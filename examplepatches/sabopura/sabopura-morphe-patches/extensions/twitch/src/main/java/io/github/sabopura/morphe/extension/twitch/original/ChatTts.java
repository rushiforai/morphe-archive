package io.github.sabopura.morphe.extension.twitch.original;

import android.content.Context;
import android.content.SharedPreferences;
import android.icu.util.ULocale;
import android.os.SystemClock;
import android.speech.tts.TextToSpeech;
import android.speech.tts.UtteranceProgressListener;
import android.util.Log;

import java.util.Locale;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.chat.ChatSettings;
import io.github.sabopura.morphe.extension.twitch.chat.emotes.EmoteSupport;
import io.github.sabopura.morphe.extension.twitch.danmaku.LiveChat;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;
import io.github.sabopura.morphe.extension.twitch.ui.Notice;

import static io.github.sabopura.morphe.extension.twitch.ui.Text.label;

/** Reads live chat aloud with the device's own text-to-speech. Nothing leaves the device. */
public final class ChatTts {
    public static final String KEY_ENABLED = "tts_enabled", KEY_SPEED = "tts_speed", KEY_PITCH = "tts_pitch",
            KEY_NAMES = "tts_names", KEY_EMOTES = "tts_emotes", KEY_WHEN = "tts_when", KEY_LANGUAGE = "tts_language";
    public static final String LANGUAGE_AUTO = SpeechLanguage.AUTO, LANGUAGE_DEVICE = SpeechLanguage.DEVICE,
            LANGUAGE_JAPANESE = SpeechLanguage.JAPANESE, LANGUAGE_ENGLISH = SpeechLanguage.ENGLISH;
    public static final String WHEN_ALWAYS = "always", WHEN_BACKGROUND = "background";
    private static final int WAITING = 6, MAX_CHARS = 120;
    /** The engine is a separate process, so it is only kept while chat is being read. */
    private static final long IDLE_MS = 120_000, SPEAK_LIMIT_MS = 30_000;
    /** Each start binds the engine's process, so after a failed one the next waits, unless it is a test. */
    private static final long START_RETRY_MS = 60_000;
    private static final String TAG = "TwitchChatTts";

    private static final SpeechQueue<Line> QUEUE = new SpeechQueue<>(WAITING);
    /** Touched on the main thread only. */
    private static TextToSpeech engine;
    private static boolean ready, speaking, testing;
    /** The language the engine was last asked for; "" is the device's own. */
    private static String voice = "";
    /** The engine has no voice for that language and kept the one before. */
    private static boolean voiceMissing;
    private static long startAllowedAt;
    private static volatile String room;
    /** The voice of the message read before, for one that names no language. Touched on the chat's thread only. */
    private static String lastLanguage = "";
    private static final Runnable STOP = ChatTts::shutDown;
    /** Engines occasionally forget to report the end of an utterance. */
    private static final Runnable UNSTICK = ChatTts::done;

    private ChatTts() {
    }

    /** What to say and in which language's voice ("" for the device's own). */
    private static final class Line {
        final String text, language;
        /** The settings' sample sentence, whose listener is told when its voice is missing. */
        final boolean sample;

        Line(String text, String language, boolean sample) {
            this.text = text;
            this.language = language;
            this.sample = sample;
        }
    }

    public static final LiveChat.Subscriber SUBSCRIBER = new LiveChat.Subscriber() {
        @Override
        public boolean wants() {
            return enabled();
        }

        @Override
        public void onMessage(LiveChat.Message message) {
            if (message.room != null && !message.room.equals(room)) {
                room = message.room;
                QUEUE.clear();
                lastLanguage = "";
            }
            if (!shouldRead() || hidden(message)) return;
            SharedPreferences prefs = Original.prefs();
            String said = prefs != null && prefs.getBoolean(KEY_EMOTES, false) ? message.text : withoutEmotes(message);
            String device = Locale.getDefault().getLanguage();
            String language = SpeechLanguage.of(choice(prefs), said, device, latin(Locale.getDefault()), lastLanguage);
            String text = SpeechText.of(message.author, said,
                    prefs != null && prefs.getBoolean(KEY_NAMES, false), SpeechLanguage.japanese(language, device), MAX_CHARS);
            if (text == null) return;
            lastLanguage = language;
            QUEUE.add(new Line(text, language, false));
            Original.onMain(ChatTts::pump);
        }
    };

    /** The message as it was said: Twitch's emotes and the words chat draws as images are pictures, not words. */
    private static String withoutEmotes(LiveChat.Message message) {
        String words = message.withoutEmotes();
        Context context = Original.app();
        return context == null ? words : SpeechText.without(words, word -> EmoteSupport.draws(context, message.room, word));
    }

    /** Whether the language is written in Latin letters, from the system's own table of languages and scripts. */
    private static boolean latin(Locale locale) {
        try {
            return "Latn".equals(ULocale.addLikelySubtags(ULocale.forLocale(locale)).getScript());
        } catch (RuntimeException | LinkageError unknown) {
            // Then the device's own voice reads everything it is not sure about.
            return true;
        }
    }

    private static String choice(SharedPreferences prefs) {
        return prefs == null ? LANGUAGE_AUTO : prefs.getString(KEY_LANGUAGE, LANGUAGE_AUTO);
    }

    private static boolean enabled() {
        SharedPreferences prefs = Original.prefs();
        return Features.has(Feature.CHAT_TTS) && prefs != null && prefs.getBoolean(KEY_ENABLED, false);
    }

    private static boolean shouldRead() {
        SharedPreferences prefs = Original.prefs();
        return prefs != null && (WHEN_ALWAYS.equals(prefs.getString(KEY_WHEN, WHEN_ALWAYS)) || !Original.foreground());
    }

    private static boolean hidden(LiveChat.Message message) {
        if (!Features.has(Feature.CHAT_FILTERS)) return false;
        ChatSettings chat = ChatSettings.peek();
        return chat != null && chat.enabled && chat.rules.blocks(message.text, message.login, message.userId);
    }

    /**
     * Main thread, posted from the chat's thread or called back by the speech engine, so nothing above it
     * catches a failure. Speaks one message at a time so a new one can always replace the backlog.
     */
    private static void pump() {
        try {
            if (speaking) return;
            if (!enabled() && !testing) {
                shutDown();
                return;
            }
            if (Original.adCoverUp() && !testing) {
                QUEUE.clear();
                Original.MAIN.removeCallbacks(STOP);
                Original.MAIN.postDelayed(STOP, IDLE_MS);
                return;
            }
            Original.MAIN.removeCallbacks(STOP);
            if (engine == null) {
                startEngine();
                return;
            }
            if (!ready) return;
            Line line = QUEUE.next();
            if (line == null) {
                testing = false;
                Original.MAIN.postDelayed(STOP, IDLE_MS);
                return;
            }
            SharedPreferences prefs = Original.prefs();
            engine.setSpeechRate(rate(prefs, KEY_SPEED));
            engine.setPitch(rate(prefs, KEY_PITCH));
            useVoice(line);
            speaking = true;
            Original.MAIN.postDelayed(UNSTICK, SPEAK_LIMIT_MS);
            if (engine.speak(line.text, TextToSpeech.QUEUE_FLUSH, null, "sabopura") == TextToSpeech.ERROR) done();
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("original.chat-tts", e);
        }
    }

    /**
     * Asks the engine for another language only when the line needs one. An engine without that
     * language keeps the voice it has, which still reads the line.
     */
    private static void useVoice(Line line) {
        String language = line.language;
        if (!language.equals(voice)) {
            voice = language;
            int result = engine.setLanguage(language.isEmpty() ? Locale.getDefault() : Locale.forLanguageTag(language));
            voiceMissing = result < 0;
            Log.d(TAG, "Voice language " + (language.isEmpty() ? "of the device" : language) + (voiceMissing ? ": not available, " + result : ""));
        }
        // Someone trying the voice should learn why the sample came out in another language's voice.
        Context context = Original.app();
        if (voiceMissing && line.sample && context != null)
            Notice.show(context, label("この言語の声が端末に入っていません。端末の設定の「テキスト読み上げ」で追加できます",
                    "The device has no voice for this language. Add one in the device's text-to-speech settings"));
    }

    private static float rate(SharedPreferences prefs, String key) {
        return Math.max(50, Math.min(200, prefs == null ? 100 : prefs.getInt(key, 100))) / 100f;
    }

    private static void startEngine() {
        Context context = Original.app();
        if (context == null || !testing && SystemClock.uptimeMillis() < startAllowedAt) return;
        ready = false;
        try {
            engine = new TextToSpeech(context, status -> Original.onMain(() -> engineStarted(status)));
            engine.setOnUtteranceProgressListener(new UtteranceProgressListener() {
                @Override
                public void onStart(String id) {
                }

                @Override
                public void onDone(String id) {
                    Original.onMain(ChatTts::done);
                }

                @Override
                public void onError(String id) {
                    Original.onMain(ChatTts::done);
                }
            });
        } catch (RuntimeException | LinkageError failure) {
            Log.w(TAG, "Text-to-speech is unavailable", failure);
            startAllowedAt = SystemClock.uptimeMillis() + START_RETRY_MS;
            engine = null;
        }
    }

    private static void engineStarted(int status) {
        if (engine == null) return;
        if (status != TextToSpeech.SUCCESS) {
            Log.w(TAG, "Text-to-speech failed to start: " + status);
            startAllowedAt = SystemClock.uptimeMillis() + START_RETRY_MS;
            Context context = Original.app();
            if (testing && context != null)
                Notice.show(context, label("読み上げエンジンを起動できませんでした", "The text-to-speech engine could not start"));
            shutDown();
            return;
        }
        ready = true;
        voice = "";
        voiceMissing = engine.setLanguage(Locale.getDefault()) < 0;
        pump();
    }

    private static void done() {
        Original.MAIN.removeCallbacks(UNSTICK);
        speaking = false;
        pump();
    }

    /** Settings: speaks a sample with the current speed and pitch, even while the switch is off. */
    public static void test() {
        Original.onMain(() -> {
            testing = true;
            QUEUE.clear();
            String choice = choice(Original.prefs());
            String device = Locale.getDefault().getLanguage();
            String japanese = "チャット読み上げのテストです", english = "This is the chat voice";
            // A fixed language is tried in that language; otherwise in the one the settings are shown in.
            String sample = LANGUAGE_JAPANESE.equals(choice) ? japanese : LANGUAGE_ENGLISH.equals(choice) ? english
                    : label(japanese, english);
            QUEUE.add(new Line(sample, SpeechLanguage.of(choice, sample, device, latin(Locale.getDefault()), ""), true));
            pump();
        });
    }

    /** Settings: stops the voice at once when the switch goes off. */
    public static void settingsChanged() {
        Original.onMain(() -> {
            if (!enabled() && !testing) shutDown();
        });
    }

    private static void shutDown() {
        Original.MAIN.removeCallbacks(STOP);
        Original.MAIN.removeCallbacks(UNSTICK);
        QUEUE.clear();
        speaking = false;
        testing = false;
        ready = false;
        if (engine == null) return;
        try {
            engine.stop();
            engine.shutdown();
        } catch (RuntimeException | LinkageError ignored) {
        }
        engine = null;
    }
}

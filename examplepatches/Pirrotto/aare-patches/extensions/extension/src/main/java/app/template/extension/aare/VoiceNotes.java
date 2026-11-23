package app.template.extension.aare;

import android.app.Notification;
import android.content.Context;
import android.media.AudioAttributes;
import android.media.AudioFocusRequest;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.ParcelFileDescriptor;
import android.os.Parcelable;
import android.service.notification.StatusBarNotification;
import android.speech.tts.TextToSpeech;
import android.speech.tts.UtteranceProgressListener;
import android.util.Log;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Plays WhatsApp voice messages in the car instead of reading "Voice message (0:05)" aloud.
 *
 * AARE reads messages aloud with CarNotificationListener.speak(String). The patch calls
 * {@link #onPosted} for every notification, so the voice messages and their times are known, and
 * {@link #onSpeak} before AARE speaks: when the text holds voice messages, this class speaks the
 * text around them and plays the matching recordings, and AARE's own text-to-speech is skipped.
 *
 * WhatsApp keeps received voice messages in
 * Android/media/com.whatsapp/WhatsApp/Media/WhatsApp Voice Notes/[year+week]/PTT-*.opus, folders
 * hidden from media apps. They are read through Shizuku (see {@link VoiceNotesAccess}), which AARE
 * already uses for car audio, so AARE needs no storage permission. Playback uses the media usage,
 * like AARE's text-to-speech, so it reaches the car.
 */
@SuppressWarnings("unused")
public final class VoiceNotes {
    private static final String TAG = "AareVoiceNotes";

    /** WhatsApp and WhatsApp Business. */
    private static final Set<String> PACKAGES = new HashSet<>(Arrays.asList("com.whatsapp", "com.whatsapp.w4b"));

    /** U+1F3A4 MICROPHONE, which WhatsApp puts before "Voice message (0:05)". */
    private static final String MIC = "🎤";

    /** "Voice message (0:05)" without the emoji: a short text ending with a duration. */
    private static final Pattern DURATION = Pattern.compile("^.{1,40}\\(\\d{1,3}:\\d{2}\\)$");

    /** A voice message in a spoken text when it isn't among the records (AARE was restarted). */
    private static final Pattern MIC_SEGMENT = Pattern.compile(MIC + "[^.\\n]*");

    /** How far a recording's file time may be from the message time. */
    private static final long BEFORE_MS = 2 * 60_000L;
    private static final long AFTER_MS = 60 * 60_000L;

    private static final int MAX_RECORDS = 200;

    /** Finds and opens recordings off the main thread, one request at a time, in order. */
    private static final ExecutorService worker = Executors.newSingleThreadExecutor();

    /** A voice message seen in a notification. */
    private static final class Record {
        final String sender;
        final String text;
        final long timeMs;

        Record(String sender, String text, long timeMs) {
            this.sender = sender;
            this.text = text;
            this.timeMs = timeMs;
        }
    }

    /** Newest last. Only touched on the main thread, where notifications and speak() arrive. */
    private static final ArrayDeque<Record> records = new ArrayDeque<>();

    private static volatile boolean shizukuHintSpoken;

    private VoiceNotes() {
    }

    // region Hooks

    /** AARE's notification listener, as last seen. */
    private static volatile java.lang.ref.WeakReference<Context> listenerRef = new java.lang.ref.WeakReference<>(null);

    /** AARE's notification listener, if it posted anything since AARE started. */
    static Context listener() {
        return listenerRef.get();
    }

    /** Called at the start of CarNotificationListener.onNotificationPosted. */
    public static void onPosted(Context context, StatusBarNotification sbn) {
        if (context != null && listenerRef.get() != context) listenerRef = new java.lang.ref.WeakReference<>(context);
        try {
            if (sbn == null || !PACKAGES.contains(sbn.getPackageName())) return;
            Bundle extras = sbn.getNotification().extras;
            if (extras == null) return;
            Parcelable[] messages = extras.getParcelableArray(Notification.EXTRA_MESSAGES);
            if (messages == null) return;
            for (Parcelable p : messages) {
                if (!(p instanceof Bundle)) continue;
                Bundle m = (Bundle) p;
                CharSequence text = m.getCharSequence("text");
                if (text == null || !isVoice(text.toString())) continue;
                remember(new Record(senderOf(m), text.toString().trim(), m.getLong("time")));
            }
        } catch (Throwable t) {
            Log.w(TAG, "onPosted", t);
        }
    }

    /**
     * Called at the start of CarNotificationListener.speak(String).
     *
     * @return true if the text was handled here, so AARE must not speak it.
     */
    public static boolean onSpeak(Context context, String text) {
        if (context != null && listenerRef.get() != context) listenerRef = new java.lang.ref.WeakReference<>(context);
        try {
            if (text == null) return false;
            // Each feature can be turned off on the Settings screen of the patches.
            List<Segment> voices = PatchSettings.isEnabled(context, PatchSettings.VOICE_MESSAGES)
                    ? findVoices(text) : new ArrayList<>();
            // The conversation being read, if it can be answered: a "Reply" card follows the reading.
            Object conversation = VoiceReply.conversationFor(context, text);
            if (voices.isEmpty() && conversation == null) return false;

            Context app = context.getApplicationContext();
            Player player = Player.get(app);
            Runnable after = conversation == null ? null : () -> VoiceReply.offer(context, conversation);
            if (voices.isEmpty()) {
                player.say(text, after);
            } else {
                worker.execute(() -> prepare(app, player, text, voices, after));
            }
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "onSpeak", t);
            return false;
        }
    }

    // endregion

    /**
     * On the worker thread: finds and opens the recordings, then queues the text and the
     * recordings in reading order.
     */
    private static void prepare(Context context, Player player, String text, List<Segment> voices, Runnable after) {
        List<Object> items = new ArrayList<>();
        try {
            List<VoiceNotesAccess.Recording> recordings = VoiceNotesAccess.list(context);
            if (recordings == null) {
                items.add(replaceVoices(text, voices, phrase("voice message", "messaggio vocale")));
                if (!shizukuHintSpoken) {
                    shizukuHintSpoken = true;
                    items.add(phrase(
                            "To hear voice messages, start Shizuku and allow it for AARE.",
                            "Per ascoltare i vocali, avvia Shizuku e consentilo ad AARE."));
                }
            } else {
                Set<String> used = new HashSet<>();
                int start = 0;
                for (Segment v : voices) {
                    items.add(text.substring(start, v.start));
                    VoiceNotesAccess.Recording r = findRecording(recordings, v.record, used);
                    ParcelFileDescriptor pfd = r == null ? null : VoiceNotesAccess.open(context, r.path);
                    if (pfd != null) {
                        used.add(r.path);
                        items.add(pfd);
                    } else {
                        items.add(phrase("Voice message not downloaded yet.", "Messaggio vocale non ancora scaricato."));
                    }
                    start = v.end;
                }
                items.add(text.substring(start));
            }
        } catch (Throwable t) {
            Log.w(TAG, "prepare", t);
            items.clear();
            items.add(replaceVoices(text, voices, phrase("voice message", "messaggio vocale")));
        }
        for (Object item : items) {
            if (item instanceof ParcelFileDescriptor) player.play((ParcelFileDescriptor) item);
            else player.say((String) item);
        }
        if (after != null) player.then(after);
    }

    // region Matching

    private static boolean isVoice(String text) {
        String t = text.trim();
        return t.startsWith(MIC) || DURATION.matcher(t).matches();
    }

    private static String senderOf(Bundle m) {
        CharSequence sender = m.getCharSequence("sender");
        if (sender == null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            Object person = m.getParcelable("sender_person");
            if (person instanceof android.app.Person) sender = ((android.app.Person) person).getName();
        }
        return sender == null ? "" : sender.toString();
    }

    private static void remember(Record r) {
        for (Record old : records) {
            if (old.timeMs == r.timeMs && old.text.equals(r.text) && old.sender.equals(r.sender)) return;
        }
        records.addLast(r);
        while (records.size() > MAX_RECORDS) records.removeFirst();
    }

    /** A voice message inside a spoken text, with the record it stands for if known. */
    private static final class Segment {
        final int start;
        final int end;
        final Record record;

        Segment(int start, int end, Record record) {
            this.start = start;
            this.end = end;
            this.record = record;
        }
    }

    /**
     * The voice messages in a text AARE is about to speak, in reading order. AARE speaks
     * "Sender. text" for a new message and "Title. text. Sender: text…" for a conversation, oldest
     * first, so the same text found several times stands for its newest records, in time order.
     */
    private static List<Segment> findVoices(String spoken) {
        List<Segment> found = new ArrayList<>();
        Set<String> texts = new HashSet<>();
        for (Record r : records) texts.add(r.text);

        for (String voiceText : texts) {
            List<Integer> positions = new ArrayList<>();
            for (int i = spoken.indexOf(voiceText); i >= 0; i = spoken.indexOf(voiceText, i + voiceText.length())) {
                positions.add(i);
            }
            if (positions.isEmpty()) continue;

            List<Record> candidates = new ArrayList<>();
            for (Record r : records) {
                if (r.text.equals(voiceText) && (r.sender.isEmpty() || spoken.contains(r.sender))) candidates.add(r);
            }
            Collections.sort(candidates, (a, b) -> Long.compare(a.timeMs, b.timeMs));
            List<Record> newest = new ArrayList<>(
                    candidates.subList(Math.max(0, candidates.size() - positions.size()), candidates.size()));
            int offset = positions.size() - newest.size();
            for (int k = 0; k < positions.size(); k++) {
                int pos = positions.get(k);
                Record r = k - offset >= 0 ? newest.get(k - offset) : null;
                found.add(new Segment(pos, pos + voiceText.length(), r));
            }
        }

        // Voice messages not among the records, for example after AARE restarted.
        Matcher m = MIC_SEGMENT.matcher(spoken);
        while (m.find()) {
            boolean covered = false;
            for (Segment s : found) {
                if (m.start() < s.end && s.start < m.end()) covered = true;
            }
            if (!covered) found.add(new Segment(m.start(), m.end(), null));
        }

        Collections.sort(found, (a, b) -> Integer.compare(a.start, b.start));
        return found;
    }

    private static String replaceVoices(String text, List<Segment> voices, String with) {
        StringBuilder b = new StringBuilder();
        int start = 0;
        for (Segment v : voices) {
            b.append(text, start, v.start).append(with);
            start = v.end;
        }
        return b.append(text.substring(start)).toString();
    }

    /**
     * The recording of a voice message: the received voice note saved closest after the message
     * time. Without a record, the newest one of the last day.
     */
    private static VoiceNotesAccess.Recording findRecording(
            List<VoiceNotesAccess.Recording> recordings, Record record, Set<String> used) {
        VoiceNotesAccess.Recording best = null;
        long bestScore = Long.MAX_VALUE;
        long now = System.currentTimeMillis();
        for (VoiceNotesAccess.Recording f : recordings) {
            if (used.contains(f.path) || f.size == 0) continue;
            long score;
            if (record != null && record.timeMs > 0) {
                long delta = f.modifiedMs - record.timeMs;
                if (delta < -BEFORE_MS || delta > AFTER_MS) continue;
                // A file saved before the message time is a weaker match than one after it.
                score = delta >= 0 ? delta : -delta * 10;
            } else {
                long age = now - f.modifiedMs;
                if (age < 0 || age > 24 * 60 * 60_000L) continue;
                score = age;
            }
            if (score < bestScore) {
                bestScore = score;
                best = f;
            }
        }
        return best;
    }

    private static String phrase(String english, String italian) {
        return "it".equals(Locale.getDefault().getLanguage()) ? italian : english;
    }

    // endregion

    // region Playback

    /** Speaks texts and plays recordings one after the other, on the main thread. */
    static final class Player {
        private static Player instance;

        static synchronized Player get(Context context) {
            if (instance == null) instance = new Player(context.getApplicationContext());
            return instance;
        }

        /**
         * Assistant usage: AARE sends it on the car's guidance channel, as Android Auto does with its
         * voice. The car lowers the radio or the music for it and goes back to them afterwards; on the
         * media channel the car switched its source to Android Auto and stayed there.
         */
        private static final AudioAttributes ATTRIBUTES = new AudioAttributes.Builder()
                .setUsage(AudioAttributes.USAGE_ASSISTANT)
                .setContentType(AudioAttributes.CONTENT_TYPE_SPEECH)
                .build();

        private final Context context;
        private final Handler main = new Handler(Looper.getMainLooper());
        private final ArrayDeque<Object> queue = new ArrayDeque<>();
        private TextToSpeech tts;
        /** null while starting, true once ready, false if there's no text-to-speech. */
        private Boolean ttsReady;
        private boolean busy;
        private int utterance;
        private AudioFocusRequest focus;

        private Player(Context context) {
            this.context = context;
        }

        void say(String text) {
            say(text, null);
        }

        /** Speaks [text], then runs [then] (on the main thread) once it was spoken. */
        void say(String text, Runnable then) {
            say(text, then, null);
        }

        /** The same, in [language] (null: the phone's). */
        void say(String text, Runnable then, Locale language) {
            String t = text.trim();
            while (t.startsWith(".") || t.startsWith(":") || t.startsWith(",")) t = t.substring(1).trim();
            if (!t.isEmpty()) enqueue(new Spoken(t, language));
            if (then != null) then(then);
        }

        private static final class Spoken {
            final String text;
            final Locale language;

            Spoken(String text, Locale language) {
                this.text = text;
                this.language = language;
            }
        }

        private Locale speaking;

        void play(ParcelFileDescriptor recording) {
            enqueue(recording);
        }

        /** Runs [run] on the main thread after everything queued before it. */
        void then(Runnable run) {
            enqueue(run);
        }

        private void enqueue(Object item) {
            main.post(() -> {
                queue.addLast(item);
                if (!busy) next();
            });
        }

        private void next() {
            Object item = queue.pollFirst();
            if (item == null) {
                busy = false;
                releaseFocus();
                return;
            }
            if (item instanceof Runnable) {
                // Not audio: no focus needed. Release it first if nothing else is queued.
                if (queue.isEmpty()) releaseFocus();
                try {
                    ((Runnable) item).run();
                } catch (Throwable t) {
                    Log.w(TAG, "after speech", t);
                }
                next();
                return;
            }
            busy = true;
            requestFocus();
            if (item instanceof ParcelFileDescriptor) playRecording((ParcelFileDescriptor) item);
            else speak(item instanceof Spoken ? (Spoken) item : new Spoken((String) item, null));
        }

        private void done() {
            main.post(this::next);
        }

        private void speak(Spoken spoken) {
            String text = spoken.text;
            if (Boolean.FALSE.equals(ttsReady)) {
                done();
                return;
            }
            if (tts == null) {
                // Started on first use; the text waits until it's ready.
                queue.addFirst(spoken);
                tts = new TextToSpeech(context, status -> main.post(() -> {
                    ttsReady = status == TextToSpeech.SUCCESS;
                    if (ttsReady) {
                        tts.setAudioAttributes(ATTRIBUTES);
                        tts.setLanguage(Locale.getDefault());
                        speaking = Locale.getDefault();
                        tts.setOnUtteranceProgressListener(new UtteranceProgressListener() {
                            @Override
                            public void onStart(String id) {
                            }

                            @Override
                            public void onDone(String id) {
                                done();
                            }

                            @Override
                            public void onError(String id) {
                                done();
                            }
                        });
                    } else {
                        Log.w(TAG, "no text-to-speech");
                    }
                    next();
                }));
                return;
            }
            Locale wanted = spoken.language != null ? spoken.language : Locale.getDefault();
            if (!wanted.equals(speaking)) {
                tts.setLanguage(wanted);
                speaking = wanted;
            }
            String id = "aare-voice-" + (++utterance);
            if (tts.speak(text, TextToSpeech.QUEUE_ADD, new Bundle(), id) != TextToSpeech.SUCCESS) done();
        }

        private void playRecording(ParcelFileDescriptor pfd) {
            MediaPlayer player = new MediaPlayer();
            Runnable finish = () -> {
                player.release();
                closeQuietly(pfd);
                done();
            };
            try {
                player.setAudioAttributes(ATTRIBUTES);
                player.setDataSource(pfd.getFileDescriptor());
                player.setOnPreparedListener(MediaPlayer::start);
                player.setOnCompletionListener(p -> finish.run());
                player.setOnErrorListener((p, what, extra) -> {
                    Log.w(TAG, "cannot play voice message: " + what + "/" + extra);
                    finish.run();
                    return true;
                });
                player.prepareAsync();
            } catch (Throwable t) {
                Log.w(TAG, "cannot play voice message", t);
                finish.run();
            }
        }

        private static void closeQuietly(ParcelFileDescriptor pfd) {
            try {
                pfd.close();
            } catch (Throwable ignored) {
            }
        }

        /** Pauses the music while a message plays, as Android Auto's assistant does. */
        private void requestFocus() {
            if (focus != null) return;
            AudioManager audio = context.getSystemService(AudioManager.class);
            if (audio == null) return;
            focus = new AudioFocusRequest.Builder(AudioManager.AUDIOFOCUS_GAIN_TRANSIENT)
                    .setAudioAttributes(ATTRIBUTES)
                    .build();
            audio.requestAudioFocus(focus);
        }

        private void releaseFocus() {
            if (focus == null) return;
            AudioManager audio = context.getSystemService(AudioManager.class);
            if (audio != null) audio.abandonAudioFocusRequest(focus);
            focus = null;
        }
    }

    // endregion
}

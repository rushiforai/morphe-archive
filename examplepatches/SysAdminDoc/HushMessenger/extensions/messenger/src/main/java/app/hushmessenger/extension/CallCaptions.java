package app.hushmessenger.extension;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.media.AudioTrack;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import java.io.Closeable;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayDeque;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.function.BiConsumer;
import java.util.function.Consumer;

/**
 * Live captions on calls (#159). The far side's sound, which plays through WebRTC's Java thread with this on, goes to
 * the phone's own on-device speech recognizer through a pipe, and what it hears shows in a box over Messenger's call
 * screen. A finished line can be translated on the phone and read aloud, with their voice turned down while it's read.
 * Nothing goes to a server through this, and nothing is kept once the call ends.
 */
public final class CallCaptions {
    static final String KEY = "call_captions";
    static final String SPEAK = "call_captions_speak";
    static final String DUCK = "call_captions_duck";
    static final String HEARD_LANGUAGE = "call_captions_heard_language";
    static final String SHOWN_LANGUAGE = "call_captions_shown_language";
    /** The shown language that keeps captions in the language they're spoken. */
    static final String UNTRANSLATED = "untranslated";
    /** How loud their voice stays while a caption is read aloud. */
    static final float DUCKED = 0.25f;
    /** The box goes away this long after the last thing it heard. */
    static final long IDLE_MILLIS = 8000;
    /** Above the call's own buttons. */
    private static final int ABOVE_BUTTONS_DP = 168;

    /** The recognizer, as the feed sees it: takes what sound it can without waiting and says how much it took. */
    interface Sink extends Closeable {
        int offer(byte[] data, int count) throws IOException;
    }

    /** One recognizer for a call. It reports on the main thread through partial, finished and note. */
    interface Listening {
        void end();
    }

    interface Translating {
        /** Hands back the translation on the main thread, or null when there isn't one. */
        void translate(String said, Consumer<String> done);

        void close();
    }

    interface Speaking {
        void say(String text);

        /** Whether their voice should be turned down right now. Asked on the call's audio thread. */
        boolean ducking();

        void close();
    }

    /** The phone's speech pieces. Tests swap them. */
    interface Parts {
        Listening listen(Context context, Feed feed, String language);

        /** Hands back a translator on the main thread, or null when the phone has none for these two languages. */
        void translator(Context context, String from, String to, Consumer<Translating> ready);

        Speaking voice(Context context, String language, boolean duck);

        /** The recognizer's languages on the phone and the ones it can download, both null without one. On the main thread. */
        void heardLanguages(Context context, BiConsumer<List<String>, List<String>> ready);

        /** The languages the phone can translate [from] into. On the main thread, empty without a translator. */
        void shownLanguages(Context context, String from, Consumer<List<String>> ready);

        void download(Context context, String language);
    }

    static volatile Parts parts;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    /** The far side's sound on its way to the recognizer, or null outside a captioned call. */
    private static volatile Feed feed;
    private static volatile Speaking voice;
    private static volatile boolean complained;
    // Main thread only from here on.
    private static Listening listening;
    private static Translating translating;
    /** Whether this call's captions are meant to be translated, so the voice only reads what's in its language. */
    private static boolean translated;
    private static Lines lines;
    private static Activity top;
    private static TextView box;
    private static final Set<String> noted = new HashSet<>();
    private static final Runnable QUIET = CallCaptions::quiet;

    private CallCaptions() {}

    static void resetForTests() {
        end();
        parts = null;
        top = null;
        complained = false;
        noted.clear();
    }

    /** Only reached from Android 13, so the phone's pieces never load below it. */
    static Parts parts() {
        Parts now = parts;
        if (now == null) parts = now = new PhoneCaptions();
        return now;
    }

    static String heardLanguage() {
        return language(HEARD_LANGUAGE);
    }

    /** The language captions show in, which is the one they're spoken in when they aren't translated. */
    static String shownLanguage() {
        return untranslated() ? heardLanguage() : language(SHOWN_LANGUAGE);
    }

    static boolean untranslated() {
        SharedPreferences prefs = Settings.preferences;
        return prefs != null && UNTRANSLATED.equals(prefs.getString(SHOWN_LANGUAGE, null));
    }

    /** A saved choice, or the phone's own language. */
    private static String language(String key) {
        SharedPreferences prefs = Settings.preferences;
        String saved = prefs == null ? null : prefs.getString(key, null);
        return saved == null || saved.isEmpty() ? Locale.getDefault().toLanguageTag() : saved;
    }

    static boolean sameLanguage(String one, String other) {
        return Locale.forLanguageTag(one).getLanguage().equals(Locale.forLanguageTag(other).getLanguage());
    }

    /** "Spanish (Mexico)", in the phone's language. */
    static String name(String language) {
        Locale locale = Locale.forLanguageTag(language);
        String named = locale.getDisplayName(Locale.getDefault());
        return named.isEmpty() ? language : Character.toUpperCase(named.charAt(0)) + named.substring(1);
    }

    /** The call's playout starting and stopping, on the main thread. */
    static void call(boolean running) {
        try {
            if (running) begin();
            else end();
        } catch (RuntimeException | LinkageError error) {
            Settings.hookFailedPrivately(KEY, "Couldn't start captions", error);
            try {
                end();
            } catch (RuntimeException | LinkageError ignored) {
                feed = null;
            }
        }
    }

    static boolean running() {
        return feed != null;
    }

    private static void begin() {
        if (feed != null || Build.VERSION.SDK_INT < 33 || !Settings.enabled(KEY) || !Settings.available(KEY)) return;
        Context context = Settings.appContext;
        if (context == null) return;
        Parts phone = parts();
        Feed made = new Feed();
        lines = new Lines();
        complained = false;
        noted.clear();
        feed = made;
        made.start();
        String heard = heardLanguage(), shown = shownLanguage();
        translated = !sameLanguage(heard, shown);
        SharedPreferences prefs = Settings.preferences;
        if (prefs != null && prefs.getBoolean(SPEAK, false)) voice = phone.voice(context, shown, prefs.getBoolean(DUCK, false));
        if (translated) phone.translator(context, heard, shown, translator -> {
            if (feed != made) {
                if (translator != null) translator.close();
                return;
            }
            translating = translator;
            if (translator == null) note("call_captions_untranslated");
        });
        listening = phone.listen(context, made, heard);
    }

    private static void end() {
        Feed was = feed;
        feed = null;
        if (was != null) was.finishUp();
        Listening heard = listening;
        listening = null;
        if (heard != null) heard.end();
        Translating translator = translating;
        translating = null;
        translated = false;
        if (translator != null) translator.close();
        Speaking speaking = voice;
        voice = null;
        if (speaking != null) speaking.close();
        lines = null;
        MAIN.removeCallbacks(QUIET);
        removeBox();
    }

    /**
     * The far side's next frame, on its way to the speaker, after Record calls has had it. Turned down in place while a
     * caption is read aloud and that's on.
     */
    static void heard(AudioTrack track, ByteBuffer sound, int bytes) {
        Feed now = feed;
        if (now == null) return;
        try {
            now.side.offer(sound, bytes, track.getChannelCount(), track.getSampleRate(), now.elapsed());
            Speaking speaking = voice;
            if (speaking != null && speaking.ducking()) duck(sound, bytes, DUCKED);
        } catch (Throwable error) {
            // 50 to 100 frames a second, so one line is enough.
            if (complained) return;
            complained = true;
            Settings.hookFailedPrivately(KEY, "Couldn't read a call's sound for captions", error);
        }
    }

    /** Scales a frame the audio thread holds in the phone's byte order, read by index like CallMix.Side does. */
    static void duck(ByteBuffer sound, int bytes, float by) {
        if (sound == null || bytes <= 0) return;
        ByteBuffer pcm = sound.duplicate().order(ByteOrder.nativeOrder());
        pcm.clear();
        int count = Math.min(bytes, pcm.capacity()) / 2;
        for (int i = 0; i < count; i++) pcm.putShort(i * 2, (short) (pcm.getShort(i * 2) * by));
    }

    /** What the recognizer has so far of what they're saying. */
    static void partial(String text) {
        if (lines == null) return;
        lines.partial(text);
        show();
    }

    /** A finished stretch of speech: shown, translated when the languages differ, then read aloud if that's on. */
    static void finished(String text) {
        Lines current = lines;
        if (current == null) return;
        Line line = current.finish(text);
        show();
        if (line == null) return;
        Translating translator = translating;
        if (translator == null) {
            // Without its translation, a line isn't in the voice's language.
            if (!translated) speak(line.text);
            return;
        }
        translator.translate(line.text, into -> {
            if (lines != current || into == null || into.trim().isEmpty()) return;
            line.text = into.trim();
            show();
            speak(line.text);
        });
    }

    private static void speak(String text) {
        Speaking speaking = voice;
        if (speaking != null) speaking.say(text);
    }

    /** A one-time line in the box about why captions can't do something this call. */
    static void note(String id) {
        if (lines == null || !noted.add(id)) return;
        Context context = top != null ? top : Settings.appContext;
        if (context == null) return;
        lines.note(new SettingsText(context).get(id));
        show();
    }

    /** The recognizer gave up for this call. */
    static void stopped(String id, Throwable error) {
        if (error != null) Settings.hookFailedPrivately(KEY, "Captions stopped", error);
        if (id != null) note(id);
        Listening heard = listening;
        listening = null;
        if (heard != null) heard.end();
    }

    /** Which of Messenger's screens is on top, from CallRecording's watcher, or null when none is. */
    static void screen(Activity activity) {
        top = activity;
        place();
    }

    private static void show() {
        MAIN.removeCallbacks(QUIET);
        if (lines == null || lines.isEmpty()) {
            removeBox();
            return;
        }
        MAIN.postDelayed(QUIET, IDLE_MILLIS);
        place();
    }

    private static void quiet() {
        if (lines != null) lines.clear();
        removeBox();
    }

    static TextView box() {
        return box;
    }

    private static void place() {
        try {
            View found = top == null ? null : top.findViewById(android.R.id.content);
            if (!(found instanceof FrameLayout) || lines == null || lines.isEmpty()) {
                removeBox();
                return;
            }
            if (box == null || box.getParent() != found) {
                removeBox();
                box = makeBox(top);
                float density = top.getResources().getDisplayMetrics().density;
                FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL);
                params.leftMargin = params.rightMargin = (int) (density * 16);
                params.bottomMargin = (int) (density * ABOVE_BUTTONS_DP);
                ((ViewGroup) found).addView(box, params);
            }
            String now = lines.text();
            if (!now.contentEquals(box.getText())) box.setText(now);
        } catch (RuntimeException error) {
            Settings.hookFailedPrivately(KEY, "Couldn't show the captions", error);
        }
    }

    private static void removeBox() {
        if (box != null && box.getParent() instanceof ViewGroup) ((ViewGroup) box.getParent()).removeView(box);
        box = null;
    }

    private static TextView makeBox(Activity activity) {
        float density = activity.getResources().getDisplayMetrics().density;
        TextView view = new TextView(activity);
        view.setTag("call_captions_box");
        view.setTextColor(Color.WHITE);
        view.setTextSize(16);
        view.setLineSpacing(0, 1.15f);
        view.setMaxLines(5);
        view.setEllipsize(TextUtils.TruncateAt.END);
        view.setPadding((int) (density * 14), (int) (density * 10), (int) (density * 14), (int) (density * 10));
        GradientDrawable shape = new GradientDrawable();
        shape.setCornerRadius(density * 12);
        shape.setColor(SettingsUi.CALL_SCRIM);
        view.setBackground(shape);
        view.setElevation(density * 24);
        // Taps go through to the call's own buttons, and TalkBack reads each new line.
        view.setClickable(false);
        view.setFocusable(false);
        view.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        // Above the navigation bar, however this screen lays itself out. Moving it waits until this layout pass is over.
        view.addOnLayoutChangeListener((self, left, up, right, down, oldLeft, oldUp, oldRight, oldDown) -> self.post(() -> lift(self)));
        return view;
    }

    private static void lift(View view) {
        View parent = (View) view.getParent();
        if (parent == null) return;
        Rect visible = new Rect();
        int[] where = new int[2];
        parent.getWindowVisibleDisplayFrame(visible);
        parent.getLocationOnScreen(where);
        int covered = Math.max(0, where[1] + parent.getHeight() - visible.bottom);
        int margin = covered + (int) (view.getResources().getDisplayMetrics().density * ABOVE_BUTTONS_DP);
        FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) view.getLayoutParams();
        if (params.bottomMargin == margin) return;
        params.bottomMargin = margin;
        view.setLayoutParams(params);
    }

    /** One finished stretch of speech. Its text becomes the translation once that's back. */
    static final class Line {
        String text;

        Line(String text) {
            this.text = text;
        }
    }

    /** What the box shows: the last few finished lines and the one still being heard. */
    static final class Lines {
        static final int KEPT = 2;
        static final int MOST_CHARACTERS = 200;
        private final ArrayDeque<Line> finished = new ArrayDeque<>();
        private String partial = "";

        void partial(String text) {
            partial = text == null ? "" : text.trim();
        }

        /** Null when nothing was said. */
        Line finish(String text) {
            partial = "";
            return add(text);
        }

        /** A line of our own, above whatever is still being heard. */
        void note(String text) {
            add(text);
        }

        private Line add(String text) {
            String said = text == null ? "" : text.trim();
            if (said.isEmpty()) return null;
            Line line = new Line(said);
            finished.addLast(line);
            while (finished.size() > KEPT) finished.removeFirst();
            return line;
        }

        void clear() {
            finished.clear();
            partial = "";
        }

        boolean isEmpty() {
            return finished.isEmpty() && partial.isEmpty();
        }

        /** Newest at the bottom, the oldest cut at a word when it runs long. */
        String text() {
            StringBuilder all = new StringBuilder();
            for (Line line : finished) {
                if (all.length() > 0) all.append('\n');
                all.append(line.text);
            }
            if (!partial.isEmpty()) {
                if (all.length() > 0) all.append('\n');
                all.append(partial);
            }
            if (all.length() <= MOST_CHARACTERS) return all.toString();
            int from = all.length() - MOST_CHARACTERS;
            int word = from;
            while (word < all.length() && !Character.isWhitespace(all.charAt(word))) word++;
            return all.substring(word < all.length() ? word + 1 : from);
        }
    }

    /**
     * The far side's sound, mono at CallMix.RATE, handed to the recognizer a little behind the clock on a thread of its
     * own. With nowhere to go, as between two recognizer sessions, it's dropped, since late captions don't help.
     */
    static final class Feed extends Thread {
        static final long PUMP_MILLIS = 100;
        /** Under a pipe's atomic write size, so a write never waits and never splits a sample. */
        private static final int CHUNK = CallMix.RATE / 10;
        final CallMix.Side side = new CallMix.Side();
        private final long began = SystemClock.elapsedRealtime();
        private final short[] samples = new short[CHUNK];
        private final byte[] bytes = new byte[CHUNK * 2];
        private final Object lock = new Object();
        private Sink sink;
        private volatile boolean stopped;
        private long fed;

        Feed() {
            super("HushCallCaptions");
            setDaemon(true);
        }

        long elapsed() {
            return SystemClock.elapsedRealtime() - began;
        }

        /** The next session's end of the pipe, or null between sessions. The last one closes here. */
        void into(Sink next) {
            synchronized (lock) {
                close(sink);
                sink = next;
            }
        }

        void finishUp() {
            stopped = true;
            interrupt();
            into(null);
        }

        @Override public void run() {
            while (!stopped) {
                try {
                    Thread.sleep(PUMP_MILLIS);
                } catch (InterruptedException woken) {
                    if (stopped) break;
                }
                pump(elapsed());
            }
            into(null);
        }

        /** Hands over everything due this long into the call. */
        void pump(long elapsedMillis) {
            long due = (elapsedMillis - CallMix.LAG_MILLIS) * CallMix.RATE / 1000;
            while (fed < due) {
                int count = (int) Math.min(due - fed, CHUNK);
                side.read(fed, count, samples);
                fed += count;
                for (int i = 0; i < count; i++) {
                    bytes[i * 2] = (byte) samples[i];
                    bytes[i * 2 + 1] = (byte) (samples[i] >> 8);
                }
                synchronized (lock) {
                    if (sink == null) continue;
                    try {
                        sink.offer(bytes, count * 2);
                    } catch (IOException | RuntimeException gone) {
                        // The recognizer let go of its end. The next session brings a new one.
                        close(sink);
                        sink = null;
                    }
                }
            }
        }

        private static void close(Closeable closing) {
            if (closing == null) return;
            try {
                closing.close();
            } catch (IOException | RuntimeException ignored) {
                // Already gone.
            }
        }
    }
}

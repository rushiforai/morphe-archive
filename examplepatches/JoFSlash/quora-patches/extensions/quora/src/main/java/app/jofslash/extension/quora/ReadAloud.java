package app.jofslash.extension.quora;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.speech.tts.TextToSpeech;
import android.speech.tts.UtteranceProgressListener;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * For Read aloud: reads an answer's text out loud with the phone's text-to-speech engine (this code
 * sends nothing anywhere itself). One text at a time. It stops when the page it was started from
 * goes away, or when the same button is tapped again.
 */
final class ReadAloud {

    private static final String TAG = "JoFSlashPatches";
    private static final String ID = "jofslash-read-";

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static TextToSpeech tts;
    private static boolean ready;
    private static Runnable pending;
    private static WeakReference<View> owner = new WeakReference<>(null);
    private static volatile boolean speaking;
    private static String lastId;
    private static int run;
    private static String ownerUrl;

    private ReadAloud() {
    }

    static boolean isSpeaking() {
        return speaking;
    }

    /**
     * Starts reading the text. Returns whether it is reading now. The view is what it reads for:
     * when that view leaves the screen, reading stops.
     *
     * @param notice A toast to show when it starts, or null for the usual one.
     * @param stop   Whether a tap while it reads only stops it (the same button tapped again);
     *               otherwise the new text replaces the one being read.
     */
    static synchronized boolean toggle(View view, String text, String notice, boolean stop) {
        if (speaking) {
            stop();
            if (stop) return false;
        }
        if (view == null || text == null || text.trim().isEmpty()) return false;
        Context context = view.getContext().getApplicationContext();
        speaking = true;
        owner = new WeakReference<>(view);
        ownerUrl = null;
        // The address it starts on, taken on the main thread (see watch).
        MAIN.post(ReadAloud::takeUrl);
        int thisRun = ++run;
        String body = text.trim();
        MAIN.post(() -> Toast.makeText(context, notice != null ? notice
                : Texts.t("Reading aloud. Tap the button again to stop."), Toast.LENGTH_SHORT).show());
        // Language detection may take a moment and mustn't run on the main thread.
        new Thread(() -> {
            Locale language = detectLanguage(context, body);
            MAIN.post(() -> start(context, body, language, thisRun));
        }, "JoFSlashReadAloud").start();
        MAIN.postDelayed(ReadAloud::watch, 2000);
        return true;
    }

    static synchronized void stop() {
        speaking = false;
        pending = null;
        run++;
        try {
            if (tts != null) tts.stop();
        } catch (Exception ex) {
            Log.e(TAG, "Failed to stop reading", ex);
        }
    }

    /** Stops when it was started for this view (a page closing). */
    static synchronized void stopFor(View view) {
        if (speaking && owner.get() == view) stop();
    }

    private static synchronized void start(Context context, String text, Locale language, int thisRun) {
        if (!speaking || thisRun != run) return;
        Runnable speak = () -> speakNow(text, language, thisRun);
        if (tts != null && ready) {
            speak.run();
            return;
        }
        pending = speak;
        if (tts != null) return; // Still starting up; it runs pending when ready.
        tts = new TextToSpeech(context, (status) -> MAIN.post(() -> {
            synchronized (ReadAloud.class) {
                ready = status == TextToSpeech.SUCCESS;
                if (!ready) {
                    tts = null;
                    speaking = false;
                    pending = null;
                    Toast.makeText(context, Texts.t("This phone has no text-to-speech. Install one, such as Speech Services by Google."),
                            Toast.LENGTH_LONG).show();
                    return;
                }
                tts.setOnUtteranceProgressListener(new UtteranceProgressListener() {
                    @Override
                    public void onStart(String utteranceId) {
                    }

                    @Override
                    public void onDone(String utteranceId) {
                        if (utteranceId != null && utteranceId.equals(lastId)) speaking = false;
                    }

                    @Override
                    @SuppressWarnings("deprecation")
                    public void onError(String utteranceId) {
                        speaking = false;
                    }
                });
                Runnable next = pending;
                pending = null;
                if (next != null) next.run();
            }
        }));
    }

    private static synchronized void speakNow(String text, Locale language, int thisRun) {
        if (!speaking || thisRun != run || tts == null) return;
        try {
            if (language != null && tts.isLanguageAvailable(language) >= TextToSpeech.LANG_AVAILABLE) {
                tts.setLanguage(language);
            } else {
                tts.setLanguage(Locale.getDefault());
            }
            List<String> parts = split(text, Math.min(3900, TextToSpeech.getMaxSpeechInputLength() - 100));
            for (int i = 0; i < parts.size(); i++) {
                String id = ID + thisRun + "-" + i;
                if (i == parts.size() - 1) lastId = id;
                tts.speak(parts.get(i), i == 0 ? TextToSpeech.QUEUE_FLUSH : TextToSpeech.QUEUE_ADD, null, id);
            }
        } catch (Exception ex) {
            Log.e(TAG, "Failed to read aloud", ex);
            speaking = false;
        }
    }

    /** The page an address is on: without the part after #, which a page changes as you read. */
    private static String page(String url) {
        if (url == null) return "";
        int hash = url.indexOf('#');
        return hash < 0 ? url : url.substring(0, hash);
    }

    private static void takeUrl() {
        View view = owner.get();
        if (ownerUrl == null && view instanceof android.webkit.WebView) {
            String url = ((android.webkit.WebView) view).getUrl();
            ownerUrl = page(url);
        }
    }

    /**
     * Stops when the page it reads for has closed, or when its web view moved on to another page
     * (the feed and question pages share one), where the button to stop it is gone.
     */
    private static void watch() {
        if (!speaking) return;
        View view = owner.get();
        if (view == null || !view.isAttachedToWindow()) {
            stop();
            return;
        }
        if (view instanceof android.webkit.WebView) {
            // Read here, on the main thread, as a web view wants; the first check takes the address.
            String url = ((android.webkit.WebView) view).getUrl();
            if (ownerUrl == null) {
                ownerUrl = page(url);
            } else if (!ownerUrl.equals(page(url))) {
                stop();
                return;
            }
        }
        MAIN.postDelayed(ReadAloud::watch, 2000);
    }

    /** The text's language when the phone can tell (Android 10 and newer), else null. */
    private static Locale detectLanguage(Context context, String text) {
        if (android.os.Build.VERSION.SDK_INT < 29) return null;
        try {
            android.view.textclassifier.TextClassificationManager manager =
                    context.getSystemService(android.view.textclassifier.TextClassificationManager.class);
            if (manager == null) return null;
            String sample = text.length() > 1000 ? text.substring(0, 1000) : text;
            android.view.textclassifier.TextLanguage result = manager.getTextClassifier().detectLanguage(
                    new android.view.textclassifier.TextLanguage.Request.Builder(sample).build());
            if (result.getLocaleHypothesisCount() == 0) return null;
            android.icu.util.ULocale best = result.getLocale(0);
            return result.getConfidenceScore(best) >= 0.5f ? best.toLocale() : null;
        } catch (Throwable ex) {
            return null;
        }
    }

    /** Splits the text at paragraphs, then sentences, then spaces, into parts of at most max chars. */
    static List<String> split(String text, int max) {
        List<String> parts = new ArrayList<>();
        StringBuilder current = new StringBuilder();
        for (String paragraph : text.split("\\n+")) {
            String p = paragraph.trim();
            if (p.isEmpty()) continue;
            for (String piece : pieces(p, max)) {
                if (current.length() > 0 && current.length() + 1 + piece.length() > max) {
                    parts.add(current.toString());
                    current.setLength(0);
                }
                if (current.length() > 0) current.append('\n');
                current.append(piece);
            }
        }
        if (current.length() > 0) parts.add(current.toString());
        return parts;
    }

    private static List<String> pieces(String paragraph, int max) {
        List<String> out = new ArrayList<>();
        String rest = paragraph;
        while (rest.length() > max) {
            int cut = Math.max(rest.lastIndexOf(". ", max), Math.max(rest.lastIndexOf("? ", max), rest.lastIndexOf("! ", max)));
            if (cut < max / 2) cut = rest.lastIndexOf(' ', max);
            if (cut < max / 2) cut = max - 1;
            out.add(rest.substring(0, cut + 1).trim());
            rest = rest.substring(cut + 1).trim();
        }
        if (!rest.isEmpty()) out.add(rest);
        return out;
    }
}

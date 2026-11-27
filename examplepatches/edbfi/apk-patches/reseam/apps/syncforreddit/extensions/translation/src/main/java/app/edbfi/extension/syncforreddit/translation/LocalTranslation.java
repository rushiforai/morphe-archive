// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.syncforreddit.translation;

import android.content.ContentValues;
import android.content.CursorLoader;
import android.content.Loader;
import android.database.Cursor;
import android.view.View;
import android.widget.Toast;
import app.reseam.runtime.Export;
import com.google.android.gms.common.GoogleApiAvailability;
import com.google.mlkit.common.MlKitException;
import com.google.mlkit.common.model.DownloadConditions;
import com.google.mlkit.nl.languageid.LanguageIdentification;
import com.google.mlkit.nl.languageid.LanguageIdentifier;
import com.google.mlkit.nl.translate.Translation;
import com.google.mlkit.nl.translate.Translator;
import com.google.mlkit.nl.translate.TranslatorOptions;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Locale;
import java.util.WeakHashMap;

/** Play services and ML Kit calls use Sync 23033's R8 names. TranslationApi.kt checks them before patching. */
public final class LocalTranslation implements View.OnAttachStateChangeListener, Runnable {
    private static final String MODEL_UNAVAILABLE = "Translation model unavailable. Connect to Wi-Fi, then try Translate again.";
    private static final String MODEL_PENDING = "Model download is still pending. Reopen Translate to try again.";
    private static final long MODEL_WAIT_MS = 30_000;
    private static final int ML_KIT_UNAVAILABLE = 14;
    private static final WeakHashMap<View, Boolean> bulkQueries = new WeakHashMap<>();
    private static final WeakHashMap<View, BulkRun> bulkRuns = new WeakHashMap<>();
    private static final View.OnAttachStateChangeListener bulkRunLifetime = new View.OnAttachStateChangeListener() {
        @Override
        public void onViewAttachedToWindow(View attached) {}

        @Override
        public void onViewDetachedFromWindow(View detached) {
            endBulkRun(detached);
        }
    };

    private final View view;
    private final WeakReference<Object> sheet;
    private final int index;
    private final String text;
    private final String source;
    private final BulkRun bulkRun;
    private LanguageIdentifier identifier;
    private Translator translator;
    private ModelWait modelWait;
    private boolean closed;

    private LocalTranslation(View view, Object sheet, int index, String text, String source, BulkRun bulkRun) {
        this.view = view;
        this.sheet = new WeakReference<>(sheet);
        this.index = index;
        this.text = text;
        this.source = source;
        this.bulkRun = bulkRun;
    }

    @Export
    public static void single(View view, Object sheet, String text, String source) {
        if (view != null) new LocalTranslation(view, sheet, -1, text, source, null).schedule();
    }

    @Export
    public static void bulk(View view, Object sheet, int index, String text) {
        BulkRun run = bulkRuns.get(view);
        if (run != null) new LocalTranslation(view, sheet, index, text, null, run).schedule();
    }

    @Export
    public static void queryBulk(View view, Object sheet, CursorLoader loader) {
        if (view == null || bulkQueries.put(view, true) != null) {
            loader.reset();
            return;
        }
        new BulkQuery(view, sheet, loader).start();
    }

    @Export
    public static String bulkMessage(View view, ContentValues[] results) {
        BulkRun run = endBulkRun(view);
        for (ContentValues result : results) {
            if (result != null) return run == null ? "Translation complete" : run.message(true);
        }
        return run == null ? "No new translations" : run.message(false);
    }

    private static BulkRun endBulkRun(View view) {
        BulkRun run = bulkRuns.remove(view);
        if (run != null) view.removeOnAttachStateChangeListener(bulkRunLifetime);
        return run;
    }

    @Export
    public static boolean alreadyTranslated(CharSequence raw, CharSequence attribution) {
        return TranslationMarker.matches(raw, attribution);
    }

    @Export
    private static native boolean isCurrent(Object sheet, View view);

    @Export
    private static native void closeSheet(Object sheet);

    @Export
    private static native void chooseSource(Object sheet);

    @Export
    private static native void saveSingle(Object sheet, String source, String text);

    @Export
    private static native void saveBulk(Object sheet, int index, String source, String text);

    @Export
    private static native void advanceBulk(Object sheet, int index);

    @Export
    private static native Object readBulkRow(Cursor cursor, int index);

    @Export
    private static native void startBulkWork(Object sheet, ArrayList<?> rows, ContentValues[] results);

    private void schedule() {
        view.addOnAttachStateChangeListener(this);
        if (view.isAttachedToWindow()) onViewAttachedToWindow(view);
    }

    @Override
    public void onViewAttachedToWindow(View attached) {
        if (!attached.post(this)) close();
    }

    @Override
    public void onViewDetachedFromWindow(View detached) {
        close();
    }

    @Override
    public void run() {
        if (currentSheet() == null) {
            close();
            return;
        }
        String trimmed = text.trim();
        if (trimmed.isEmpty() || trimmed.equals("[deleted]") || trimmed.equals("[removed]")) {
            finish("No text to translate", false);
            return;
        }
        if (source != null) {
            translate(source);
            return;
        }

        int availability = GoogleApiAvailability.q().i(view.getContext());
        if (availability != 0) {
            String message = switch (availability) {
                case 1 -> "Install Google Play services for automatic language detection.";
                case 2 -> "Update Google Play services for automatic language detection.";
                case 3 -> "Enable Google Play services for automatic language detection.";
                case 18 -> "Google Play services is updating. Try again after it finishes.";
                default -> "Google Play services is unavailable for automatic language detection.";
            };
            cannotIdentify(message, true);
            return;
        }

        try {
            identifier = LanguageIdentification.a();
        } catch (RuntimeException ignored) {
            cannotIdentify("Unable to start language detection.", true);
            return;
        }
        try {
            identifier.q0(text).b(task -> {
                closeIdentifier();
                if (currentSheet() == null) {
                    close();
                } else if (task.q()) {
                    translate(task.m());
                } else {
                    Exception failure = task.l();
                    boolean unavailable = failure instanceof MlKitException mlKitFailure
                            && mlKitFailure.a() == ML_KIT_UNAVAILABLE;
                    cannotIdentify(unavailable
                            ? "Automatic language detection is unavailable. Try again later."
                            : "Unable to detect the source language.", unavailable);
                }
            });
        } catch (RuntimeException ignored) {
            cannotIdentify("Unable to start language detection for this text.", false);
        }
    }

    private void translate(String languageTag) {
        String language = supportedLanguage(languageTag);
        if (language == null) {
            String message = languageTag == null || languageTag.equals("und")
                    ? "Could not detect the source language." : "The source language is unsupported.";
            cannotIdentify(message, false);
            return;
        }
        if (language.equals("en")) {
            finish(source == null ? "The source text is already English." : "English is already the target language.",
                    false);
            return;
        }
        if (bulkRun != null && bulkRun.hasTimedOut(language)) {
            finish(MODEL_PENDING, false);
            return;
        }
        try {
            translator = Translation.a(new TranslatorOptions.Builder().b(language).c("en").a());
            ModelWait wait = new ModelWait(result -> {
                clearModelWait();
                if (currentSheet() == null) {
                    close();
                } else if (result == ModelWait.Result.READY) {
                    translateWithModel(language);
                } else if (result == ModelWait.Result.TIMED_OUT) {
                    if (bulkRun != null) bulkRun.recordTimeout(language);
                    finish(MODEL_PENDING, false);
                } else {
                    finish(MODEL_UNAVAILABLE, true);
                }
            });
            modelWait = wait;
            if (!view.postDelayed(wait, MODEL_WAIT_MS)) {
                finish(MODEL_UNAVAILABLE, true);
                return;
            }
            translator.G(new DownloadConditions.Builder().b().a()).b(download -> wait.complete(download.q()));
        } catch (RuntimeException ignored) {
            finish(MODEL_UNAVAILABLE, true);
        }
    }

    private void translateWithModel(String language) {
        try {
            translator.A(text).b(task -> {
                Object current = currentSheet();
                String translated = task.q() ? task.m() : null;
                if (current == null) {
                    close();
                } else if (translated == null || translated.trim().isEmpty()) {
                    finish("Unable to translate the text. Try again.", true);
                } else {
                    close();
                    if (index < 0) saveSingle(current, language, translated);
                    else saveBulk(current, index, language, translated);
                }
            });
        } catch (RuntimeException ignored) {
            finish("Unable to translate the text. Try again.", true);
        }
    }

    // Use the source languages offered by Sync's shipped ML Kit 17.0.1 language picker.
    private static String supportedLanguage(String tag) {
        if (tag == null) return null;
        String language = Locale.forLanguageTag(tag).getLanguage();
        return switch (language) {
            case "iw" -> "he";
            case "in" -> "id";
            case "nb" -> "no";
            case "fil" -> "tl";
            case "af", "sq", "ar", "be", "bg", "bn", "ca", "zh", "hr", "cs", "da", "nl",
                    "en", "eo", "et", "fi", "fr", "gl", "ka", "de", "el", "gu", "ht", "he",
                    "hi", "hu", "is", "id", "ga", "it", "ja", "kn", "ko", "lt", "lv", "mk",
                    "mr", "ms", "mt", "no", "fa", "pl", "pt", "ro", "ru", "sk", "sl", "es",
                    "sv", "sw", "tl", "ta", "te", "th", "tr", "uk", "ur", "vi", "cy" -> language;
            default -> null;
        };
    }

    private void cannotIdentify(String message, boolean unavailable) {
        Object current = currentSheet();
        close();
        if (current == null) return;
        if (index < 0) {
            notifyUser(view, message);
            chooseSource(current);
        } else {
            bulkRun.detectionFailed(index, message, unavailable, completed -> advanceBulk(current, completed));
        }
    }

    private void finish(String message, boolean bulkFailure) {
        Object current = currentSheet();
        close();
        if (current == null) return;
        if (index < 0) {
            notifyUser(view, message);
            closeSheet(current);
        } else {
            if (bulkFailure) bulkRun.recordFailure(message);
            advanceBulk(current, index);
        }
    }

    private static void notifyUser(View view, String message) {
        Toast.makeText(view.getContext(), message, Toast.LENGTH_LONG).show();
    }

    private Object currentSheet() {
        Object current = sheet.get();
        return !closed && current != null && view.isAttachedToWindow()
                && (bulkRun == null || bulkRuns.get(view) == bulkRun) && isCurrent(current, view) ? current : null;
    }

    private void closeIdentifier() {
        if (identifier == null) return;
        LanguageIdentifier client = identifier;
        identifier = null;
        client.close();
    }

    private void clearModelWait() {
        if (modelWait == null) return;
        modelWait.cancel();
        view.removeCallbacks(modelWait);
        modelWait = null;
    }

    private void close() {
        if (closed) return;
        closed = true;
        view.removeCallbacks(this);
        view.removeOnAttachStateChangeListener(this);
        clearModelWait();
        closeIdentifier();
        if (translator != null) {
            translator.close();
            translator = null;
        }
    }

    private static final class BulkQuery implements Loader.OnLoadCompleteListener<Cursor>, View.OnAttachStateChangeListener {
        private final View view;
        private final WeakReference<Object> sheet;
        private final CursorLoader loader;
        private final BulkSnapshot<ArrayList<Object>> snapshot = new BulkSnapshot<>(this::release);

        private BulkQuery(View view, Object sheet, CursorLoader loader) {
            this.view = view;
            this.sheet = new WeakReference<>(sheet);
            this.loader = loader;
        }

        private void start() {
            view.addOnAttachStateChangeListener(this);
            loader.registerListener(0, this);
            loader.startLoading();
        }

        @Override
        public void onLoadComplete(Loader<Cursor> source, Cursor cursor) {
            Object current = sheet.get();
            if (current == null || !isCurrent(current, view)) {
                snapshot.cancel();
                return;
            }
            snapshot.deliver(() -> copyRows(cursor), rows -> {
                if (rows.isEmpty()) {
                    notifyUser(view, "Error translating all (no items found)");
                    closeSheet(current);
                } else {
                    bulkRuns.put(view, new BulkRun(rows.size()));
                    view.addOnAttachStateChangeListener(bulkRunLifetime);
                    startBulkWork(current, rows, new ContentValues[rows.size()]);
                }
            });
        }

        private static ArrayList<Object> copyRows(Cursor cursor) {
            int count = cursor == null ? 0 : cursor.getCount();
            ArrayList<Object> rows = new ArrayList<>(count);
            for (int index = 0; index < count; index++) rows.add(readBulkRow(cursor, index));
            return rows;
        }

        private void release() {
            view.removeOnAttachStateChangeListener(this);
            loader.unregisterListener(this);
            loader.reset();
        }

        @Override
        public void onViewAttachedToWindow(View attached) {}

        @Override
        public void onViewDetachedFromWindow(View detached) {
            snapshot.cancel();
        }
    }
}

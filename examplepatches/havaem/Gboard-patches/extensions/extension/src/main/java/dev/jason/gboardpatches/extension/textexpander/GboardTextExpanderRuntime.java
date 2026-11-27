package dev.jason.gboardpatches.extension.textexpander;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.inputmethodservice.InputMethodService;
import android.os.Handler;
import android.os.Looper;
import android.text.InputType;
import android.text.TextUtils;
import android.util.Log;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;

import java.lang.reflect.Array;
import java.text.DateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;
import dev.jason.gboardpatches.extension.shiftdelete.GboardShiftDeleteEventBinding;

/**
 * Input-event entry for the text expander. On a soft Space press, a shortcut right before the
 * cursor is replaced with its expansion and the Space is consumed (the expansion carries its
 * own trailing space). Never throws; a reflection failure turns the feature off for the process.
 */
public final class GboardTextExpanderRuntime {
    private static final String TAG = "GboardTextExpander";
    private static final int SPACE = 62;

    private static final AtomicBoolean LOADING = new AtomicBoolean();
    private static volatile Snapshot snapshot;
    private static volatile GboardShiftDeleteEventBinding binding;
    private static volatile Throwable failure;
    private static final SharedPreferences.OnSharedPreferenceChangeListener REFRESH =
            (preferences, key) -> {
                if (key == null || GboardTextExpanderSettings.ENABLED.equals(key)
                        || GboardTextExpanderSettings.SHORTCUTS.equals(key)) {
                    snapshot = Snapshot.read(preferences);
                }
            };

    private GboardTextExpanderRuntime() { }

    /** Returns true when the event was handled here and Gboard must not process it. */
    public static boolean onInput(Object service, Object event) {
        if (event == null || failure != null || !(service instanceof InputMethodService ime)) {
            return false;
        }
        try {
            Snapshot current = snapshot;
            if (current == null) {
                load(ime);
                return false;
            }
            if (!current.enabled || current.shortcuts.isEmpty() || !isSpacePress(event)) {
                return false;
            }
            return expand(ime, current.shortcuts);
        } catch (Throwable error) {
            failure = error;
            report(error);
            return false;
        }
    }

    private static boolean isSpacePress(Object event) throws ReflectiveOperationException {
        GboardShiftDeleteEventBinding events = binding;
        if (events == null || events.eventType() != event.getClass()) {
            events = GboardShiftDeleteEventBinding.resolve(event.getClass());
            binding = events;
        }
        if (events.hardwareEvent.get(event) != null || events.metadata.get(event) == null) {
            return false;
        }
        Object entries = events.entries.get(event);
        if (entries == null || Array.getLength(entries) != 1) return false;
        Object entry = Array.get(entries, 0);
        if (entry == null || events.code.getInt(entry) != SPACE) return false;
        // Gboard's Space softkey carries data=" " as its payload.
        Object payload = events.payload.get(entry);
        return (payload == null || " ".equals(String.valueOf(payload)))
                && events.action.get(event) instanceof Enum<?> action
                && "PRESS".equals(action.name());
    }

    private static boolean expand(InputMethodService ime, Map<String, String> shortcuts) {
        InputConnection input = ime.getCurrentInputConnection();
        if (input == null || isSecret(ime.getCurrentInputEditorInfo())) return false;
        if (!TextUtils.isEmpty(input.getSelectedText(0))) return false;
        String token = GboardTextExpander.trailingToken(
                input.getTextBeforeCursor(GboardTextExpander.MAX_SHORTCUT_LENGTH + 1, 0));
        String template = token == null ? null : shortcuts.get(token);
        if (template == null) return false;
        GboardTextExpander.Expansion expansion =
                GboardTextExpander.expand(template, new Variables(ime));
        input.beginBatchEdit();
        try {
            // Commit Gboard's composing word first so the delete covers the shortcut as shown.
            input.finishComposingText();
            input.deleteSurroundingText(token.length(), 0);
            if (expansion.cursor < 0) {
                input.commitText(expansion.text + " ", 1);
            } else {
                input.commitText(expansion.text.substring(0, expansion.cursor), 1);
                // 0 keeps the cursor before the remaining text.
                input.commitText(expansion.text.substring(expansion.cursor), 0);
            }
        } finally {
            input.endBatchEdit();
        }
        return true;
    }

    private static boolean isSecret(EditorInfo editor) {
        if (editor == null) return false;
        int variation = editor.inputType & InputType.TYPE_MASK_VARIATION;
        int kind = editor.inputType & InputType.TYPE_MASK_CLASS;
        return kind == InputType.TYPE_CLASS_TEXT
                && (variation == InputType.TYPE_TEXT_VARIATION_PASSWORD
                        || variation == InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD
                        || variation == InputType.TYPE_TEXT_VARIATION_WEB_PASSWORD)
                || kind == InputType.TYPE_CLASS_NUMBER
                        && variation == InputType.TYPE_NUMBER_VARIATION_PASSWORD;
    }

    /** First use reads settings off the input thread; keys typed meanwhile pass through. */
    private static void load(Context context) {
        Context app = context.getApplicationContext() != null
                ? context.getApplicationContext() : context;
        if (!GboardPatchesSettings.isUserUnlocked(app) || !LOADING.compareAndSet(false, true)) {
            return;
        }
        new Thread(() -> {
            try {
                SharedPreferences preferences = GboardPatchesSettings.preferencesOrNull(app);
                if (preferences == null) {
                    LOADING.set(false);
                    return;
                }
                Snapshot loaded = Snapshot.read(preferences);
                new Handler(Looper.getMainLooper()).post(() -> {
                    preferences.registerOnSharedPreferenceChangeListener(REFRESH);
                    snapshot = Snapshot.read(preferences);
                });
                snapshot = loaded;
            } catch (Throwable error) {
                LOADING.set(false);
                report(error);
            }
        }, TAG).start();
    }

    private static void report(Throwable error) {
        try {
            Log.w(TAG, "Text expander unavailable", error);
        } catch (Throwable ignored) { }
    }

    private static final class Snapshot {
        final boolean enabled;
        final Map<String, String> shortcuts;

        Snapshot(boolean enabled, Map<String, String> shortcuts) {
            this.enabled = enabled;
            this.shortcuts = shortcuts;
        }

        static Snapshot read(SharedPreferences preferences) {
            return new Snapshot(GboardTextExpanderSettings.enabled(preferences),
                    Collections.unmodifiableMap(GboardTextExpanderSettings.shortcuts(preferences)));
        }
    }

    private static final class Variables implements GboardTextExpander.Variables {
        private final Context context;
        private final Date now = new Date();

        Variables(Context context) {
            this.context = context;
        }

        @Override public String date() {
            return DateFormat.getDateInstance(DateFormat.SHORT).format(now);
        }

        @Override public String time() {
            return DateFormat.getTimeInstance(DateFormat.SHORT).format(now);
        }

        @Override public String clipboard() {
            ClipboardManager clipboard = context.getSystemService(ClipboardManager.class);
            ClipData clip = clipboard == null ? null : clipboard.getPrimaryClip();
            if (clip == null || clip.getItemCount() == 0) return "";
            CharSequence text = clip.getItemAt(0).coerceToText(context);
            return text == null ? "" : text.toString();
        }
    }
}

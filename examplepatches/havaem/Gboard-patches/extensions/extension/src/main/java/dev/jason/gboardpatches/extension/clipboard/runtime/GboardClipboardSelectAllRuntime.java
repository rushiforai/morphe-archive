package dev.jason.gboardpatches.extension.clipboard;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.LocaleList;
import android.os.Looper;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;

import java.util.Locale;
import java.util.concurrent.atomic.AtomicBoolean;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.clipboard.header.GboardClipboardExtraActions;
import dev.jason.gboardpatches.extension.clipboard.header.GboardClipboardHeaderActions;
import dev.jason.gboardpatches.extension.clipboard.header.GboardClipboardHeaderBinding;
import dev.jason.gboardpatches.extension.clipboard.search.GboardClipboardSearch;
import dev.jason.gboardpatches.extension.clipboard.search.GboardClipboardSearchBinding;
import dev.jason.gboardpatches.extension.customstickers.GboardCustomStickersClipboardImport;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;
import dev.jason.gboardpatches.extension.settings.GboardSettingsLocaleManager;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

/** Adapts the clipboard panel lifecycle and native touch dispatch to the edit action. */
public final class GboardClipboardSelectAllRuntime {
    private static final String TAG = "GboardClipboardSelectAll";
    private static GboardClipboardHeaderBinding binding;
    private static final AtomicBoolean LOADING_SETTINGS = new AtomicBoolean();
    private static volatile Preferences preferences;
    private static volatile Snapshot snapshot;
    private static final SharedPreferences.OnSharedPreferenceChangeListener REFRESH =
            (changed, key) -> {
                if (key == null || GboardClipboardSettings.PREF_KEY_CLIPBOARD_ENABLED.equals(key)
                        || GboardClipboardSettings.PREF_KEY_SELECT_ALL.equals(key)
                        || GboardClipboardSettings.PREF_KEY_EXCLUDE_PINNED.equals(key)
                        || GboardClipboardSettings.PREF_KEY_SEARCH.equals(key)
                        || GboardClipboardSettings.PREF_KEY_SAVE_STICKERS.equals(key)
                        || GboardPatchesSettings.PREF_KEY_SETTINGS_UI_LANGUAGE.equals(key)) {
                    publishSettings();
                }
            };

    private GboardClipboardSelectAllRuntime() { }

    public static void beforeOpenOrClose(Object keyboard) {
        GboardClipboardSearch.beforeOpenOrClose();
        try {
            GboardClipboardHeaderActions.close(keyboard);
            GboardClipboardExtraActions.close(keyboard);
        } catch (Throwable failure) {
            report(failure);
        }
    }

    public static void afterOpen(Object keyboard) {
        GboardClipboardSearch.afterOpen();
        try {
            if (binding == null) {
                binding = new GboardClipboardHeaderBinding(keyboard.getClass().getClassLoader(),
                        GboardClipboardSelectAllRuntime::settings,
                        GboardClipboardSelectAllRuntime::report);
            }
            binding.attach(keyboard, EXTRA);
        } catch (Throwable failure) {
            report(failure);
        }
    }

    public static void afterState(Object keyboard, int state) {
        try {
            boolean editing = state >= 1 && state <= 3;
            GboardClipboardHeaderActions.stateChanged(keyboard, editing);
            GboardClipboardExtraActions.stateChanged(keyboard, editing);
        } catch (Throwable failure) {
            report(failure);
        }
    }

    public static void afterData(Object adapter) {
        try {
            if (binding != null) {
                Object keyboard = binding.keyboardForAdapter(adapter);
                GboardClipboardHeaderActions.update(keyboard);
                GboardClipboardExtraActions.update(keyboard);
            }
        } catch (Throwable failure) {
            report(failure);
        }
    }

    public static boolean interceptTouch(View header, MotionEvent event) {
        try {
            return GboardClipboardHeaderActions.onHeaderTouch(header, event)
                    || GboardClipboardExtraActions.onHeaderTouch(header, event);
        } catch (Throwable failure) {
            report(failure);
            return false;
        }
    }

    /** Search and Add-to-stickers; each reflective binding is resolved on first use. */
    private static final GboardClipboardExtraActions.Ops EXTRA = new GboardClipboardExtraActions.Ops() {
        private GboardClipboardSearchBinding search;
        private GboardCustomStickersClipboardImport stickers;

        @Override public boolean isCurrent(Object keyboard, View header)
                throws ReflectiveOperationException {
            return binding != null && binding.isCurrent(keyboard, header);
        }

        @Override public GboardClipboardExtraActions.Settings settings(Context context) {
            Snapshot current = snapshot;
            if (current == null) {
                // Select All only loads settings in edit mode; Search shows outside it.
                if (preferences == null) loadSettings(context);
                return null;
            }
            if (!(current.search || current.stickers)) return null;
            String language = language(context, current);
            return new GboardClipboardExtraActions.Settings(current.search, current.stickers,
                    GboardSettingsText.getInLanguage(R.string.gboard_clipboard_search_label, language),
                    GboardSettingsText.getInLanguage(R.string.gboard_clipboard_search_clear, language),
                    GboardSettingsText.getInLanguage(R.string.gboard_clipboard_sticker_label, language));
        }

        @Override public boolean searchAvailable(Object keyboard)
                throws ReflectiveOperationException {
            return search(keyboard).available(keyboard);
        }

        @Override public void openSearch(Object keyboard, View view)
                throws ReflectiveOperationException {
            String language = language(view.getContext(), snapshot);
            search(keyboard).open(keyboard, view, new GboardClipboardSearchBinding.Texts(
                    GboardSettingsText.getInLanguage(R.string.gboard_clipboard_search_label, language),
                    GboardSettingsText.getInLanguage(R.string.gboard_clipboard_search_action, language),
                    GboardSettingsText.getInLanguage(R.string.gboard_clipboard_search_hint, language)),
                    GboardClipboardSelectAllRuntime::report);
        }

        @Override public void clearSearch(Object keyboard) throws ReflectiveOperationException {
            search(keyboard).clear(keyboard);
        }

        @Override public String activeQuery() {
            return GboardClipboardSearch.query();
        }

        @Override public void addSelectedToStickers(Object keyboard, View anchor)
                throws ReflectiveOperationException {
            if (stickers == null) {
                stickers = new GboardCustomStickersClipboardImport(
                        keyboard.getClass().getClassLoader());
            }
            String language = language(anchor.getContext(), snapshot);
            stickers.show(anchor, stickers.selectedImages(keyboard),
                    new GboardCustomStickersClipboardImport.Texts(
                            GboardSettingsText.getInLanguage(
                                    R.string.gboard_clipboard_sticker_no_images, language),
                            GboardSettingsText.getInLanguage(
                                    R.string.gboard_clipboard_sticker_new_pack, language),
                            GboardSettingsText.getInLanguage(
                                    R.string.gboard_clipboard_sticker_default_pack, language),
                            GboardSettingsText.getInLanguage(
                                    R.string.gboard_clipboard_sticker_added, language),
                            GboardSettingsText.getInLanguage(
                                    R.string.gboard_clipboard_sticker_failed, language)));
        }

        @Override public void report(Throwable failure) {
            GboardClipboardSelectAllRuntime.report(failure);
        }

        private GboardClipboardSearchBinding search(Object keyboard)
                throws ReflectiveOperationException {
            if (search == null) {
                search = new GboardClipboardSearchBinding(keyboard.getClass().getClassLoader());
            }
            return search;
        }
    };

    private static String language(Context context, Snapshot current) {
        LocaleList locales = context.getResources().getConfiguration().getLocales();
        Locale deviceLocale = locales.isEmpty() ? Locale.getDefault() : locales.get(0);
        return GboardSettingsLocaleManager.resolveEffectiveLanguageTag(
                current == null ? null : current.languagePreference, deviceLocale);
    }

    private static GboardClipboardHeaderActions.Settings settings(Context context) {
        Snapshot current = snapshot;
        if (current == null) {
            if (preferences == null) loadSettings(context);
            return null;
        }
        if (!current.enabled) return null;
        String language = language(context, current);
        int emptyText = current.excludePinned
                ? R.string.gboard_clipboard_no_unpinned : R.string.gboard_clipboard_no_items;
        return new GboardClipboardHeaderActions.Settings(
                GboardSettingsText.getInLanguage(
                        R.string.gboard_patches_long_press_quick_actions_action_select_all, language),
                GboardSettingsText.getInLanguage(emptyText, language),
                current.excludePinned);
    }

    private static void loadSettings(Context context) {
        Context app = context.getApplicationContext();
        if (app == null || !GboardPatchesSettings.isUserUnlocked(app)
                || !LOADING_SETTINGS.compareAndSet(false, true)) return;
        try {
            new Thread(() -> {
                try {
                    SharedPreferences clipboard = GboardClipboardSettings.preferences(app);
                    SharedPreferences ui = GboardPatchesSettings.preferencesOrNull(app);
                    if (ui == null) {
                        LOADING_SETTINGS.set(false);
                        return;
                    }
                    // Await initial disk loads here. Later reads use these in-memory stores.
                    clipboard.getAll();
                    ui.getAll();
                    boolean stickers = GboardPatchesFeatureAvailability.hasFeature(app,
                            GboardPatchesFeatureAvailability.FEATURE_CUSTOM_STICKERS);
                    Handler main = new Handler(Looper.getMainLooper());
                    if (!main.post(() -> registerSettings(clipboard, ui, stickers))) {
                        LOADING_SETTINGS.set(false);
                    }
                } catch (Throwable failure) {
                    LOADING_SETTINGS.set(false);
                    report(failure);
                }
            }, "GboardClipboardSettings").start();
        } catch (Throwable failure) {
            LOADING_SETTINGS.set(false);
            report(failure);
        }
    }

    private static void registerSettings(SharedPreferences clipboard, SharedPreferences ui,
            boolean stickersInstalled) {
        try {
            clipboard.registerOnSharedPreferenceChangeListener(REFRESH);
            ui.registerOnSharedPreferenceChangeListener(REFRESH);
            preferences = new Preferences(clipboard, ui, stickersInstalled);
            publishSettings();
        } catch (Throwable failure) {
            report(failure);
        } finally {
            LOADING_SETTINGS.set(false);
        }
    }

    private static void publishSettings() {
        try {
            Preferences current = preferences;
            if (current == null) return;
            boolean clipboardEnabled = GboardClipboardSettings.readClipboardEnabled(current.clipboard);
            snapshot = new Snapshot(
                    clipboardEnabled && GboardClipboardSettings.readSelectAll(current.clipboard),
                    GboardClipboardSettings.readExcludePinned(current.clipboard),
                    clipboardEnabled && GboardClipboardSettings.readSearch(current.clipboard),
                    clipboardEnabled && current.stickersInstalled
                            && GboardClipboardSettings.readSaveStickers(current.clipboard),
                    GboardSettingsLocaleManager.readLanguagePreference(current.ui));
            GboardClipboardHeaderActions.settingsPublished();
            GboardClipboardExtraActions.settingsPublished();
        } catch (Throwable failure) {
            snapshot = null;
            report(failure);
            try {
                GboardClipboardHeaderActions.settingsPublished();
                GboardClipboardExtraActions.settingsPublished();
            } catch (Throwable cleanup) {
                report(cleanup);
            }
        }
    }

    private static final class Preferences {
        final SharedPreferences clipboard;
        final SharedPreferences ui;
        final boolean stickersInstalled;

        Preferences(SharedPreferences clipboard, SharedPreferences ui, boolean stickersInstalled) {
            this.clipboard = clipboard;
            this.ui = ui;
            this.stickersInstalled = stickersInstalled;
        }
    }

    private static final class Snapshot {
        final boolean enabled;
        final boolean excludePinned;
        final boolean search;
        final boolean stickers;
        final String languagePreference;

        Snapshot(boolean enabled, boolean excludePinned, boolean search, boolean stickers,
                String languagePreference) {
            this.enabled = enabled;
            this.excludePinned = excludePinned;
            this.search = search;
            this.stickers = stickers;
            this.languagePreference = languagePreference;
        }
    }

    private static void report(Throwable failure) {
        try {
            Log.w(TAG, "Clipboard select all unavailable", failure);
        } catch (Throwable ignored) { }
    }
}

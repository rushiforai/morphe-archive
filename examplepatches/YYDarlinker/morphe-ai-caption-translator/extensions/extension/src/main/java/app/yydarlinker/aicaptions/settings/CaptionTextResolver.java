package app.yydarlinker.aicaptions.settings;

import android.content.Context;
import android.content.res.Configuration;
import android.os.LocaleList;
import android.text.TextUtils;
import android.text.NoCopySpan;
import android.text.Spanned;
import android.view.View;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import android.app.Dialog;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;

/** UI text only. A configuration context never leaves string(), and is never retained. */
public final class CaptionTextResolver {
    private static final String SETTINGS = "app.morphe.extension.shared.settings.";
    private static final String YOUTUBE = "com.google.android.youtube";

    private CaptionTextResolver() {}

    /** Text equality that also sees real span and style changes, not just equal characters. */
    public static boolean sameText(CharSequence a, CharSequence b) {
        if (a == b) return true;
        if (!TextUtils.equals(a, b)) return false;
        List<Object> left = styleSpans(a), right = styleSpans(b);
        if (left.size() != right.size()) return false;
        for (int i = 0; i < left.size(); i++) {
            Object x = left.get(i), y = right.get(i);
            Spanned sx = (Spanned) a, sy = (Spanned) b;
            if (!x.equals(y)
                    || sx.getSpanStart(x) != sy.getSpanStart(y)
                    || sx.getSpanEnd(x) != sy.getSpanEnd(y)
                    || sx.getSpanFlags(x) != sy.getSpanFlags(y)) return false;
        }
        return true;
    }

    private static List<Object> styleSpans(CharSequence value) {
        List<Object> result = new ArrayList<>();
        if (value instanceof Spanned)
            for (Object span : ((Spanned) value).getSpans(0, value.length(), Object.class))
                if (!(span instanceof NoCopySpan)) result.add(span);
        return result;
    }

    /** The language Morphe is set to, else the language of the app. */
    public static Locale locale(Context caller) {
        Locale chosen = morpheLocale();
        if (chosen != null) return chosen;
        try {
            return caller.getResources().getConfiguration().getLocales().get(0);
        } catch (RuntimeException unavailable) {
            return Locale.ENGLISH;
        }
    }

    /** Morphe's own language setting, or null when it follows the system or is not installed. */
    private static Locale morpheLocale() {
        try {
            Object setting =
                    Class.forName(SETTINGS + "BaseSettings").getField("MORPHE_LANGUAGE").get(null);
            Class<?> enumSetting = Class.forName(SETTINGS + "EnumSetting");
            if (!enumSetting.isInstance(setting)) return null;
            java.lang.reflect.Method get = enumSetting.getMethod("get");
            if (!Enum.class.isAssignableFrom(get.getReturnType())) return null;
            Object value = get.invoke(setting);
            Class<?> language = Class.forName(SETTINGS + "AppLanguage");
            if (!language.isInstance(value) || "DEFAULT".equals(((Enum<?>) value).name()))
                return null;
            java.lang.reflect.Method getLocale = language.getMethod("getLocale");
            if (getLocale.getReturnType() != Locale.class) return null;
            Object selected = getLocale.invoke(value);
            return selected instanceof Locale ? (Locale) selected : null;
        } catch (ReflectiveOperationException | ClassCastException | LinkageError unavailable) {
            return null;
        }
    }

    /** The text of [key] in the language of the app. */
    static String string(Context caller, String key) {
        return string(caller, locale(caller), key);
    }

    /**
     * The text of [key] in [locale], read through a configuration context that exists only for this
     * call. A key without a resource is shown as it is.
     */
    public static String string(Context caller, Locale locale, String key) {
        if (caller == null) return key;
        int id = identifier(caller, key);
        if (id == 0) return key;
        Configuration configuration = new Configuration(caller.getResources().getConfiguration());
        configuration.setLocale(locale);
        try {
            return caller.createConfigurationContext(configuration).getString(id);
        } catch (android.content.res.Resources.NotFoundException unavailable) {
            return key;
        }
    }

    private static int identifier(Context caller, String key) {
        String name = "cap_" + key;
        try {
            Object id =
                    Class.forName("app.morphe.extension.shared.ResourceUtils")
                            .getMethod("getStringIdentifier", String.class)
                            .invoke(null, name);
            // Confirm that the id belongs to this resource table, including renamed APKs.
            if (id instanceof Integer
                    && (Integer) id != 0
                    && name.equals(caller.getResources().getResourceEntryName((Integer) id)))
                return (Integer) id;
        } catch (ReflectiveOperationException | RuntimeException | LinkageError unavailable) {
            // A standalone host: look the name up directly.
        }
        int id = caller.getResources().getIdentifier(name, "string", caller.getPackageName());
        return id != 0 ? id : caller.getResources().getIdentifier(name, "string", YOUTUBE);
    }

    /**
     * Gives [view] the layout and text direction of the app language. Data (an editor holding a url
     * or a key) stays left to right.
     */
    static void direction(View view, boolean data) {
        Locale selected = locale(view.getContext());
        boolean rtl =
                !data
                        && TextUtils.getLayoutDirectionFromLocale(selected)
                                == View.LAYOUT_DIRECTION_RTL;
        int layout = rtl ? View.LAYOUT_DIRECTION_RTL : View.LAYOUT_DIRECTION_LTR;
        int text =
                data
                        ? View.TEXT_DIRECTION_LTR
                        : rtl ? View.TEXT_DIRECTION_RTL : View.TEXT_DIRECTION_LOCALE;
        if (view.getLayoutDirection() != layout) view.setLayoutDirection(layout);
        if (view.getTextDirection() != text) view.setTextDirection(text);
        if (view instanceof TextView) {
            LocaleList locales = new LocaleList(selected);
            if (!locales.equals(((TextView) view).getTextLocales()))
                ((TextView) view).setTextLocales(locales);
        }
    }

    /** One standard preferences listener per actual AI group. No Fragment hooks or window ownership. */
    @SuppressWarnings("deprecation")
    static final class Subscription
            implements SharedPreferences.OnSharedPreferenceChangeListener {
        private static final Map<PreferenceGroup, Subscription> GROUPS =
                new WeakHashMap<>();
        private final WeakReference<PreferenceGroup> root;
        private final WeakReference<CaptionSettingsSwitch> child;
        private final SharedPreferences preferences;
        private final String languageKey;
        private final Handler main = new Handler(Looper.getMainLooper());
        private final Runnable update =
                () -> {
                    queued = false;
                    refresh();
                };
        private boolean queued, registered;

        private Subscription(
                PreferenceGroup root,
                CaptionSettingsSwitch child,
                SharedPreferences preferences,
                String key) {
            this.root = new WeakReference<>(root);
            this.child = new WeakReference<>(child);
            this.preferences = preferences;
            languageKey = key;
            preferences.registerOnSharedPreferenceChangeListener(this);
            registered = true;
        }

        static Subscription attach(CaptionSettingsSwitch child) {
            PreferenceGroup parent = child.getParent();
            if (parent == null || !"morphe_vot_screen__ai_captions".equals(parent.getKey()))
                return null;
            Subscription existing = GROUPS.get(parent);
            if (existing != null && existing.child.get() == child) return existing;
            if (existing != null) existing.close();
            try {
                Object setting =
                        Class.forName("app.morphe.extension.shared.settings.BaseSettings")
                                .getField("MORPHE_LANGUAGE")
                                .get(null);
                Class<?> owner = Class.forName("app.morphe.extension.shared.settings.Setting");
                if (!owner.isInstance(setting)) return null;
                Object key = owner.getField("key").get(setting);
                Object category = owner.getField("preferences").get(null);
                Object preferences = category.getClass().getField("preferences").get(category);
                if (!(key instanceof String) || !(preferences instanceof SharedPreferences))
                    return null;
                Subscription result =
                        new Subscription(
                                parent, child, (SharedPreferences) preferences, (String) key);
                GROUPS.put(parent, result);
                result.refresh();
                return result;
            } catch (ReflectiveOperationException | LinkageError unavailable) {
                refreshGroup(parent);
                return null;
            }
        }

        @Override
        public void onSharedPreferenceChanged(SharedPreferences ignored, String key) {
            if (root.get() == null || child.get() == null) {
                close();
                return;
            }
            if (!languageKey.equals(key) || queued) return;
            queued = true;
            main.post(update); // Read the Enum after the official save call stack returns.
        }

        private void refresh() {
            PreferenceGroup group = root.get();
            CaptionSettingsSwitch anchor = child.get();
            if (group == null || anchor == null || anchor.getParent() != group) {
                close();
                return;
            }
            refreshGroup(group);
        }

        static void refreshGroup(PreferenceGroup group) {
            group.setTitle(CaptionStrings.get(group.getContext(), "ai_title"));
            group.setSummary(CaptionStrings.get(group.getContext(), "ai_summary"));
            if (group instanceof PreferenceScreen) {
                Dialog dialog = ((PreferenceScreen) group).getDialog();
                if (dialog != null) dialog.setTitle(group.getTitle());
            }
            refreshChildren(group);
        }

        static void refreshChildren(PreferenceGroup group) {
            for (int index = 0; index < group.getPreferenceCount(); index++) {
                Preference preference = group.getPreference(index);
                if (preference instanceof CaptionSettingsPreference)
                    ((CaptionSettingsPreference) preference).refresh();
                if (preference instanceof CaptionSettingsSwitch)
                    ((CaptionSettingsSwitch) preference).refresh();
                String key = preference.getKey();
                String prefix = "ai_caption_section_";
                if (preference instanceof android.preference.PreferenceCategory && key != null
                        && key.startsWith(prefix))
                    CaptionSettingsPreference.localizeTitle(preference, key.substring(prefix.length()));
                if (preference instanceof PreferenceGroup)
                    refreshChildren((PreferenceGroup) preference);
            }
        }

        void close() {
            main.removeCallbacks(update);
            queued = false;
            if (registered) {
                preferences.unregisterOnSharedPreferenceChangeListener(this);
                registered = false;
            }
            PreferenceGroup group = root.get();
            if (group != null && GROUPS.get(group) == this) GROUPS.remove(group);
        }
    }
}

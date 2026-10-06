package app.yydarlinker.deepseekcaptions;

import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;

/** One standard preferences listener per actual AI group. No Fragment hooks or window ownership. */
@SuppressWarnings("deprecation")
final class CaptionLocaleSubscription implements SharedPreferences.OnSharedPreferenceChangeListener {
    private static final Map<PreferenceGroup, CaptionLocaleSubscription> GROUPS = new WeakHashMap<>();
    private final WeakReference<PreferenceGroup> root;
    private final WeakReference<DeepSeekEnabledPreference> child;
    private final SharedPreferences preferences;
    private final String languageKey;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Runnable update = () -> { queued = false; refresh(); };
    private boolean queued, registered;
    private CaptionLocaleSubscription(PreferenceGroup root, DeepSeekEnabledPreference child,
            SharedPreferences preferences, String key) {
        this.root = new WeakReference<>(root); this.child = new WeakReference<>(child);
        this.preferences = preferences; languageKey = key;
        preferences.registerOnSharedPreferenceChangeListener(this); registered = true;
    }
    static CaptionLocaleSubscription attach(DeepSeekEnabledPreference child) {
        PreferenceGroup parent = child.getParent();
        if (parent == null || !"morphe_vot_screen__ai_captions".equals(parent.getKey())) return null;
        CaptionLocaleSubscription existing = GROUPS.get(parent);
        if (existing != null && existing.child.get() == child) return existing;
        if (existing != null) existing.close();
        try {
            Object setting = Class.forName("app.morphe.extension.shared.settings.BaseSettings")
                    .getField("MORPHE_LANGUAGE").get(null);
            Class<?> owner = Class.forName("app.morphe.extension.shared.settings.Setting");
            if (!owner.isInstance(setting)) return null;
            Object key = owner.getField("key").get(setting);
            Object category = owner.getField("preferences").get(null);
            Object preferences = category.getClass().getField("preferences").get(category);
            if (!(key instanceof String) || !(preferences instanceof SharedPreferences)) return null;
            CaptionLocaleSubscription result = new CaptionLocaleSubscription(parent, child, (SharedPreferences) preferences, (String) key);
            GROUPS.put(parent, result); result.refresh(); return result;
        } catch (ReflectiveOperationException | LinkageError unavailable) {
            refreshGroup(parent); return null;
        }
    }
    @Override public void onSharedPreferenceChanged(SharedPreferences ignored, String key) {
        if (root.get() == null || child.get() == null) { close(); return; }
        if (!languageKey.equals(key) || queued) return;
        queued = true; main.post(update); // Read the Enum after the official save call stack returns.
    }
    private void refresh() {
        PreferenceGroup group = root.get(); DeepSeekEnabledPreference anchor = child.get();
        if (group == null || anchor == null || anchor.getParent() != group) { close(); return; }
        refreshGroup(group);
    }
    static void refreshGroup(PreferenceGroup group) {
        group.setTitle(CaptionStrings.settings(group.getContext(), "ai_title"));
        group.setSummary(CaptionStrings.settings(group.getContext(), "ai_summary"));
        if(group instanceof android.preference.PreferenceScreen){android.app.Dialog dialog=((android.preference.PreferenceScreen)group).getDialog();if(dialog!=null)dialog.setTitle(group.getTitle());}
        refreshChildren(group);
    }
    private static void refreshChildren(PreferenceGroup group) {
        for (int index = 0; index < group.getPreferenceCount(); index++) {
            Preference preference = group.getPreference(index);
            if (preference instanceof CaptionSettingPreference) ((CaptionSettingPreference) preference).refreshCaptionText();
            if (preference instanceof CaptionSettingCategory) ((CaptionSettingCategory) preference).refreshCaptionText();
            if (preference instanceof PreferenceGroup) refreshChildren((PreferenceGroup) preference);
        }
    }
    void close() {
        main.removeCallbacks(update); queued = false;
        if (registered) { preferences.unregisterOnSharedPreferenceChangeListener(this); registered = false; }
        PreferenceGroup group = root.get(); if (group != null && GROUPS.get(group) == this) GROUPS.remove(group);
    }
}

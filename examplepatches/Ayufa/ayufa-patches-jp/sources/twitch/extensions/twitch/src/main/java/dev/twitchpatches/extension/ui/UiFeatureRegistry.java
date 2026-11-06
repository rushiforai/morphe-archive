package dev.twitchpatches.extension.ui;

import dev.twitchpatches.extension.settings.SettingSection;
import dev.twitchpatches.extension.settings.ToggleSetting;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public final class UiFeatureRegistry {
    public interface Preferences {
        boolean read(String key);
        void write(String key, boolean enabled);
    }

    private final Preferences preferences;
    private final Map<String, ToggleSetting> features = new LinkedHashMap<>();
    private final Set<Runnable> listeners = new LinkedHashSet<>();
    private boolean batching;
    private boolean changed;

    public UiFeatureRegistry(Preferences preferences) { this.preferences = preferences; }

    public synchronized ToggleSetting register(String key, String title, String summary) {
        return register(key, title, summary, SettingSection.INTERFACE, "ic_settings");
    }

    public synchronized ToggleSetting register(String key, String title, String summary, SettingSection section, String icon) {
        if (key == null || !key.matches("[a-z][a-z0-9_]{0,63}") || title == null || title.trim().isEmpty() || summary == null
                || section == null || icon == null || !icon.matches("[a-z][a-z0-9_]*"))
            throw new IllegalArgumentException("UI option requires a stable key, title, summary, section and icon.");
        if (features.containsKey(key)) throw new IllegalStateException("Duplicate UI option: " + key);
        ToggleSetting option = new ToggleSetting() {
            private volatile boolean enabled = preferences.read(key);
            @Override public String key() { return key; }
            @Override public String title() { return title; }
            @Override public String summary() { return summary; }
            @Override public SettingSection section() { return section; }
            @Override public String icon() { return icon; }
            @Override public boolean isEnabled() { return enabled; }
            @Override public void setEnabled(boolean value) {
                synchronized (UiFeatureRegistry.this) {
                    if (enabled == value) return;
                    preferences.write(key, value);
                    enabled = value;
                }
                notifyChanged();
            }
        };
        features.put(key, option);
        return option;
    }

    public synchronized boolean enabled(String key) {
        ToggleSetting option = features.get(key);
        return option != null && option.isEnabled();
    }

    public synchronized List<ToggleSetting> options() { return new ArrayList<>(features.values()); }

    public ToggleSetting master(String key, List<ToggleSetting> children) {
        return master(key, children, "すべて非表示", SettingSection.INTERFACE);
    }

    public ToggleSetting master(String key, List<ToggleSetting> children, String title, SettingSection section) {
        List<ToggleSetting> members = new ArrayList<>(children);
        if (members.isEmpty()) throw new IllegalArgumentException("UI group requires options.");
        return new ToggleSetting() {
            @Override public String key() { return key; }
            @Override public String title() { return title; }
            @Override public String summary() {
                long hidden = members.stream().filter(ToggleSetting::isEnabled).count();
                return hidden == 0 ? "すべて表示中です。" : hidden == members.size() ? "すべて非表示中です。"
                        : members.size() + "件中" + hidden + "件を非表示中です。";
            }
            @Override public SettingSection section() { return section; }
            @Override public boolean isEnabled() { return members.stream().allMatch(ToggleSetting::isEnabled); }
            @Override public void setEnabled(boolean enabled) { setAll(members, enabled); }
        };
    }

    private void setAll(List<ToggleSetting> members, boolean enabled) {
        synchronized (this) {
            batching = true;
            try { members.forEach(option -> option.setEnabled(enabled)); }
            finally { batching = false; }
            if (!changed) return;
            changed = false;
        }
        notifyChanged();
    }

    public synchronized Map<String, Boolean> snapshot() {
        Map<String, Boolean> values = new LinkedHashMap<>();
        features.forEach((key, option) -> values.put(key, option.isEnabled()));
        return values;
    }

    public synchronized AutoCloseable observe(Runnable listener) {
        if (listener == null) throw new IllegalArgumentException("UI listener is required.");
        Runnable subscription = listener::run;
        listeners.add(subscription);
        return () -> { synchronized (UiFeatureRegistry.this) { listeners.remove(subscription); } };
    }

    private void notifyChanged() {
        List<Runnable> callbacks;
        synchronized (this) {
            if (batching) { changed = true; return; }
            callbacks = new ArrayList<>(listeners);
        }
        callbacks.forEach(Runnable::run);
    }
}

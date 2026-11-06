package dev.twitchpatches.extension.settings;

final class SettingsOpenRequest {
    private boolean pending;
    private String groupKey;

    void request() { request(null); }
    void request(String key) { groupKey = key; pending = true; }
    String groupKey() { return groupKey; }

    boolean consume(boolean canShow, boolean alreadyOpen) {
        if (!pending || !canShow) return false;
        pending = false;
        return !alreadyOpen;
    }
}

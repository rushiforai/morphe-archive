package dev.twitchpatches.extension.settings;

final class SettingsOpenRequest {
    private boolean pending;

    void request() { pending = true; }

    boolean consume(boolean canShow, boolean alreadyOpen) {
        if (!pending || !canShow) return false;
        pending = false;
        return !alreadyOpen;
    }
}

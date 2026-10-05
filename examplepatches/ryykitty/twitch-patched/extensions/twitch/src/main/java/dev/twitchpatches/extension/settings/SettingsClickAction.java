package dev.twitchpatches.extension.settings;

public final class SettingsClickAction {
    public static final SettingsClickAction INSTANCE = new SettingsClickAction();

    private SettingsClickAction() { }

    public Object invoke() {
        PatchSettings.open();
        return null;
    }
}

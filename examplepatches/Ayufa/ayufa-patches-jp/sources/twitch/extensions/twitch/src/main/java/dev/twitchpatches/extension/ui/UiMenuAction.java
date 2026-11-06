package dev.twitchpatches.extension.ui;

public final class UiMenuAction {
    public static final UiMenuAction INSTANCE = new UiMenuAction();
    private UiMenuAction() { }
    public Object invoke() { UiSettings.open(); return null; }
}

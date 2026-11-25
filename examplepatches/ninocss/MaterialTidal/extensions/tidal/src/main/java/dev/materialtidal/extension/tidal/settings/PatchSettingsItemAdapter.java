package dev.materialtidal.extension.tidal.settings;

import java.util.Locale;

/**
 * Settings item adapter injected into TIDAL's main Settings screen ({@code Lhsg;}).
 * At patch time, {@code PatchSettingsPatch} wires this class to implement TIDAL's
 * {@code SettingsItem} interface ({@code Lcom/aspiro/wamp/settings/a;}) with forwarding methods
 * {@code a()} and {@code b()}.
 */
@SuppressWarnings("unused")
public final class PatchSettingsItemAdapter {

    private final PatchSettingsClickAdapter clickHandler = new PatchSettingsClickAdapter();
    private volatile Object viewState;

    public PatchSettingsItemAdapter() {
        refreshImpl();
    }

    public Object getViewStateImpl() {
        Object current = this.viewState;
        if (current == null) {
            refreshImpl();
            current = this.viewState;
        }
        return current;
    }

    public void refreshImpl() {
        boolean de = isGermanLocale();
        int modified = PatchSettingsPrefs.getModifiedCount();
        String title = "MaterialTidal";
        String subtitle = de
                ? "Patch-Einstellungen · Design, Player, Gesten & mehr"
                : "Patch settings · Theme, Player, Gestures & more";
        String trailing = modified > 0
                ? (de ? (modified + " aktiv") : (modified + " edited"))
                : "Live";
        this.viewState = PatchSettingsBridge.nativeCreateSettingsRowViewState(
                title,
                subtitle,
                trailing,
                clickHandler
        );
    }

    private static boolean isGermanLocale() {
        try {
            String lang = Locale.getDefault().getLanguage();
            return lang != null && lang.toLowerCase(Locale.ROOT).startsWith("de");
        } catch (Throwable ignored) {
            return false;
        }
    }
}

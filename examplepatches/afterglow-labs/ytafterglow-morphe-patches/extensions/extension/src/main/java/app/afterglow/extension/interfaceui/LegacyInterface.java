package app.afterglow.extension.interfaceui;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.AfterglowPrefs;

/** Enables the installed Android compatibility policy without replacing its target or safeguards. */
public final class LegacyInterface {
    private LegacyInterface() {}

    /** Called once when the upstream version policy initializes; changes require a restart. */
    public static boolean enableVersionOverride(boolean upstreamEnabled) {
        if (upstreamEnabled) return true;
        try {
            return InstalledTweaks.has("interface-layout") && AfterglowPrefs.getBool("oldYTUI");
        } catch (Throwable error) {
            Afterglow.error("LegacyInterface.enableVersionOverride", error);
            return false;
        }
    }
}

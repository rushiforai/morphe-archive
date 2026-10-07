package io.github.bakwudo.uyu.extension.appearance;

import io.github.bakwudo.uyu.extension.settings.Settings;

public final class LinkDisclaimerSupport {
    private LinkDisclaimerSupport() {
    }

    public static boolean shouldBypass() {
        return Settings.DISABLE_LINK_DISCLAIMER.get();
    }
}
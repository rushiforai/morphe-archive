package com.waze.gw;

/** Release gates for optional HUD integrations. VietMap is currently withdrawn from the UI. */
final class HudFeatureFlags {
    static final boolean VIETMAP_TAB_VISIBLE = false;
    /** Keep the implementation dormant while the VietMap H50 integration is not exposed. */
    static final boolean VIETMAP_H50_RUNTIME_ENABLED = false;
    static final boolean VIETMAP_H1_RUNTIME_ENABLED = false;
    static final boolean VIETMAP_DEV_OVERRIDE = false;

    private HudFeatureFlags() { }

    static boolean isTabVisible() { return VIETMAP_TAB_VISIBLE; }

    static boolean vietMapTabVisible() { return isTabVisible(); }

    static boolean h50RuntimeEnabled() {
        return isRuntimeEnabled(HudProtocolFamily.VIETMAP_H50);
    }

    static boolean h1RuntimeEnabled() {
        return isRuntimeEnabled(HudProtocolFamily.VIETMAP_H1);
    }

    static boolean isRuntimeEnabled(HudProtocolFamily family) {
        if (family == HudProtocolFamily.HLP1) return true;
        if (family == null || family == HudProtocolFamily.AUTO) return false;
        if (VIETMAP_DEV_OVERRIDE) return true;
        if (family == HudProtocolFamily.VIETMAP_H50)
            return VIETMAP_H50_RUNTIME_ENABLED;
        if (family == HudProtocolFamily.VIETMAP_H1)
            return VIETMAP_H1_RUNTIME_ENABLED;
        return false;
    }
}

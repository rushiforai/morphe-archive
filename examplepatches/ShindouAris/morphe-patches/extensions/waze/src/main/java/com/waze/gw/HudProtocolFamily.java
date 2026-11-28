package com.waze.gw;

/** Wire-protocol families supported by the HUD Link selector. */
enum HudProtocolFamily {
    AUTO("auto"),
    HLP1("hlp1"),
    VIETMAP_H50("vietmap_h50"),
    VIETMAP_H1("vietmap_h1");

    private final String preferenceValue;

    HudProtocolFamily(String value) {
        preferenceValue = value;
    }

    String preferenceValue() { return preferenceValue; }

    static HudProtocolFamily fromPreference(String value) {
        if (value == null) return AUTO;
        String normalized = value.trim().toLowerCase(java.util.Locale.US);
        for (HudProtocolFamily family : values()) {
            if (family.preferenceValue.equals(normalized)) return family;
        }
        return AUTO;
    }
}

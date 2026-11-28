package com.waze.gw;

import java.util.Locale;

/** Deterministic protocol-family selection; it never probes or silently falls back. */
final class HudProtocolSelector {
    static final int TRANSPORT_AUTO = 0;
    static final int TRANSPORT_SPP = 1;
    static final int TRANSPORT_BLE = 2;

    static final String HLP_SERVICE_UUID =
            "8a7e0001-4d6e-4c48-9a9d-484c504c0001";
    static final String VIETMAP_H50_SERVICE_UUID =
            "0000ffff-0000-1000-8000-00805f9b34fb";
    static final String VIETMAP_H1_SERVICE_UUID =
            "0000fff0-0000-1000-8000-00805f9b34fb";

    private HudProtocolSelector() { }

    /**
     * Selects a family from an optional explicit choice, advertised services and transport.
     * An explicit non-AUTO choice always wins.  AUTO uses a fixed service precedence, while a
     * legacy Classic connection with no explicit choice remains HLP/1 for compatibility.
     */
    static HudProtocolFamily select(HudProtocolFamily explicitFamily,
                                    Iterable<String> advertisedServiceUuids,
                                    int transport) {
        HudProtocolFamily explicit = explicitFamily == null ? HudProtocolFamily.AUTO : explicitFamily;
        if (explicit != HudProtocolFamily.AUTO) return explicit;
        if (transport == TRANSPORT_SPP) return HudProtocolFamily.HLP1;

        boolean hlp = false;
        boolean h50 = false;
        boolean h1 = false;
        if (advertisedServiceUuids != null) {
            for (String value : advertisedServiceUuids) {
                String uuid = normalizeUuid(value);
                if (HLP_SERVICE_UUID.equals(uuid)) hlp = true;
                else if (VIETMAP_H50_SERVICE_UUID.equals(uuid)) h50 = true;
                else if (VIETMAP_H1_SERVICE_UUID.equals(uuid)) h1 = true;
            }
        }
        // Keep the order stable if a peripheral advertises more than one known service.
        if (hlp) return HudProtocolFamily.HLP1;
        if (h50) return HudProtocolFamily.VIETMAP_H50;
        if (h1) return HudProtocolFamily.VIETMAP_H1;
        return HudProtocolFamily.AUTO;
    }

    static HudProtocolFamily select(String explicitFamily,
                                    Iterable<String> advertisedServiceUuids,
                                    int transport) {
        return select(HudProtocolFamily.fromPreference(explicitFamily),
                advertisedServiceUuids, transport);
    }

    /** Returns the canonical 128-bit UUID, or an empty string for malformed input. */
    static String normalizeUuid(String value) {
        if (value == null) return "";
        String uuid = value.trim().toLowerCase(Locale.US);
        if (uuid.startsWith("{") && uuid.endsWith("}"))
            uuid = uuid.substring(1, uuid.length() - 1).trim();
        if (uuid.length() == 4) uuid = "0000" + uuid + "-0000-1000-8000-00805f9b34fb";
        return uuid;
    }

    static String detectedService(Iterable<String> advertisedServiceUuids, int transport) {
        HudProtocolFamily selected = select(HudProtocolFamily.AUTO,
                advertisedServiceUuids, transport);
        if (selected == HudProtocolFamily.HLP1) return HLP_SERVICE_UUID;
        if (selected == HudProtocolFamily.VIETMAP_H50) return VIETMAP_H50_SERVICE_UUID;
        if (selected == HudProtocolFamily.VIETMAP_H1) return VIETMAP_H1_SERVICE_UUID;
        return "";
    }
}

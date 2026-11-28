package com.waze.gw;

import android.content.Context;

/** Creates exactly one protocol session for an already-selected device family. */
final class HudProtocolSessionFactory {
    private HudProtocolSessionFactory() { }

    static HudProtocolSession create(Context context, HudProtocolFamily family,
                                     HudTransport transport, HudSessionListener listener) {
        if (family == HudProtocolFamily.HLP1) {
            return new HlpProtocol.Session(context, transport, listener);
        }
        if (family == HudProtocolFamily.VIETMAP_H50) {
            return new VietMapH50Session(transport, listener, new VietMapH50CodecAdapter());
        }
        throw new IllegalArgumentException("Unsupported HUD protocol family: " + family);
    }

    static boolean hasRuntimeSession(HudProtocolFamily family) {
        return family == HudProtocolFamily.HLP1 || family == HudProtocolFamily.VIETMAP_H50;
    }

    static HudGattProfile gattProfile(HudProtocolFamily family) {
        if (family == HudProtocolFamily.VIETMAP_H50) return HudGattProfile.VIETMAP_H50;
        if (family == HudProtocolFamily.VIETMAP_H1) return HudGattProfile.VIETMAP_H1;
        return HudGattProfile.HLP1;
    }
}

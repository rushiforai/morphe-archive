package defpackage;

import com.drew.metadata.pcx.bLHD.HrUBqHumRuLe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class mmd {
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    public static nmd a(String str) {
        str.getClass();
        int iHashCode = str.hashCode();
        if (iHashCode != 79201641) {
            if (iHashCode != 79923350) {
                switch (iHashCode) {
                    case -503070503:
                        if (str.equals("TLSv1.1")) {
                            return nmd.TLS_1_1;
                        }
                        break;
                    case -503070502:
                        if (str.equals("TLSv1.2")) {
                            return nmd.TLS_1_2;
                        }
                        break;
                    case -503070501:
                        if (str.equals("TLSv1.3")) {
                            return nmd.TLS_1_3;
                        }
                        break;
                }
            } else if (str.equals(HrUBqHumRuLe.HBt)) {
                return nmd.TLS_1_0;
            }
        } else if (str.equals("SSLv3")) {
            return nmd.SSL_3_0;
        }
        ay0.e("Unexpected TLS version: ".concat(str));
        return null;
    }
}

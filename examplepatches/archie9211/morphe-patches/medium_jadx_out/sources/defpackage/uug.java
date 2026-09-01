package defpackage;

import com.drew.imaging.raf.yvq.AXoTRPEGKEve;
import java.security.GeneralSecurityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class uug implements vwf {
    public static final pif a;
    public static final pif b;

    static {
        d2f d2fVarB = pif.b();
        d2fVarB.F0(xug.zza, fcg.b);
        d2fVarB.F0(xug.zzb, fcg.c);
        d2fVarB.F0(xug.zzc, fcg.d);
        a = d2fVarB.y0();
        d2f d2fVarB2 = pif.b();
        d2fVarB2.F0(zug.zza, hcg.c);
        d2fVarB2.F0(zug.zzb, hcg.b);
        d2fVarB2.F0(zug.zzc, hcg.d);
        b = d2fVarB2.y0();
    }

    public static final String a(ecg ecgVar) throws GeneralSecurityException {
        if (ecgVar.equals(ecg.b)) {
            return "HmacSha1";
        }
        if (ecgVar == ecg.c) {
            return "HmacSha224";
        }
        if (ecgVar == ecg.d) {
            return "HmacSha256";
        }
        if (ecgVar == ecg.e) {
            return "HmacSha384";
        }
        if (ecgVar == ecg.f) {
            return AXoTRPEGKEve.pWzPwMPWULRKhri;
        }
        throw new GeneralSecurityException("hash unsupported for EciesAeadHkdf: ".concat(String.valueOf(ecgVar)));
    }
}

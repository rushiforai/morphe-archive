package defpackage;

import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.security.spec.ECParameterSpec;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xcg extends xdg {
    public final jdg h;
    public final ujf i;

    public xcg(jdg jdgVar, ujf ujfVar) {
        this.h = jdgVar;
        this.i = ujfVar;
    }

    public static xcg L(jdg jdgVar, ujf ujfVar) throws GeneralSecurityException {
        ECParameterSpec eCParameterSpec;
        scg scgVar = jdgVar.h;
        qvg qvgVar = (qvg) ujfVar.b;
        rcg rcgVar = scgVar.a;
        int length = qvgVar.a.length;
        String str = "Encoded private key byte length for " + String.valueOf(rcgVar) + " must be %d, not " + length;
        rcg rcgVar2 = rcg.g;
        rcg rcgVar3 = rcg.f;
        rcg rcgVar4 = rcg.e;
        rcg rcgVar5 = rcg.d;
        if (rcgVar == rcgVar5) {
            if (length != 32) {
                throw new GeneralSecurityException(String.format(str, 32));
            }
        } else if (rcgVar == rcgVar4) {
            if (length != 48) {
                throw new GeneralSecurityException(String.format(str, 48));
            }
        } else if (rcgVar == rcgVar3) {
            if (length != 66) {
                throw new GeneralSecurityException(String.format(str, 66));
            }
        } else {
            if (rcgVar != rcgVar2) {
                throw new GeneralSecurityException("Unable to validate private key length for ".concat(String.valueOf(rcgVar)));
            }
            if (length != 32) {
                throw new GeneralSecurityException(String.format(str, 32));
            }
        }
        byte[] bArrB = jdgVar.i.b();
        byte[] bArrB2 = qvgVar.b();
        if (rcgVar == rcgVar5 || rcgVar == rcgVar4 || rcgVar == rcgVar3) {
            if (rcgVar == rcgVar5) {
                eCParameterSpec = nfg.a;
            } else if (rcgVar == rcgVar4) {
                eCParameterSpec = nfg.b;
            } else {
                if (rcgVar != rcgVar3) {
                    ay0.e("Unable to determine NIST curve params for ".concat(String.valueOf(rcgVar)));
                    return null;
                }
                eCParameterSpec = nfg.c;
            }
            BigInteger order = eCParameterSpec.getOrder();
            BigInteger bigIntegerI = qq7.I(bArrB2);
            if (bigIntegerI.signum() <= 0 || bigIntegerI.compareTo(order) >= 0) {
                ygf.l("Invalid private key.");
                return null;
            }
            if (!nfg.c(bigIntegerI, eCParameterSpec).equals(en7.Y(eCParameterSpec.getCurve(), zug.zza, bArrB))) {
                ygf.l("Invalid private key for public key.");
                return null;
            }
        } else {
            if (rcgVar != rcgVar2) {
                ay0.e("Unable to validate key pair for ".concat(String.valueOf(rcgVar)));
                return null;
            }
            if (!Arrays.equals(no7.K(bArrB2), bArrB)) {
                ygf.l("Invalid private key for public key.");
                return null;
            }
        }
        return new xcg(jdgVar, ujfVar);
    }

    @Override // defpackage.gr7
    public final /* synthetic */ bzf H() {
        return this.h.h;
    }

    @Override // defpackage.xdg
    public final /* synthetic */ gr7 K() {
        return this.h;
    }
}

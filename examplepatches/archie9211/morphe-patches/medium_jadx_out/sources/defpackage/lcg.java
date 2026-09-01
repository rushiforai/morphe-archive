package defpackage;

import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.security.spec.ECParameterSpec;
import java.security.spec.ECPoint;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lcg extends xdg {
    public final ucg h;
    public final wjc i;
    public final ujf j;

    public lcg(ucg ucgVar, wjc wjcVar, ujf ujfVar) {
        this.h = ucgVar;
        this.i = wjcVar;
        this.j = ujfVar;
    }

    public static ECParameterSpec L(fcg fcgVar) {
        if (fcgVar == fcg.b) {
            return nfg.a;
        }
        if (fcgVar == fcg.c) {
            return nfg.b;
        }
        if (fcgVar == fcg.d) {
            return nfg.c;
        }
        ay0.e("Unable to determine NIST curve type for ".concat(String.valueOf(fcgVar)));
        return null;
    }

    public static lcg M(ucg ucgVar, wjc wjcVar) throws GeneralSecurityException {
        ECPoint eCPoint = ucgVar.i;
        if (eCPoint == null) {
            ygf.l("ECIES private key for NIST curve cannot be constructed with X25519-curve public key");
            return null;
        }
        BigInteger bigInteger = (BigInteger) wjcVar.b;
        fcg fcgVar = ucgVar.h.a;
        BigInteger order = L(fcgVar).getOrder();
        if (bigInteger.signum() <= 0 || bigInteger.compareTo(order) >= 0) {
            ygf.l("Invalid private value");
            return null;
        }
        if (nfg.c(bigInteger, L(fcgVar)).equals(eCPoint)) {
            return new lcg(ucgVar, wjcVar, null);
        }
        ygf.l("Invalid private value");
        return null;
    }

    public static lcg N(ucg ucgVar, ujf ujfVar) throws GeneralSecurityException {
        qvg qvgVar = ucgVar.j;
        if (qvgVar == null) {
            ygf.l("ECIES private key for X25519 curve cannot be constructed with NIST-curve public key");
            return null;
        }
        byte[] bArrB = ((qvg) ujfVar.b).b();
        byte[] bArrB2 = qvgVar.b();
        if (bArrB.length != 32) {
            ygf.l("Private key bytes length for X25519 curve must be 32");
            return null;
        }
        if (Arrays.equals(no7.K(bArrB), bArrB2)) {
            return new lcg(ucgVar, null, ujfVar);
        }
        ygf.l("Invalid private key for public key.");
        return null;
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

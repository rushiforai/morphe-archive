package defpackage;

import androidx.work.impl.yX.VrhD;
import java.security.GeneralSecurityException;
import java.security.spec.ECPoint;
import java.security.spec.EllipticCurve;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class ucg extends beg {
    public final jcg h;
    public final ECPoint i;
    public final qvg j;
    public final qvg k;
    public final Integer l;

    public ucg(jcg jcgVar, ECPoint eCPoint, qvg qvgVar, qvg qvgVar2, Integer num) {
        this.h = jcgVar;
        this.i = eCPoint;
        this.j = qvgVar;
        this.k = qvgVar2;
        this.l = num;
    }

    public static ucg L(jcg jcgVar, ECPoint eCPoint, Integer num) {
        EllipticCurve curve;
        fcg fcgVar = jcgVar.a;
        gcg gcgVar = jcgVar.d;
        if (fcgVar.equals(fcg.e)) {
            ygf.l("createForNistCurve may only be called with parameters for NIST curve");
            return null;
        }
        O(gcgVar, num);
        if (fcgVar == fcg.b) {
            curve = nfg.a.getCurve();
        } else if (fcgVar == fcg.c) {
            curve = nfg.b.getCurve();
        } else {
            if (fcgVar != fcg.d) {
                ay0.e("Unable to determine NIST curve type for ".concat(String.valueOf(fcgVar)));
                return null;
            }
            curve = nfg.c.getCurve();
        }
        nfg.g(eCPoint, curve);
        return new ucg(jcgVar, eCPoint, null, N(gcgVar, num), num);
    }

    public static qvg N(gcg gcgVar, Integer num) {
        if (gcgVar == gcg.d) {
            return mhg.a;
        }
        if (num == null) {
            ygf.f("idRequirement must be non-null for EciesParameters.Variant: ".concat(String.valueOf(gcgVar)));
            return null;
        }
        if (gcgVar == gcg.c) {
            return mhg.a(num.intValue());
        }
        if (gcgVar == gcg.b) {
            return mhg.b(num.intValue());
        }
        ygf.f("Unknown EciesParameters.Variant: ".concat(String.valueOf(gcgVar)));
        return null;
    }

    public static void O(gcg gcgVar, Integer num) throws GeneralSecurityException {
        gcg gcgVar2 = gcg.d;
        if (!gcgVar.equals(gcgVar2) && num == null) {
            throw new GeneralSecurityException(ev6.x("'idRequirement' must be non-null for ", String.valueOf(gcgVar), " variant."));
        }
        if (gcgVar == gcgVar2 && num != null) {
            ygf.l("'idRequirement' must be null for NO_PREFIX variant.");
        }
    }

    @Override // defpackage.gr7
    public final /* synthetic */ bzf H() {
        return this.h;
    }

    @Override // defpackage.gr7
    public final Integer J() {
        return this.l;
    }

    @Override // defpackage.beg
    public final qvg K() {
        return this.k;
    }

    public static ucg M(jcg jcgVar, qvg qvgVar, Integer num) {
        fcg fcgVar = jcgVar.a;
        gcg gcgVar = jcgVar.d;
        if (!fcgVar.equals(fcg.e)) {
            ygf.l("createForCurveX25519 may only be called with parameters for curve X25519");
            return null;
        }
        O(gcgVar, num);
        if (qvgVar.a.length == 32) {
            return new ucg(jcgVar, null, qvgVar, N(gcgVar, num), num);
        }
        ygf.l(VrhD.mTgA);
        return null;
    }
}

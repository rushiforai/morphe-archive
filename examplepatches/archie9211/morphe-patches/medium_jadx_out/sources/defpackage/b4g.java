package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import com.medium.android.explore.ui.vAWg.OphtYB;
import java.security.GeneralSecurityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class b4g {
    public static final uhg a;
    public static final shg b;
    public static final zfg c;
    public static final wfg d;

    static {
        qvg qvgVarC = ejg.c("type.googleapis.com/google.crypto.tink.KmsEnvelopeAeadKey");
        int i = 28;
        a = new uhg(x3g.class, new fa4(i));
        b = new shg(qvgVarC, new z46());
        c = new zfg(z3g.class, new rz5(i));
        d = new wfg(qvgVarC, new cd7());
    }

    public static x3g a(ltg ltgVar, ntg ntgVar) throws GeneralSecurityException {
        zwf zwfVar;
        d1g d1gVar = d1g.o;
        zwf zwfVar2 = zwf.k;
        zwf zwfVar3 = zwf.j;
        zwf zwfVar4 = zwf.i;
        zwf zwfVar5 = zwf.g;
        zwf zwfVar6 = zwf.h;
        zwf zwfVar7 = zwf.f;
        hsg hsgVarT = isg.t();
        hsgVarT.g(ltgVar.t().B());
        hsgVarT.h(ltgVar.t().A());
        hsgVarT.e(ntg.RAW);
        bzf bzfVarM = kk7.M(((isg) hsgVarT.b()).c());
        if (bzfVarM instanceof g2g) {
            zwfVar = zwfVar7;
        } else if (bzfVarM instanceof c3g) {
            zwfVar = zwfVar6;
        } else if (bzfVarM instanceof m5g) {
            zwfVar = zwfVar5;
        } else if (bzfVarM instanceof f1g) {
            zwfVar = zwfVar4;
        } else if (bzfVarM instanceof p1g) {
            zwfVar = zwfVar3;
        } else {
            if (!(bzfVarM instanceof r2g)) {
                throw new GeneralSecurityException("Unsupported DEK parameters when parsing ".concat(String.valueOf(bzfVarM)));
            }
            zwfVar = zwfVar2;
        }
        int i = d4g.a[ntgVar.ordinal()];
        if (i == 1) {
            d1gVar = d1g.n;
        } else if (i != 2) {
            throw new GeneralSecurityException(b09.w(ntgVar.zza(), "Unable to parse OutputPrefixType: "));
        }
        String strZ = ltgVar.z();
        t0g t0gVar = (t0g) bzfVarM;
        if (strZ == null) {
            ygf.l("kekUri must be set");
            return null;
        }
        if (t0gVar.a()) {
            ygf.l("dekParametersForNewKeys must not have ID Requirements");
            return null;
        }
        if ((zwfVar == zwfVar7 && (t0gVar instanceof g2g)) || ((zwfVar == zwfVar6 && (t0gVar instanceof c3g)) || ((zwfVar == zwfVar5 && (t0gVar instanceof m5g)) || ((zwfVar == zwfVar4 && (t0gVar instanceof f1g)) || ((zwfVar == zwfVar3 && (t0gVar instanceof p1g)) || (zwfVar == zwfVar2 && (t0gVar instanceof r2g))))))) {
            return new x3g(d1gVar, strZ, zwfVar, t0gVar);
        }
        throw new GeneralSecurityException(ev6.y("Cannot use parsing strategy ", zwfVar.b, " when new keys are picked according to ", String.valueOf(t0gVar), "."));
    }

    public static ltg b(x3g x3gVar) {
        try {
            isg isgVarU = isg.u(kk7.O(x3gVar.d), ptf.a);
            ktg ktgVarX = ltg.x();
            String str = x3gVar.b;
            ktgVarX.c();
            ltg.v((ltg) ktgVarX.b, str);
            ktgVarX.c();
            ltg.w((ltg) ktgVarX.b, isgVarU);
            return (ltg) ktgVarX.b();
        } catch (zzale e) {
            throw new GeneralSecurityException(OphtYB.rlDzHggn, e);
        }
    }
}

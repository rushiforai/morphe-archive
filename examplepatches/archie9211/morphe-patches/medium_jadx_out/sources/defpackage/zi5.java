package defpackage;

import android.os.Bundle;
import android.view.View;
import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import com.medium.android.common.post.text.ParagraphEditTextLayout;
import j$.util.DesugarCollections;
import java.security.GeneralSecurityException;
import java.security.Provider;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.Executor;
import javax.crypto.Mac;
import sprig.b.VPIE.dpBiLjNeNsiASg;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class zi5 implements y92, i19, yte, c8, g70, j70, z5e, pg2, xlf, thg, rhg, yfg {
    public static final zi5 b = new zi5(1);
    public static final zi5 c = new zi5(2);
    public static final /* synthetic */ zi5 d = new zi5(3);
    public static final zi5 e = new zi5(4);
    public static final zi5 f = new zi5(5);
    public static final zi5 g = new zi5(7);
    public static final zi5 h = new zi5(8);
    public static final zi5 i;
    public static final zi5 j;
    public static final zi5 k;
    public final /* synthetic */ int a;

    static {
        int i2 = 9;
        i = new zi5(i2);
        j = new zi5(i2);
        k = new zi5(i2);
    }

    public zi5(int i2, int i3) {
        this.a = 18;
    }

    public static ba8 e(mp mpVar, va8 va8Var, Bundle bundle, vx6 vx6Var, la8 la8Var) {
        String string = UUID.randomUUID().toString();
        string.getClass();
        va8Var.getClass();
        vx6Var.getClass();
        return new ba8(mpVar, va8Var, bundle, vx6Var, la8Var, string, null);
    }

    public static Bundle l(d34 d34Var, View view, View view2) {
        Bundle bundle = new Bundle();
        if (d34Var != null) {
            List<q39> listUnmodifiableList = DesugarCollections.unmodifiableList(d34Var.c);
            listUnmodifiableList.getClass();
            for (q39 q39Var : listUnmodifiableList) {
                String str = q39Var.b;
                ArrayList arrayList = q39Var.c;
                String str2 = q39Var.a;
                if (str.length() > 0) {
                    bundle.putString(str2, q39Var.b);
                } else if (arrayList.size() > 0) {
                    Iterator it2 = (q39Var.d.equals("relative") ? vx0.M(view2, arrayList, 0, -1, view2.getClass().getSimpleName()) : vx0.M(view, arrayList, 0, -1, view.getClass().getSimpleName())).iterator();
                    while (true) {
                        if (it2.hasNext()) {
                            gq1 gq1Var = (gq1) it2.next();
                            if (gq1Var.a() != null) {
                                String strJ = gue.j(gq1Var.a());
                                if (strJ.length() > 0) {
                                    bundle.putString(str2, strJ);
                                    break;
                                }
                            }
                        }
                    }
                }
            }
        }
        return bundle;
    }

    public static c28 m(c6a c6aVar) {
        int i2 = c6aVar == null ? -1 : n7a.a[c6aVar.ordinal()];
        return i2 != 1 ? i2 != 2 ? i2 != 3 ? i2 != 4 ? c28.FINAL : c28.SEALED : c28.ABSTRACT : c28.OPEN : c28.FINAL;
    }

    public static int n() {
        int i2 = p83.d;
        p83.d = i2 << 1;
        return i2;
    }

    @Override // defpackage.i19
    public void a(int i2, String str) {
    }

    @Override // defpackage.yte
    public m45 b(x0 x0Var) {
        if (!x0Var.isAttachedToWindow()) {
            rya ryaVar = new rya();
            q15 q15Var = new q15(2, x0Var, ryaVar);
            x0Var.addOnAttachStateChangeListener(q15Var);
            ryaVar.a = new cn(x0Var, 23, q15Var);
            return new bd9(29, ryaVar);
        }
        iy6 iy6VarK = fp7.k(x0Var);
        if (iy6VarK != null) {
            return mo7.P(x0Var, iy6VarK.getLifecycle());
        }
        b26.c("View tree for " + x0Var + " has no ViewTreeLifecycleOwner");
        z72.b();
        return null;
    }

    @Override // defpackage.i19
    public void c(ParagraphEditTextLayout paragraphEditTextLayout) {
    }

    @Override // defpackage.xlf
    public /* bridge */ /* synthetic */ Object d(String str, Provider provider) {
        return provider == null ? Mac.getInstance(str) : Mac.getInstance(str, provider);
    }

    @Override // defpackage.g70, defpackage.j70
    public float f() {
        return 0.0f;
    }

    @Override // defpackage.j70
    public void f0(m73 m73Var, int i2, int[] iArr, int[] iArr2) {
        qb8.N(i2, iArr, iArr2, false);
    }

    @Override // defpackage.c8
    public Object fromJson(fd6 fd6Var, yl2 yl2Var) {
        return Boolean.valueOf(fd6Var.nextBoolean());
    }

    public List g(Executor executor) {
        return Collections.singletonList(new cy2(executor));
    }

    @Override // defpackage.z5e
    public void h() {
    }

    @Override // defpackage.thg
    public lig i(bzf bzfVar) throws GeneralSecurityException {
        ntg ntgVar;
        l3g l3gVar = (l3g) bzfVar;
        hsg hsgVarT = isg.t();
        hsgVarT.g("type.googleapis.com/google.crypto.tink.KmsAeadKey");
        etg etgVarT = ftg.t();
        String str = l3gVar.a;
        etgVarT.c();
        ftg.v((ftg) etgVarT.b, str);
        hsgVarT.h(((ftg) etgVarT.b()).b());
        d1g d1gVar = l3gVar.b;
        if (d1g.l == d1gVar) {
            ntgVar = ntg.TINK;
        } else {
            if (d1g.m != d1gVar) {
                throw new GeneralSecurityException("Unable to serialize variant: ".concat(String.valueOf(d1gVar)));
            }
            ntgVar = ntg.RAW;
        }
        hsgVarT.e(ntgVar);
        return lig.p0((isg) hsgVarT.b());
    }

    public List j() {
        return Collections.EMPTY_LIST;
    }

    public synchronized iq1 k() {
        iq1 iq1Var;
        iq1 iq1Var2;
        try {
            iq1Var = null;
            if (ec2.a.contains(iq1.class)) {
                iq1Var2 = null;
            } else {
                try {
                    iq1Var2 = iq1.h;
                } catch (Throwable th) {
                    ec2.a(iq1.class, th);
                    iq1Var2 = null;
                }
            }
            if (iq1Var2 == null) {
                iq1 iq1Var3 = new iq1(0);
                if (!ec2.a.contains(iq1.class)) {
                    try {
                        iq1.h = iq1Var3;
                    } catch (Throwable th2) {
                        ec2.a(iq1.class, th2);
                    }
                }
            }
            if (!ec2.a.contains(iq1.class)) {
                try {
                    iq1Var = iq1.h;
                } catch (Throwable th3) {
                    ec2.a(iq1.class, th3);
                }
            }
            iq1Var.getClass();
        } catch (Throwable th4) {
            throw th4;
        }
        return iq1Var;
    }

    @Override // defpackage.yfg
    public nig l0(gr7 gr7Var) {
        u2g u2gVar = (u2g) gr7Var;
        cog cogVarW = eog.w();
        byte[] bArrB = ((qvg) u2gVar.i.b).b();
        rsf rsfVarP = hsf.p(bArrB, 0, bArrB.length);
        cogVarW.c();
        eog.v((eog) cogVarW.b, rsfVarP);
        return nig.I("type.googleapis.com/google.crypto.tink.ChaCha20Poly1305Key", ((eog) cogVarW.b()).b(), zrg.SYMMETRIC, m7g.b(u2gVar.h.a), u2gVar.k);
    }

    @Override // defpackage.z5e
    public void o() {
    }

    @Override // defpackage.c8
    public void toJson(ae6 ae6Var, yl2 yl2Var, Object obj) {
        boolean zBooleanValue = ((Boolean) obj).booleanValue();
        yl2Var.getClass();
        ae6Var.V(zBooleanValue);
    }

    public String toString() {
        switch (this.a) {
            case 11:
                return "Arrangement#Center";
            default:
                return super.toString();
        }
    }

    @Override // defpackage.y92
    public Object v(Object obj) {
        return (fdb) obj;
    }

    @Override // defpackage.g70
    public void w(m73 m73Var, int i2, int[] iArr, ip6 ip6Var, int[] iArr2) {
        if (ip6Var == ip6.Ltr) {
            qb8.N(i2, iArr, iArr2, false);
        } else {
            qb8.N(i2, iArr, iArr2, true);
        }
    }

    @Override // defpackage.rhg
    public bzf r(lig ligVar) throws GeneralSecurityException {
        isg isgVar = (isg) ligVar.c;
        if (!isgVar.B().equals("type.googleapis.com/google.crypto.tink.AesEaxKey")) {
            ay0.e(ka1.r("Wrong type URL in call to AesEaxProtoSerialization.parseParameters: ", isgVar.B()));
            return null;
        }
        try {
            smg smgVarU = smg.u(isgVar.A(), ptf.a);
            o2b o2bVarB = p1g.b();
            o2bVarB.W(smgVarU.t());
            o2bVarB.S(smgVarU.y().t());
            o2bVarB.Y();
            o2bVarB.e = v5g.a(isgVar.z());
            return o2bVarB.O();
        } catch (zzale e2) {
            throw new GeneralSecurityException(dpBiLjNeNsiASg.MPkJ, e2);
        }
    }

    public /* synthetic */ zi5(int i2) {
        this.a = i2;
    }
}

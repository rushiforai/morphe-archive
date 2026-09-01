package defpackage;

import android.os.SystemClock;
import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import com.google.firebase.components.ComponentRegistrar;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.security.Provider;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.chromium.support_lib_boundary.WebkitToCompatConverterBoundaryInterface;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class xsa implements y92, pq3, f2f, veb, ajc, a7g, c8, g70, a21, ba2, pg2, ni5, k60, ah8, khf, xlf, yfg, thg, rhg {
    public static final xsa b = new xsa(1);
    public static final xsa c = new xsa(2);
    public static final String[] d = new String[0];
    public static final xsa e = new xsa(4);
    public static final xsa f = new xsa(5);
    public static final xsa g = new xsa(6);
    public static final xsa h = new xsa(7);
    public static final ywb i = new ywb(23);
    public static final xsa j = new xsa(9);
    public final /* synthetic */ int a;

    public xsa(hha hhaVar) {
        this.a = 25;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v0 */
    /* JADX WARN: Type inference failed for: r2v1, types: [q28] */
    /* JADX WARN: Type inference failed for: r2v10 */
    /* JADX WARN: Type inference failed for: r2v11 */
    /* JADX WARN: Type inference failed for: r2v12 */
    /* JADX WARN: Type inference failed for: r2v4 */
    /* JADX WARN: Type inference failed for: r2v5, types: [q28] */
    /* JADX WARN: Type inference failed for: r2v6, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r2v7 */
    /* JADX WARN: Type inference failed for: r2v8 */
    /* JADX WARN: Type inference failed for: r2v9 */
    /* JADX WARN: Type inference failed for: r3v0 */
    /* JADX WARN: Type inference failed for: r3v1 */
    /* JADX WARN: Type inference failed for: r3v10 */
    /* JADX WARN: Type inference failed for: r3v11 */
    /* JADX WARN: Type inference failed for: r3v2 */
    /* JADX WARN: Type inference failed for: r3v3, types: [o78] */
    /* JADX WARN: Type inference failed for: r3v4 */
    /* JADX WARN: Type inference failed for: r3v5 */
    /* JADX WARN: Type inference failed for: r3v6, types: [o78] */
    /* JADX WARN: Type inference failed for: r3v8 */
    /* JADX WARN: Type inference failed for: r3v9 */
    /* JADX WARN: Type inference failed for: r4v4 */
    @Override // defpackage.ah8
    public boolean A(yn5 yn5Var, aq6 aq6Var) {
        eh8 eh8Var = (eh8) aq6Var.F.e;
        eh8Var.getClass();
        q28 q28VarQ0 = eh8Var.Q0(fh8.g(16));
        if (q28VarQ0 != null && q28VarQ0.n) {
            if (!q28VarQ0.a.n) {
                b26.b("visitLocalDescendants called on an unattached node");
            }
            q28 q28Var = q28VarQ0.a;
            if ((q28Var.d & 16) != 0) {
                while (q28Var != null) {
                    if ((q28Var.c & 16) != 0) {
                        ?? Q0 = q28Var;
                        ?? o78Var = 0;
                        while (Q0 != 0) {
                            if (Q0 instanceof ub9) {
                                if (((ub9) Q0).l0()) {
                                    yn5Var.c = yn5Var.a.b - 1;
                                    return true;
                                }
                            } else if ((Q0.c & 16) != 0 && (Q0 instanceof b43)) {
                                q28 q28Var2 = ((b43) Q0).p;
                                int i2 = 0;
                                Q0 = Q0;
                                o78Var = o78Var;
                                while (q28Var2 != null) {
                                    if ((q28Var2.c & 16) != 0) {
                                        i2++;
                                        o78Var = o78Var;
                                        if (i2 == 1) {
                                            Q0 = q28Var2;
                                        } else {
                                            if (o78Var == 0) {
                                                o78Var = new o78(new q28[16]);
                                            }
                                            if (Q0 != 0) {
                                                o78Var.b(Q0);
                                                Q0 = 0;
                                            }
                                            o78Var.b(q28Var2);
                                        }
                                    }
                                    q28Var2 = q28Var2.f;
                                    Q0 = Q0;
                                    o78Var = o78Var;
                                }
                                if (i2 == 1) {
                                }
                            }
                            Q0 = flb.q0(o78Var);
                        }
                    }
                    q28Var = q28Var.f;
                }
            }
        }
        return false;
    }

    @Override // defpackage.veb
    public void B(String str, String str2, boolean z) {
        str.getClass();
    }

    @Override // defpackage.ah8
    public boolean C(aq6 aq6Var) {
        return true;
    }

    @Override // defpackage.veb
    public void D(String str, String str2) {
        str.getClass();
    }

    @Override // defpackage.ajc
    public boolean E(Object obj, Object obj2) {
        return g76.L(obj, obj2);
    }

    @Override // defpackage.veb
    public void F(String str, String str2) {
        str.getClass();
    }

    @Override // defpackage.f2f
    public String[] G() {
        return d;
    }

    @Override // defpackage.k60
    public int H() {
        return 0;
    }

    @Override // defpackage.veb
    public void I(String str, String str2) {
        str.getClass();
    }

    @Override // defpackage.veb
    public void J(String str, String str2) {
        str.getClass();
    }

    @Override // defpackage.veb
    public Object K(String str, int i2, String str2, n92 n92Var) {
        return c1e.a;
    }

    @Override // defpackage.ni5
    public boolean M() {
        boolean z;
        synchronized (ig4.a) {
            try {
                int i2 = ig4.c;
                ig4.c = i2 + 1;
                if (i2 >= 30 || SystemClock.uptimeMillis() > ig4.d + 30000) {
                    ig4.c = 0;
                    ig4.d = SystemClock.uptimeMillis();
                    String[] list = ig4.b.list();
                    if (list == null) {
                        list = new String[0];
                    }
                    ig4.e = list.length < 800;
                }
                z = ig4.e;
            } catch (Throwable th) {
                throw th;
            }
        }
        return z;
    }

    @Override // defpackage.veb
    public void O(String str, String str2) {
        str.getClass();
    }

    @Override // defpackage.ba2
    public List P(qt5 qt5Var) {
        qt5Var.getClass();
        return ey3.a;
    }

    @Override // defpackage.ni5
    public boolean Q(cfc cfcVar) {
        xe3 xe3Var = cfcVar.a;
        if ((xe3Var instanceof ue3 ? ((ue3) xe3Var).a : Integer.MAX_VALUE) <= 100) {
            return false;
        }
        xe3 xe3Var2 = cfcVar.b;
        return (xe3Var2 instanceof ue3 ? ((ue3) xe3Var2).a : Integer.MAX_VALUE) > 100;
    }

    @Override // defpackage.k60
    public String R() {
        return "";
    }

    @Override // defpackage.veb
    public void S(String str, String str2, String str3) {
        str.getClass();
        str2.getClass();
    }

    public synchronized m50 T() {
        m50 m50Var;
        try {
            if (m50.p == null) {
                m50.p = new m50(iq1.C(f94.a()), new dsc(3), 6);
            }
            m50Var = m50.p;
            if (m50Var == null) {
                g76.g0("instance");
                throw null;
            }
        } catch (Throwable th) {
            throw th;
        }
        return m50Var;
    }

    public boolean U(CharSequence charSequence) {
        return false;
    }

    public List V(ComponentRegistrar componentRegistrar) {
        ArrayList arrayList = new ArrayList();
        for (iy1 iy1Var : componentRegistrar.getComponents()) {
            String str = iy1Var.a;
            if (str != null) {
                iy1Var = new iy1(str, iy1Var.b, iy1Var.c, iy1Var.d, iy1Var.e, new lt(str, 3, iy1Var), iy1Var.g);
            }
            arrayList.add(iy1Var);
        }
        return arrayList;
    }

    @Override // defpackage.a21
    public byte[] a(byte[] bArr, int i2, int i3) {
        return Arrays.copyOfRange(bArr, i2, i3 + i2);
    }

    @Override // defpackage.a7g
    public b8g c(Class cls) {
        if (!h5g.class.isAssignableFrom(cls)) {
            ay0.e("Unsupported message type: ".concat(cls.getName()));
            return null;
        }
        try {
            return (b8g) h5g.m(cls.asSubclass(h5g.class)).j(3);
        } catch (Exception e2) {
            lg8.p("Unable to get message info for ".concat(cls.getName()), e2);
            return null;
        }
    }

    @Override // defpackage.xlf
    public /* bridge */ /* synthetic */ Object d(String str, Provider provider) {
        return provider == null ? MessageDigest.getInstance(str) : MessageDigest.getInstance(str, provider);
    }

    @Override // defpackage.a7g
    public boolean e(Class cls) {
        return h5g.class.isAssignableFrom(cls);
    }

    @Override // defpackage.g70, defpackage.j70
    public /* synthetic */ float f() {
        return 0.0f;
    }

    @Override // defpackage.c8
    public Object fromJson(fd6 fd6Var, yl2 yl2Var) {
        return Double.valueOf(fd6Var.nextDouble());
    }

    @Override // defpackage.veb
    public void g(String str, String str2) {
        str.getClass();
    }

    @Override // defpackage.f2f
    public WebkitToCompatConverterBoundaryInterface getWebkitToCompatConverter() {
        throw new UnsupportedOperationException("This should never happen, if this method was called it means we're trying to reach into WebView APK code on an incompatible device. This most likely means the current method is being called too early, or is being called on start-up rather than lazily");
    }

    @Override // defpackage.veb
    public void h(String str, String str2) {
        str.getClass();
    }

    @Override // defpackage.thg
    public lig i(bzf bzfVar) {
        p1g p1gVar = (p1g) bzfVar;
        hsg hsgVarT = isg.t();
        hsgVarT.g("type.googleapis.com/google.crypto.tink.AesEaxKey");
        rmg rmgVarX = smg.x();
        wmg wmgVarC = v5g.c(p1gVar);
        rmgVarX.c();
        smg.w((smg) rmgVarX.b, wmgVarC);
        int i2 = p1gVar.a;
        rmgVarX.c();
        ((smg) rmgVarX.b).zzg = i2;
        hsgVarT.h(((smg) rmgVarX.b()).b());
        hsgVarT.e(v5g.b(p1gVar.d));
        return lig.p0((isg) hsgVarT.b());
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0 */
    /* JADX WARN: Type inference failed for: r0v1 */
    /* JADX WARN: Type inference failed for: r0v10 */
    /* JADX WARN: Type inference failed for: r0v11 */
    /* JADX WARN: Type inference failed for: r0v2 */
    /* JADX WARN: Type inference failed for: r0v3, types: [o78] */
    /* JADX WARN: Type inference failed for: r0v4 */
    /* JADX WARN: Type inference failed for: r0v5 */
    /* JADX WARN: Type inference failed for: r0v6, types: [o78] */
    /* JADX WARN: Type inference failed for: r0v8 */
    /* JADX WARN: Type inference failed for: r0v9 */
    /* JADX WARN: Type inference failed for: r2v4 */
    /* JADX WARN: Type inference failed for: r7v0, types: [q28] */
    /* JADX WARN: Type inference failed for: r7v1, types: [q28] */
    /* JADX WARN: Type inference failed for: r7v10 */
    /* JADX WARN: Type inference failed for: r7v11 */
    /* JADX WARN: Type inference failed for: r7v3 */
    /* JADX WARN: Type inference failed for: r7v4, types: [q28] */
    /* JADX WARN: Type inference failed for: r7v5, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r7v6 */
    /* JADX WARN: Type inference failed for: r7v7 */
    /* JADX WARN: Type inference failed for: r7v8 */
    /* JADX WARN: Type inference failed for: r7v9 */
    @Override // defpackage.ah8
    public boolean j(q28 q28Var) {
        ?? o78Var = 0;
        while (true) {
            int i2 = 0;
            if (q28Var == 0) {
                return false;
            }
            if (q28Var instanceof ub9) {
                ((ub9) q28Var).M();
            } else if ((q28Var.c & 16) != 0 && (q28Var instanceof b43)) {
                q28 q28Var2 = ((b43) q28Var).p;
                o78Var = o78Var;
                q28Var = q28Var;
                while (q28Var2 != null) {
                    if ((q28Var2.c & 16) != 0) {
                        i2++;
                        o78Var = o78Var;
                        if (i2 == 1) {
                            q28Var = q28Var2;
                        } else {
                            if (o78Var == 0) {
                                o78Var = new o78(new q28[16]);
                            }
                            if (q28Var != 0) {
                                o78Var.b(q28Var);
                                q28Var = 0;
                            }
                            o78Var.b(q28Var2);
                        }
                    }
                    q28Var2 = q28Var2.f;
                    o78Var = o78Var;
                    q28Var = q28Var;
                }
                if (i2 == 1) {
                }
            }
            q28Var = flb.q0(o78Var);
        }
    }

    @Override // defpackage.ah8
    public int l() {
        return 16;
    }

    @Override // defpackage.yfg
    public nig l0(gr7 gr7Var) throws GeneralSecurityException {
        ntg ntgVar;
        k3g k3gVar = (k3g) gr7Var;
        zsg zsgVarW = atg.w();
        etg etgVarT = ftg.t();
        String str = k3gVar.h.a;
        etgVarT.c();
        ftg.v((ftg) etgVarT.b, str);
        ftg ftgVar = (ftg) etgVarT.b();
        zsgVarW.c();
        atg.v((atg) zsgVarW.b, ftgVar);
        rsf rsfVarB = ((atg) zsgVarW.b()).b();
        zrg zrgVar = zrg.REMOTE;
        d1g d1gVar = k3gVar.h.b;
        if (d1g.l == d1gVar) {
            ntgVar = ntg.TINK;
        } else {
            if (d1g.m != d1gVar) {
                throw new GeneralSecurityException("Unable to serialize variant: ".concat(String.valueOf(d1gVar)));
            }
            ntgVar = ntg.RAW;
        }
        return nig.I("type.googleapis.com/google.crypto.tink.KmsAeadKey", rsfVarB, zrgVar, ntgVar, k3gVar.j);
    }

    @Override // defpackage.veb
    public void m(String str, String str2) {
        str.getClass();
    }

    @Override // defpackage.ah8
    public boolean n(q28 q28Var) {
        return true;
    }

    @Override // defpackage.veb
    public void q(String str, String str2, boolean z) {
        str.getClass();
    }

    @Override // defpackage.rhg
    public bzf r(lig ligVar) throws GeneralSecurityException {
        isg isgVar = (isg) ligVar.c;
        if (!isgVar.B().equals("type.googleapis.com/google.crypto.tink.ChaCha20Poly1305Key")) {
            ay0.e(ka1.r("Wrong type URL in call to ChaCha20Poly1305ProtoSerialization.parseParameters: ", isgVar.B()));
            return null;
        }
        try {
            kog.t(isgVar.A(), ptf.a);
            return new c3g(m7g.a(isgVar.z()));
        } catch (zzale e2) {
            throw new GeneralSecurityException("Parsing ChaCha20Poly1305Parameters failed: ", e2);
        }
    }

    @Override // defpackage.ah8
    public void s(aq6 aq6Var, long j2, yn5 yn5Var, int i2, boolean z) {
        aq6Var.A(j2, yn5Var, i2, z);
    }

    @Override // defpackage.veb
    public void t(String str, String str2) {
        str.getClass();
    }

    @Override // defpackage.c8
    public void toJson(ae6 ae6Var, yl2 yl2Var, Object obj) {
        double dDoubleValue = ((Number) obj).doubleValue();
        yl2Var.getClass();
        ae6Var.z(dDoubleValue);
    }

    public String toString() {
        switch (this.a) {
            case 7:
                return "StructuralEqualityPolicy";
            case 11:
                return "Arrangement#End";
            default:
                return super.toString();
        }
    }

    @Override // defpackage.veb
    public void u(String str, String str2) {
        str.getClass();
    }

    @Override // defpackage.y92
    public Object v(Object obj) {
        ((fdb) obj).close();
        return c1e.a;
    }

    @Override // defpackage.g70
    public void w(m73 m73Var, int i2, int[] iArr, ip6 ip6Var, int[] iArr2) {
        int i3 = 0;
        if (ip6Var == ip6.Ltr) {
            int i4 = 0;
            for (int i5 : iArr) {
                i4 += i5;
            }
            int length = iArr.length;
            int i6 = i2 - i4;
            int i7 = 0;
            while (i3 < length) {
                int i8 = iArr[i3];
                iArr2[i7] = i6;
                i6 += i8;
                i3++;
                i7++;
            }
            return;
        }
        int length2 = iArr.length;
        while (true) {
            length2--;
            if (-1 >= length2) {
                return;
            }
            int i9 = iArr[length2];
            iArr2[length2] = i3;
            i3 += i9;
        }
    }

    @Override // defpackage.veb
    public void x(String str, int i2, String str2) {
        str.getClass();
    }

    @Override // defpackage.khf
    public Object y() {
        return new zi5(25);
    }

    @Override // defpackage.ba2
    public void z(qt5 qt5Var, List list) {
        qt5Var.getClass();
    }

    public /* synthetic */ xsa(int i2) {
        this.a = i2;
    }

    @Override // defpackage.pq3
    public void L(String str) {
    }

    @Override // defpackage.pq3
    public void k(or3 or3Var) {
    }

    @Override // defpackage.k60
    public void o(String str) {
    }

    @Override // defpackage.pq3
    public void p(or3 or3Var) {
    }

    @Override // defpackage.veb
    public void b(String str, String str2) {
    }
}

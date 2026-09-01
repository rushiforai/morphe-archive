package defpackage;

import android.content.Context;
import android.content.SharedPreferences;
import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import com.medium.android.donkey.main.Wv.MaAxRJinch;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class z46 implements qx5, mqe, ndf, uy4, sy3, r44, hb2, ukg, rhg, thg {
    public static boolean b;
    public static boolean c;
    public static final z46 a = new z46();
    public static final ar0 d = new ar0(-1.0f, -1.0f);
    public static final ar0 e = new ar0(0.0f, -1.0f);
    public static final ar0 f = new ar0(1.0f, -1.0f);
    public static final ar0 g = new ar0(-1.0f, 0.0f);
    public static final ar0 h = new ar0(0.0f, 0.0f);
    public static final ar0 i = new ar0(1.0f, 0.0f);
    public static final ar0 j = new ar0(-1.0f, 1.0f);
    public static final ar0 k = new ar0(0.0f, 1.0f);
    public static final ar0 l = new ar0(1.0f, 1.0f);
    public static final zq0 m = new zq0(-1.0f);
    public static final zq0 n = new zq0(0.0f);
    public static final zq0 o = new zq0(1.0f);
    public static final yq0 p = new yq0(-1.0f);
    public static final yq0 q = new yq0(0.0f);
    public static final yq0 r = new yq0(1.0f);
    public static final z46 s = new z46();
    public static final z46 t = new z46();
    public static final z46 u = new z46();
    public static final z46 v = new z46();
    public static final z46 w = new z46();
    public static final z46 x = new z46();
    public static final z46 y = new z46();
    public static final /* synthetic */ z46 z = new z46();

    public static y28 b(y28 y28Var) {
        z05 z05VarG = d93.g(y28Var);
        String str = s96.a;
        y05 y05Var = (y05) s96.k.get(z05VarG);
        if (y05Var == null) {
            rd6.s("Given class ", y28Var, " is not a read-only collection");
            return null;
        }
        y28 y28VarJ = f93.e(y28Var).j(y05Var);
        y28VarJ.getClass();
        return y28VarJ;
    }

    public static zg7 c(wue wueVar, uue uueVar, int i2) {
        if ((i2 & 2) != 0) {
            uueVar = wueVar instanceof pi5 ? ((pi5) wueVar).getDefaultViewModelProviderFactory() : i33.b;
        }
        qg2 defaultViewModelCreationExtras = wueVar instanceof pi5 ? ((pi5) wueVar).getDefaultViewModelCreationExtras() : og2.b;
        uueVar.getClass();
        defaultViewModelCreationExtras.getClass();
        return new zg7(wueVar.getViewModelStore(), uueVar, defaultViewModelCreationExtras);
    }

    public static String g(String str) {
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
            byte[] bytes = str.getBytes(wk1.a);
            bytes.getClass();
            messageDigest.update(bytes);
            byte[] bArrDigest = messageDigest.digest();
            bArrDigest.getClass();
            return k80.C0(bArrDigest, "", 30);
        } catch (NoSuchAlgorithmException e2) {
            f49.K(ymb.a, d66.ERROR, e66.USER, b18.k, e2, false, 48);
            return null;
        }
    }

    public static zo7 h(x12 x12Var) {
        return (zo7) ((p65) x12Var).j(kt7.b);
    }

    public static jp7 j(x12 x12Var) {
        return (jp7) ((p65) x12Var).j(kt7.a);
    }

    public static eu7 n(x12 x12Var) {
        return (eu7) ((p65) x12Var).j(kt7.c);
    }

    public static void q(i87 i87Var, String str, String str2) {
        i87Var.getClass();
        str.getClass();
        synchronized (f94.b) {
        }
    }

    public static void s(i87 i87Var, String str, String str2, Object... objArr) {
        i87Var.getClass();
        str.getClass();
        synchronized (f94.b) {
        }
    }

    public static void w(vy3 vy3Var, StringBuilder sb) {
        int iCharAt = (sb.charAt(1) * '(') + (sb.charAt(0) * 1600) + sb.charAt(2) + 1;
        vy3Var.c.append(new String(new char[]{(char) (iCharAt / 256), (char) (iCharAt % 256)}));
        sb.delete(0, 3);
    }

    public static SharedPreferences x(Context context, String str) {
        return context.getSharedPreferences("com.google.firebase.auth.internal.browserSignInSessionStore." + str, 0);
    }

    public static void y(SharedPreferences sharedPreferences) {
        SharedPreferences.Editor editorEdit = sharedPreferences.edit();
        Iterator<String> it2 = sharedPreferences.getAll().keySet().iterator();
        while (it2.hasNext()) {
            editorEdit.remove(it2.next());
        }
        editorEdit.apply();
    }

    public static final cof z(Object obj, Object obj2) {
        cof cofVarA = (cof) obj;
        cof cofVar = (cof) obj2;
        if (!cofVar.isEmpty()) {
            if (!cofVarA.a) {
                cofVarA = cofVarA.a();
            }
            cofVarA.c();
            if (!cofVar.isEmpty()) {
                cofVarA.putAll(cofVar);
            }
        }
        return cofVarA;
    }

    @Override // defpackage.mqe
    public Object L0(id6 id6Var, float f2) {
        boolean z2 = id6Var.I() == ed6.BEGIN_ARRAY;
        if (z2) {
            id6Var.f();
        }
        float fNextDouble = (float) id6Var.nextDouble();
        float fNextDouble2 = (float) id6Var.nextDouble();
        while (id6Var.hasNext()) {
            id6Var.v();
        }
        if (z2) {
            id6Var.p();
        }
        return new gqb((fNextDouble / 100.0f) * f2, (fNextDouble2 / 100.0f) * f2);
    }

    public void M0(vy3 vy3Var) {
        StringBuilder sb = new StringBuilder();
        while (true) {
            if (!vy3Var.b()) {
                break;
            }
            char cA = vy3Var.a();
            vy3Var.d++;
            int iF = f(cA, sb);
            int length = vy3Var.c.length() + ((sb.length() / 3) << 1);
            vy3Var.c(length);
            int i2 = vy3Var.f.b - length;
            if (!vy3Var.b()) {
                StringBuilder sb2 = new StringBuilder();
                if (sb.length() % 3 == 2 && (i2 < 2 || i2 > 2)) {
                    int length2 = sb.length();
                    sb.delete(length2 - iF, length2);
                    vy3Var.d--;
                    iF = f(vy3Var.a(), sb2);
                    vy3Var.f = null;
                }
                while (sb.length() % 3 == 1 && ((iF <= 3 && i2 != 1) || iF > 3)) {
                    int length3 = sb.length();
                    sb.delete(length3 - iF, length3);
                    vy3Var.d--;
                    iF = f(vy3Var.a(), sb2);
                    vy3Var.f = null;
                }
            } else if (sb.length() % 3 == 0 && wgf.F(vy3Var.a, vy3Var.d, l()) != l()) {
                vy3Var.e = 0;
                break;
            }
        }
        o(vy3Var, sb);
    }

    @Override // defpackage.qx5
    public void a() {
    }

    @Override // defpackage.ukg
    public ing d(ur7 ur7Var) {
        fug fugVar = (fug) ur7Var;
        omg omgVar = elf.a;
        mqg mqgVarE = oqg.E();
        mqgVarE.c();
        ((oqg) mqgVarE.b).G();
        sqg sqgVarC = elf.c(fugVar.i);
        mqgVarE.c();
        ((oqg) mqgVarE.b).H(sqgVarC);
        byte[] bArrN = kk7.N((BigInteger) fugVar.j.b);
        omf omfVar = pmf.b;
        omf omfVarC = pmf.C(bArrN, 0, bArrN.length);
        mqgVarE.c();
        ((oqg) mqgVarE.b).I(omfVarC);
        byte[] bArrN2 = kk7.N((BigInteger) fugVar.k.b);
        omf omfVarC2 = pmf.C(bArrN2, 0, bArrN2.length);
        mqgVarE.c();
        ((oqg) mqgVarE.b).J(omfVarC2);
        byte[] bArrN3 = kk7.N((BigInteger) fugVar.l.b);
        omf omfVarC3 = pmf.C(bArrN3, 0, bArrN3.length);
        mqgVarE.c();
        ((oqg) mqgVarE.b).K(omfVarC3);
        byte[] bArrN4 = kk7.N((BigInteger) fugVar.m.b);
        omf omfVarC4 = pmf.C(bArrN4, 0, bArrN4.length);
        mqgVarE.c();
        ((oqg) mqgVarE.b).L(omfVarC4);
        byte[] bArrN5 = kk7.N((BigInteger) fugVar.n.b);
        omf omfVarC5 = pmf.C(bArrN5, 0, bArrN5.length);
        mqgVarE.c();
        ((oqg) mqgVarE.b).M(omfVarC5);
        byte[] bArrN6 = kk7.N((BigInteger) fugVar.o.b);
        omf omfVarC6 = pmf.C(bArrN6, 0, bArrN6.length);
        mqgVarE.c();
        ((oqg) mqgVarE.b).N(omfVarC6);
        omf omfVarC7 = ((oqg) mqgVarE.e()).c();
        d1g d1gVar = d1g.x;
        iug iugVar = fugVar.i;
        return ing.k("type.googleapis.com/google.crypto.tink.RsaSsaPkcs1PrivateKey", omfVarC7, d1gVar, elf.a(iugVar.i.c), iugVar.l);
    }

    public int f(char c2, StringBuilder sb) {
        if (c2 == ' ') {
            sb.append((char) 3);
            return 1;
        }
        if (c2 >= '0' && c2 <= '9') {
            sb.append((char) (c2 - ','));
            return 1;
        }
        if (c2 >= 'A' && c2 <= 'Z') {
            sb.append((char) (c2 - '3'));
            return 1;
        }
        if (c2 < ' ') {
            sb.append((char) 0);
            sb.append(c2);
            return 2;
        }
        if (c2 >= '!' && c2 <= '/') {
            sb.append((char) 1);
            sb.append((char) (c2 - '!'));
            return 2;
        }
        if (c2 >= ':' && c2 <= '@') {
            sb.append((char) 1);
            sb.append((char) (c2 - '+'));
            return 2;
        }
        if (c2 >= '[' && c2 <= '_') {
            sb.append((char) 1);
            sb.append((char) (c2 - 'E'));
            return 2;
        }
        if (c2 < '`' || c2 > 127) {
            sb.append("\u0001\u001e");
            return f((char) (c2 - 128), sb) + 2;
        }
        sb.append((char) 2);
        sb.append((char) (c2 - '`'));
        return 2;
    }

    @Override // defpackage.thg
    public lig i(bzf bzfVar) {
        g2g g2gVar = (g2g) bzfVar;
        f6g.c(g2gVar);
        hsg hsgVarT = isg.t();
        hsgVarT.g("type.googleapis.com/google.crypto.tink.AesGcmKey");
        dng dngVarX = fng.x();
        int i2 = g2gVar.a;
        dngVarX.c();
        ((fng) dngVarX.b).zze = i2;
        hsgVarT.h(((fng) dngVarX.b()).b());
        hsgVarT.e(f6g.b(g2gVar.d));
        return lig.p0((isg) hsgVarT.b());
    }

    @Override // defpackage.qx5
    public void k() {
    }

    public int l() {
        return 1;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0016 A[Catch: all -> 0x001b, TRY_LEAVE, TryCatch #1 {, blocks: (B:3:0x0001, B:12:0x0016, B:10:0x0011, B:7:0x000d), top: B:22:0x0001, inners: #0 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized defpackage.nz5 m(android.content.Context r4) {
        /*
            r3 = this;
            monitor-enter(r3)
            java.lang.Class<nz5> r0 = defpackage.nz5.class
            java.util.Set r1 = defpackage.ec2.a     // Catch: java.lang.Throwable -> L1b
            boolean r1 = r1.contains(r0)     // Catch: java.lang.Throwable -> L1b
            r2 = 0
            if (r1 == 0) goto Ld
            goto L14
        Ld:
            nz5 r2 = defpackage.nz5.m     // Catch: java.lang.Throwable -> L10
            goto L14
        L10:
            r1 = move-exception
            defpackage.ec2.a(r0, r1)     // Catch: java.lang.Throwable -> L1b
        L14:
            if (r2 != 0) goto L1d
            nz5 r2 = e(r4)     // Catch: java.lang.Throwable -> L1b
            goto L1d
        L1b:
            r4 = move-exception
            goto L1f
        L1d:
            monitor-exit(r3)
            return r2
        L1f:
            monitor-exit(r3)     // Catch: java.lang.Throwable -> L1b
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.z46.m(android.content.Context):nz5");
    }

    public void o(vy3 vy3Var, StringBuilder sb) {
        int length = (sb.length() / 3) << 1;
        int length2 = sb.length() % 3;
        int length3 = vy3Var.c.length() + length;
        vy3Var.c(length3);
        int i2 = vy3Var.f.b - length3;
        if (length2 == 2) {
            sb.append((char) 0);
            while (sb.length() >= 3) {
                w(vy3Var, sb);
            }
            if (vy3Var.b()) {
                vy3Var.d((char) 254);
            }
        } else if (i2 == 1 && length2 == 1) {
            while (sb.length() >= 3) {
                w(vy3Var, sb);
            }
            if (vy3Var.b()) {
                vy3Var.d((char) 254);
            }
            vy3Var.d--;
        } else {
            if (length2 != 0) {
                ygf.f("Unexpected case. Please report!");
                return;
            }
            while (sb.length() >= 3) {
                w(vy3Var, sb);
            }
            if (i2 > 0 || vy3Var.b()) {
                vy3Var.d((char) 254);
            }
        }
        vy3Var.e = 0;
    }

    @Override // defpackage.qx5
    public void onCancel() {
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x007f, code lost:
    
        if (r9 == r14) goto L49;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x00b9, code lost:
    
        if (r9 == r14) goto L49;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x00ec, code lost:
    
        if (r9 == r14) goto L49;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x011f, code lost:
    
        if (r9 == r14) goto L49;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object p(defpackage.ok7 r10, defpackage.nhc r11, android.content.res.Resources r12, defpackage.e9d r13, defpackage.n92 r14) {
        /*
            Method dump skipped, instruction units count: 312
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.z46.p(ok7, nhc, android.content.res.Resources, e9d, n92):java.lang.Object");
    }

    public synchronized void t(String str) {
        str.getClass();
        f94.h(i87.INCLUDE_ACCESS_TOKENS);
        u(str);
    }

    public synchronized void u(String str) {
        str.getClass();
        f87.c.put(str, "ACCESS_TOKEN_REMOVED");
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0038  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean v(java.lang.String r9) {
        /*
            r8 = this;
            java.util.Set r0 = defpackage.ec2.a
            boolean r1 = r0.contains(r8)
            r2 = 0
            if (r1 == 0) goto La
            return r2
        La:
            boolean r0 = r0.contains(r8)     // Catch: java.lang.Throwable -> L43
            java.lang.String r1 = "none"
            r3 = 1
            r4 = 0
            if (r0 == 0) goto L15
            goto L3d
        L15:
            r0 = 30
            float[] r5 = new float[r0]     // Catch: java.lang.Throwable -> L22
            r6 = r2
        L1a:
            if (r6 >= r0) goto L24
            r7 = 0
            r5[r6] = r7     // Catch: java.lang.Throwable -> L22
            int r6 = r6 + 1
            goto L1a
        L22:
            r9 = move-exception
            goto L3a
        L24:
            h28 r0 = defpackage.h28.MTML_INTEGRITY_DETECT     // Catch: java.lang.Throwable -> L22
            float[][] r6 = new float[r3][]     // Catch: java.lang.Throwable -> L22
            r6[r2] = r5     // Catch: java.lang.Throwable -> L22
            java.lang.String[] r9 = new java.lang.String[]{r9}     // Catch: java.lang.Throwable -> L22
            java.lang.String[] r9 = defpackage.k28.f(r0, r6, r9)     // Catch: java.lang.Throwable -> L22
            if (r9 == 0) goto L38
            r4 = r9[r2]     // Catch: java.lang.Throwable -> L22
            if (r4 != 0) goto L3d
        L38:
            r4 = r1
            goto L3d
        L3a:
            defpackage.ec2.a(r8, r9)     // Catch: java.lang.Throwable -> L43
        L3d:
            boolean r8 = r1.equals(r4)     // Catch: java.lang.Throwable -> L43
            r8 = r8 ^ r3
            return r8
        L43:
            r9 = move-exception
            defpackage.ec2.a(r8, r9)
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.z46.v(java.lang.String):boolean");
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x001a A[Catch: all -> 0x0020, TRY_LEAVE, TryCatch #1 {, blocks: (B:4:0x0003, B:13:0x001a, B:11:0x0014, B:8:0x0010), top: B:92:0x0003, inners: #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:67:0x016a  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0176  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.nz5 e(android.content.Context r22) {
        /*
            Method dump skipped, instruction units count: 449
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.z46.e(android.content.Context):nz5");
    }

    @Override // defpackage.rhg
    public bzf r(lig ligVar) throws GeneralSecurityException {
        isg isgVar = (isg) ligVar.c;
        if (!isgVar.B().equals("type.googleapis.com/google.crypto.tink.KmsEnvelopeAeadKey")) {
            ay0.e(ka1.r("Wrong type URL in call to LegacyKmsEnvelopeAeadProtoSerialization.parseParameters: ", isgVar.B()));
            return null;
        }
        try {
            return b4g.a(ltg.u(isgVar.A(), ptf.a), isgVar.z());
        } catch (zzale e2) {
            throw new GeneralSecurityException(MaAxRJinch.DsQHnLQtfOxTR, e2);
        }
    }
}

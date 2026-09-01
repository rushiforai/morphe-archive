package defpackage;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Point;
import android.graphics.Rect;
import android.inputmethodservice.InputMethodService;
import android.os.Build;
import android.os.SystemClock;
import android.util.Log;
import android.view.Display;
import android.view.WindowManager;
import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import java.security.GeneralSecurityException;
import java.security.Provider;
import java.security.Signature;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uob implements y92, hb2, nvc, ajc, o5f, c8, g70, j70, b21, um2, q14, r44, ah8, dp1, khf, xlf, rhg, vfg {
    public static final uob b = new uob(1);
    public static final uob c = new uob(2);
    public static final /* synthetic */ uob d = new uob(3);
    public static final uob e = new uob(4);
    public static final uob f = new uob(5);
    public static final uob g = new uob(6);
    public static final uob h = new uob(7);
    public static final uob i = new uob(8);
    public static final uob j = new uob(9);
    public final /* synthetic */ int a;

    public /* synthetic */ uob(int i2) {
        this.a = i2;
    }

    @Override // defpackage.ah8
    public boolean A(yn5 yn5Var, aq6 aq6Var) {
        return false;
    }

    @Override // defpackage.ah8
    public boolean C(aq6 aq6Var) {
        txb txbVarX = aq6Var.x();
        boolean z = false;
        if (txbVarX != null && txbVarX.d) {
            z = true;
        }
        return !z;
    }

    @Override // defpackage.ajc
    public boolean E(Object obj, Object obj2) {
        return obj == obj2;
    }

    @Override // defpackage.vfg
    public gr7 T(nig nigVar) throws GeneralSecurityException {
        if (!((String) nigVar.a).equals("type.googleapis.com/google.crypto.tink.AesEaxKey")) {
            ay0.e("Wrong type URL in call to AesEaxProtoSerialization.parseKey");
            return null;
        }
        try {
            pmg pmgVarU = pmg.u((hsf) nigVar.c, ptf.a);
            if (pmgVarU.t() != 0) {
                throw new GeneralSecurityException("Only version 0 keys are accepted");
            }
            o2b o2bVarB = p1g.b();
            o2bVarB.W(pmgVarU.z().e());
            o2bVarB.S(pmgVarU.y().t());
            o2bVarB.Y();
            o2bVarB.e = v5g.a((ntg) nigVar.e);
            p1g p1gVarO = o2bVarB.O();
            vwa vwaVar = new vwa(26, false);
            vwaVar.c = null;
            vwaVar.d = null;
            vwaVar.b = p1gVarO;
            vwaVar.c = new ujf(28, qvg.a(pmgVarU.z().x()));
            vwaVar.d = (Integer) nigVar.f;
            return vwaVar.H();
        } catch (zzale unused) {
            ygf.l("Parsing AesEaxKey failed");
            return null;
        }
    }

    @Override // defpackage.b21
    public byte[] a(byte[] bArr, int i2, int i3) {
        return Arrays.copyOfRange(bArr, i2, i3 + i2);
    }

    @Override // defpackage.o5f
    public k5f b(ContextWrapper contextWrapper, n73 n73Var) {
        Context baseContext = contextWrapper;
        while (true) {
            if (!(baseContext instanceof ContextWrapper)) {
                baseContext = contextWrapper;
                break;
            }
            if ((baseContext instanceof Activity) || (baseContext instanceof InputMethodService)) {
                break;
            }
            ContextWrapper contextWrapper2 = (ContextWrapper) baseContext;
            if (contextWrapper2.getBaseContext() == null) {
                break;
            }
            baseContext = contextWrapper2.getBaseContext();
            baseContext.getClass();
        }
        if (baseContext instanceof Activity) {
            Activity activity = (Activity) baseContext;
            yx0.U.getClass();
            int i2 = Build.VERSION.SDK_INT;
            return new k5f(new wx0((i2 >= 30 ? zx0.a : i2 >= 29 ? h1c.d : i2 >= 28 ? jzb.b : i2 >= 24 ? y3b.d : u3b.c).p(activity)), n73Var.c(activity));
        }
        if (!(baseContext instanceof InputMethodService) && !(baseContext instanceof Application)) {
            ay0.e("Must provide a UiContext or Application Context");
            return null;
        }
        Object systemService = contextWrapper.getSystemService("window");
        systemService.getClass();
        Display defaultDisplay = ((WindowManager) systemService).getDefaultDisplay();
        defaultDisplay.getClass();
        Point point = new Point();
        defaultDisplay.getRealSize(point);
        return new k5f(new Rect(0, 0, point.x, point.y), n73Var.c(contextWrapper));
    }

    @Override // defpackage.nvc
    public void c(mvc mvcVar) {
        mvcVar.clear();
    }

    @Override // defpackage.xlf
    public /* bridge */ /* synthetic */ Object d(String str, Provider provider) {
        return provider == null ? Signature.getInstance(str) : Signature.getInstance(str, provider);
    }

    @Override // defpackage.dp1
    public long e() {
        return SystemClock.elapsedRealtime();
    }

    @Override // defpackage.g70, defpackage.j70
    public float f() {
        return 0.0f;
    }

    @Override // defpackage.j70
    public void f0(m73 m73Var, int i2, int[] iArr, int[] iArr2) {
        qb8.O(i2, iArr, iArr2, false);
    }

    @Override // defpackage.c8
    public Object fromJson(fd6 fd6Var, yl2 yl2Var) {
        return Integer.valueOf(fd6Var.nextInt());
    }

    @Override // defpackage.nvc
    public boolean i(Object obj, Object obj2) {
        return false;
    }

    @Override // defpackage.ah8
    public boolean j(q28 q28Var) {
        return false;
    }

    public boolean k(int i2) {
        return 4 <= i2 || Log.isLoggable("FirebaseCrashlytics", i2);
    }

    @Override // defpackage.ah8
    public int l() {
        return 8;
    }

    @Override // defpackage.um2
    public Iterable m(Object obj) {
        Collection collectionI;
        f41 f41Var = (f41) obj;
        return (f41Var == null || (collectionI = f41Var.i()) == null) ? ey3.a : collectionI;
    }

    @Override // defpackage.ah8
    public boolean n(q28 q28Var) {
        return kng.I(il7.h(flb.v0(q28Var), false));
    }

    public void o(String str) {
        if (k(3)) {
            Log.d("FirebaseCrashlytics", str, null);
        }
    }

    public void p(String str) {
        if (k(2)) {
            Log.v("FirebaseCrashlytics", str, null);
        }
    }

    public void q(String str, Exception exc) {
        if (k(5)) {
            Log.w("FirebaseCrashlytics", str, exc);
        }
    }

    @Override // defpackage.rhg
    public bzf r(lig ligVar) throws GeneralSecurityException {
        isg isgVar = (isg) ligVar.c;
        if (!isgVar.B().equals("type.googleapis.com/google.crypto.tink.KmsAeadKey")) {
            ay0.e(ka1.r("Wrong type URL in call to LegacyKmsAeadProtoSerialization.parseParameters: ", isgVar.B()));
            return null;
        }
        try {
            return new l3g(ftg.u(isgVar.A(), ptf.a).x(), s3g.a(isgVar.z()));
        } catch (zzale e2) {
            throw new GeneralSecurityException("Parsing KmsAeadKeyFormat failed: ", e2);
        }
    }

    @Override // defpackage.ah8
    public void s(aq6 aq6Var, long j2, yn5 yn5Var, int i2, boolean z) {
        hj0 hj0Var = aq6Var.F;
        eh8 eh8Var = (eh8) hj0Var.e;
        tjb tjbVar = eh8.N;
        ((eh8) hj0Var.e).T0(eh8.R, eh8Var.L0(j2), yn5Var, 1, z);
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x00a4  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00c1  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x007c A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:46:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /* JADX WARN: Type inference failed for: r0v10, types: [qya, x45] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:33:0x00b9 -> B:18:0x0047). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object t(int r18, long r19, long r21, double r23, defpackage.x45 r25, defpackage.p92 r26) {
        /*
            Method dump skipped, instruction units count: 208
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uob.t(int, long, long, double, x45, p92):java.lang.Object");
    }

    @Override // defpackage.c8
    public void toJson(ae6 ae6Var, yl2 yl2Var, Object obj) {
        int iIntValue = ((Number) obj).intValue();
        yl2Var.getClass();
        ae6Var.u(iIntValue);
    }

    public String toString() {
        switch (this.a) {
            case 6:
                return "ReferentialEqualityPolicy";
            case 11:
                return "Arrangement#SpaceAround";
            case 13:
                return "Empty";
            default:
                return super.toString();
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:34:0x00a2, code lost:
    
        if (defpackage.gsa.X(r6, r1) != r2) goto L13;
     */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0076 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:30:0x008a  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00a5 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00a6  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:34:0x00a2 -> B:13:0x0037). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object u(defpackage.x45 r17, long r18, long r20, double r22, defpackage.x45 r24, defpackage.p92 r25) throws java.lang.Exception {
        /*
            r16 = this;
            r0 = r25
            boolean r1 = r0 instanceof defpackage.e5g
            if (r1 == 0) goto L15
            r1 = r0
            e5g r1 = (defpackage.e5g) r1
            int r2 = r1.i
            r3 = -2147483648(0xffffffff80000000, float:-0.0)
            r4 = r2 & r3
            if (r4 == 0) goto L15
            int r2 = r2 - r3
            r1.i = r2
            goto L1c
        L15:
            e5g r1 = new e5g
            r2 = r16
            r1.<init>(r2, r0)
        L1c:
            java.lang.Object r0 = r1.g
            tb2 r2 = defpackage.tb2.COROUTINE_SUSPENDED
            int r3 = r1.i
            r4 = 2
            r5 = 1
            if (r3 == 0) goto L55
            if (r3 == r5) goto L45
            if (r3 != r4) goto L3e
            long r6 = r1.e
            double r8 = r1.f
            long r10 = r1.d
            x45 r3 = r1.c
            x45 r12 = r1.b
            defpackage.br7.v(r0)
        L37:
            r14 = r12
            r12 = r1
            r1 = r14
            r14 = r10
            r10 = r8
            r8 = r14
            goto L63
        L3e:
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r0)
            r0 = 0
            return r0
        L45:
            long r6 = r1.e
            double r8 = r1.f
            long r10 = r1.d
            x45 r3 = r1.c
            x45 r12 = r1.b
            defpackage.br7.v(r0)     // Catch: java.lang.Exception -> L53
            return r0
        L53:
            r0 = move-exception
            goto L7e
        L55:
            defpackage.br7.v(r0)
            r6 = r18
            r8 = r20
            r10 = r22
            r3 = r24
            r12 = r1
            r1 = r17
        L63:
            r12.b = r1     // Catch: java.lang.Exception -> L77
            r12.c = r3     // Catch: java.lang.Exception -> L77
            r12.d = r8     // Catch: java.lang.Exception -> L77
            r12.f = r10     // Catch: java.lang.Exception -> L77
            r12.e = r6     // Catch: java.lang.Exception -> L77
            r12.i = r5     // Catch: java.lang.Exception -> L77
            java.lang.Object r0 = r3.invoke(r12)     // Catch: java.lang.Exception -> L77
            if (r0 != r2) goto L76
            goto La5
        L76:
            return r0
        L77:
            r0 = move-exception
            r14 = r12
            r12 = r1
            r1 = r14
            r14 = r10
            r10 = r8
            r8 = r14
        L7e:
            java.lang.Object r13 = r12.invoke(r0)
            java.lang.Boolean r13 = (java.lang.Boolean) r13
            boolean r13 = r13.booleanValue()
            if (r13 == 0) goto La6
            double r6 = (double) r6
            double r6 = r6 * r8
            long r6 = (long) r6
            int r0 = (r6 > r10 ? 1 : (r6 == r10 ? 0 : -1))
            if (r0 <= 0) goto L92
            r6 = r10
        L92:
            r1.b = r12
            r1.c = r3
            r1.d = r10
            r1.f = r8
            r1.e = r6
            r1.i = r4
            java.lang.Object r0 = defpackage.gsa.X(r6, r1)
            if (r0 == r2) goto La5
            goto L37
        La5:
            return r2
        La6:
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uob.u(x45, long, long, double, x45, p92):java.lang.Object");
    }

    @Override // defpackage.y92
    public Object v(Object obj) {
        ((fdb) obj).close();
        return null;
    }

    @Override // defpackage.g70
    public void w(m73 m73Var, int i2, int[] iArr, ip6 ip6Var, int[] iArr2) {
        if (ip6Var == ip6.Ltr) {
            qb8.O(i2, iArr, iArr2, false);
        } else {
            qb8.O(i2, iArr, iArr2, true);
        }
    }

    @Override // defpackage.khf
    public /* synthetic */ Object y() {
        return new jif("StandardIntegrity");
    }

    @Override // defpackage.q14
    public void h(f41 f41Var) {
    }

    @Override // defpackage.q14
    public void g(y28 y28Var, ArrayList arrayList) {
    }
}

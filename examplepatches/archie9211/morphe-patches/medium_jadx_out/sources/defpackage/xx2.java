package defpackage;

import android.app.Activity;
import android.content.Context;
import com.android.billingclient.api.BillingClient;
import com.android.billingclient.api.BillingFlowParams;
import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.ProductDetails;
import com.android.billingclient.api.PurchasesUpdatedListener;
import com.datadog.android.core.yjCm.PqkdNGCEoxOKZk;
import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import com.medium.android.domain.payments.BillingResultException;
import com.medium.proto.event.IapPurchaseCanceled;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class xx2 implements cr0, PurchasesUpdatedListener {
    public final Context a;
    public final sb2 b;
    public final hx4 c;
    public final l95 d;
    public final og3 e;
    public final yx2 f;
    public final vwa g;
    public final da5 h;
    public final ba5 i;
    public final zg7 j;
    public BillingClient o;
    public enc p;
    public hx2 q;
    public boolean r;
    public final ArrayList k = new ArrayList();
    public final xpc l = vv2.j(null);
    public final xpc m = vv2.j(null);
    public final xpc n = vv2.j(-1);
    public final xpc s = vv2.j(Boolean.FALSE);
    public final a98 t = new a98();

    public xx2(Context context, sb2 sb2Var, hx4 hx4Var, l95 l95Var, og3 og3Var, yx2 yx2Var, vwa vwaVar, da5 da5Var, ba5 ba5Var, zg7 zg7Var) {
        this.a = context;
        this.b = sb2Var;
        this.c = hx4Var;
        this.d = l95Var;
        this.e = og3Var;
        this.f = yx2Var;
        this.g = vwaVar;
        this.h = da5Var;
        this.i = ba5Var;
        this.j = zg7Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(com.android.billingclient.api.Purchase r18, defpackage.p92 r19) {
        /*
            Method dump skipped, instruction units count: 251
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xx2.a(com.android.billingclient.api.Purchase, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x00af  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00be A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(defpackage.p92 r11) {
        /*
            r10 = this;
            boolean r0 = r11 instanceof defpackage.kx2
            if (r0 == 0) goto L13
            r0 = r11
            kx2 r0 = (defpackage.kx2) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            kx2 r0 = new kx2
            r0.<init>(r10, r11)
        L18:
            java.lang.Object r11 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 0
            r5 = 4
            r6 = 3
            r7 = 1
            xpc r8 = r10.m
            r9 = 2
            if (r2 == 0) goto L43
            if (r2 == r7) goto L3f
            if (r2 == r9) goto L3a
            if (r2 == r6) goto L3a
            if (r2 != r5) goto L34
            defpackage.br7.v(r11)
            return r11
        L34:
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r10)
            return r4
        L3a:
            defpackage.br7.v(r11)
            goto Laf
        L3f:
            defpackage.br7.v(r11)
            goto L7c
        L43:
            defpackage.br7.v(r11)
            com.android.billingclient.api.BillingClient r11 = r10.o
            if (r11 != 0) goto L53
            o2a r10 = new o2a
            r11 = -1
            java.lang.String r0 = "Billing client is not initialized"
            r10.<init>(r11, r0)
            return r10
        L53:
            com.android.billingclient.api.BillingClient r11 = r10.c()
            boolean r11 = r11.isReady()
            xpc r2 = r10.n
            if (r11 == 0) goto L6b
            java.lang.Object r11 = r2.getValue()
            java.lang.Number r11 = (java.lang.Number) r11
            int r11 = r11.intValue()
            if (r11 == 0) goto L6e
        L6b:
            r10.l()
        L6e:
            lx2 r11 = new lx2
            r11.<init>(r9, r3, r4)
            r0.d = r7
            java.lang.Object r11 = defpackage.dm2.D(r2, r11, r0)
            if (r11 != r1) goto L7c
            goto Lbd
        L7c:
            xpc r11 = r10.s
            java.lang.Object r2 = r11.getValue()
            java.lang.Boolean r2 = (java.lang.Boolean) r2
            boolean r2 = r2.booleanValue()
            if (r2 == 0) goto L98
            mx2 r10 = new mx2
            r10.<init>(r9, r3, r4)
            r0.d = r9
            java.lang.Object r10 = defpackage.dm2.D(r11, r10, r0)
            if (r10 != r1) goto Laf
            goto Lbd
        L98:
            java.lang.Object r11 = r8.getValue()
            if (r11 == 0) goto La6
            java.lang.Object r11 = r8.getValue()
            boolean r11 = r11 instanceof defpackage.o2a
            if (r11 == 0) goto Laf
        La6:
            r0.d = r6
            java.lang.Object r10 = r10.f(r0)
            if (r10 != r1) goto Laf
            goto Lbd
        Laf:
            zz r10 = new zz
            r11 = 7
            r10.<init>(r8, r11)
            r0.d = r5
            java.lang.Object r10 = defpackage.dm2.C(r10, r0)
            if (r10 != r1) goto Lbe
        Lbd:
            return r1
        Lbe:
            return r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xx2.b(p92):java.lang.Object");
    }

    public final BillingClient c() {
        BillingClient billingClient = this.o;
        if (billingClient != null) {
            return billingClient;
        }
        g76.g0("billingClient");
        throw null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:132:0x03df, code lost:
    
        if (j(r2) == r3) goto L133;
     */
    /* JADX WARN: Removed duplicated region for block: B:112:0x02dd  */
    /* JADX WARN: Removed duplicated region for block: B:115:0x031f  */
    /* JADX WARN: Removed duplicated region for block: B:118:0x0329  */
    /* JADX WARN: Removed duplicated region for block: B:122:0x0356  */
    /* JADX WARN: Removed duplicated region for block: B:130:0x0383  */
    /* JADX WARN: Removed duplicated region for block: B:135:0x03e5  */
    /* JADX WARN: Removed duplicated region for block: B:137:0x03eb A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:150:0x01ca A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00cc  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x00cf  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00f1  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00f8  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0108  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0118 A[LOOP:0: B:43:0x0112->B:45:0x0118, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0136  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0156  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x01c7  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x01e0  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x021a  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x0225  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:132:0x03df -> B:134:0x03e2). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:135:0x03e5 -> B:136:0x03e7). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(java.util.Set r35, defpackage.p92 r36) {
        /*
            Method dump skipped, instruction units count: 1040
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xx2.d(java.util.Set, p92):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:41:0x00f0, code lost:
    
        if (r1 == r3) goto L42;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object f(defpackage.p92 r21) {
        /*
            Method dump skipped, instruction units count: 611
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xx2.f(p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object g(defpackage.p92 r14) {
        /*
            Method dump skipped, instruction units count: 216
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xx2.g(p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object h(defpackage.p92 r7) {
        /*
            r6 = this;
            boolean r0 = r7 instanceof defpackage.tx2
            if (r0 == 0) goto L13
            r0 = r7
            tx2 r0 = (defpackage.tx2) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            tx2 r0 = new tx2
            r0.<init>(r6, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            c1e r3 = defpackage.c1e.a
            r4 = 2
            r5 = 1
            if (r2 == 0) goto L37
            if (r2 == r5) goto L33
            if (r2 != r4) goto L2c
            defpackage.br7.v(r7)
            return r3
        L2c:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L33:
            defpackage.br7.v(r7)
            goto L47
        L37:
            defpackage.br7.v(r7)
            boolean r7 = r6.r
            if (r7 != 0) goto L47
            r0.d = r5
            java.lang.Object r7 = r6.g(r0)
            if (r7 != r1) goto L47
            goto L5d
        L47:
            xpc r7 = r6.s
            java.lang.Object r7 = r7.getValue()
            java.lang.Boolean r7 = (java.lang.Boolean) r7
            boolean r7 = r7.booleanValue()
            if (r7 != 0) goto L5e
            r0.d = r4
            java.lang.Object r6 = r6.f(r0)
            if (r6 != r1) goto L5e
        L5d:
            return r1
        L5e:
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xx2.h(p92):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:40:0x00d3, code lost:
    
        if (k(r0) != r1) goto L42;
     */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00bd  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object i(defpackage.p92 r13) {
        /*
            Method dump skipped, instruction units count: 224
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xx2.i(p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object j(defpackage.p92 r14) {
        /*
            r13 = this;
            boolean r0 = r14 instanceof defpackage.vx2
            if (r0 == 0) goto L13
            r0 = r14
            vx2 r0 = (defpackage.vx2) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            vx2 r0 = new vx2
            r0.<init>(r13, r14)
        L18:
            java.lang.Object r14 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L33
            if (r2 != r4) goto L2c
            defpackage.br7.v(r14)
            bjb r14 = (defpackage.bjb) r14
            java.lang.Object r14 = r14.a
            goto L43
        L2c:
            java.lang.String r13 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r13)
            r13 = 0
            return r13
        L33:
            defpackage.br7.v(r14)
            r0.d = r4
            yd4 r14 = defpackage.yd4.NetworkOnly
            og3 r2 = r13.e
            java.lang.Object r14 = r2.a(r14, r3, r0)
            if (r14 != r1) goto L43
            return r1
        L43:
            boolean r0 = r14 instanceof defpackage.ajb
            if (r0 != 0) goto L70
            r0 = r14
            rj2 r0 = (defpackage.rj2) r0
            hv2 r4 = defpackage.hv2.CONFIRMED
            r11 = 0
            r12 = 254(0xfe, float:3.56E-43)
            r5 = 0
            r6 = 0
            r7 = 0
            r8 = 0
            r9 = 0
            r10 = 0
            dh7 r0 = defpackage.wo7.t(r4, r5, r6, r7, r8, r9, r10, r11, r12)
            uld r1 = defpackage.wld.a
            java.lang.Object[] r2 = new java.lang.Object[r3]
            java.lang.String r4 = "refreshCurrentUser: refreshing user silently successful"
            r1.f(r4, r2)
            ak4 r1 = defpackage.ak4.a()
            r1.b(r4)
            hy2 r1 = defpackage.g01.y
            if (r1 == 0) goto L70
            r1.b(r4, r0)
        L70:
            java.lang.Throwable r14 = defpackage.bjb.b(r14)
            if (r14 == 0) goto Lb0
            hv2 r4 = defpackage.hv2.CONFIRMED
            r11 = 0
            r12 = 254(0xfe, float:3.56E-43)
            r5 = 0
            r6 = 0
            r7 = 0
            r8 = 0
            r9 = 0
            r10 = 0
            dh7 r0 = defpackage.wo7.t(r4, r5, r6, r7, r8, r9, r10, r11, r12)
            uld r1 = defpackage.wld.a
            java.lang.Object[] r2 = new java.lang.Object[r3]
            java.lang.String r3 = "refreshCurrentUser: failed to refresh user after exception"
            r1.e(r14, r3, r2)
            hy2 r1 = defpackage.g01.y
            if (r1 == 0) goto L95
            r1.a(r3, r14, r0)
        L95:
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            java.lang.String r1 = "refreshCurrentUser: failed to refresh user after "
            r0.<init>(r1)
            r0.append(r14)
            java.lang.String r3 = r0.toString()
            r7 = 0
            r8 = 38
            yx2 r2 = r13.f
            r4 = 0
            java.lang.String r5 = ""
            java.lang.String r6 = ""
            defpackage.ev6.K(r2, r3, r4, r5, r6, r7, r8)
        Lb0:
            c1e r13 = defpackage.c1e.a
            return r13
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xx2.j(p92):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:22:0x005f, code lost:
    
        if (f(r0) == r1) goto L23;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object k(defpackage.p92 r7) {
        /*
            r6 = this;
            boolean r0 = r7 instanceof defpackage.wx2
            if (r0 == 0) goto L13
            r0 = r7
            wx2 r0 = (defpackage.wx2) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            wx2 r0 = new wx2
            r0.<init>(r6, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 1
            r5 = 2
            if (r2 == 0) goto L35
            if (r2 == r4) goto L31
            if (r2 != r5) goto L2b
            defpackage.br7.v(r7)
            goto L62
        L2b:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r3
        L31:
            defpackage.br7.v(r7)
            goto L54
        L35:
            defpackage.br7.v(r7)
            xpc r7 = r6.s
            java.lang.Object r2 = r7.getValue()
            java.lang.Boolean r2 = (java.lang.Boolean) r2
            boolean r2 = r2.booleanValue()
            if (r2 == 0) goto L54
            mx2 r2 = new mx2
            r2.<init>(r5, r4, r3)
            r0.d = r4
            java.lang.Object r7 = defpackage.dm2.D(r7, r2, r0)
            if (r7 != r1) goto L54
            goto L61
        L54:
            xpc r7 = r6.m
            r7.l(r3)
            r0.d = r5
            java.lang.Object r6 = r6.f(r0)
            if (r6 != r1) goto L62
        L61:
            return r1
        L62:
            c1e r6 = defpackage.c1e.a
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xx2.k(p92):java.lang.Object");
    }

    public final void l() {
        n92 n92Var = null;
        km4.I(wld.a, null, "Retry billing connection", new Object[0], "Retry billing connection");
        enc encVar = this.p;
        if (encVar != null) {
            encVar.m(null);
        }
        this.p = vx0.c0(this.b, null, null, new r91(this, n92Var, 21), 3);
    }

    @Override // com.android.billingclient.api.PurchasesUpdatedListener
    public final void onPurchasesUpdated(BillingResult billingResult, List list) {
        String str;
        String str2;
        hy2 hy2Var;
        billingResult.getClass();
        int responseCode = billingResult.getResponseCode();
        if (responseCode != 0) {
            yx2 yx2Var = this.f;
            if (responseCode != 1) {
                BillingResultException billingResultException = new BillingResultException(billingResult);
                boolean z = billingResult.getResponseCode() == -1 && g76.L(billingResult.getDebugMessage(), "Service connection is disconnected.");
                hv2 hv2Var = hv2.RESULT;
                hx2 hx2Var = this.q;
                String str3 = hx2Var != null ? hx2Var.a : null;
                Integer numValueOf = Integer.valueOf(billingResult.getResponseCode());
                hx2 hx2Var2 = this.q;
                dh7 dh7VarT = wo7.t(hv2Var, str3, numValueOf, null, hx2Var2 != null ? hx2Var2.c : null, hx2Var2 != null ? hx2Var2.b : null, hx2Var2 != null ? hx2Var2.d : null, null, 136);
                wld.a.e(billingResultException, "onPurchasesUpdated error", new Object[0]);
                if (!z && (hy2Var = g01.y) != null) {
                    hy2Var.a("onPurchasesUpdated error", billingResultException, dh7VarT);
                }
                String strR = ka1.r("onPurchasesUpdated: ", billingResultException.getMessage());
                int responseCode2 = billingResult.getResponseCode();
                hx2 hx2Var3 = this.q;
                yx2Var.b(strR, hx2Var3 != null ? hx2Var3.a : null, Integer.valueOf(responseCode2), (hx2Var3 == null || (str2 = hx2Var3.c) == null) ? "" : str2, hx2Var3 != null ? hx2Var3.b : "", hx2Var3 != null ? hx2Var3.d : null);
            } else {
                hv2 hv2Var2 = hv2.RESULT;
                hx2 hx2Var4 = this.q;
                String str4 = hx2Var4 != null ? hx2Var4.a : null;
                Integer numValueOf2 = Integer.valueOf(billingResult.getResponseCode());
                hx2 hx2Var5 = this.q;
                dh7 dh7VarT2 = wo7.t(hv2Var2, str4, numValueOf2, null, hx2Var5 != null ? hx2Var5.c : null, hx2Var5 != null ? hx2Var5.b : null, hx2Var5 != null ? hx2Var5.d : null, null, 136);
                String str5 = "onPurchasesUpdated - user cancelled the purchase flow - skipping";
                wld.a.f("onPurchasesUpdated - user cancelled the purchase flow - skipping", new Object[0]);
                ak4.a().b("onPurchasesUpdated - user cancelled the purchase flow - skipping");
                hy2 hy2Var2 = g01.y;
                if (hy2Var2 != null) {
                    hy2Var2.b("onPurchasesUpdated - user cancelled the purchase flow - skipping", dh7VarT2);
                }
                hx2 hx2Var6 = this.q;
                if (hx2Var6 == null || (str = hx2Var6.c) == null) {
                    str = "";
                }
                rqd.a(yx2Var.a, new IapPurchaseCanceled(null, hx2Var6 != null ? hx2Var6.a : null, str5, null, null, null, 57, null), str, hx2Var6 != null ? hx2Var6.b : "", true, null, hx2Var6 != null ? hx2Var6.d : null, 16);
            }
        } else {
            hv2 hv2Var3 = hv2.RESULT;
            hx2 hx2Var7 = this.q;
            String str6 = hx2Var7 != null ? hx2Var7.a : null;
            Integer numValueOf3 = Integer.valueOf(billingResult.getResponseCode());
            hx2 hx2Var8 = this.q;
            dh7 dh7VarT3 = wo7.t(hv2Var3, str6, numValueOf3, null, hx2Var8 != null ? hx2Var8.c : null, hx2Var8 != null ? hx2Var8.b : null, hx2Var8 != null ? hx2Var8.d : null, null, 136);
            wld.a.f("onPurchasesUpdated - purchase flow succeeded", new Object[0]);
            ak4.a().b("onPurchasesUpdated - purchase flow succeeded");
            hy2 hy2Var3 = g01.y;
            if (hy2Var3 != null) {
                hy2Var3.b("onPurchasesUpdated - purchase flow succeeded", dh7VarT3);
            }
            Set setQ1 = list != null ? bu1.q1(list) : null;
            this.l.m(null, setQ1 == null ? ny3.a : setQ1);
            if (setQ1 != null) {
                vx0.c0(this.b, null, null, new px2(this, setQ1, null), 3);
            }
        }
        this.q = null;
    }

    public final BillingResult e(Activity activity, String str, String str2, String str3, String str4, String str5, String str6, String str7) {
        Object obj;
        String str8;
        str3.getClass();
        boolean z = (str6 == null || str7 == null) ? false : true;
        String str9 = PqkdNGCEoxOKZk.WjwDdQorS + str + ", with old purchase token?: " + (str7 != null);
        uld uldVar = wld.a;
        uldVar.b(null, str9, new Object[0]);
        ak4.a().b(str9);
        this.q = new hx2(str, str4, str3, str5);
        String strConcat = "Purchase attempt for product: ".concat(str);
        dh7 dh7VarT = wo7.t(hv2.ATTEMPT, str, null, Boolean.valueOf(z), str3, str4, str5, null, NikonType2MakernoteDirectory.TAG_LENS);
        uldVar.f(strConcat, new Object[0]);
        ak4.a().b(strConcat);
        hy2 hy2Var = g01.y;
        if (hy2Var != null) {
            hy2Var.b(strConcat, dh7VarT);
        }
        Object value = this.m.getValue();
        p2a p2aVar = value instanceof p2a ? (p2a) value : null;
        if (p2aVar != null) {
            Iterator it2 = p2aVar.a.iterator();
            while (true) {
                if (!it2.hasNext()) {
                    obj = null;
                    break;
                }
                Object next = it2.next();
                if (g76.L(((ProductDetails) next).getProductId(), str)) {
                    obj = next;
                    break;
                }
            }
            ProductDetails productDetails = (ProductDetails) obj;
            if (productDetails != null) {
                BillingFlowParams.ProductDetailsParams.Builder offerToken = BillingFlowParams.ProductDetailsParams.newBuilder().setProductDetails(productDetails).setOfferToken(str2);
                offerToken.getClass();
                if (str6 != null && str7 != null) {
                    offerToken = offerToken.setSubscriptionProductReplacementParams(BillingFlowParams.ProductDetailsParams.SubscriptionProductReplacementParams.newBuilder().setOldProductId(str6).setReplacementMode(1).build());
                    offerToken.getClass();
                }
                BillingFlowParams.Builder productDetailsParamsList = BillingFlowParams.newBuilder().setProductDetailsParamsList(d46.Q(offerToken.build()));
                productDetailsParamsList.getClass();
                rj2 rj2VarA = this.d.a();
                if (rj2VarA != null && (str8 = rj2VarA.a) != null) {
                    productDetailsParamsList = productDetailsParamsList.setObfuscatedAccountId(str8);
                    productDetailsParamsList.getClass();
                }
                if (str6 != null && str7 != null) {
                    productDetailsParamsList = productDetailsParamsList.setSubscriptionUpdateParams(BillingFlowParams.SubscriptionUpdateParams.newBuilder().setOldPurchaseToken(str7).build());
                    productDetailsParamsList.getClass();
                }
                BillingResult billingResultLaunchBillingFlow = c().launchBillingFlow(activity, productDetailsParamsList.build());
                billingResultLaunchBillingFlow.getClass();
                return billingResultLaunchBillingFlow;
            }
        }
        BillingResult billingResultBuild = BillingResult.newBuilder().setResponseCode(4).setDebugMessage("Product details " + str + " cannot be found").build();
        billingResultBuild.getClass();
        return billingResultBuild;
    }
}

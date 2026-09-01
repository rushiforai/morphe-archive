package defpackage;

import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewStructure;
import android.view.autofill.AutofillId;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mo implements f03, View.OnAttachStateChangeListener {
    public final mn a;
    public final vf b;
    public b82 c;
    public final ArrayList d = new ArrayList();
    public fo e = fo.SHOW_ORIGINAL;
    public boolean f = true;
    public final uz0 g = pwd.e(1, 6, null);
    public k68 h;
    public long i;
    public final k68 j;
    public ayb k;
    public boolean l;
    public final v0 m;

    public mo(mn mnVar, vf vfVar) {
        this.a = mnVar;
        this.b = vfVar;
        new Handler(Looper.getMainLooper());
        k68 k68Var = j46.a;
        k68Var.getClass();
        this.h = k68Var;
        this.j = new k68();
        this.k = new ayb(mnVar.getSemanticsOwner().a(), k68Var);
        this.m = new v0(4, this);
    }

    /* JADX WARN: Code restructure failed: missing block: B:32:0x0083, code lost:
    
        if (defpackage.gsa.X(100, r0) == r1) goto L33;
     */
    /* JADX WARN: Removed duplicated region for block: B:21:0x004f  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x005a  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:32:0x0083 -> B:13:0x002b). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.p92 r9) throws java.lang.Throwable {
        /*
            r8 = this;
            boolean r0 = r9 instanceof defpackage.ko
            if (r0 == 0) goto L13
            r0 = r9
            ko r0 = (defpackage.ko) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            ko r0 = new ko
            r0.<init>(r8, r9)
        L18:
            java.lang.Object r9 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 2
            r4 = 1
            if (r2 == 0) goto L3a
            if (r2 == r4) goto L34
            if (r2 != r3) goto L2d
            pz0 r2 = r0.b
            defpackage.br7.v(r9)
        L2b:
            r9 = r2
            goto L44
        L2d:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            r8 = 0
            return r8
        L34:
            pz0 r2 = r0.b
            defpackage.br7.v(r9)
            goto L52
        L3a:
            defpackage.br7.v(r9)
            pz0 r9 = new pz0
            uz0 r2 = r8.g
            r9.<init>(r2)
        L44:
            r0.b = r9
            r0.e = r4
            java.lang.Object r2 = r9.b(r0)
            if (r2 != r1) goto L4f
            goto L85
        L4f:
            r7 = r2
            r2 = r9
            r9 = r7
        L52:
            java.lang.Boolean r9 = (java.lang.Boolean) r9
            boolean r9 = r9.booleanValue()
            if (r9 == 0) goto L86
            r2.c()
            boolean r9 = r8.e()
            if (r9 == 0) goto L66
            r8.g()
        L66:
            mn r9 = r8.a
            android.os.Handler r9 = r9.getHandler()
            boolean r5 = r8.l
            if (r5 != 0) goto L79
            if (r9 == 0) goto L79
            r8.l = r4
            v0 r5 = r8.m
            r9.post(r5)
        L79:
            r0.b = r2
            r0.e = r3
            r5 = 100
            java.lang.Object r9 = defpackage.gsa.X(r5, r0)
            if (r9 != r1) goto L2b
        L85:
            return r1
        L86:
            c1e r8 = defpackage.c1e.a
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mo.a(p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x00c9  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x016a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void b(defpackage.i46 r34) {
        /*
            Method dump skipped, instruction units count: 425
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mo.b(i46):void");
    }

    public final void c(zxb zxbVar, b55 b55Var) {
        zxbVar.getClass();
        List listJ = zxb.j(4, zxbVar);
        int size = listJ.size();
        int i = 0;
        for (int i2 = 0; i2 < size; i2++) {
            Object obj = listJ.get(i2);
            if (d().a(((zxb) obj).f)) {
                b55Var.invoke(Integer.valueOf(i), obj);
                i++;
            }
        }
    }

    public final i46 d() {
        if (this.f) {
            this.f = false;
            this.h = kng.z(this.a.getSemanticsOwner(), fn.e);
            this.i = System.currentTimeMillis();
        }
        return this.h;
    }

    public final boolean e() {
        return this.c != null;
    }

    public final void g() {
        b82 b82Var = this.c;
        if (b82Var != null && Build.VERSION.SDK_INT >= 29) {
            ArrayList arrayList = this.d;
            if (arrayList.isEmpty()) {
                return;
            }
            int size = arrayList.size();
            for (int i = 0; i < size; i++) {
                x72 x72Var = (x72) arrayList.get(i);
                int i2 = jo.a[x72Var.c.ordinal()];
                if (i2 == 1) {
                    qlb qlbVar = x72Var.d;
                    if (qlbVar != null) {
                        ((a82) b82Var).d((ViewStructure) qlbVar.a);
                    }
                } else {
                    if (i2 != 2) {
                        ygf.a();
                        return;
                    }
                    a82 a82Var = (a82) b82Var;
                    AutofillId autofillIdB = a82Var.b(x72Var.a);
                    if (autofillIdB != null) {
                        a82Var.e(autofillIdB);
                    }
                }
            }
            ((a82) b82Var).a();
            arrayList.clear();
        }
    }

    public final void h(zxb zxbVar, ayb aybVar) {
        int i = 0;
        c(zxbVar, new lo(aybVar, i, this));
        List listJ = zxb.j(4, zxbVar);
        int size = listJ.size();
        while (i < size) {
            zxb zxbVar2 = (zxb) listJ.get(i);
            i46 i46VarD = d();
            int i2 = zxbVar2.f;
            if (i46VarD.a(i2)) {
                k68 k68Var = this.j;
                if (k68Var.a(i2)) {
                    Object objB = k68Var.b(i2);
                    if (objB == null) {
                        throw lv8.v("node not present in pruned tree before this change");
                    }
                    h(zxbVar2, (ayb) objB);
                } else {
                    continue;
                }
            }
            i++;
        }
    }

    public final void i(int i, String str) {
        b82 b82Var;
        if (Build.VERSION.SDK_INT >= 29 && (b82Var = this.c) != null) {
            a82 a82Var = (a82) b82Var;
            AutofillId autofillIdB = a82Var.b(i);
            if (autofillIdB == null) {
                throw lv8.v("Invalid content capture ID");
            }
            a82Var.f(autofillIdB, str);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:104:0x0182  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0070  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void j(int r14, defpackage.zxb r15) {
        /*
            Method dump skipped, instruction units count: 435
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mo.j(int, zxb):void");
    }

    public final void k(zxb zxbVar) {
        if (e()) {
            this.d.add(new x72(zxbVar.f, this.i, y72.VIEW_DISAPPEAR, null));
            List listJ = zxb.j(4, zxbVar);
            int size = listJ.size();
            for (int i = 0; i < size; i++) {
                k((zxb) listJ.get(i));
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0059  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void l() {
        /*
            r17 = this;
            r0 = r17
            k68 r1 = r0.j
            r1.c()
            i46 r2 = r0.d()
            int[] r3 = r2.b
            java.lang.Object[] r4 = r2.c
            long[] r2 = r2.a
            int r5 = r2.length
            int r5 = r5 + (-2)
            if (r5 < 0) goto L5e
            r7 = 0
        L17:
            r8 = r2[r7]
            long r10 = ~r8
            r12 = 7
            long r10 = r10 << r12
            long r10 = r10 & r8
            r12 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r10 = r10 & r12
            int r10 = (r10 > r12 ? 1 : (r10 == r12 ? 0 : -1))
            if (r10 == 0) goto L59
            int r10 = r7 - r5
            int r10 = ~r10
            int r10 = r10 >>> 31
            r11 = 8
            int r10 = 8 - r10
            r12 = 0
        L31:
            if (r12 >= r10) goto L57
            r13 = 255(0xff, double:1.26E-321)
            long r13 = r13 & r8
            r15 = 128(0x80, double:6.3E-322)
            int r13 = (r13 > r15 ? 1 : (r13 == r15 ? 0 : -1))
            if (r13 >= 0) goto L53
            int r13 = r7 << 3
            int r13 = r13 + r12
            r14 = r3[r13]
            r13 = r4[r13]
            byb r13 = (defpackage.byb) r13
            ayb r15 = new ayb
            zxb r13 = r13.a
            i46 r6 = r0.d()
            r15.<init>(r13, r6)
            r1.i(r14, r15)
        L53:
            long r8 = r8 >> r11
            int r12 = r12 + 1
            goto L31
        L57:
            if (r10 != r11) goto L5e
        L59:
            if (r7 == r5) goto L5e
            int r7 = r7 + 1
            goto L17
        L5e:
            ayb r1 = new ayb
            mn r2 = r0.a
            cyb r2 = r2.getSemanticsOwner()
            zxb r2 = r2.a()
            i46 r3 = r0.d()
            r1.<init>(r2, r3)
            r0.k = r1
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mo.l():void");
    }

    @Override // defpackage.f03
    public final void onStart(iy6 iy6Var) {
        this.c = (b82) this.b.invoke();
        j(-1, this.a.getSemanticsOwner().a());
        g();
    }

    @Override // defpackage.f03
    public final void onStop(iy6 iy6Var) {
        k(this.a.getSemanticsOwner().a());
        g();
        this.c = null;
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
        Handler handler = this.a.getHandler();
        handler.getClass();
        handler.removeCallbacks(this.m);
        this.c = null;
    }

    @Override // defpackage.f03
    public final void onCreate(iy6 iy6Var) {
    }

    @Override // defpackage.f03
    public final void onDestroy(iy6 iy6Var) {
    }

    @Override // defpackage.f03
    public final void onPause(iy6 iy6Var) {
    }

    @Override // defpackage.f03
    public final void onResume(iy6 iy6Var) {
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
    }
}

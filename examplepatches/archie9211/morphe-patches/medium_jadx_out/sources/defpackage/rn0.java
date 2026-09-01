package defpackage;

import android.view.animation.Interpolator;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class rn0 {
    public final on0 c;
    public final ArrayList a = new ArrayList(1);
    public boolean b = false;
    public float d = 0.0f;
    public Object e = null;
    public float f = -1.0f;
    public float g = -1.0f;

    public rn0(List list) {
        on0 qn0Var;
        if (list.isEmpty()) {
            qn0Var = new y3b(12);
        } else {
            qn0Var = list.size() == 1 ? new qn0(list) : new pn0(list);
        }
        this.c = qn0Var;
    }

    public final void a(nn0 nn0Var) {
        this.a.add(nn0Var);
    }

    public final float b() {
        Interpolator interpolator;
        t90 t90Var = xn6.a;
        uk6 uk6VarD = this.c.d();
        if (uk6VarD == null || uk6VarD.c() || (interpolator = uk6VarD.d) == null) {
            return 0.0f;
        }
        return interpolator.getInterpolation(c());
    }

    public final float c() {
        if (this.b) {
            return 0.0f;
        }
        t90 t90Var = xn6.a;
        uk6 uk6VarD = this.c.d();
        if (uk6VarD.c()) {
            return 0.0f;
        }
        return (this.d - uk6VarD.b()) / (uk6VarD.a() - uk6VarD.b());
    }

    public Object d() {
        float fC = c();
        on0 on0Var = this.c;
        if (on0Var.b(fC) && !h()) {
            return this.e;
        }
        t90 t90Var = xn6.a;
        uk6 uk6VarD = on0Var.d();
        Interpolator interpolator = uk6VarD.e;
        Interpolator interpolator2 = uk6VarD.f;
        Object objE = (interpolator == null || interpolator2 == null) ? e(uk6VarD, b()) : f(uk6VarD, fC, interpolator.getInterpolation(fC), interpolator2.getInterpolation(fC));
        this.e = objE;
        return objE;
    }

    public abstract Object e(uk6 uk6Var, float f);

    public Object f(uk6 uk6Var, float f, float f2, float f3) {
        throw new UnsupportedOperationException("This animation does not support split dimensions!");
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0029 A[PHI: r3
      0x0029: PHI (r3v4 float) = (r3v3 float), (r3v1 float) binds: [B:20:0x003e, B:11:0x0020] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void g(float r5) {
        /*
            r4 = this;
            t90 r0 = defpackage.xn6.a
            on0 r0 = r4.c
            boolean r1 = r0.isEmpty()
            if (r1 == 0) goto Lb
            goto L6c
        Lb:
            float r1 = r4.f
            r2 = -1082130432(0xffffffffbf800000, float:-1.0)
            int r3 = (r1 > r2 ? 1 : (r1 == r2 ? 0 : -1))
            if (r3 != 0) goto L19
            float r1 = r0.o()
            r4.f = r1
        L19:
            r3 = r1
            int r1 = (r5 > r1 ? 1 : (r5 == r1 ? 0 : -1))
            if (r1 >= 0) goto L2b
            int r5 = (r3 > r2 ? 1 : (r3 == r2 ? 0 : -1))
            if (r5 != 0) goto L29
            float r5 = r0.o()
            r4.f = r5
            goto L46
        L29:
            r5 = r3
            goto L46
        L2b:
            float r1 = r4.g
            int r3 = (r1 > r2 ? 1 : (r1 == r2 ? 0 : -1))
            if (r3 != 0) goto L37
            float r1 = r0.m()
            r4.g = r1
        L37:
            r3 = r1
            int r1 = (r5 > r1 ? 1 : (r5 == r1 ? 0 : -1))
            if (r1 <= 0) goto L46
            int r5 = (r3 > r2 ? 1 : (r3 == r2 ? 0 : -1))
            if (r5 != 0) goto L29
            float r5 = r0.m()
            r4.g = r5
        L46:
            float r1 = r4.d
            int r1 = (r5 > r1 ? 1 : (r5 == r1 ? 0 : -1))
            if (r1 != 0) goto L4d
            goto L6c
        L4d:
            r4.d = r5
            boolean r5 = r0.h(r5)
            if (r5 == 0) goto L6c
            r5 = 0
        L56:
            java.util.ArrayList r0 = r4.a
            int r1 = r0.size()
            if (r5 >= r1) goto L6a
            java.lang.Object r0 = r0.get(r5)
            nn0 r0 = (defpackage.nn0) r0
            r0.a()
            int r5 = r5 + 1
            goto L56
        L6a:
            t90 r4 = defpackage.xn6.a
        L6c:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rn0.g(float):void");
    }

    public boolean h() {
        return false;
    }
}

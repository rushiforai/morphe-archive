package defpackage;

import android.view.ViewTreeObserver;
import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vsb {
    public nsb a;
    public fx8 b;
    public dn4 c;
    public hw8 d;
    public boolean e;
    public cd8 f;
    public final msb g;
    public final isb h;
    public boolean i;
    public int j = 1;
    public xrb k = w2g.p;
    public final tsb l = new tsb(this);
    public final eb8 m = new eb8(28, this);

    public vsb(nsb nsbVar, fx8 fx8Var, dn4 dn4Var, hw8 hw8Var, boolean z, cd8 cd8Var, msb msbVar, isb isbVar) {
        this.a = nsbVar;
        this.b = fx8Var;
        this.c = dn4Var;
        this.d = hw8Var;
        this.e = z;
        this.f = cd8Var;
        this.g = msbVar;
        this.h = isbVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(long r12, defpackage.p92 r14) throws java.lang.Throwable {
        /*
            r11 = this;
            boolean r0 = r14 instanceof defpackage.rsb
            if (r0 == 0) goto L13
            r0 = r14
            rsb r0 = (defpackage.rsb) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            rsb r0 = new rsb
            r0.<init>(r11, r14)
        L18:
            java.lang.Object r14 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L36
            if (r2 != r4) goto L2f
            qya r12 = r0.b
            defpackage.br7.v(r14)     // Catch: java.lang.Throwable -> L2b
            r6 = r11
            goto L58
        L2b:
            r0 = move-exception
            r12 = r0
            r6 = r11
            goto L68
        L2f:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            r11 = 0
            return r11
        L36:
            defpackage.br7.v(r14)
            qya r7 = new qya
            r7.<init>()
            r7.a = r12
            r11.i = r4
            s78 r14 = defpackage.s78.Default     // Catch: java.lang.Throwable -> L65
            ssb r5 = new ssb     // Catch: java.lang.Throwable -> L65
            r10 = 0
            r6 = r11
            r8 = r12
            r5.<init>(r6, r7, r8, r10)     // Catch: java.lang.Throwable -> L62
            r0.b = r7     // Catch: java.lang.Throwable -> L62
            r0.e = r4     // Catch: java.lang.Throwable -> L62
            java.lang.Object r11 = r6.f(r14, r5, r0)     // Catch: java.lang.Throwable -> L62
            if (r11 != r1) goto L57
            return r1
        L57:
            r12 = r7
        L58:
            r6.i = r3
            long r11 = r12.a
            qre r13 = new qre
            r13.<init>(r11)
            return r13
        L62:
            r0 = move-exception
        L63:
            r12 = r0
            goto L68
        L65:
            r0 = move-exception
            r6 = r11
            goto L63
        L68:
            r6.i = r3
            throw r12
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vsb.a(long, p92):java.lang.Object");
    }

    public final Object b(long j, boolean z, p4d p4dVar) {
        c1e c1eVar = c1e.a;
        if (!z || !(this.c instanceof az2)) {
            long jA = qre.a(j, 0.0f, 0.0f, this.d == hw8.Horizontal ? 1 : 2);
            usb usbVar = new usb(this, null);
            fx8 fx8Var = this.b;
            if (fx8Var == null || !(this.a.d() || this.a.c())) {
                usb usbVar2 = new usb(usbVar.e, p4dVar);
                usbVar2.d = jA;
                Object objInvokeSuspend = usbVar2.invokeSuspend(c1eVar);
                if (objInvokeSuspend == tb2.COROUTINE_SUSPENDED) {
                    return objInvokeSuspend;
                }
            } else {
                Object objA = fx8Var.a(jA, usbVar, p4dVar);
                if (objA == tb2.COROUTINE_SUSPENDED) {
                    return objA;
                }
            }
        }
        return c1eVar;
    }

    public final long c(xrb xrbVar, long j, int i) {
        hd8 hd8Var = this.f.a;
        hd8 hd8VarJ0 = hd8Var != null ? hd8Var.J0() : null;
        long jK = hd8VarJ0 != null ? hd8VarJ0.K(i, j) : 0L;
        long jD = ip8.d(j, jK);
        long jE = e(h(xrbVar.a(g(e(this.d == hw8.Horizontal ? ip8.a(0.0f, 1, jD) : ip8.a(0.0f, 2, jD))))));
        msb msbVar = this.g;
        if (msbVar.n) {
            ViewTreeObserver viewTreeObserver = ((mn) flb.w0(msbVar)).getViewTreeObserver();
            try {
                Method declaredMethod = mn.h1;
                if (declaredMethod == null) {
                    declaredMethod = viewTreeObserver.getClass().getDeclaredMethod("dispatchOnScrollChanged", null);
                    declaredMethod.setAccessible(true);
                    mn.h1 = declaredMethod;
                }
                declaredMethod.invoke(viewTreeObserver, null);
            } catch (Exception unused) {
            }
        }
        long jD2 = ip8.d(jD, jE);
        hd8 hd8Var2 = this.f.a;
        hd8 hd8VarJ02 = hd8Var2 != null ? hd8Var2.J0() : null;
        return ip8.e(ip8.e(jK, jE), hd8VarJ02 != null ? hd8VarJ02.n0(jE, jD2, i) : 0L);
    }

    public final float d(float f) {
        return this.e ? f * (-1.0f) : f;
    }

    public final long e(long j) {
        return this.e ? ip8.f(-1.0f, j) : j;
    }

    public final Object f(s78 s78Var, b55 b55Var, p92 p92Var) {
        Object objB = this.a.b(s78Var, new mw9(this, b55Var, null, 21), p92Var);
        return objB == tb2.COROUTINE_SUSPENDED ? objB : c1e.a;
    }

    public final float g(long j) {
        return Float.intBitsToFloat(this.d == hw8.Horizontal ? (int) (j >> 32) : (int) (j & 4294967295L));
    }

    public final long h(float f) {
        if (f == 0.0f) {
            return 0L;
        }
        if (this.d == hw8.Horizontal) {
            return (((long) Float.floatToRawIntBits(f)) << 32) | (((long) Float.floatToRawIntBits(0.0f)) & 4294967295L);
        }
        return (((long) Float.floatToRawIntBits(f)) & 4294967295L) | (Float.floatToRawIntBits(0.0f) << 32);
    }

    public final float i(long j) {
        int i = (int) (4294967295L & j);
        int i2 = (int) (j >> 32);
        double dAtan2 = (float) Math.atan2(Math.abs(Float.intBitsToFloat(i)), Math.abs(Float.intBitsToFloat(i2)));
        hw8 hw8Var = this.d;
        if (dAtan2 >= 0.7853981633974483d) {
            if (hw8Var == hw8.Vertical) {
                return Float.intBitsToFloat(i);
            }
            return 0.0f;
        }
        if (hw8Var == hw8.Horizontal) {
            return Float.intBitsToFloat(i2);
        }
        return 0.0f;
    }
}

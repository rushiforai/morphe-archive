package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class gp extends a1 implements lb2 {
    private volatile Object _preHandler;

    public gp() {
        super(u3b.d);
        this._preHandler = this;
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x002f  */
    @Override // defpackage.lb2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void I(defpackage.ib2 r3, java.lang.Throwable r4) {
        /*
            r2 = this;
            int r3 = android.os.Build.VERSION.SDK_INT
            r0 = 26
            if (r0 > r3) goto L4a
            r0 = 28
            if (r3 >= r0) goto L4a
            java.lang.Object r3 = r2._preHandler
            r0 = 0
            if (r3 == r2) goto L12
            java.lang.reflect.Method r3 = (java.lang.reflect.Method) r3
            goto L32
        L12:
            java.lang.Class<java.lang.Thread> r3 = java.lang.Thread.class
            java.lang.String r1 = "getUncaughtExceptionPreHandler"
            java.lang.reflect.Method r3 = r3.getDeclaredMethod(r1, r0)     // Catch: java.lang.Throwable -> L2f
            int r1 = r3.getModifiers()     // Catch: java.lang.Throwable -> L2f
            boolean r1 = java.lang.reflect.Modifier.isPublic(r1)     // Catch: java.lang.Throwable -> L2f
            if (r1 == 0) goto L2f
            int r1 = r3.getModifiers()     // Catch: java.lang.Throwable -> L2f
            boolean r1 = java.lang.reflect.Modifier.isStatic(r1)     // Catch: java.lang.Throwable -> L2f
            if (r1 == 0) goto L2f
            goto L30
        L2f:
            r3 = r0
        L30:
            r2._preHandler = r3
        L32:
            if (r3 == 0) goto L39
            java.lang.Object r2 = r3.invoke(r0, r0)
            goto L3a
        L39:
            r2 = r0
        L3a:
            boolean r3 = r2 instanceof java.lang.Thread.UncaughtExceptionHandler
            if (r3 == 0) goto L41
            r0 = r2
            java.lang.Thread$UncaughtExceptionHandler r0 = (java.lang.Thread.UncaughtExceptionHandler) r0
        L41:
            if (r0 == 0) goto L4a
            java.lang.Thread r2 = java.lang.Thread.currentThread()
            r0.uncaughtException(r2, r4)
        L4a:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gp.I(ib2, java.lang.Throwable):void");
    }
}

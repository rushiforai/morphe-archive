package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final /* synthetic */ class v08 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ v08(int i, int i2, Object obj) {
        this.a = i2;
        this.b = obj;
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x007a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object a(java.lang.Object r19, java.lang.Object r20) {
        /*
            r18 = this;
            r0 = r18
            java.lang.Object r0 = r0.b
            swa r0 = (defpackage.swa) r0
            r1 = r19
            java.util.Set r1 = (java.util.Set) r1
            r2 = r20
            oic r2 = (defpackage.oic) r2
            java.lang.Object r2 = r0.c
            monitor-enter(r2)
            xpc r3 = r0.u     // Catch: java.lang.Throwable -> L6f
            java.lang.Object r3 = r3.getValue()     // Catch: java.lang.Throwable -> L6f
            pwa r3 = (defpackage.pwa) r3     // Catch: java.lang.Throwable -> L6f
            pwa r4 = defpackage.pwa.Idle     // Catch: java.lang.Throwable -> L6f
            int r3 = r3.compareTo(r4)     // Catch: java.lang.Throwable -> L6f
            if (r3 < 0) goto La6
            g78 r3 = r0.h     // Catch: java.lang.Throwable -> L6f
            boolean r4 = r1 instanceof defpackage.jqb     // Catch: java.lang.Throwable -> L6f
            r5 = 1
            if (r4 == 0) goto L7f
            jqb r1 = (defpackage.jqb) r1     // Catch: java.lang.Throwable -> L6f
            g78 r1 = r1.a     // Catch: java.lang.Throwable -> L6f
            java.lang.Object[] r4 = r1.b     // Catch: java.lang.Throwable -> L6f
            long[] r1 = r1.a     // Catch: java.lang.Throwable -> L6f
            int r6 = r1.length     // Catch: java.lang.Throwable -> L6f
            int r6 = r6 + (-2)
            if (r6 < 0) goto La1
            r7 = 0
            r8 = r7
        L37:
            r9 = r1[r8]     // Catch: java.lang.Throwable -> L6f
            long r11 = ~r9     // Catch: java.lang.Throwable -> L6f
            r13 = 7
            long r11 = r11 << r13
            long r11 = r11 & r9
            r13 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r11 = r11 & r13
            int r11 = (r11 > r13 ? 1 : (r11 == r13 ? 0 : -1))
            if (r11 == 0) goto L7a
            int r11 = r8 - r6
            int r11 = ~r11     // Catch: java.lang.Throwable -> L6f
            int r11 = r11 >>> 31
            r12 = 8
            int r11 = 8 - r11
            r13 = r7
        L51:
            if (r13 >= r11) goto L78
            r14 = 255(0xff, double:1.26E-321)
            long r14 = r14 & r9
            r16 = 128(0x80, double:6.3E-322)
            int r14 = (r14 > r16 ? 1 : (r14 == r16 ? 0 : -1))
            if (r14 >= 0) goto L74
            int r14 = r8 << 3
            int r14 = r14 + r13
            r14 = r4[r14]     // Catch: java.lang.Throwable -> L6f
            boolean r15 = r14 instanceof defpackage.eqc     // Catch: java.lang.Throwable -> L6f
            if (r15 == 0) goto L71
            r15 = r14
            eqc r15 = (defpackage.eqc) r15     // Catch: java.lang.Throwable -> L6f
            boolean r15 = r15.c(r5)     // Catch: java.lang.Throwable -> L6f
            if (r15 != 0) goto L71
            goto L74
        L6f:
            r0 = move-exception
            goto Lb4
        L71:
            r3.a(r14)     // Catch: java.lang.Throwable -> L6f
        L74:
            long r9 = r9 >> r12
            int r13 = r13 + 1
            goto L51
        L78:
            if (r11 != r12) goto La1
        L7a:
            if (r8 == r6) goto La1
            int r8 = r8 + 1
            goto L37
        L7f:
            java.lang.Iterable r1 = (java.lang.Iterable) r1     // Catch: java.lang.Throwable -> L6f
            java.util.Iterator r1 = r1.iterator()     // Catch: java.lang.Throwable -> L6f
        L85:
            boolean r4 = r1.hasNext()     // Catch: java.lang.Throwable -> L6f
            if (r4 == 0) goto La1
            java.lang.Object r4 = r1.next()     // Catch: java.lang.Throwable -> L6f
            boolean r6 = r4 instanceof defpackage.eqc     // Catch: java.lang.Throwable -> L6f
            if (r6 == 0) goto L9d
            r6 = r4
            eqc r6 = (defpackage.eqc) r6     // Catch: java.lang.Throwable -> L6f
            boolean r6 = r6.c(r5)     // Catch: java.lang.Throwable -> L6f
            if (r6 != 0) goto L9d
            goto L85
        L9d:
            r3.a(r4)     // Catch: java.lang.Throwable -> L6f
            goto L85
        La1:
            w51 r0 = r0.z()     // Catch: java.lang.Throwable -> L6f
            goto La7
        La6:
            r0 = 0
        La7:
            monitor-exit(r2)
            if (r0 == 0) goto Lb1
            c1e r1 = defpackage.c1e.a
            x51 r0 = (defpackage.x51) r0
            r0.resumeWith(r1)
        Lb1:
            c1e r0 = defpackage.c1e.a
            return r0
        Lb4:
            monitor-exit(r2)
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.v08.a(java.lang.Object, java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:305:0x08b3  */
    @Override // defpackage.b55
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invoke(java.lang.Object r59, java.lang.Object r60) {
        /*
            Method dump skipped, instruction units count: 2574
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.v08.invoke(java.lang.Object, java.lang.Object):java.lang.Object");
    }

    public /* synthetic */ v08(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }
}

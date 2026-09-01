package defpackage;

import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hz5 {
    public static final hz5 a = new hz5();
    public static final AtomicBoolean b = new AtomicBoolean(false);

    /* JADX WARN: Removed duplicated region for block: B:38:0x0075 A[Catch: all -> 0x0029, TRY_LEAVE, TryCatch #1 {all -> 0x0029, blocks: (B:8:0x000d, B:12:0x0017, B:14:0x0020, B:20:0x0037, B:22:0x003b, B:25:0x0041, B:27:0x004a, B:35:0x0060, B:37:0x0064, B:33:0x005a, B:38:0x0075, B:17:0x002b, B:19:0x002f, B:30:0x0056), top: B:49:0x000d, outer: #2, inners: #0 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final synchronized void b(android.content.Context r6, defpackage.vz5 r7) {
        /*
            java.lang.Class<hz5> r0 = defpackage.hz5.class
            monitor-enter(r0)
            java.util.Set r1 = defpackage.ec2.a     // Catch: java.lang.Throwable -> L8c
            boolean r2 = r1.contains(r0)     // Catch: java.lang.Throwable -> L8c
            if (r2 == 0) goto Ld
            monitor-exit(r0)
            return
        Ld:
            java.util.concurrent.atomic.AtomicBoolean r2 = defpackage.hz5.b     // Catch: java.lang.Throwable -> L29
            boolean r3 = r2.get()     // Catch: java.lang.Throwable -> L29
            if (r3 == 0) goto L17
            monitor-exit(r0)
            return
        L17:
            rya r3 = new rya     // Catch: java.lang.Throwable -> L29
            r3.<init>()     // Catch: java.lang.Throwable -> L29
            vz5 r4 = defpackage.vz5.V2_V4     // Catch: java.lang.Throwable -> L29
            if (r7 != r4) goto L2b
            z46 r4 = defpackage.nz5.l     // Catch: java.lang.Throwable -> L29
            nz5 r4 = r4.m(r6)     // Catch: java.lang.Throwable -> L29
            r3.a = r4     // Catch: java.lang.Throwable -> L29
            goto L37
        L29:
            r6 = move-exception
            goto L85
        L2b:
            vz5 r4 = defpackage.vz5.V5_V7     // Catch: java.lang.Throwable -> L29
            if (r7 != r4) goto L37
            lz5 r4 = defpackage.oz5.G     // Catch: java.lang.Throwable -> L29
            oz5 r4 = r4.b(r6)     // Catch: java.lang.Throwable -> L29
            r3.a = r4     // Catch: java.lang.Throwable -> L29
        L37:
            java.lang.Object r4 = r3.a     // Catch: java.lang.Throwable -> L29
            if (r4 != 0) goto L41
            r6 = 1
            r2.set(r6)     // Catch: java.lang.Throwable -> L29
            monitor-exit(r0)
            return
        L41:
            ka4 r2 = defpackage.ka4.AndroidIAPSubscriptionAutoLogging     // Catch: java.lang.Throwable -> L29
            boolean r2 = defpackage.na4.b(r2)     // Catch: java.lang.Throwable -> L29
            r4 = 0
            if (r2 == 0) goto L75
            y4a r2 = defpackage.y4a.a     // Catch: java.lang.Throwable -> L29
            java.lang.Class<y4a> r2 = defpackage.y4a.class
            boolean r1 = r1.contains(r2)     // Catch: java.lang.Throwable -> L29
            if (r1 == 0) goto L56
        L54:
            r1 = r4
            goto L5e
        L56:
            boolean r1 = defpackage.y4a.b     // Catch: java.lang.Throwable -> L59
            goto L5e
        L59:
            r1 = move-exception
            defpackage.ec2.a(r2, r1)     // Catch: java.lang.Throwable -> L29
            goto L54
        L5e:
            if (r1 == 0) goto L64
            vz5 r1 = defpackage.vz5.V2_V4     // Catch: java.lang.Throwable -> L29
            if (r7 != r1) goto L75
        L64:
            java.lang.Object r1 = r3.a     // Catch: java.lang.Throwable -> L29
            iz5 r1 = (defpackage.iz5) r1     // Catch: java.lang.Throwable -> L29
            wz5 r2 = defpackage.wz5.INAPP     // Catch: java.lang.Throwable -> L29
            ss r4 = new ss     // Catch: java.lang.Throwable -> L29
            r5 = 9
            r4.<init>(r3, r7, r6, r5)     // Catch: java.lang.Throwable -> L29
            r1.a(r2, r4)     // Catch: java.lang.Throwable -> L29
            goto L83
        L75:
            java.lang.Object r1 = r3.a     // Catch: java.lang.Throwable -> L29
            iz5 r1 = (defpackage.iz5) r1     // Catch: java.lang.Throwable -> L29
            wz5 r2 = defpackage.wz5.INAPP     // Catch: java.lang.Throwable -> L29
            gz5 r3 = new gz5     // Catch: java.lang.Throwable -> L29
            r3.<init>(r7, r6, r4)     // Catch: java.lang.Throwable -> L29
            r1.a(r2, r3)     // Catch: java.lang.Throwable -> L29
        L83:
            monitor-exit(r0)
            return
        L85:
            java.lang.Class<hz5> r7 = defpackage.hz5.class
            defpackage.ec2.a(r7, r6)     // Catch: java.lang.Throwable -> L8c
            monitor-exit(r0)
            return
        L8c:
            r6 = move-exception
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L8c
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hz5.b(android.content.Context, vz5):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x0088  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00b4  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00cc  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x00ce A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:79:0x00a2 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:81:0x00e3 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:87:0x00b6 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:89:0x008a A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void a(defpackage.vz5 r11, java.lang.String r12) {
        /*
            Method dump skipped, instruction units count: 248
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hz5.a(vz5, java.lang.String):void");
    }
}

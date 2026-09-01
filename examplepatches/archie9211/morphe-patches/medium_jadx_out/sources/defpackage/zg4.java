package defpackage;

import java.io.File;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zg4 implements fp1 {
    public final File a;
    public final i0c b;
    public final b56 c;
    public final vp0 d;
    public final AtomicBoolean e;
    public final a98 f;

    public zg4(File file, i0c i0cVar, b56 b56Var, vp0 vp0Var) {
        i0cVar.getClass();
        b56Var.getClass();
        this.a = file;
        this.b = i0cVar;
        this.c = b56Var;
        this.d = vp0Var;
        this.e = new AtomicBoolean(false);
        this.f = new a98();
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0073  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x007b A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.hd1 r9, defpackage.p92 r10) throws java.lang.Throwable {
        /*
            r8 = this;
            boolean r0 = r10 instanceof defpackage.xg4
            if (r0 == 0) goto L13
            r0 = r10
            xg4 r0 = (defpackage.xg4) r0
            int r1 = r0.g
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.g = r1
            goto L18
        L13:
            xg4 r0 = new xg4
            r0.<init>(r8, r10)
        L18:
            java.lang.Object r10 = r0.e
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.g
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L3a
            if (r2 != r3) goto L34
            boolean r8 = r0.d
            ug4 r9 = r0.c
            zg4 r0 = r0.b
            defpackage.br7.v(r10)     // Catch: java.lang.Throwable -> L2e
            goto L6b
        L2e:
            r10 = move-exception
            r7 = r10
            r10 = r8
            r8 = r0
            r0 = r7
            goto L83
        L34:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            return r4
        L3a:
            defpackage.br7.v(r10)
            java.util.concurrent.atomic.AtomicBoolean r10 = r8.e
            boolean r10 = r10.get()
            if (r10 != 0) goto L95
            a98 r10 = r8.f
            boolean r10 = r10.e(r4)
            ug4 r2 = new ug4     // Catch: java.lang.Throwable -> L8c
            java.io.File r5 = r8.a     // Catch: java.lang.Throwable -> L8c
            i0c r6 = r8.b     // Catch: java.lang.Throwable -> L8c
            r2.<init>(r5, r6)     // Catch: java.lang.Throwable -> L8c
            java.lang.Boolean r5 = java.lang.Boolean.valueOf(r10)     // Catch: java.lang.Throwable -> L80
            r0.b = r8     // Catch: java.lang.Throwable -> L80
            r0.c = r2     // Catch: java.lang.Throwable -> L80
            r0.d = r10     // Catch: java.lang.Throwable -> L80
            r0.g = r3     // Catch: java.lang.Throwable -> L80
            java.lang.Object r9 = r9.f(r2, r5, r0)     // Catch: java.lang.Throwable -> L80
            if (r9 != r1) goto L67
            return r1
        L67:
            r0 = r8
            r8 = r10
            r10 = r9
            r9 = r2
        L6b:
            r9.close()     // Catch: java.lang.Throwable -> L70
            r9 = r4
            goto L71
        L70:
            r9 = move-exception
        L71:
            if (r9 != 0) goto L7b
            if (r8 == 0) goto L7a
            a98 r8 = r0.f
            r8.f(r4)
        L7a:
            return r10
        L7b:
            throw r9     // Catch: java.lang.Throwable -> L7c
        L7c:
            r9 = move-exception
            r10 = r8
            r8 = r0
            goto L8d
        L80:
            r9 = move-exception
            r0 = r9
            r9 = r2
        L83:
            r9.close()     // Catch: java.lang.Throwable -> L87
            goto L8b
        L87:
            r9 = move-exception
            defpackage.kyd.D(r0, r9)     // Catch: java.lang.Throwable -> L8c
        L8b:
            throw r0     // Catch: java.lang.Throwable -> L8c
        L8c:
            r9 = move-exception
        L8d:
            if (r10 == 0) goto L94
            a98 r8 = r8.f
            r8.f(r4)
        L94:
            throw r9
        L95:
            java.lang.String r8 = "StorageConnection has already been disposed."
            defpackage.ygf.f(r8)
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zg4.a(hd1, p92):java.lang.Object");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00ce A[Catch: all -> 0x0109, IOException -> 0x010c, TRY_ENTER, TryCatch #8 {IOException -> 0x010c, all -> 0x0109, blocks: (B:42:0x00ce, B:44:0x00d4, B:46:0x00dc, B:50:0x00e8, B:51:0x0108, B:47:0x00e1, B:58:0x0116, B:65:0x0124, B:64:0x0121, B:61:0x011c), top: B:89:0x0023, inners: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:58:0x0116 A[Catch: all -> 0x0109, IOException -> 0x010c, TRY_ENTER, TRY_LEAVE, TryCatch #8 {IOException -> 0x010c, all -> 0x0109, blocks: (B:42:0x00ce, B:44:0x00d4, B:46:0x00dc, B:50:0x00e8, B:51:0x0108, B:47:0x00e1, B:58:0x0116, B:65:0x0124, B:64:0x0121, B:61:0x011c), top: B:89:0x0023, inners: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:71:0x012e A[Catch: all -> 0x0125, TryCatch #2 {all -> 0x0125, blocks: (B:69:0x0128, B:71:0x012e, B:72:0x0131, B:32:0x008b, B:33:0x00a7), top: B:81:0x008b }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /* JADX WARN: Type inference failed for: r10v11, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r10v15, types: [java.lang.StringBuilder] */
    /* JADX WARN: Type inference failed for: r10v17 */
    /* JADX WARN: Type inference failed for: r10v19 */
    /* JADX WARN: Type inference failed for: r10v2 */
    /* JADX WARN: Type inference failed for: r10v3 */
    /* JADX WARN: Type inference failed for: r10v4, types: [y88] */
    /* JADX WARN: Type inference failed for: r10v5 */
    /* JADX WARN: Type inference failed for: r10v6 */
    /* JADX WARN: Type inference failed for: r2v0, types: [java.lang.Object, tb2] */
    /* JADX WARN: Type inference failed for: r2v1 */
    /* JADX WARN: Type inference failed for: r2v11 */
    /* JADX WARN: Type inference failed for: r2v2 */
    /* JADX WARN: Type inference failed for: r2v3 */
    /* JADX WARN: Type inference failed for: r2v4 */
    /* JADX WARN: Type inference failed for: r2v5 */
    /* JADX WARN: Type inference failed for: r2v6, types: [y88] */
    /* JADX WARN: Type inference failed for: r2v8, types: [y88] */
    /* JADX WARN: Type inference failed for: r3v1 */
    /* JADX WARN: Type inference failed for: r3v2, types: [java.io.File] */
    /* JADX WARN: Type inference failed for: r3v7, types: [java.io.File, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r9v0, types: [java.lang.Object, oz] */
    /* JADX WARN: Type inference failed for: r9v1 */
    /* JADX WARN: Type inference failed for: r9v12, types: [java.io.File] */
    /* JADX WARN: Type inference failed for: r9v13 */
    /* JADX WARN: Type inference failed for: r9v14 */
    /* JADX WARN: Type inference failed for: r9v15 */
    /* JADX WARN: Type inference failed for: r9v3, types: [b55] */
    /* JADX WARN: Type inference failed for: r9v4 */
    /* JADX WARN: Type inference failed for: r9v6 */
    /* JADX WARN: Type inference failed for: r9v7 */
    /* JADX WARN: Type inference failed for: r9v8, types: [java.io.File, java.lang.Object] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(defpackage.oz r9, defpackage.p92 r10) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 316
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zg4.b(oz, p92):java.lang.Object");
    }

    @Override // defpackage.fp1
    public final void close() {
        this.e.set(true);
        this.d.invoke();
    }
}

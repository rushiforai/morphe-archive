package defpackage;

import java.io.File;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ug4 implements fp1 {
    public final File a;
    public final i0c b;
    public final AtomicBoolean c;

    public ug4(File file, i0c i0cVar) {
        i0cVar.getClass();
        this.a = file;
        this.b = i0cVar;
        this.c = new AtomicBoolean(false);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r2v0, types: [int] */
    /* JADX WARN: Type inference failed for: r2v1 */
    /* JADX WARN: Type inference failed for: r2v11, types: [ug4] */
    /* JADX WARN: Type inference failed for: r2v5 */
    /* JADX WARN: Type inference failed for: r2v9 */
    /* JADX WARN: Type inference failed for: r7v0, types: [java.lang.Object, ug4] */
    /* JADX WARN: Type inference failed for: r7v1 */
    /* JADX WARN: Type inference failed for: r7v2, types: [ug4] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.Object a(defpackage.ug4 r7, defpackage.p92 r8) {
        /*
            boolean r0 = r8 instanceof defpackage.tg4
            if (r0 == 0) goto L13
            r0 = r8
            tg4 r0 = (defpackage.tg4) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            tg4 r0 = new tg4
            r0.<init>(r7, r8)
        L18:
            java.lang.Object r8 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 2
            r4 = 1
            r5 = 0
            if (r2 == 0) goto L45
            if (r2 == r4) goto L39
            if (r2 != r3) goto L33
            java.lang.Object r7 = r0.b
            java.io.Closeable r7 = (java.io.Closeable) r7
            defpackage.br7.v(r8)     // Catch: java.lang.Throwable -> L30
            goto L9c
        L30:
            r8 = move-exception
            goto La4
        L33:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r5
        L39:
            java.io.FileInputStream r7 = r0.c
            java.lang.Object r2 = r0.b
            ug4 r2 = (defpackage.ug4) r2
            defpackage.br7.v(r8)     // Catch: java.lang.Throwable -> L43
            goto L6a
        L43:
            r8 = move-exception
            goto L75
        L45:
            defpackage.br7.v(r8)
            java.util.concurrent.atomic.AtomicBoolean r8 = r7.c
            boolean r8 = r8.get()
            if (r8 != 0) goto Laf
            java.io.FileInputStream r8 = new java.io.FileInputStream     // Catch: java.io.FileNotFoundException -> L7b
            java.io.File r2 = r7.a     // Catch: java.io.FileNotFoundException -> L7b
            r8.<init>(r2)     // Catch: java.io.FileNotFoundException -> L7b
            i0c r2 = r7.b     // Catch: java.lang.Throwable -> L70
            r0.b = r7     // Catch: java.lang.Throwable -> L70
            r0.c = r8     // Catch: java.lang.Throwable -> L70
            r0.f = r4     // Catch: java.lang.Throwable -> L70
            java.lang.Object r2 = r2.w(r8)     // Catch: java.lang.Throwable -> L70
            if (r2 != r1) goto L66
            goto L98
        L66:
            r6 = r2
            r2 = r7
            r7 = r8
            r8 = r6
        L6a:
            defpackage.k50.X(r7, r5)     // Catch: java.io.FileNotFoundException -> L6e
            return r8
        L6e:
            r7 = r2
            goto L7b
        L70:
            r2 = move-exception
            r6 = r2
            r2 = r7
            r7 = r8
            r8 = r6
        L75:
            throw r8     // Catch: java.lang.Throwable -> L76
        L76:
            r4 = move-exception
            defpackage.k50.X(r7, r8)     // Catch: java.io.FileNotFoundException -> L6e
            throw r4     // Catch: java.io.FileNotFoundException -> L6e
        L7b:
            java.io.File r8 = r7.a
            i0c r2 = r7.b
            boolean r8 = r8.exists()
            if (r8 == 0) goto Laa
            java.io.FileInputStream r8 = new java.io.FileInputStream
            java.io.File r7 = r7.a
            r8.<init>(r7)
            r0.b = r8     // Catch: java.lang.Throwable -> La0
            r0.c = r5     // Catch: java.lang.Throwable -> La0
            r0.f = r3     // Catch: java.lang.Throwable -> La0
            java.lang.Object r7 = r2.w(r8)     // Catch: java.lang.Throwable -> La0
            if (r7 != r1) goto L99
        L98:
            return r1
        L99:
            r6 = r8
            r8 = r7
            r7 = r6
        L9c:
            defpackage.k50.X(r7, r5)
            return r8
        La0:
            r7 = move-exception
            r6 = r8
            r8 = r7
            r7 = r6
        La4:
            throw r8     // Catch: java.lang.Throwable -> La5
        La5:
            r0 = move-exception
            defpackage.k50.X(r7, r8)
            throw r0
        Laa:
            java.lang.Object r7 = r2.l()
            return r7
        Laf:
            java.lang.String r7 = "This scope has already been closed."
            defpackage.ygf.f(r7)
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ug4.a(ug4, p92):java.lang.Object");
    }

    @Override // defpackage.fp1
    public final void close() {
        this.c.set(true);
    }
}

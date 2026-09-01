package defpackage;

import java.io.File;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p58 implements b56 {
    public static final h1c j = new h1c(19);
    public final ib2 a;
    public final File b;
    public final zj1 c;
    public final String d;
    public final String e;
    public final String f;
    public final a98 g;
    public final w5d h;
    public final w5d i;

    public p58(ib2 ib2Var, File file) {
        ib2Var.getClass();
        this.a = ib2Var;
        this.b = file;
        Object obj = x58.b;
        this.c = new zj1(new mo5(file, null, 11), zx3.a, -2, nz0.SUSPEND, 0);
        this.d = ".lock";
        this.e = ".version";
        this.f = "fcntl failed: EAGAIN";
        this.g = new a98();
        this.h = new w5d(new m58(this, 2));
        this.i = new w5d(new m58(this, 1));
    }

    public static void f(File file) {
        File parentFile = file.getCanonicalFile().getParentFile();
        if (parentFile != null) {
            parentFile.mkdirs();
            if (!parentFile.isDirectory()) {
                ywb.o("Unable to create parent directories of ", file);
                return;
            }
        }
        if (file.exists()) {
            return;
        }
        file.createNewFile();
    }

    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00b5  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00bb A[Catch: all -> 0x00bf, TRY_ENTER, TRY_LEAVE, TryCatch #7 {all -> 0x00bf, blocks: (B:41:0x00bb, B:55:0x00d9, B:56:0x00dc), top: B:77:0x0022, outer: #1 }] */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00d9 A[Catch: all -> 0x00bf, TRY_ENTER, TryCatch #7 {all -> 0x00bf, blocks: (B:41:0x00bb, B:55:0x00d9, B:56:0x00dc), top: B:77:0x0022, outer: #1 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r0v10, types: [y88] */
    /* JADX WARN: Type inference failed for: r0v15 */
    /* JADX WARN: Type inference failed for: r0v4 */
    /* JADX WARN: Type inference failed for: r0v5 */
    /* JADX WARN: Type inference failed for: r0v7 */
    /* JADX WARN: Type inference failed for: r0v9 */
    /* JADX WARN: Type inference failed for: r10v1, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r10v11 */
    /* JADX WARN: Type inference failed for: r10v14 */
    /* JADX WARN: Type inference failed for: r10v16, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r10v17 */
    /* JADX WARN: Type inference failed for: r10v18 */
    /* JADX WARN: Type inference failed for: r10v2 */
    /* JADX WARN: Type inference failed for: r10v20 */
    /* JADX WARN: Type inference failed for: r10v21 */
    /* JADX WARN: Type inference failed for: r10v22 */
    /* JADX WARN: Type inference failed for: r10v3 */
    /* JADX WARN: Type inference failed for: r10v4, types: [y88] */
    /* JADX WARN: Type inference failed for: r10v6, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r10v8 */
    /* JADX WARN: Type inference failed for: r2v3 */
    /* JADX WARN: Type inference failed for: r2v4, types: [x45] */
    /* JADX WARN: Type inference failed for: r2v9 */
    /* JADX WARN: Type inference failed for: r7v0 */
    /* JADX WARN: Type inference failed for: r8v11 */
    /* JADX WARN: Type inference failed for: r8v13 */
    /* JADX WARN: Type inference failed for: r8v14, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r8v25, types: [y88] */
    /* JADX WARN: Type inference failed for: r8v29 */
    /* JADX WARN: Type inference failed for: r9v0, types: [java.io.Closeable, java.lang.Object, x45] */
    /* JADX WARN: Type inference failed for: r9v1, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r9v12 */
    /* JADX WARN: Type inference failed for: r9v13 */
    @Override // defpackage.b56
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.x45 r9, defpackage.p92 r10) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 232
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.p58.a(x45, p92):java.lang.Object");
    }

    @Override // defpackage.b56
    public final Object b(p92 p92Var) {
        w5d w5dVar = this.i;
        if (w5dVar.a()) {
            return new Integer(m6c.b.nativeGetCounterValue(((m6c) w5dVar.getValue()).a));
        }
        return vx0.m0(this.a, new l58(this, null, 0), p92Var);
    }

    @Override // defpackage.b56
    public final Object c(oz ozVar) {
        w5d w5dVar = this.i;
        if (w5dVar.a()) {
            return new Integer(m6c.b.nativeIncrementAndGetCounterValue(((m6c) w5dVar.getValue()).a));
        }
        return vx0.m0(this.a, new l58(this, null, 1), ozVar);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:31:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00dc A[Catch: all -> 0x00e0, TRY_ENTER, TRY_LEAVE, TryCatch #1 {all -> 0x00e0, blocks: (B:61:0x00dc, B:75:0x00f7, B:76:0x00fa), top: B:88:0x0027 }] */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00e9  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x00f7 A[Catch: all -> 0x00e0, TRY_ENTER, TryCatch #1 {all -> 0x00e0, blocks: (B:61:0x00dc, B:75:0x00f7, B:76:0x00fa), top: B:88:0x0027 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Type inference failed for: r19v0, types: [b55] */
    /* JADX WARN: Type inference failed for: r1v13 */
    /* JADX WARN: Type inference failed for: r1v15 */
    /* JADX WARN: Type inference failed for: r1v16 */
    /* JADX WARN: Type inference failed for: r1v17 */
    /* JADX WARN: Type inference failed for: r1v18, types: [boolean] */
    /* JADX WARN: Type inference failed for: r1v2 */
    /* JADX WARN: Type inference failed for: r1v20 */
    /* JADX WARN: Type inference failed for: r1v21 */
    /* JADX WARN: Type inference failed for: r1v3 */
    /* JADX WARN: Type inference failed for: r1v4 */
    /* JADX WARN: Type inference failed for: r1v5 */
    /* JADX WARN: Type inference failed for: r2v10, types: [y88] */
    /* JADX WARN: Type inference failed for: r2v13, types: [a98] */
    /* JADX WARN: Type inference failed for: r2v15 */
    /* JADX WARN: Type inference failed for: r2v2, types: [y88] */
    /* JADX WARN: Type inference failed for: r2v3 */
    /* JADX WARN: Type inference failed for: r2v4 */
    /* JADX WARN: Type inference failed for: r2v9 */
    /* JADX WARN: Type inference failed for: r3v11 */
    /* JADX WARN: Type inference failed for: r3v12 */
    /* JADX WARN: Type inference failed for: r3v13 */
    /* JADX WARN: Type inference failed for: r3v2, types: [java.lang.Object, o58] */
    /* JADX WARN: Type inference failed for: r3v3 */
    /* JADX WARN: Type inference failed for: r3v6 */
    /* JADX WARN: Type inference failed for: r3v7, types: [y88] */
    /* JADX WARN: Type inference failed for: r4v0, types: [java.io.Closeable, java.lang.Object, tb2] */
    @Override // defpackage.b56
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(defpackage.b55 r19, defpackage.p92 r20) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 266
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.p58.d(b55, p92):java.lang.Object");
    }

    @Override // defpackage.b56
    public final bo4 e() {
        return this.c;
    }
}

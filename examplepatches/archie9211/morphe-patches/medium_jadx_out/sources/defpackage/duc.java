package defpackage;

import java.io.Closeable;
import java.io.FileInputStream;
import java.nio.charset.Charset;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class duc implements Closeable {
    public final FileInputStream a;
    public final Charset b;
    public byte[] c;
    public int d;
    public int e;

    public duc(FileInputStream fileInputStream, Charset charset) {
        if (charset == null) {
            throw null;
        }
        if (!charset.equals(zoe.a)) {
            ay0.e("Unsupported encoding");
            throw null;
        }
        this.a = fileInputStream;
        this.b = charset;
        this.c = new byte[8192];
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        synchronized (this.a) {
            try {
                if (this.c != null) {
                    this.c = null;
                    this.a.close();
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x003f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.String f() {
        /*
            r8 = this;
            java.io.FileInputStream r0 = r8.a
            monitor-enter(r0)
            byte[] r1 = r8.c     // Catch: java.lang.Throwable -> L3d
            if (r1 == 0) goto La3
            int r2 = r8.d     // Catch: java.lang.Throwable -> L3d
            int r3 = r8.e     // Catch: java.lang.Throwable -> L3d
            r4 = 0
            r5 = -1
            if (r2 < r3) goto L24
            java.io.FileInputStream r2 = r8.a     // Catch: java.lang.Throwable -> L3d
            int r3 = r1.length     // Catch: java.lang.Throwable -> L3d
            int r1 = r2.read(r1, r4, r3)     // Catch: java.lang.Throwable -> L3d
            if (r1 == r5) goto L1e
            r8.d = r4     // Catch: java.lang.Throwable -> L3d
            r8.e = r1     // Catch: java.lang.Throwable -> L3d
            r2 = r4
            goto L24
        L1e:
            java.io.EOFException r8 = new java.io.EOFException     // Catch: java.lang.Throwable -> L3d
            r8.<init>()     // Catch: java.lang.Throwable -> L3d
            throw r8     // Catch: java.lang.Throwable -> L3d
        L24:
            int r1 = r8.e     // Catch: java.lang.Throwable -> L3d
            r3 = 10
            if (r2 == r1) goto L55
            byte[] r1 = r8.c     // Catch: java.lang.Throwable -> L3d
            r6 = r1[r2]     // Catch: java.lang.Throwable -> L3d
            if (r6 != r3) goto L52
            int r3 = r8.d     // Catch: java.lang.Throwable -> L3d
            if (r2 == r3) goto L3f
            int r4 = r2 + (-1)
            r5 = r1[r4]     // Catch: java.lang.Throwable -> L3d
            r6 = 13
            if (r5 != r6) goto L3f
            goto L40
        L3d:
            r8 = move-exception
            goto Lab
        L3f:
            r4 = r2
        L40:
            java.lang.String r5 = new java.lang.String     // Catch: java.lang.Throwable -> L3d
            int r4 = r4 - r3
            java.nio.charset.Charset r6 = r8.b     // Catch: java.lang.Throwable -> L3d
            java.lang.String r6 = r6.name()     // Catch: java.lang.Throwable -> L3d
            r5.<init>(r1, r3, r4, r6)     // Catch: java.lang.Throwable -> L3d
            int r2 = r2 + 1
            r8.d = r2     // Catch: java.lang.Throwable -> L3d
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L3d
            return r5
        L52:
            int r2 = r2 + 1
            goto L24
        L55:
            cuc r1 = new cuc     // Catch: java.lang.Throwable -> L3d
            int r2 = r8.e     // Catch: java.lang.Throwable -> L3d
            int r6 = r8.d     // Catch: java.lang.Throwable -> L3d
            int r2 = r2 - r6
            int r2 = r2 + 80
            r1.<init>(r8, r2)     // Catch: java.lang.Throwable -> L3d
        L61:
            byte[] r2 = r8.c     // Catch: java.lang.Throwable -> L3d
            int r6 = r8.d     // Catch: java.lang.Throwable -> L3d
            int r7 = r8.e     // Catch: java.lang.Throwable -> L3d
            int r7 = r7 - r6
            r1.write(r2, r6, r7)     // Catch: java.lang.Throwable -> L3d
            r8.e = r5     // Catch: java.lang.Throwable -> L3d
            java.io.FileInputStream r2 = r8.a     // Catch: java.lang.Throwable -> L3d
            byte[] r6 = r8.c     // Catch: java.lang.Throwable -> L3d
            int r7 = r6.length     // Catch: java.lang.Throwable -> L3d
            int r2 = r2.read(r6, r4, r7)     // Catch: java.lang.Throwable -> L3d
            if (r2 == r5) goto L9d
            r8.d = r4     // Catch: java.lang.Throwable -> L3d
            r8.e = r2     // Catch: java.lang.Throwable -> L3d
            r2 = r4
        L7d:
            int r6 = r8.e     // Catch: java.lang.Throwable -> L3d
            if (r2 == r6) goto L61
            byte[] r6 = r8.c     // Catch: java.lang.Throwable -> L3d
            r7 = r6[r2]     // Catch: java.lang.Throwable -> L3d
            if (r7 != r3) goto L9a
            int r3 = r8.d     // Catch: java.lang.Throwable -> L3d
            if (r2 == r3) goto L90
            int r4 = r2 - r3
            r1.write(r6, r3, r4)     // Catch: java.lang.Throwable -> L3d
        L90:
            int r2 = r2 + 1
            r8.d = r2     // Catch: java.lang.Throwable -> L3d
            java.lang.String r8 = r1.toString()     // Catch: java.lang.Throwable -> L3d
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L3d
            return r8
        L9a:
            int r2 = r2 + 1
            goto L7d
        L9d:
            java.io.EOFException r8 = new java.io.EOFException     // Catch: java.lang.Throwable -> L3d
            r8.<init>()     // Catch: java.lang.Throwable -> L3d
            throw r8     // Catch: java.lang.Throwable -> L3d
        La3:
            java.io.IOException r8 = new java.io.IOException     // Catch: java.lang.Throwable -> L3d
            java.lang.String r1 = "LineReader is closed"
            r8.<init>(r1)     // Catch: java.lang.Throwable -> L3d
            throw r8     // Catch: java.lang.Throwable -> L3d
        Lab:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L3d
            throw r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.duc.f():java.lang.String");
    }
}

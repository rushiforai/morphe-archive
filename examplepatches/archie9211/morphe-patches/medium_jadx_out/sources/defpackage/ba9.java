package defpackage;

import com.google.gson.JsonParseException;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileLock;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ba9 {
    public static final byte[] b = new byte[0];
    public final f66 a;

    public ba9(f66 f66Var, int i) {
        f66Var.getClass();
        switch (i) {
            case 1:
                this.a = f66Var;
                break;
            case 2:
                this.a = f66Var;
                break;
            default:
                this.a = f66Var;
                break;
        }
    }

    public static void c(File file, qsa qsaVar) throws IOException {
        FileOutputStream fileOutputStream = new FileOutputStream(file, true);
        try {
            FileLock fileLockLock = fileOutputStream.getChannel().lock();
            fileLockLock.getClass();
            try {
                byte[] bArr = qsaVar.b;
                byte[] bArr2 = qsaVar.a;
                ByteBuffer byteBufferAllocate = ByteBuffer.allocate(bArr2.length + 6 + bArr.length + 6);
                byteBufferAllocate.getClass();
                ByteBuffer byteBufferPut = byteBufferAllocate.putShort(y99.META.getIdentifier()).putInt(bArr.length).put(bArr);
                byteBufferPut.getClass();
                ByteBuffer byteBufferPut2 = byteBufferPut.putShort(y99.EVENT.getIdentifier()).putInt(bArr2.length).put(bArr2);
                byteBufferPut2.getClass();
                fileOutputStream.write(byteBufferPut2.array());
                fileOutputStream.close();
            } finally {
                fileLockLock.release();
            }
        } finally {
        }
    }

    public boolean a(int i, int i2, String str) {
        if (i == i2) {
            return true;
        }
        f66 f66Var = this.a;
        if (i2 != -1) {
            f49.K(f66Var, d66.ERROR, e66.MAINTAINER, new z99(str, i, i2), null, false, 56);
            return false;
        }
        f49.K(f66Var, d66.ERROR, e66.MAINTAINER, new hm0(str, 20), null, false, 56);
        return false;
    }

    public Object b(String str) {
        try {
            return iq7.H(str);
        } catch (JsonParseException e) {
            f49.L(this.a, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new hm0(str, 17), e, 48);
            return null;
        } catch (IllegalStateException e2) {
            f49.L(this.a, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new hm0(str, 18), e2, 48);
            return null;
        }
    }

    public zm0 d(BufferedInputStream bufferedInputStream, y99 y99Var) throws IOException {
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(6);
        int i = bufferedInputStream.read(byteBufferAllocate.array());
        if (!a(6, i, ev6.x("Block(", y99Var.name(), "): Header read"))) {
            return new zm0(null, Math.max(0, i));
        }
        short s = byteBufferAllocate.getShort();
        if (s != y99Var.getIdentifier()) {
            f49.K(this.a, d66.ERROR, e66.MAINTAINER, new aa9(s, y99Var), null, false, 56);
            return new zm0(null, i);
        }
        int i2 = byteBufferAllocate.getInt();
        byte[] bArr = new byte[i2];
        int i3 = bufferedInputStream.read(bArr);
        return a(i2, i3, ev6.x("Block(", y99Var.name(), "):Data read")) ? new zm0(bArr, i + i3) : new zm0(null, Math.max(0, i3) + i);
    }

    public List e(File file) {
        try {
            return f(file);
        } catch (IOException e) {
            f49.L(this.a, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new vp0(file, 13), e, 48);
            return ey3.a;
        } catch (SecurityException e2) {
            f49.L(this.a, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new vp0(file, 14), e2, 48);
            return ey3.a;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:6:0x0027, code lost:
    
        r2 = r2 - r5;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.ArrayList f(java.io.File r9) throws java.io.IOException {
        /*
            r8 = this;
            f66 r0 = r8.a
            long r0 = defpackage.ht2.u0(r9, r0)
            int r0 = (int) r0
            java.util.ArrayList r1 = new java.util.ArrayList
            r1.<init>()
            java.io.FileInputStream r2 = new java.io.FileInputStream
            r2.<init>(r9)
            java.io.BufferedInputStream r3 = new java.io.BufferedInputStream
            r4 = 8192(0x2000, float:1.148E-41)
            r3.<init>(r2, r4)
            r2 = r0
        L19:
            if (r2 <= 0) goto L49
            y99 r4 = defpackage.y99.META     // Catch: java.lang.Throwable -> L40
            zm0 r4 = r8.d(r3, r4)     // Catch: java.lang.Throwable -> L40
            int r5 = r4.b     // Catch: java.lang.Throwable -> L40
            byte[] r4 = r4.a     // Catch: java.lang.Throwable -> L40
            if (r4 != 0) goto L29
            int r2 = r2 - r5
            goto L49
        L29:
            y99 r6 = defpackage.y99.EVENT     // Catch: java.lang.Throwable -> L40
            zm0 r6 = r8.d(r3, r6)     // Catch: java.lang.Throwable -> L40
            int r7 = r6.b     // Catch: java.lang.Throwable -> L40
            int r5 = r5 + r7
            int r2 = r2 - r5
            byte[] r5 = r6.a     // Catch: java.lang.Throwable -> L40
            if (r5 == 0) goto L49
            qsa r6 = new qsa     // Catch: java.lang.Throwable -> L40
            r6.<init>(r5, r4)     // Catch: java.lang.Throwable -> L40
            r1.add(r6)     // Catch: java.lang.Throwable -> L40
            goto L19
        L40:
            r0 = move-exception
            r8 = r0
            throw r8     // Catch: java.lang.Throwable -> L43
        L43:
            r0 = move-exception
            r9 = r0
            defpackage.k50.X(r3, r8)
            throw r9
        L49:
            r3.close()
            if (r2 != 0) goto L58
            if (r0 <= 0) goto L57
            boolean r0 = r1.isEmpty()
            if (r0 == 0) goto L57
            goto L58
        L57:
            return r1
        L58:
            d66 r3 = defpackage.d66.ERROR
            r0 = 2
            e66[] r0 = new defpackage.e66[r0]
            e66 r2 = defpackage.e66.USER
            r4 = 0
            r0[r4] = r2
            e66 r2 = defpackage.e66.TELEMETRY
            r4 = 1
            r0[r4] = r2
            java.util.List r4 = defpackage.d46.R(r0)
            vp0 r5 = new vp0
            r0 = 15
            r5.<init>(r9, r0)
            r6 = 0
            r7 = 56
            f66 r2 = r8.a
            defpackage.f49.L(r2, r3, r4, r5, r6, r7)
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ba9.f(java.io.File):java.util.ArrayList");
    }
}

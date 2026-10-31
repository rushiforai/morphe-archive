package com.bykv.vk.openvk.preload.geckox.buffer.a;

import com.bykv.vk.openvk.preload.geckox.utils.CloseableUtils;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
final class c implements com.bykv.vk.openvk.preload.geckox.buffer.a {

    /* renamed from: a, reason: collision with root package name */
    private long f22048a;

    /* renamed from: b, reason: collision with root package name */
    private long f22049b;

    /* renamed from: c, reason: collision with root package name */
    private RandomAccessFile f22050c;

    /* renamed from: d, reason: collision with root package name */
    private AtomicBoolean f22051d = new AtomicBoolean(false);

    /* renamed from: e, reason: collision with root package name */
    private File f22052e;

    public c(long j11, File file) throws IOException {
        this.f22048a = j11;
        this.f22052e = file;
        file.getParentFile().mkdirs();
        try {
            RandomAccessFile randomAccessFile = new RandomAccessFile(file, "rw");
            this.f22050c = randomAccessFile;
            randomAccessFile.setLength(j11);
        } catch (Exception e3) {
            CloseableUtils.close(this.f22050c);
            throw new IOException("create raf swap failed! path: " + file.getAbsolutePath() + " caused by: " + e3.getMessage(), e3);
        }
    }

    @Override // com.bykv.vk.openvk.preload.geckox.buffer.a
    public final void a() throws IOException {
        if (this.f22051d.get()) {
            throw new IOException("released!");
        }
    }

    @Override // com.bykv.vk.openvk.preload.geckox.buffer.a
    public final long b() {
        return this.f22048a;
    }

    @Override // com.bykv.vk.openvk.preload.geckox.buffer.a
    public final long c() throws IOException {
        if (this.f22051d.get()) {
            throw new IOException("released!");
        }
        return this.f22049b;
    }

    @Override // com.bykv.vk.openvk.preload.geckox.buffer.a
    public final int d() throws IOException {
        byte[] bArr = new byte[1];
        if (b(bArr) == 0) {
            return -1;
        }
        return bArr[0];
    }

    @Override // com.bykv.vk.openvk.preload.geckox.buffer.a
    public final void e() throws IOException {
        if (this.f22051d.getAndSet(true)) {
            return;
        }
        CloseableUtils.close(this.f22050c);
    }

    @Override // com.bykv.vk.openvk.preload.geckox.buffer.a
    public final File f() {
        return this.f22052e;
    }

    /* JADX WARN: Removed duplicated region for block: B:6:0x000e A[PHI: r0
      0x000e: PHI (r0v5 long) = (r0v2 long), (r0v3 long) binds: [B:5:0x000c, B:8:0x0014] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // com.bykv.vk.openvk.preload.geckox.buffer.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void b(long j11) throws IOException {
        if (this.f22051d.get()) {
            throw new IOException("released!");
        }
        long j12 = 0;
        if (j11 < 0) {
            j11 = j12;
        } else {
            j12 = this.f22048a;
            if (j11 > j12) {
            }
        }
        this.f22049b = j11;
        this.f22050c.seek(j11);
    }

    @Override // com.bykv.vk.openvk.preload.geckox.buffer.a
    public final void a(int i5) throws IOException {
        a(new byte[]{(byte) i5});
    }

    @Override // com.bykv.vk.openvk.preload.geckox.buffer.a
    public final void a(byte[] bArr) throws IOException {
        a(bArr, 0, bArr.length);
    }

    @Override // com.bykv.vk.openvk.preload.geckox.buffer.a
    public final synchronized long a(long j11) throws IOException {
        int iSkipBytes;
        if (this.f22051d.get()) {
            throw new IOException("released!");
        }
        int i5 = (int) j11;
        if (i5 == j11) {
            iSkipBytes = this.f22050c.skipBytes(i5);
            this.f22049b = this.f22050c.getFilePointer();
        } else {
            throw new IOException("too large:".concat(String.valueOf(j11)));
        }
        return iSkipBytes;
    }

    @Override // com.bykv.vk.openvk.preload.geckox.buffer.a
    public final int b(byte[] bArr) throws IOException {
        return b(bArr, 0, bArr.length);
    }

    @Override // com.bykv.vk.openvk.preload.geckox.buffer.a
    public final int b(byte[] bArr, int i5, int i11) throws IOException {
        if (!this.f22051d.get()) {
            if (bArr == null || i11 <= 0 || i5 < 0 || i5 >= bArr.length) {
                return 0;
            }
            if (i5 + i11 > bArr.length) {
                i11 = bArr.length - i5;
            }
            synchronized (this) {
                try {
                    long j11 = this.f22049b;
                    long j12 = this.f22048a;
                    if (j11 == j12) {
                        return -1;
                    }
                    if (i11 + j11 > j12) {
                        i11 = (int) (j12 - j11);
                    }
                    int i12 = this.f22050c.read(bArr, i5, i11);
                    if (i12 == -1) {
                        return -1;
                    }
                    this.f22049b += i12;
                    return i12;
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        throw new IOException("released!");
    }

    @Override // com.bykv.vk.openvk.preload.geckox.buffer.a
    public final int a(byte[] bArr, int i5, int i11) throws IOException {
        if (!this.f22051d.get()) {
            if (bArr == null || bArr.length == 0 || i11 <= 0 || i5 < 0 || i5 >= bArr.length) {
                return 0;
            }
            if (i5 + i11 > bArr.length) {
                i11 = bArr.length - i5;
            }
            synchronized (this) {
                try {
                    long j11 = this.f22049b;
                    long j12 = this.f22048a;
                    if (j11 == j12) {
                        return 0;
                    }
                    if (i11 + j11 > j12) {
                        i11 = (int) (j12 - j11);
                    }
                    this.f22050c.write(bArr, i5, i11);
                    this.f22049b += i11;
                    return i11;
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        throw new IOException("released!");
    }
}

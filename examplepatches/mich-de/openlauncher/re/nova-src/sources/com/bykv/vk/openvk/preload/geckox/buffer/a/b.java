package com.bykv.vk.openvk.preload.geckox.buffer.a;

import com.bykv.vk.openvk.preload.geckox.utils.CloseableUtils;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
final class b implements com.bykv.vk.openvk.preload.geckox.buffer.a {

    /* renamed from: a, reason: collision with root package name */
    private RandomAccessFile f22045a;

    /* renamed from: b, reason: collision with root package name */
    private AtomicBoolean f22046b = new AtomicBoolean(false);

    /* renamed from: c, reason: collision with root package name */
    private File f22047c;

    public b(File file) throws IOException {
        this.f22047c = file;
        file.getParentFile().mkdirs();
        try {
            this.f22045a = new RandomAccessFile(file, "rw");
        } catch (Exception e3) {
            CloseableUtils.close(this.f22045a);
            throw new IOException("create raf mSwap failed! path: " + file.getAbsolutePath() + " caused by: " + e3.getMessage(), e3);
        }
    }

    @Override // com.bykv.vk.openvk.preload.geckox.buffer.a
    public final void a() throws IOException {
        if (this.f22046b.get()) {
            throw new IOException("released!");
        }
    }

    @Override // com.bykv.vk.openvk.preload.geckox.buffer.a
    public final long b() throws IOException {
        return this.f22045a.length();
    }

    @Override // com.bykv.vk.openvk.preload.geckox.buffer.a
    public final long c() throws IOException {
        if (this.f22046b.get()) {
            throw new IOException("released!");
        }
        return this.f22045a.getFilePointer();
    }

    @Override // com.bykv.vk.openvk.preload.geckox.buffer.a
    public final int d() throws IOException {
        byte[] bArr = new byte[1];
        if (b(bArr) <= 0) {
            return -1;
        }
        return bArr[0];
    }

    @Override // com.bykv.vk.openvk.preload.geckox.buffer.a
    public final void e() throws IOException {
        if (this.f22046b.getAndSet(true)) {
            return;
        }
        CloseableUtils.close(this.f22045a);
    }

    @Override // com.bykv.vk.openvk.preload.geckox.buffer.a
    public final File f() {
        return this.f22047c;
    }

    @Override // com.bykv.vk.openvk.preload.geckox.buffer.a
    public final void b(long j11) throws IOException {
        if (this.f22046b.get()) {
            throw new IOException("released!");
        }
        if (j11 < 0) {
            j11 = 0;
        }
        this.f22045a.seek(j11);
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
        if (this.f22046b.get()) {
            throw new IOException("released!");
        }
        if (((int) j11) == j11) {
        } else {
            throw new IOException("too large:".concat(String.valueOf(j11)));
        }
        return this.f22045a.skipBytes(r0);
    }

    @Override // com.bykv.vk.openvk.preload.geckox.buffer.a
    public final int b(byte[] bArr) throws IOException {
        return b(bArr, 0, bArr.length);
    }

    @Override // com.bykv.vk.openvk.preload.geckox.buffer.a
    public final int b(byte[] bArr, int i5, int i11) throws IOException {
        int i12;
        if (!this.f22046b.get()) {
            if (bArr == null || i11 <= 0 || i5 < 0 || i5 >= bArr.length) {
                return 0;
            }
            if (i5 + i11 > bArr.length) {
                i11 = bArr.length - i5;
            }
            synchronized (this) {
                i12 = this.f22045a.read(bArr, i5, i11);
            }
            return i12;
        }
        throw new IOException("released!");
    }

    @Override // com.bykv.vk.openvk.preload.geckox.buffer.a
    public final int a(byte[] bArr, int i5, int i11) throws IOException {
        if (!this.f22046b.get()) {
            if (bArr == null || bArr.length == 0 || i11 <= 0 || i5 < 0 || i5 >= bArr.length) {
                return 0;
            }
            if (i5 + i11 > bArr.length) {
                i11 = bArr.length - i5;
            }
            synchronized (this) {
                this.f22045a.write(bArr, i5, i11);
            }
            return i11;
        }
        throw new IOException("released!");
    }
}

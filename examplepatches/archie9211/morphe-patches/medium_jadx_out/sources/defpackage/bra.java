package defpackage;

import java.io.Closeable;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.channels.FileChannel;
import java.util.NoSuchElementException;
import java.util.logging.Level;
import java.util.logging.Logger;
import sprig.b.VPIE.dpBiLjNeNsiASg;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class bra implements Closeable {
    public static final Logger g = Logger.getLogger(bra.class.getName());
    public final RandomAccessFile a;
    public int b;
    public int c;
    public yqa d;
    public yqa e;
    public final byte[] f;

    public static int L(int i, byte[] bArr) {
        return ((bArr[i] & 255) << 24) + ((bArr[i + 1] & 255) << 16) + ((bArr[i + 2] & 255) << 8) + (bArr[i + 3] & 255);
    }

    public static void j0(byte[] bArr, int i, int i2) {
        bArr[i] = (byte) (i2 >> 24);
        bArr[i + 1] = (byte) (i2 >> 16);
        bArr[i + 2] = (byte) (i2 >> 8);
        bArr[i + 3] = (byte) i2;
    }

    public final synchronized void B(ara araVar) {
        int iU = this.d.b;
        for (int i = 0; i < this.c; i++) {
            yqa yqaVarI = I(iU);
            araVar.b(new zqa(this, yqaVarI), yqaVarI.c);
            iU = U(yqaVarI.b + 4 + yqaVarI.c);
        }
    }

    public final synchronized boolean D() {
        return this.c == 0;
    }

    public final yqa I(int i) throws IOException {
        if (i == 0) {
            return yqa.d;
        }
        RandomAccessFile randomAccessFile = this.a;
        randomAccessFile.seek(i);
        return new yqa(i, randomAccessFile.readInt(), 0);
    }

    public final synchronized void N() {
        try {
            if (D()) {
                throw new NoSuchElementException();
            }
            if (this.c == 1) {
                m();
            } else {
                yqa yqaVar = this.d;
                int iU = U(yqaVar.b + 4 + yqaVar.c);
                Q(iU, 0, 4, this.f);
                int iL = L(0, this.f);
                g0(this.b, this.c - 1, iU, this.e.b);
                this.c--;
                this.d = new yqa(iU, iL, 0);
            }
        } catch (Throwable th) {
            throw th;
        }
    }

    public final void Q(int i, int i2, int i3, byte[] bArr) throws IOException {
        int iU = U(i);
        int i4 = iU + i3;
        int i5 = this.b;
        RandomAccessFile randomAccessFile = this.a;
        if (i4 <= i5) {
            randomAccessFile.seek(iU);
            randomAccessFile.readFully(bArr, i2, i3);
            return;
        }
        int i6 = i5 - iU;
        randomAccessFile.seek(iU);
        randomAccessFile.readFully(bArr, i2, i6);
        randomAccessFile.seek(16L);
        randomAccessFile.readFully(bArr, i2 + i6, i3 - i6);
    }

    public final void R(byte[] bArr, int i, int i2) throws IOException {
        int iU = U(i);
        int i3 = iU + i2;
        int i4 = this.b;
        RandomAccessFile randomAccessFile = this.a;
        if (i3 <= i4) {
            randomAccessFile.seek(iU);
            randomAccessFile.write(bArr, 0, i2);
            return;
        }
        int i5 = i4 - iU;
        randomAccessFile.seek(iU);
        randomAccessFile.write(bArr, 0, i5);
        randomAccessFile.seek(16L);
        randomAccessFile.write(bArr, i5, i2 - i5);
    }

    public final int T() {
        if (this.c == 0) {
            return 16;
        }
        yqa yqaVar = this.e;
        int i = yqaVar.b;
        int i2 = this.d.b;
        return i >= i2 ? (i - i2) + 4 + yqaVar.c + 16 : (((i + 4) + yqaVar.c) + this.b) - i2;
    }

    public final int U(int i) {
        int i2 = this.b;
        return i < i2 ? i : (i + 16) - i2;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final synchronized void close() {
        this.a.close();
    }

    public final void f(byte[] bArr) {
        int iU;
        int length = bArr.length;
        synchronized (this) {
            if (length >= 0) {
                if (length <= bArr.length) {
                    p(length);
                    boolean zD = D();
                    if (zD) {
                        iU = 16;
                    } else {
                        yqa yqaVar = this.e;
                        iU = U(yqaVar.b + 4 + yqaVar.c);
                    }
                    yqa yqaVar2 = new yqa(iU, length, 0);
                    j0(this.f, 0, length);
                    R(this.f, iU, 4);
                    R(bArr, iU + 4, length);
                    g0(this.b, this.c + 1, zD ? iU : this.d.b, iU);
                    this.e = yqaVar2;
                    this.c++;
                    if (zD) {
                        this.d = yqaVar2;
                    }
                }
            }
            throw new IndexOutOfBoundsException();
        }
    }

    public final void g0(int i, int i2, int i3, int i4) throws IOException {
        int[] iArr = {i, i2, i3, i4};
        int i5 = 0;
        int i6 = 0;
        while (true) {
            byte[] bArr = this.f;
            if (i5 >= 4) {
                RandomAccessFile randomAccessFile = this.a;
                randomAccessFile.seek(0L);
                randomAccessFile.write(bArr);
                return;
            } else {
                j0(bArr, i6, iArr[i5]);
                i6 += 4;
                i5++;
            }
        }
    }

    public final synchronized void m() {
        g0(4096, 0, 0, 0);
        this.c = 0;
        yqa yqaVar = yqa.d;
        this.d = yqaVar;
        this.e = yqaVar;
        if (this.b > 4096) {
            RandomAccessFile randomAccessFile = this.a;
            randomAccessFile.setLength(4096L);
            randomAccessFile.getChannel().force(true);
        }
        this.b = 4096;
    }

    public final void p(int i) throws IOException {
        int i2 = i + 4;
        int iT = this.b - T();
        if (iT >= i2) {
            return;
        }
        int i3 = this.b;
        do {
            iT += i3;
            i3 <<= 1;
        } while (iT < i2);
        RandomAccessFile randomAccessFile = this.a;
        randomAccessFile.setLength(i3);
        randomAccessFile.getChannel().force(true);
        yqa yqaVar = this.e;
        int iU = U(yqaVar.b + 4 + yqaVar.c);
        if (iU < this.d.b) {
            FileChannel channel = randomAccessFile.getChannel();
            channel.position(this.b);
            long j = iU - 4;
            if (channel.transferTo(16L, j, channel) != j) {
                ay0.d("Copied insufficient number of bytes!");
                return;
            }
        }
        int i4 = this.e.b;
        int i5 = this.d.b;
        if (i4 < i5) {
            int i6 = (this.b + i4) - 16;
            g0(i3, this.c, i5, i6);
            this.e = new yqa(i6, this.e.c, 0);
        } else {
            g0(i3, this.c, i5, i4);
        }
        this.b = i3;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(bra.class.getSimpleName());
        sb.append("[fileLength=");
        sb.append(this.b);
        sb.append(", size=");
        sb.append(this.c);
        sb.append(", first=");
        sb.append(this.d);
        sb.append(", last=");
        sb.append(this.e);
        sb.append(", element lengths=[");
        try {
            B(new sv0(6, sb));
        } catch (IOException e) {
            g.log(Level.WARNING, "read error", (Throwable) e);
        }
        sb.append("]]");
        return sb.toString();
    }

    public bra(File file) throws IOException {
        byte[] bArr = new byte[16];
        this.f = bArr;
        if (!file.exists()) {
            File file2 = new File(file.getPath() + ".tmp");
            RandomAccessFile randomAccessFile = new RandomAccessFile(file2, "rwd");
            try {
                randomAccessFile.setLength(4096L);
                randomAccessFile.seek(0L);
                byte[] bArr2 = new byte[16];
                int[] iArr = {4096, 0, 0, 0};
                int i = 0;
                for (int i2 = 0; i2 < 4; i2++) {
                    j0(bArr2, i, iArr[i2]);
                    i += 4;
                }
                randomAccessFile.write(bArr2);
                randomAccessFile.close();
                if (!file2.renameTo(file)) {
                    ik4.g("Rename failed!");
                    throw null;
                }
            } catch (Throwable th) {
                randomAccessFile.close();
                throw th;
            }
        }
        RandomAccessFile randomAccessFile2 = new RandomAccessFile(file, "rwd");
        this.a = randomAccessFile2;
        randomAccessFile2.seek(0L);
        randomAccessFile2.readFully(bArr);
        int iL = L(0, bArr);
        this.b = iL;
        if (iL <= randomAccessFile2.length()) {
            this.c = L(4, bArr);
            int iL2 = L(8, bArr);
            int iL3 = L(12, bArr);
            this.d = I(iL2);
            this.e = I(iL3);
            return;
        }
        throw new IOException(dpBiLjNeNsiASg.PuASElg + this.b + ", Actual length: " + randomAccessFile2.length());
    }
}

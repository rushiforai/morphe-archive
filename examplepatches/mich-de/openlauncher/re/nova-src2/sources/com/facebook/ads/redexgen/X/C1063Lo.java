package com.facebook.ads.redexgen.X;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Lo, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1063Lo extends OutputStream {
    public static byte[] A02;
    public static String[] A03 = {"N4LOohCr7uAcXM5M1YHx3RtuyT7xq1Wv", "h9ySK30ONKxEx0a41I355Lc4G3ja1fW6", "66hjKg", "nD62wBBG4QNJfRqYXFgrI7wCUY0Atlyz", "gr8VL0beA86YZXgyNLqcOe6ee0pl7lhg", "WfkbJfZv2jx1jTU7C5", "DEWe3qmuHSzSbodSOnqlm3mY9JsOJdVX", "9rGAEY6uN2AFdldvYqzxYh2QcrwmjBeM"};
    public boolean A00 = false;
    public final FileOutputStream A01;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 10);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{76, 121, 98, 96, 100, 110, 75, 100, 97, 104, 102, 65, 73, 76, 69, 68, 0, 84, 79, 0, 83, 89, 78, 67, 0, 70, 73, 76, 69, 0, 68, 69, 83, 67, 82, 73, 80, 84, 79, 82, 26};
    }

    static {
        A01();
    }

    public C1063Lo(File file) throws FileNotFoundException {
        this.A01 = new FileOutputStream(file);
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        if (this.A00) {
            return;
        }
        if (A03[3].charAt(1) != 'D') {
            throw new RuntimeException();
        }
        A03[2] = "W6kF8z";
        this.A00 = true;
        flush();
        try {
            this.A01.getFD().sync();
        } catch (IOException e3) {
            MV.A0A(A00(0, 10, 7), A00(10, 31, 42), e3);
        }
        this.A01.close();
    }

    @Override // java.io.OutputStream, java.io.Flushable
    public final void flush() throws IOException {
        this.A01.flush();
    }

    @Override // java.io.OutputStream
    public final void write(int i5) throws IOException {
        this.A01.write(i5);
    }

    @Override // java.io.OutputStream
    public final void write(byte[] bArr) throws IOException {
        this.A01.write(bArr);
    }

    @Override // java.io.OutputStream
    public final void write(byte[] bArr, int i5, int i11) throws IOException {
        this.A01.write(bArr, i5, i11);
    }
}

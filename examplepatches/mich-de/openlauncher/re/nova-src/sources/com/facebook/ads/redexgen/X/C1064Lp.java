package com.facebook.ads.redexgen.X;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Lp, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1064Lp {
    public static byte[] A02;
    public final File A00;
    public final File A01;

    static {
        A02();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 109);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A02 = new byte[]{12, 88, 67, 12, 78, 77, 79, 71, 89, 92, 12, 74, 69, 64, 73, 12, 113, 61, 62, 52, 78, 123, 96, 98, 102, 108, 73, 102, 99, 106, 71, 107, 113, 104, 96, 106, 35, 112, 36, 103, 118, 97, 101, 112, 97, 36, 70, 106, 112, 105, 97, 107, 34, 113, 37, 119, 96, 107, 100, 104, 96, 37, 99, 108, 105, 96, 37};
    }

    public C1064Lp(File file) {
        this.A01 = file;
        this.A00 = new File(file.getPath() + A00(16, 4, 50));
    }

    private void A01() {
        if (this.A00.exists()) {
            this.A01.delete();
            this.A00.renameTo(this.A01);
        }
    }

    public final C1063Lo A03() throws IOException {
        if (this.A01.exists()) {
            if (!this.A00.exists()) {
                if (!this.A01.renameTo(this.A00)) {
                    MV.A07(A00(20, 10, 98), A00(46, 21, 104) + this.A01 + A00(0, 16, 65) + this.A00);
                }
            } else {
                this.A01.delete();
            }
        }
        try {
            return new C1063Lo(this.A01);
        } catch (FileNotFoundException e3) {
            File parentFile = this.A01.getParentFile();
            String strA00 = A00(30, 16, 105);
            if (parentFile != null && parentFile.mkdirs()) {
                try {
                    File parent = this.A01;
                    return new C1063Lo(parent);
                } catch (FileNotFoundException e11) {
                    throw new IOException(strA00 + this.A01, e11);
                }
            }
            throw new IOException(strA00 + this.A01, e3);
        }
    }

    public final InputStream A04() throws FileNotFoundException {
        A01();
        return new FileInputStream(this.A01);
    }

    public final void A05() {
        this.A01.delete();
        this.A00.delete();
    }

    public final void A06(OutputStream outputStream) throws IOException {
        outputStream.close();
        this.A00.delete();
    }

    public final boolean A07() {
        return this.A01.exists() || this.A00.exists();
    }
}

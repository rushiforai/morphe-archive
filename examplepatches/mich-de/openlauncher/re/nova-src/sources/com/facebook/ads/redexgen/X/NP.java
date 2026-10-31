package com.facebook.ads.redexgen.X;

import android.graphics.Bitmap;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class NP implements InterfaceC1615dG<Bitmap> {
    public static byte[] A06;
    public static String[] A07 = {"O8BWLXPdzHA", "6sEzkrKiC7tSlAyzako7Jr1QeLTjq7r7", "buIAODYM5Oo034kKCIV4I7ZzRqvLqiIh", "ENOGp8Grp5cb6hByXNSQMpF2JyONyocp", "tnh", "2Zn0DxkDz4CuR43sN", "3j1ga9q4MlHQ2cRzMN", "NuleDR7CXAFlpWhCDunnHJWIhrQ2pSEs"};
    public final int A00;
    public final int A01;
    public final String A02 = NP.class.getSimpleName();
    public final boolean A03;
    public final boolean A04;
    public final boolean A05;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A06, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 8);
            if (A07[7].charAt(0) == 'p') {
                throw new RuntimeException();
            }
            A07[6] = "rTtdlTA5qc3UePbll3p";
            bArrCopyOfRange[i13] = b11;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        if (A07[4].length() != 3) {
            throw new RuntimeException();
        }
        A07[6] = "j2OKbozXXbIBudrsn6AX9zPsXXh";
        A06 = new byte[]{1, 91, 66, 95, 7, 44, 49, 40, 36, 53, 101, 44, 54, 101, 43, 48, 41, 41, 124, 65, 90, 92, 73, 77, 80, 86, 87, 25, 93, 76, 75, 80, 87, 94, 25, 95, 80, 85, 92, 25, 90, 86, 84, 73, 75, 92, 74, 74, 80, 86, 87};
    }

    static {
        A02();
    }

    public NP(int i5, int i11, boolean z11, boolean z12, boolean z13) {
        this.A01 = i5;
        this.A00 = i11;
        this.A05 = z11;
        this.A03 = z12;
        this.A04 = z13;
    }

    public static C1614dF<Bitmap> A00(Throwable th2) {
        return new C1614dF<>(false, null, th2);
    }

    private void A03(File file, Bitmap bitmap) throws IOException {
        if (bitmap == null) {
            return;
        }
        ByteArrayOutputStream byteArrayOutputStream = null;
        FileOutputStream fileOutputStream = null;
        FileInputStream fileInputStream = null;
        FileOutputStream fileOutputStream2 = null;
        try {
            ByteArrayOutputStream compressedBitmapOS = new ByteArrayOutputStream();
            byteArrayOutputStream = compressedBitmapOS;
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, byteArrayOutputStream);
            if (byteArrayOutputStream.size() >= 3145728) {
                return;
            }
            String str = file.getCanonicalPath() + A01(0, 4, 39);
            File file2 = new File(str);
            file2.createNewFile();
            fileOutputStream = new FileOutputStream(str);
            byteArrayOutputStream.writeTo(fileOutputStream);
            fileOutputStream.flush();
            fileInputStream = new FileInputStream(str);
            fileOutputStream2 = new FileOutputStream(file);
            byte[] bArr = new byte[1024];
            while (true) {
                int i5 = fileInputStream.read(bArr);
                if (i5 > 0) {
                    fileOutputStream2.write(bArr, 0, i5);
                } else {
                    file2.delete();
                    return;
                }
            }
        } finally {
            AbstractC1634dZ.A07(byteArrayOutputStream);
            AbstractC1634dZ.A07(fileOutputStream);
            AbstractC1634dZ.A07(fileInputStream);
            AbstractC1634dZ.A07(fileOutputStream2);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1615dG
    public final C1614dF<Bitmap> A4N(File file, InterfaceC1633dY interfaceC1633dY) {
        if (!this.A04) {
            return new C1614dF<>(true, null);
        }
        try {
            Bitmap bitmapA03 = AbstractC1634dZ.A03(file.getCanonicalPath(), this.A01, this.A00, this.A05);
            if (bitmapA03 != null) {
                return new C1614dF<>(true, bitmapA03);
            }
            interfaceC1633dY.ABp(new NE(A01(4, 14, 77)));
            return A00(null);
        } catch (Throwable t6) {
            file.delete();
            interfaceC1633dY.ABp(t6);
            return A00(t6);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1615dG
    public final void A5m(File file, InterfaceC1633dY interfaceC1633dY) throws Throwable {
        if (this.A03) {
            try {
                Bitmap bitmap = AbstractC1634dZ.A03(file.getCanonicalPath(), this.A01, this.A00, this.A05);
                if (bitmap != null) {
                    A03(file, bitmap);
                } else {
                    file.delete();
                    throw new NE(A01(4, 14, 77));
                }
            } catch (NE e3) {
                interfaceC1633dY.AC6(e3);
                throw e3;
            } catch (Throwable th2) {
                interfaceC1633dY.AC6(th2);
                Throwable t6 = new NE(A01(18, 33, 49), th2);
                throw t6;
            }
        }
    }
}

package com.facebook.ads.redexgen.X;

import android.graphics.Bitmap;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.br, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1528br {
    public static String[] A09 = {"6REwmDl9XOCMOUVALE304PQaLIACUDdB", "OSiE0ETm3o80qopLKjeVsFdmRqEwQRGP", "T4HMME4g12759npSgydXzQUPRfl1LVqh", "kVrElxr9MLzANfC8O6qAp157bhaNdsP8", "IT4zLxeG2VEg7n7F6NyAzQJRgNacg", "0a8lKfPHuQ0g4jZrkzQ4AzqRo5FUtIe0", "3lFGWYjdVLwI7ZVfWxuSMAgcPM7rT", "UJH1pef1suSIUGrZ969c7mjQy8Sa4Ju7"};
    public int A00;
    public int A01;
    public int A02;
    public int A03;
    public int A04;
    public int A05;
    public boolean A06;
    public final C1084Mk A07 = new C1084Mk();
    public final int[] A08 = new int[256];

    /* JADX INFO: Access modifiers changed from: private */
    public void A00(C1084Mk c1084Mk, int i5) {
        int totalLength;
        if (i5 < 4) {
            return;
        }
        c1084Mk.A0g(3);
        boolean z11 = (c1084Mk.A0I() & 128) != 0;
        int i11 = i5 - 4;
        String[] strArr = A09;
        if (strArr[7].charAt(13) == strArr[2].charAt(13)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A09;
        strArr2[7] = "jH34FN8wZX0PvsBocX7ZqPy41aKwrRI2";
        strArr2[2] = "aSPilwoBqAEpIL5WJQy14AT2v8knN9ff";
        if (z11) {
            if (i11 < 7 || (totalLength = c1084Mk.A0K()) < 4) {
                return;
            }
            this.A01 = c1084Mk.A0M();
            this.A00 = c1084Mk.A0M();
            this.A07.A0d(totalLength - 4);
            i11 -= 7;
        }
        int limit = this.A07.A09();
        int position = this.A07.A0A();
        if (limit < position && i11 > 0) {
            int iMin = Math.min(i11, position - limit);
            c1084Mk.A0k(this.A07.A0l(), limit, iMin);
            this.A07.A0f(limit + iMin);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A01(C1084Mk c1084Mk, int i5) {
        if (i5 < 19) {
            return;
        }
        this.A05 = c1084Mk.A0M();
        this.A04 = c1084Mk.A0M();
        c1084Mk.A0g(11);
        this.A02 = c1084Mk.A0M();
        this.A03 = c1084Mk.A0M();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A02(C1084Mk c1084Mk, int i5) {
        if (i5 % 5 != 2) {
            return;
        }
        c1084Mk.A0g(2);
        Arrays.fill(this.A08, 0);
        int i11 = i5 / 5;
        for (int index = 0; index < i11; index++) {
            int iA0I = c1084Mk.A0I();
            int a11 = c1084Mk.A0I();
            int iA0I2 = c1084Mk.A0I();
            int iA0I3 = c1084Mk.A0I();
            int entryCount = iA0I2 - 128;
            int i12 = (int) (a11 + (entryCount * 1.402d));
            int g11 = (int) ((a11 - ((iA0I3 - 128) * 0.34414d)) - ((iA0I2 - 128) * 0.71414d));
            int entryCount2 = c1084Mk.A0I() << 24;
            this.A08[iA0I] = entryCount2 | (N1.A07(i12, 0, 255) << 16) | (N1.A07(g11, 0, 255) << 8) | N1.A07((int) (a11 + ((iA0I3 - 128) * 1.772d)), 0, 255);
        }
        this.A06 = true;
    }

    public final C1251Th A06() {
        int iA0I;
        if (this.A05 == 0 || this.A04 == 0 || this.A01 == 0 || this.A00 == 0 || this.A07.A0A() == 0 || this.A07.A09() != this.A07.A0A() || !this.A06) {
            return null;
        }
        this.A07.A0f(0);
        int[] iArr = new int[this.A01 * this.A00];
        int runLength = 0;
        while (runLength < iArr.length) {
            int iA0I2 = this.A07.A0I();
            if (iA0I2 != 0) {
                int i5 = runLength + 1;
                int[] iArr2 = this.A08;
                String[] strArr = A09;
                if (strArr[6].length() != strArr[4].length()) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A09;
                strArr2[0] = "0EK1tFE9VOylfBdNrLrZeEFYyvusNkWz";
                strArr2[3] = "isR3l5x9bAsQyPyJhFnO5izP7p9Ywoni";
                iArr[runLength] = iArr2[iA0I2];
                runLength = i5;
            } else {
                int argbBitmapDataIndex = this.A07.A0I();
                if (argbBitmapDataIndex != 0) {
                    if ((argbBitmapDataIndex & 64) == 0) {
                        iA0I = argbBitmapDataIndex & 63;
                    } else {
                        iA0I = ((argbBitmapDataIndex & 63) << 8) | this.A07.A0I();
                    }
                    Arrays.fill(iArr, runLength, runLength + iA0I, (argbBitmapDataIndex & 128) == 0 ? 0 : this.A08[this.A07.A0I()]);
                    runLength += iA0I;
                }
            }
        }
        return new C1052Ld().A0D(Bitmap.createBitmap(iArr, this.A01, this.A00, Bitmap.Config.ARGB_8888)).A04(this.A02 / this.A05).A0A(0).A07(this.A03 / this.A04, 0).A09(0).A06(this.A01 / this.A05).A03(this.A00 / this.A04).A0H();
    }

    public final void A07() {
        this.A05 = 0;
        this.A04 = 0;
        this.A02 = 0;
        this.A03 = 0;
        this.A01 = 0;
        this.A00 = 0;
        this.A07.A0d(0);
        this.A06 = false;
    }
}

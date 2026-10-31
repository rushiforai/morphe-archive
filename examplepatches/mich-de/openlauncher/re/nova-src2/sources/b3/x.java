package b3;

import ads_mobile_sdk.xt3;
import b.k9;
import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class x {

    /* renamed from: a, reason: collision with root package name */
    public int f17391a;

    /* renamed from: b, reason: collision with root package name */
    public int[] f17392b;

    public x(int[] iArr, int i5) {
        int iC = k9.c(((~480298490) & 1376520936) | 743765285, (480298490 & 1378459336) | 569504804, -451892186, 1172755590) ^ (496987743 % 159259470);
        int length = iArr.length;
        if (length == iC) {
            this.f17391a = i5;
            this.f17392b = iArr;
        } else {
            StringBuilder sb2 = new StringBuilder(String.valueOf(length).length() + 44);
            sb2.append(xt3.a("Ake3rgkWMjm+UlOd1Tg3PHccqBbIRJQk3bhyKj5k"));
            sb2.append(length);
            sb2.append(xt3.a("a0CvvBEaN339T0zNlXk="));
            throw new IllegalArgumentException(sb2.toString());
        }
    }

    public void a(int i5, byte[] bArr) {
        int i11 = 1777080124;
        int i12 = 1777080124;
        int i13 = 0;
        int iC = 0;
        int i14 = 0;
        int i15 = 0;
        int i16 = 0;
        int i17 = 0;
        int i18 = 0;
        int i19 = 0;
        int i21 = 0;
        char c11 = 0;
        int i22 = 0;
        char c12 = 0;
        int i23 = 0;
        int i24 = 0;
        int i25 = 0;
        char c13 = 0;
        while (true) {
            if (i12 == 719824015) {
                int i26 = (-235787554) + i12;
                i12 += 799411447;
                if (i13 == iC) {
                    i12 = i26;
                }
            } else if (i12 == 1519235462) {
                int[] iArr = this.f17392b;
                i15 += (((i14 << i16) ^ (i14 >>> i17)) + i14) ^ (i13 + iArr[i13 & i18]);
                i13 += i19;
                i14 += (iArr[(i13 >>> i21) & i18] + i13) ^ (((i15 << i16) ^ (i15 >>> i17)) + i15);
                i12 -= 799411447;
            } else {
                if (i12 != i11) {
                    bArr[0] = (byte) (i15 >> i25);
                    bArr[1] = (byte) ((((i15 >> i24) & i22) << i25) >> i25);
                    bArr[c13] = (byte) ((((i15 >> i23) & i22) << i25) >> i25);
                    bArr[i18] = (byte) (((i15 & i22) << i25) >> i25);
                    bArr[i16] = (byte) (i14 >> i25);
                    bArr[i17] = (byte) ((((i14 >> i24) & i22) << i25) >> i25);
                    bArr[c12] = (byte) ((((i14 >> i23) & i22) << i25) >> i25);
                    bArr[c11] = (byte) (((i14 & i22) << i25) >> i25);
                    return;
                }
                iC = k9.c(((~1805613091) & 1510775491) | 1446977934, (1805613091 & (-1409156543)) | (-1529649762), 328319491, 94255812) ^ (959658925 % 805251743);
                i15 = this.f17391a;
                i12 -= 1057256109;
                i16 = 4;
                i17 = 5;
                i18 = 3;
                i19 = 1340169305;
                i21 = 11;
                i25 = 24;
                i22 = 255;
                c13 = 2;
                c12 = 6;
                c11 = 7;
                i24 = 16;
                i23 = 8;
                i14 = i5;
                i13 = 0;
            }
            i11 = 1777080124;
        }
    }

    public void b(int i5) {
        int[] iArr = this.f17392b;
        int length = iArr.length;
        int i11 = this.f17391a;
        if (length == i11) {
            int[] iArr2 = new int[i11 + i11];
            System.arraycopy(iArr, 0, iArr2, 0, i11);
            this.f17392b = iArr2;
        }
        int[] iArr3 = this.f17392b;
        int i12 = this.f17391a;
        this.f17391a = i12 + 1;
        iArr3[i12] = i5;
    }

    public void c(int i5, int i11, int i12) {
        int i13 = this.f17391a;
        int[] iArrCopyOf = this.f17392b;
        int i14 = i13 + 3;
        if (i14 >= iArrCopyOf.length) {
            iArrCopyOf = Arrays.copyOf(iArrCopyOf, iArrCopyOf.length * 2);
            Intrinsics.f(iArrCopyOf, "copyOf(...)");
            this.f17392b = iArrCopyOf;
        }
        iArrCopyOf[i13] = i5 + i12;
        iArrCopyOf[i13 + 1] = i11 + i12;
        iArrCopyOf[i13 + 2] = i12;
        this.f17391a = i14;
    }

    public void d(int i5, int i11, int i12, int i13) {
        int i14 = this.f17391a;
        int[] iArrCopyOf = this.f17392b;
        int i15 = i14 + 4;
        if (i15 >= iArrCopyOf.length) {
            iArrCopyOf = Arrays.copyOf(iArrCopyOf, iArrCopyOf.length * 2);
            Intrinsics.f(iArrCopyOf, "copyOf(...)");
            this.f17392b = iArrCopyOf;
        }
        iArrCopyOf[i14] = i5;
        iArrCopyOf[i14 + 1] = i11;
        iArrCopyOf[i14 + 2] = i12;
        iArrCopyOf[i14 + 3] = i13;
        this.f17391a = i15;
    }

    public void e(int i5, int i11) {
        if (i5 < i11) {
            int i12 = i5 - 3;
            for (int i13 = i5; i13 < i11; i13 += 3) {
                int[] iArr = this.f17392b;
                int i14 = iArr[i13];
                int i15 = iArr[i11];
                if (i14 < i15 || (i14 == i15 && iArr[i13 + 1] <= iArr[i11 + 1])) {
                    i12 += 3;
                    f(i12, i13);
                }
            }
            f(i12 + 3, i11);
            e(i5, i12);
            e(i12 + 6, i11);
        }
    }

    public void f(int i5, int i11) {
        int[] iArr = this.f17392b;
        int i12 = iArr[i5];
        iArr[i5] = iArr[i11];
        iArr[i11] = i12;
        int i13 = i5 + 1;
        int i14 = i11 + 1;
        int i15 = iArr[i13];
        iArr[i13] = iArr[i14];
        iArr[i14] = i15;
        int i16 = i5 + 2;
        int i17 = i11 + 2;
        int i18 = iArr[i16];
        iArr[i16] = iArr[i17];
        iArr[i17] = i18;
    }

    public x(int i5, boolean z11) {
        switch (i5) {
            case 3:
                this.f17392b = new int[8];
                this.f17391a = 0;
                break;
            default:
                this.f17392b = new int[8];
                this.f17391a = 0;
                break;
        }
    }

    public x(int i5) {
        this.f17392b = new int[i5];
    }
}

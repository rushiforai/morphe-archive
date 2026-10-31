package gf;

import java.util.Arrays;
import java.util.Random;

/* loaded from: classes3.dex */
public final class v0 {

    /* renamed from: a, reason: collision with root package name */
    public final Random f57645a;

    /* renamed from: b, reason: collision with root package name */
    public final int[] f57646b;

    /* renamed from: c, reason: collision with root package name */
    public final int[] f57647c;

    public v0() {
        this(new Random());
    }

    public final v0 a(int i5) {
        int[] iArr;
        Random random;
        int[] iArr2 = new int[i5];
        int[] iArr3 = new int[i5];
        int i11 = 0;
        while (true) {
            iArr = this.f57646b;
            random = this.f57645a;
            if (i11 >= i5) {
                break;
            }
            iArr2[i11] = random.nextInt(iArr.length + 1);
            int i12 = i11 + 1;
            int iNextInt = random.nextInt(i12);
            iArr3[i11] = iArr3[iNextInt];
            iArr3[iNextInt] = i11;
            i11 = i12;
        }
        Arrays.sort(iArr2);
        int[] iArr4 = new int[iArr.length + i5];
        int i13 = 0;
        int i14 = 0;
        for (int i15 = 0; i15 < iArr.length + i5; i15++) {
            if (i13 >= i5 || i14 != iArr2[i13]) {
                int i16 = i14 + 1;
                int i17 = iArr[i14];
                iArr4[i15] = i17;
                if (i17 >= 0) {
                    iArr4[i15] = i17 + i5;
                }
                i14 = i16;
            } else {
                iArr4[i15] = iArr3[i13];
                i13++;
            }
        }
        return new v0(iArr4, new Random(random.nextLong()));
    }

    public v0(int[] iArr, Random random) {
        this.f57646b = iArr;
        this.f57645a = random;
        this.f57647c = new int[iArr.length];
        for (int i5 = 0; i5 < iArr.length; i5++) {
            this.f57647c[iArr[i5]] = i5;
        }
    }

    public v0(Random random) {
        this(new int[0], random);
    }
}

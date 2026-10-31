package kotlin.uuid;

import b.u4;
import kotlin.text.HexExtensionsKt;

/* loaded from: classes5.dex */
public abstract class b extends a {
    public static final void a(int i5, String str) {
        if (str.charAt(i5) == '-') {
            return;
        }
        StringBuilder sbJ = u4.j(i5, "Expected '-' (hyphen) at index ", ", but was '");
        sbJ.append(str.charAt(i5));
        sbJ.append('\'');
        throw new IllegalArgumentException(sbJ.toString().toString());
    }

    public static final void b(long j11, byte[] bArr, int i5, int i11) {
        int i12 = (i11 * 2) + i5;
        for (int i13 = 0; i13 < i11; i13++) {
            int i14 = HexExtensionsKt.f72010a[(int) (255 & j11)];
            bArr[i12 - 1] = (byte) i14;
            i12 -= 2;
            bArr[i12] = (byte) (i14 >> 8);
            j11 >>= 8;
        }
    }
}

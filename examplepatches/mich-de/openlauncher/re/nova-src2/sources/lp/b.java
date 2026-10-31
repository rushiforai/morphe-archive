package lp;

/* loaded from: classes4.dex */
public final class b extends a {
    public static b c(byte[] bArr) {
        int i5;
        String str;
        int length = bArr != null ? bArr.length : 0;
        if (length == 0) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        } else {
            int i11 = length / 3;
            int i12 = i11 * 3;
            if (length == 0) {
                i5 = 0;
            } else {
                i5 = i11 << 2;
                int i13 = length % 3;
                if (i13 != 0) {
                    i5 = i5 + i13 + 1;
                }
            }
            byte[] bArr2 = new byte[i5];
            int i14 = 0;
            int i15 = 0;
            while (i14 < i12) {
                int i16 = i14 + 2;
                int i17 = ((bArr[i14 + 1] & 255) << 8) | ((bArr[i14] & 255) << 16);
                i14 += 3;
                int i18 = i17 | (bArr[i16] & 255);
                bArr2[i15] = io.sentry.config.a.D((i18 >>> 18) & 63);
                bArr2[i15 + 1] = io.sentry.config.a.D((i18 >>> 12) & 63);
                int i19 = i15 + 3;
                bArr2[i15 + 2] = io.sentry.config.a.D((i18 >>> 6) & 63);
                i15 += 4;
                bArr2[i19] = io.sentry.config.a.D(i18 & 63);
            }
            int i21 = length - i12;
            if (i21 > 0) {
                int i22 = ((bArr[i12] & 255) << 10) | (i21 == 2 ? (bArr[length - 1] & 255) << 2 : 0);
                if (i21 == 2) {
                    bArr2[i5 - 3] = io.sentry.config.a.D(i22 >> 12);
                    bArr2[i5 - 2] = io.sentry.config.a.D((i22 >>> 6) & 63);
                    bArr2[i5 - 1] = io.sentry.config.a.D(i22 & 63);
                } else {
                    bArr2[i5 - 2] = io.sentry.config.a.D(i22 >> 12);
                    bArr2[i5 - 1] = io.sentry.config.a.D((i22 >>> 6) & 63);
                }
            }
            str = new String(bArr2, f.f75086a);
        }
        return new b(str);
    }

    public static b d(String str) {
        if (str == null) {
            return null;
        }
        return new b(str);
    }

    @Override // lp.a
    public final boolean equals(Object obj) {
        if (obj instanceof b) {
            return this.f75082a.equals(((a) obj).f75082a);
        }
        return false;
    }
}

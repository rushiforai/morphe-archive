package lp;

import com.google.android.gms.internal.measurement.k2;
import com.vungle.ads.internal.protos.Sdk;
import java.io.Serializable;
import java.math.BigInteger;
import java.util.Arrays;
import java.util.Objects;

/* loaded from: classes4.dex */
public class a implements Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final String f75082a;

    public a(String str) {
        Objects.requireNonNull(str);
        this.f75082a = str;
    }

    public final byte[] a() {
        char c11;
        String str = this.f75082a;
        if (str == null || str.isEmpty()) {
            return new byte[0];
        }
        byte[] bytes = str.getBytes(f.f75086a);
        int length = bytes.length;
        long j11 = (length * 6) >> 3;
        int i5 = (int) j11;
        if (i5 != j11) {
            throw new IllegalArgumentException(k2.i(j11, " cannot be cast to int without changing its value."));
        }
        byte[] bArr = new byte[i5];
        int i11 = 0;
        int i12 = 0;
        while (i11 < bytes.length) {
            int i13 = 0;
            int i14 = 0;
            while (i13 < 4 && i11 < length) {
                int i15 = i11 + 1;
                byte b11 = bytes[i11];
                int iZ = io.sentry.config.a.Z(b11, 64) & io.sentry.config.a.a0(b11, 91);
                int iZ2 = io.sentry.config.a.Z(b11, 96) & io.sentry.config.a.a0(b11, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE);
                int iZ3 = io.sentry.config.a.Z(b11, 47) & io.sentry.config.a.a0(b11, 58);
                int iY = io.sentry.config.a.Y(b11, 43) | io.sentry.config.a.Y(b11, 45);
                int iY2 = io.sentry.config.a.Y(b11, 47) | io.sentry.config.a.Y(b11, 95);
                byte[] bArr2 = bytes;
                int iB0 = io.sentry.config.a.b0(iZ2, b11 - 71, 0) | io.sentry.config.a.b0(iZ, b11 - 65, 0) | io.sentry.config.a.b0(iZ3, b11 + 4, 0) | io.sentry.config.a.b0(iY, 62, 0) | io.sentry.config.a.b0(iY2, 63, 0) | io.sentry.config.a.b0(iZ | iZ2 | iZ3 | iY | iY2, 0, -1);
                if (iB0 >= 0) {
                    i14 |= iB0 << (18 - (i13 * 6));
                    i13++;
                }
                i11 = i15;
                bytes = bArr2;
            }
            byte[] bArr3 = bytes;
            if (i13 >= 2) {
                int i16 = i12 + 1;
                bArr[i12] = (byte) (i14 >> 16);
                c11 = 3;
                if (i13 >= 3) {
                    int i17 = i12 + 2;
                    bArr[i16] = (byte) (i14 >> 8);
                    if (i13 >= 4) {
                        i12 += 3;
                        bArr[i17] = (byte) i14;
                    } else {
                        i12 = i17;
                    }
                } else {
                    i12 = i16;
                }
            } else {
                c11 = 3;
            }
            bytes = bArr3;
        }
        return Arrays.copyOf(bArr, i12);
    }

    public final BigInteger b() {
        return new BigInteger(1, a());
    }

    public boolean equals(Object obj) {
        if (obj instanceof a) {
            return this.f75082a.equals(((a) obj).f75082a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f75082a.hashCode();
    }

    public final String toString() {
        return this.f75082a;
    }
}

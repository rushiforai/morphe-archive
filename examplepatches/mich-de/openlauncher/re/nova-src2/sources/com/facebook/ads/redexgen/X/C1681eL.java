package com.facebook.ads.redexgen.X;

import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.io.File;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.eL, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1681eL implements Comparable<C1681eL> {
    public static byte[] A06;
    public static String[] A07 = {"vAp8qu6hUJHkmxeq2", "CjFksMF3RrvU1Fj", "8Ag3fWeHtKmV3KTQV", "Szvp3QKxFyx2isRkoWgDgVpRYYN", "VbZdgYPyFWGijN2YkRmsfVIgm", "XQT1ZA9mRB6Q7qzJs0iljIPic", "2ASyfpABfjGjkC5DoDqKLeafK1z", "umE5OeXC1QerodiF8"};

    @MetaExoPlayerCustomization
    public static final String A08;
    public final long A00;
    public final long A01;
    public final long A02;
    public final File A03;
    public final String A04;
    public final boolean A05;

    public static String A08(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A06, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A07[0].length() != 17) {
                throw new RuntimeException();
            }
            A07[5] = "aXAau";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 69);
            i13++;
        }
    }

    public static void A09() {
        A06 = new byte[]{53, 121, 116, 97, 47, 69, 21, 10, 22, 95, 69, 78, 29, 7, 20, 11, 84, 78, 15, 45, 47, 36, 41, 31, 60, 45, 34, 55};
    }

    static {
        A09();
        A08 = C1681eL.class.getSimpleName();
    }

    public C1681eL(String str, long j11, long j12, long j13, File file) {
        this.A04 = str;
        this.A02 = j11;
        this.A01 = j12;
        this.A05 = file != null;
        this.A03 = file;
        this.A00 = j13;
    }

    @Override // java.lang.Comparable
    /* renamed from: A0A, reason: merged with bridge method [inline-methods] */
    public final int compareTo(C1681eL c1681eL) {
        if (!this.A04.equals(c1681eL.A04)) {
            String str = this.A04;
            String str2 = c1681eL.A04;
            if (A07[5].length() == 28) {
                throw new RuntimeException();
            }
            String[] strArr = A07;
            strArr[2] = "efXniPdmq3AxXfVh1";
            strArr[7] = "Jgr9jaigT7qyWCes6";
            return str.compareTo(str2);
        }
        long j11 = this.A02 - c1681eL.A02;
        if (j11 == 0) {
            return 0;
        }
        return j11 < 0 ? -1 : 1;
    }

    public final boolean A0B() {
        return !this.A05;
    }

    public final boolean A0C() {
        return this.A01 == -1;
    }

    @MetaExoPlayerCustomization
    public final String toString() {
        return A08(18, 10, 9) + this.A04 + A08(0, 5, 80) + this.A00 + A08(5, 6, 32) + this.A02 + A08(11, 7, 43) + this.A01 + AbstractJsonLexerKt.END_OBJ;
    }
}

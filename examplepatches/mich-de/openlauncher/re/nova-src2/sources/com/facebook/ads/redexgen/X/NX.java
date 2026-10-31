package com.facebook.ads.redexgen.X;

import android.net.Uri;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/* loaded from: assets/audience_network/classes.dex */
public final class NX {
    public static byte[] A0B;
    public static String[] A0C = {"e4uUPmc22ZRdNaAgF5vnZAPDwfLtA", "mUVxOHc0ILtKLSRGr5mEhSRkM1gHAbfi", "LQLJ1jX1NfccFVprhGRuxOVaKJD75qni", "izL0WdnTuG5jJeHTukCmuQTjI8Sziec1", "pXkZJ9PjdU7O9UesVkJehPDeoAoV3IHZ", "TiCIJb0kjhpYjTw1vUQPafsZ9hiijRPH", "kpSiCN8RDKSwkRhWAxn", "9X5aabTvwMVqU3dL5x6y59OngkfV"};

    @MetaExoPlayerCustomization
    public static final NX A0D;
    public final int A00;
    public final int A01;

    @Deprecated
    public final long A02;
    public final long A03;
    public final long A04;
    public final long A05;
    public final Uri A06;

    @MetaExoPlayerCustomization
    public final C1667e7 A07;
    public final String A08;
    public final Map<String, String> A09;
    public final byte[] A0A;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 21 out of bounds for length 21
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @MetaExoPlayerCustomization
    public NX(Uri uri, long j11, int i5, byte[] bArr, Map<String, String> map, long j12, long j13, String str, int i11, C1667e7 c1667e7) {
        boolean z11 = true;
        AbstractC1062Ln.A07(j11 + j12 >= 0);
        AbstractC1062Ln.A07(j12 >= 0);
        if (j13 <= 0 && j13 != -1) {
            z11 = false;
        }
        AbstractC1062Ln.A07(z11);
        this.A06 = uri;
        this.A05 = j11;
        this.A01 = i5;
        this.A0A = (bArr == null || bArr.length == 0) ? null : bArr;
        this.A09 = Collections.unmodifiableMap(new HashMap(map));
        this.A04 = j12;
        this.A02 = j11 + j12;
        this.A03 = j13;
        this.A08 = str;
        this.A00 = i11;
        this.A07 = c1667e7;
    }

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0B, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 42);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A0B = new byte[]{20, 41, 37, 18, 55, 34, 55, 5, 38, 51, 53, 13, 41, 43, 58, 105, 100, 96, 101, 81, 78, 82, 85, 70, 18, 26, 26, 18, 91, 16, 13, 26, 91, 17, 20, 1, 20, 6, 26, 0, 7, 22, 16, 5, 5, 5, 92, 20, 19, 17, 23, 16, 29, 29, 25, 92, 17, 29, 31};
    }

    static {
        A03();
        C1045Ku.A03(A02(24, 19, 95));
        A0D = new NX(Uri.parse(A02(43, 16, 88)));
    }

    public NX(Uri uri) {
        this(uri, 0, -1);
    }

    @MetaExoPlayerCustomization
    @Deprecated
    public NX(Uri uri, int i5, int i11) {
        this(uri, 0L, 1, null, Collections.emptyMap(), 0L, -1L, null, i5, new C1667e7(A02(0, 0, 64), -1L, false, -1, -1, -1, -1, false, false, i11, -1L, new C1666e6(), false, -1, -1, -1L, -1L, -1, null, -1, null, null, C1665e5.A02, -1, false, null, A02(0, 0, 64), A02(0, 0, 64), null, -1L, -1L));
    }

    @MetaExoPlayerCustomization
    @Deprecated
    public NX(Uri uri, long j11, long j12, String str) {
        this(uri, 0L, 1, null, Collections.emptyMap(), j11, j12, str, 0, new C1667e7());
    }

    private final String A00() {
        return A01(this.A01);
    }

    public static String A01(int i5) {
        switch (i5) {
            case 1:
                String[] strArr = A0C;
                if (strArr[5].charAt(22) == strArr[1].charAt(22)) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A0C;
                strArr2[5] = "bVpGc3himAyWBXgDV3GJ8JuNnF3YG4hd";
                strArr2[1] = "07oqMMKOGbODfNxa6l2jJOb5TlwAwkRZ";
                return A02(12, 3, 68);
            case 2:
                return A02(19, 4, 43);
            case 3:
                return A02(15, 4, 11);
            default:
                throw new IllegalStateException();
        }
    }

    public final NU A04() {
        return new NU(this);
    }

    @MetaExoPlayerCustomization
    public final NX A05(long j11, long j12) {
        if (j11 == 0) {
            long j13 = this.A03;
            if (A0C[4].charAt(22) != 'D') {
                throw new RuntimeException();
            }
            String[] strArr = A0C;
            strArr[0] = "TpKAAsTwxZbyFWpefvYKqDbTmEJb2";
            strArr[6] = "mMzaHO9lRjFjAfMys9W";
            if (j13 == j12) {
                return this;
            }
        }
        return new NX(this.A06, this.A05, this.A01, this.A0A, this.A09, this.A04 + j11, j12, this.A08, this.A00, new C1667e7(this.A07));
    }

    public final boolean A06(int i5) {
        return (this.A00 & i5) == i5;
    }

    @MetaExoPlayerCustomization
    public final String toString() {
        StringBuilder sbAppend = new StringBuilder().append(A02(3, 9, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE)).append(A00()).append(A02(0, 1, 30)).append(this.A06);
        String strA02 = A02(1, 2, 47);
        return sbAppend.append(strA02).append(this.A04).append(strA02).append(this.A03).append(strA02).append(this.A08).append(strA02).append(this.A00).append(strA02).append(this.A07).append(strA02).append(this.A07.A0P).append(A02(23, 1, 49)).toString();
    }
}

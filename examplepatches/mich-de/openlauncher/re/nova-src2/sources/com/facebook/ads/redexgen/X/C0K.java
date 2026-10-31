package com.facebook.ads.redexgen.X;

import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.lang.Enum;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.0K, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C0K<T extends Enum<T>> extends AbstractC05490a<T> implements InterfaceC05640p<T>, Serializable {
    public static byte[] A01;
    public static String[] A02 = {"g51k1HhHpYkj9VHfWZ", "EWWj4NKKEIgPKrjUtv88K0X8SPv0XOKR", "MYYix4VerB0hQ5oDwMWCCvMrCMkMejVr", "KXmmOsGIW251fyBFhdS6O0hRIquxh5d4", "FqRmXM6RsSdQrEmx7rTZy8IkaG5JdbxF", "xb9XSYIqlsKB21aN6AlwK9AyDPFMpn92", "G5eIpQ2zAIls9BeUM771c0Xq", "UoGRLNIkpvi"};
    public final T[] A00;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 27);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A01 = new byte[]{46, 15, 25, 15, 24, 3, 11, 6, 3, 16, 11, 30, 3, 5, 4, 74, 3, 25, 74, 25, 31, 26, 26, 5, 24, 30, 15, 14, 74, 28, 3, 11, 74, 26, 24, 5, 18, 19, 74, 5, 4, 6, 19, 66, 75, 66, 74, 66, 73, 83, 122, 113, 107, 109, 118, 122, 108};
    }

    static {
        A04();
    }

    public C0K(T[] tArr) {
        C1h.A09(tArr, A03(50, 7, 4));
        this.A00 = tArr;
    }

    private final int A00(T t6) {
        C1h.A09(t6, A03(43, 7, 60));
        int iOrdinal = t6.ordinal();
        if (((Enum) C0N.A01(this.A00, iOrdinal)) == t6) {
            return iOrdinal;
        }
        return -1;
    }

    private final int A01(T t6) {
        C1h.A09(t6, A03(43, 7, 60));
        return A00(t6);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.AbstractC05490a, java.util.List
    /* renamed from: A02, reason: merged with bridge method [inline-methods] */
    public final T get(int i5) {
        AbstractC05490a.A02.A03(i5, this.A00.length);
        return this.A00[i5];
    }

    private final boolean A05(T t6) {
        C1h.A09(t6, A03(43, 7, 60));
        Enum target = (Enum) C0N.A01(this.A00, t6.ordinal());
        return target == t6;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC05730y
    public final int A0C() {
        return this.A00.length;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC05730y, java.util.Collection, java.util.List
    public final /* bridge */ boolean contains(Object obj) {
        if (obj instanceof Enum) {
            return A05((Enum) obj);
        }
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC05490a, java.util.List
    public final /* bridge */ int indexOf(Object obj) {
        if (obj instanceof Enum) {
            return A00((Enum) obj);
        }
        return -1;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC05490a, java.util.List
    public final /* bridge */ int lastIndexOf(Object obj) {
        if (!(obj instanceof Enum)) {
            return -1;
        }
        Enum r42 = (Enum) obj;
        if (A02[1].charAt(21) != '0') {
            throw new RuntimeException();
        }
        String[] strArr = A02;
        strArr[4] = "ilUmfbZBv6Y2f9PUf49wlGdNYrlD4EkR";
        strArr[3] = "0YjmfpCo2P8nf50lJrNZDFbnB4C9VoXf";
        return A01(r42);
    }

    private final void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException(A03(0, 43, 113));
    }
}

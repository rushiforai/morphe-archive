package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.bB, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1486bB {
    public static byte[] A05;
    public static String[] A06 = {"mmPErTj", "K9ExEazTZ3WFv6SCxncreKjwLXjXCyhb", "Q3fPujAXV", "AGUF", "Y2zUmeLwNLvMuBvxTcvoXmc", "rVtHJBkiJVUXSrbBDtFS9pwh6Ga5B6g8", "l1pzjmR", "KMLDpJ7cXvrz4OGxqZ4RWojRY2dvT9L"};
    public final int A00;
    public final ZN A01;
    public final String A02;
    public final boolean A03;
    public final byte[] A04;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A06[1].charAt(8) == 'R') {
                throw new RuntimeException();
            }
            A06[5] = "x7aa6QcfJq1EkYVNe9ozivRcPlo0CTfd";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 104);
            i13++;
        }
    }

    public static void A02() {
        A05 = new byte[]{63, 54, 56, 89, 107, 107, 109, 117, 113, 118, AbstractJsonLexerKt.TC_INVALID, 56, 89, 93, 75, 53, 91, 76, 74, 56, 123, 106, 97, 104, 108, 119, 56, 117, 119, 124, 125, 54, 66, 100, 119, 117, 125, 83, 120, 117, 100, 111, 102, 98, AbstractJsonLexerKt.TC_INVALID, 121, 120, 84, 121, 110, 76, 119, 106, 108, 105, 105, 118, 107, 109, 124, 125, 57, 105, 107, 118, 109, 124, 122, 109, 112, 118, 119, 57, 106, 122, 113, 124, 116, 124, 57, 109, 96, 105, 124, 57, 62, 7, 6, 7, 85, 100, 101, 100, 116, 42, 44, 39, 42, 60, 58, 49, 44};
    }

    static {
        A02();
    }

    public C1486bB(boolean z11, String str, int i5, byte[] bArr, int i11, int i12, byte[] bArr2) {
        AbstractC1062Ln.A07((bArr2 == null) ^ (i5 == 0));
        this.A03 = z11;
        this.A02 = str;
        this.A00 = i5;
        this.A04 = bArr2;
        this.A01 = new ZN(A00(str), bArr, i11, i12);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:7:0x000c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int A00(String str) {
        char c11;
        if (str == null) {
            return 1;
        }
        switch (str.hashCode()) {
            case 3046605:
                if (!str.equals(A01(86, 4, 12))) {
                    c11 = 65535;
                    break;
                } else {
                    c11 = 2;
                    break;
                }
            case 3046671:
                if (str.equals(A01(90, 4, 111))) {
                    c11 = 3;
                    break;
                }
                break;
            case 3049879:
                if (str.equals(A01(94, 4, 33))) {
                    c11 = 0;
                    break;
                }
                break;
            case 3049895:
                if (str.equals(A01(98, 4, 55))) {
                    c11 = 1;
                    break;
                }
                break;
        }
        switch (c11) {
            case 0:
            case 1:
                break;
            case 2:
            case 3:
                break;
            default:
                MV.A07(A01(32, 18, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE), A01(50, 36, 113) + str + A01(0, 32, 112));
                break;
        }
        return 1;
    }
}

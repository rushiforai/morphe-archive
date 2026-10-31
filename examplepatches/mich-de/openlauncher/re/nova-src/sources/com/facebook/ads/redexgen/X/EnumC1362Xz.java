package com.facebook.ads.redexgen.X;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* renamed from: com.facebook.ads.redexgen.X.Xz, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class EnumC1362Xz {
    public static byte[] A01;
    public static String[] A02 = {"AE", "GdqVhwG", "E2pty4F6L2pY8xgEi08F0ThEIxbvQYM7", "bGcXHf51b7qKY2cVQuFG4hvr8nfoBqtw", "0zqu30E6twhPOlj0YvlQme6TDnHd2Dwf", "XtqT", "MPjdZYbpYME1R1FRzCZ9y0KNHKbPXSOu", "BFSocIsH3UKFU9n"};
    public static final /* synthetic */ EnumC1362Xz[] A03;
    public static final EnumC1362Xz A04;
    public static final EnumC1362Xz A05;
    public static final EnumC1362Xz A06;
    public static final EnumC1362Xz A07;
    public static final EnumC1362Xz A08;
    public static final EnumC1362Xz A09;
    public static final EnumC1362Xz A0A;
    public final String A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 15);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{12, 27, 8, 8, 11, 28, 17, 12, 11, 2, 1, 25, 17, 26, 6, 28, 11, 29, 6, 1, 2, 10, 115, 122, 103, 118, 112, 106, 112, 123, 113, 56, 57, 41, 57, 35, 34, 38, 35, 34, 41, 52, 35, 48, 48, 51, 36, 31, 4, 29, 29, 14, 23, 30, 3, 28, 16, 5, 63, 57, 62, 42, 45, 47, 41, 51, 34, 35, 56, 51, 62, 41, 45, 40, 53, 110, 117, 112, 117, 116, 108, 117, 112, 102, 110, 115, 110, 105, 96, 120, 97, 104, 117, 120, 108, 98, 126, 116, 59, 44, 63, 63, 60, 43, 6, 59, 60, 53, 54, 46, 6, 45, 49, 43, 60, 42, 49, 54, 53, 61, 118, AbstractJsonLexerKt.TC_INVALID, 98, 115, 117, 79, 117, 126, 116, 108, 109, 93, 109, 119, 118, 114, 119, 118, 93, 96, 119, 100, 100, 103, 112, 104, 115, 106, 106, 89, 96, 105, 116, 107, 103, 114, 122, 124, 123, 111, 104, 106, 108, 86, 103, 102, 125, 86, 123, 108, 104, 109, 112, 64, 91, 94, 91, 90, 66, 91, 79, 89, 81, 76, 81, 86, 95, 103, 94, 87, 74, 103, 83, 93, 65, 75};
    }

    static {
        A01();
        A09 = new EnumC1362Xz(A00(75, 7, 52), 0, A00(TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173, 7, 58));
        A07 = new EnumC1362Xz(A00(47, 11, 94), 1, A00(145, 11, 9));
        A0A = new EnumC1362Xz(A00(82, 16, 40), 2, A00(180, 16, 55));
        A06 = new EnumC1362Xz(A00(31, 16, Sdk.SDKError.Reason.TPAT_ERROR_VALUE), 3, A00(Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE, 16, 13));
        A08 = new EnumC1362Xz(A00(58, 17, 99), 4, A00(156, 17, 6));
        A05 = new EnumC1362Xz(A00(22, 9, 58), 5, A00(120, 9, 31));
        A04 = new EnumC1362Xz(A00(0, 22, 65), 6, A00(98, 22, 86));
        A03 = A02();
    }

    public EnumC1362Xz(String str, int i5, String str2) {
        this.A00 = str2;
    }

    public static /* synthetic */ EnumC1362Xz[] A02() {
        EnumC1362Xz[] enumC1362XzArr = new EnumC1362Xz[7];
        enumC1362XzArr[0] = A09;
        enumC1362XzArr[1] = A07;
        enumC1362XzArr[2] = A0A;
        enumC1362XzArr[3] = A06;
        enumC1362XzArr[4] = A08;
        EnumC1362Xz enumC1362Xz = A05;
        String[] strArr = A02;
        if (strArr[3].charAt(13) == strArr[6].charAt(13)) {
            throw new RuntimeException();
        }
        A02[4] = "Eo798DzpF8Ehy03P2RHnCXH07z0EfKCh";
        enumC1362XzArr[5] = enumC1362Xz;
        enumC1362XzArr[6] = A04;
        return enumC1362XzArr;
    }

    public static EnumC1362Xz valueOf(String str) {
        return (EnumC1362Xz) Enum.valueOf(EnumC1362Xz.class, str);
    }

    public static EnumC1362Xz[] values() {
        return (EnumC1362Xz[]) A03.clone();
    }
}

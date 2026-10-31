package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: assets/audience_network/classes.dex */
public final class RY implements InterfaceC1018Jt {
    public static byte[] A03;
    public static String[] A04 = {"32nmVqBUd6ScGXhzrcUZ2CoYZys4fj3l", "PWPCosQ00gNrcPfGN38ZB6jam7FVQo2g", "gBtlgyishh25rXcE8gQOIP5", "oRVSretvekHEc0u7ZcHL3TYeJWiha7Vu", "pugzzwsVxwFcLcrv7dmQlm5oRrud03T8", "kBBAjHcN0yNpX5mlrjNjuVcYB9m1hD3B", "m1N8vtxAtiD", "0OYDTbgdrtgr9rFtJFCT4MvdwnZYglyu"};
    public static final InterfaceC1017Js<RY> A05;
    public static final RY A06;
    public static final String A07;
    public int A00;
    public final int A01;
    public final AbstractC07549l<U8> A02;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 48);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A03 = new byte[]{81, 105, 112, 104, 117, 108, 112, 121, 60, 117, 120, 121, 114, 104, 117, AbstractJsonLexerKt.TC_INVALID, 125, 112, 60, 72, 110, 125, AbstractJsonLexerKt.TC_INVALID, 119, 91, 110, 115, 105, 108, 111, 60, 125, 120, 120, 121, 120, 60, 104, 115, 60, 115, 114, 121, 60, 72, 110, 125, AbstractJsonLexerKt.TC_INVALID, 119, 91, 110, 115, 105, 108, 93, 110, 110, 125, 101, 50, 92, 122, 105, 107, 99, 79, 122, 103, 125, 120, 73, 122, 122, 105, 113};
    }

    static {
        A03();
        A06 = new RY(new U8[0]);
        A07 = N1.A0h(0);
        A05 = new InterfaceC1017Js() { // from class: com.facebook.ads.redexgen.X.RZ
            @Override // com.facebook.ads.redexgen.X.InterfaceC1017Js
            public final InterfaceC1018Jt A7F(Bundle bundle) {
                return RY.A00(bundle);
            }
        };
    }

    public RY(U8... u8Arr) {
        this.A02 = AbstractC07549l.A07(u8Arr);
        this.A01 = u8Arr.length;
        A02();
    }

    public static /* synthetic */ RY A00(Bundle bundle) {
        ArrayList parcelableArrayList = bundle.getParcelableArrayList(A07);
        if (parcelableArrayList == null) {
            return new RY(new U8[0]);
        }
        return new RY((U8[]) C1068Lt.A01(U8.A07, parcelableArrayList).toArray(new U8[0]));
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0007 */
    /* JADX WARN: Incorrect condition in loop: B:7:0x0011 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A02() {
        for (int i5 = 0; i5 < i; i5++) {
            for (int i11 = i5 + 1; i11 < i; i11++) {
                boolean zEquals = this.A02.get(i5).equals(this.A02.get(i11));
                String[] strArr = A04;
                String str = strArr[0];
                String str2 = strArr[5];
                int j11 = str.charAt(23);
                int i12 = str2.charAt(23);
                if (j11 != i12) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A04;
                strArr2[1] = "OaUuQcLcnGshcJMYkzCqCN2DspTcMkyf";
                strArr2[3] = "EIzHMAunraDOcgjXYUoXQzUwWy5yr8uP";
                if (zEquals) {
                    MV.A08(A01(60, 15, 56), A01(0, 0, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE), new IllegalArgumentException(A01(0, 60, 44)));
                }
            }
        }
    }

    public final int A04(U8 u82) {
        int index = this.A02.indexOf(u82);
        if (index >= 0) {
            return index;
        }
        return -1;
    }

    public final U8 A05(int i5) {
        return this.A02.get(i5);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        String[] strArr = A04;
        if (strArr[0].charAt(23) != strArr[5].charAt(23)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A04;
        strArr2[0] = "mi6i1C7pUp0AwcX8yxLD7WeY5ZX2gm87";
        strArr2[5] = "n7jobHx1WufBwwMu40rfALLYWmGr4Z4E";
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        RY ry2 = (RY) obj;
        return this.A01 == ry2.A01 && this.A02.equals(ry2.A02);
    }

    public final int hashCode() {
        if (this.A00 == 0) {
            this.A00 = this.A02.hashCode();
        }
        return this.A00;
    }
}

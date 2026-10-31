package com.facebook.ads.redexgen.X;

import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.text.TextUtils;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: assets/audience_network/classes.dex */
public abstract class MH extends AbstractC1701ef {
    public static String A04;
    public static String A05;
    public static String A06;
    public static byte[] A07;
    public static String[] A08 = {"1", "OJ2IOsbUnCKybSqk53zM3JXcifahO", "e4RldewFXKwYCBzcZ5CwWZ5XjhlRHNiJ", "729G42gqUNiz5ZAUAxRhvFZ2YWMhTd0L", "J1Ql0tv9onNfDvsMKNTgjNyaDa6Pnzub", "9fBm", "mbPUpspz4Nj5AFGqwEe2w9x9WWs", "2uSYGuFAJgr"};
    public int A00;
    public final boolean A01;
    public final C1707em A02;
    public final boolean A03;

    public static String A0A(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A07, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 30);
            if (A08[3].charAt(0) != '7') {
                throw new RuntimeException();
            }
            A08[5] = "PWjD";
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0B() {
        A07 = new byte[]{93, 114, 119, 125, 117, 62, 114, 113, 121, 121, 123, 122, 68, 75, 65, 87, 74, 76, 65, 11, 76, 75, 81, 64, 75, 81, 11, 68, 70, 81, 76, 74, 75, 11, 115, 108, 96, 114, 24, 27, 25, 17, 37, 14, 19, 23, 31, 46, 39, 35, 52, 39, 29, 54, 43, 47, 39, 11, 17, 16, 7, 11, 9, 1, 37, 35, 53, 53, 51, 37, 37, 76, 87, 80, 79, 92, 75, 74, 88, 85, 102, 85, 80, 87, 82, 89, 95, 73, 94, 115, 88, 94, 77, 79, 71, 73, 94, 115, 69, 95, 115, 66, 67, 88, 115, 66, 89, 64, 64, 73, 79, 89, 78, 95, 80, 85, 95, 87, 96, 118, 99, 116, AbstractJsonLexerKt.TC_INVALID, 72, 118, 121, 115, 72, 117, 101, 120, 96, 100, 114};
    }

    public abstract EnumC1698ec A0J();

    static {
        A0B();
        A04 = A0A(64, 7, 72);
        A05 = A0A(85, 24, 50);
        A06 = A0A(Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE, 16, 9);
    }

    public MH(C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, String str, C1707em c1707em, boolean z11) {
        this(c0958Hi, interfaceC2224nG, str, c1707em, z11, false);
    }

    public MH(C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, String str, C1707em c1707em, boolean z11, boolean z12) {
        super(c0958Hi, interfaceC2224nG, str);
        this.A00 = 0;
        this.A02 = c1707em;
        this.A03 = z11;
        this.A01 = z12;
        if (this.A02 != null) {
            this.A02.A07(new InterfaceC1700ee() { // from class: com.facebook.ads.redexgen.X.MI
                @Override // com.facebook.ads.redexgen.X.InterfaceC1700ee
                public final void AGh() {
                    this.A00.A0K();
                }
            });
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1701ef
    public final EnumC1698ec A0G(String str) {
        if (this.A02 != null) {
            this.A02.A08(super.A03);
        }
        if (C2644u8.A05(super.A01)) {
            EnumC1698ec enumC1698ec = EnumC1698ec.A05;
            if (A08[1].length() != 32) {
                A08[6] = "d9";
                return enumC1698ec;
            }
        } else {
            boolean zA0N = A0N(str);
            String[] strArr = A08;
            if (strArr[2].charAt(18) != strArr[4].charAt(18)) {
                A08[1] = "2xR5Lf7zvGoOc6k6N0KJGWYDjft65vIkC";
                if (zA0N) {
                    return EnumC1698ec.A05;
                }
                return A0J();
            }
        }
        throw new RuntimeException();
    }

    public final /* synthetic */ void A0K() {
        this.A00++;
        if (A0N(null) && super.A00 != null) {
            super.A00.ADg();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0082  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A0L(Map<String, String> extraData, EnumC1698ec enumC1698ec) {
        if (!TextUtils.isEmpty(super.A03)) {
            if (this instanceof C07307w) {
                super.A02.ACy(super.A03, extraData);
            } else {
                InterfaceC2224nG interfaceC2224nG = super.A02;
                String str = super.A03;
                if (A08[6].length() != 8) {
                    A08[5] = "D2ZF";
                    interfaceC2224nG.ACA(str, extraData);
                } else {
                    interfaceC2224nG.ACA(str, extraData);
                }
            }
            boolean zA02 = EnumC1698ec.A02(enumC1698ec);
            if (A08[1].length() == 32) {
                throw new RuntimeException();
            }
            A08[0] = "X";
            boolean z11 = this.A02 != null;
            boolean isError = C2203mv.A2W(super.A01);
            if (isError) {
                Map<String, String> navigationDataMap = new HashMap<>();
                boolean isError2 = !zA02;
                navigationDataMap.put(A04, Boolean.toString(isError2));
                navigationDataMap.put(A05, Boolean.toString(z11));
                String str2 = A06;
                boolean isError3 = this.A01;
                navigationDataMap.put(str2, Boolean.toString(isError3));
                super.A02.ACb(super.A03, navigationDataMap);
            }
            if (this.A02 != null) {
                this.A02.A06(enumC1698ec);
                if (A08[6].length() != 8) {
                    A08[6] = "4hYdj7INWre5bef3R1byHGHBMmQCX";
                    if (zA02) {
                        C1707em c1707em = this.A02;
                        if (A08[6].length() != 8) {
                            String[] strArr = A08;
                            strArr[2] = "42brCgECckKxVuTsLxKp6fXlInYi7mUj";
                            strArr[4] = "SJ7s8Rg0tKhfkKPQamVQVBa2w2xrx0QV";
                            c1707em.A05();
                        } else {
                            c1707em.A05();
                        }
                    }
                } else {
                    A08[5] = "IMSq";
                    if (zA02) {
                    }
                }
            } else {
                HashMap map = new HashMap();
                map.put(A0A(47, 10, 92), Long.toString(-1L));
                map.put(A0A(38, 9, 100), Long.toString(-1L));
                map.put(A0A(57, 7, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE), EnumC1698ec.A04.name());
                super.A02.ACz(super.A03, map);
            }
        }
        AbstractC2358pW.A04(super.A01, A0A(0, 12, 0));
    }

    public final boolean A0M(Uri uri) {
        try {
            String queryParameter = uri.getQueryParameter(A0A(71, 14, 39));
            boolean redirectedToApp = TextUtils.isEmpty(queryParameter);
            if (redirectedToApp) {
                return false;
            }
            Intent intent = new Intent(A0A(12, 26, 59), AbstractC2351pP.A00(queryParameter));
            intent.addFlags(268435456);
            if (Build.VERSION.SDK_INT >= 30) {
                intent.addFlags(1024);
            }
            return C2337p8.A0F(super.A01, intent);
        } catch (C2335p6 unused) {
            return false;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x002d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean A0N(String str) {
        if (str != null) {
            String[] strArr = A08;
            if (strArr[2].charAt(18) == strArr[4].charAt(18)) {
                throw new RuntimeException();
            }
            A08[3] = "7G1cJQr0jIuGleknkY04jEhD0A31LjuP";
            if (!str.equals(A0A(109, 9, 34))) {
                if (this.A00 != 0 && this.A00 >= C2203mv.A0G(super.A01)) {
                    return true;
                }
            }
        }
        return false;
    }
}

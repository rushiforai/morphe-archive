package com.facebook.ads.redexgen.X;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: assets/audience_network/classes.dex */
public class AK implements InterfaceC1421a7 {
    public static byte[] A05;
    public static String[] A06 = {"yJwczGSbba5UrkwzZOW60Je1LUoZxQIl", "oZp", "SLRT1bjVboXCxkvYGWPu27FVIHxKKecJ", "WHpvXVjPup", b.f42142b, "gRWAa43vtpEz38T6Kt4HiTmitjJp6SmI", b.f42142b, "QpBNbg2dQWhW"};
    public JSONObject A00;
    public JSONObject A01;
    public final EnumC1407Zt A03;
    public final List<InterfaceC1404Zq> A04 = new ArrayList();
    public boolean A02 = false;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 27);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        if (A06[7].length() != 12) {
            throw new RuntimeException();
        }
        A06[3] = "GbTE4j9vTw";
        A05 = new byte[]{58, 13, 22, 28, 20, 29, 88, 93, 11, 88, 28, 25, 12, 25, 88, 13, 8, 28, 25, 12, 29, 66, 114, 82, 82, 88, 28, 25, 12, 25, 88, 82, 82, 114, 93, 11, 114, 82, 82, 88, 30, 17, 22, 31, 29, 10, 8, 10, 17, 22, 12, 88, 82, 82, 114, 93, 11, 89, 110, 117, AbstractJsonLexerKt.TC_INVALID, 119, 126, 59, 115, 122, 104, 59, 117, 116, 59, 125, 114, 117, 124, 126, 105, 107, 105, 114, 117, 111, 32, 23, 12, 6, 14, 7, 66, 11, 17, 66, 12, 13, 22, 66, 16, 7, 3, 6, 27, 43, 46, 59, 46, 111, 114, 114, 111, 33, 58, 35, 35, 107, 100, 99, 106, 104, AbstractJsonLexerKt.TC_INVALID, 125, AbstractJsonLexerKt.TC_INVALID, 100, 99, 121, 45, 44, 48, 45, 99, 120, 97, 97, 125, 114, 117, 124, 126, 105, 107, 105, 114, 117, 111, 59, 38, 38, 59, 117, 110, 119, 119, 77, 86, 79, 79};
    }

    static {
        A01();
    }

    public AK(EnumC1407Zt enumC1407Zt) {
        this.A03 = enumC1407Zt;
    }

    private boolean A02(JSONObject jSONObject, JSONObject jSONObject2) {
        if (jSONObject == null && jSONObject2 == null) {
            return false;
        }
        if (jSONObject == null || jSONObject2 == null) {
            return true;
        }
        boolean zA02 = AbstractC1428aF.A02(jSONObject, jSONObject2);
        String[] strArr = A06;
        if (strArr[0].charAt(8) != strArr[2].charAt(8)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A06;
        strArr2[4] = b.f42142b;
        strArr2[6] = b.f42142b;
        return true ^ zA02;
    }

    public final synchronized boolean A03(JSONObject jSONObject, JSONObject jSONObject2) {
        if (jSONObject != null) {
            if (jSONObject2 == null && this.A03.A05()) {
                throw new IllegalArgumentException(A00(Sdk.SDKError.Reason.OMSDK_DOWNLOAD_JS_ERROR_VALUE, 19, 0));
            }
            if (jSONObject2 == null || this.A03.A05()) {
                if (!A02(this.A01, jSONObject2) && !A02(this.A00, jSONObject)) {
                    return false;
                }
                this.A00 = jSONObject;
                this.A01 = jSONObject2;
                this.A02 = true;
                Iterator<InterfaceC1404Zq> it = this.A04.iterator();
                while (it.hasNext()) {
                    it.next().A5I();
                }
                try {
                    String.format(Locale.US, A00(0, 57, 99), this.A03, this.A00 == null ? A00(151, 4, 56) : this.A00.toString(2), this.A01 == null ? A00(151, 4, 56) : this.A01.toString(2));
                } catch (JSONException unused) {
                }
                return true;
            }
            throw new IllegalArgumentException(A00(113, 19, 22));
        }
        throw new IllegalArgumentException(A00(101, 12, 84));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1421a7
    public final synchronized void A4R(InterfaceC1404Zq interfaceC1404Zq) {
        this.A04.add(interfaceC1404Zq);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1421a7
    public final synchronized JSONObject A8J() {
        if (this.A00 != null) {
        } else {
            throw new IllegalStateException(A00(82, 19, Sdk.SDKError.Reason.TPAT_ERROR_VALUE));
        }
        return this.A00;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1421a7
    public final synchronized JSONObject A8j() {
        if (this.A03.A05()) {
            if (this.A01 != null) {
            } else {
                throw new IllegalStateException(A00(82, 19, Sdk.SDKError.Reason.TPAT_ERROR_VALUE));
            }
        } else {
            throw new IllegalStateException(A00(57, 25, 0));
        }
        return this.A01;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1421a7
    public final EnumC1407Zt A8r() {
        return this.A03;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1421a7
    public final synchronized boolean ABM() {
        return this.A02;
    }
}

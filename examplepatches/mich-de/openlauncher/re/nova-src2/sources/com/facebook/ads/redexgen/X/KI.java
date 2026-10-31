package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import com.facebook.ads.AdExperienceType;
import com.facebook.ads.internal.dynamicloading.DynamicLoaderFactory;
import com.facebook.ads.internal.protocol.AdErrorType;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: assets/audience_network/classes.dex */
public abstract class KI implements InterfaceC2287oJ {
    public static byte[] A0D;
    public static String[] A0E = {"4yJhIog9RzpC9w4XHjq79o6hmz2pMXrt", "bLneqHgNlbzxjE", "P7gevZ65hMGDm5VmgpkLcWEi46YxYduR", "Pajg2XTKXpS0pN0AoGLcPnQoa2IWF6Z7", "YyJRdl3XxpBTstTmsw", "OvgbPt0JG7dlaj99kqPbJKVmb9CPKTVr", "21VbiQWRKHmC0d4xB3zoTsbqXtN2ZOxw", "Q3Y9mBD7X4l0uaedlY7FP5X0xCsXbtIX"};
    public static final C1713es A0F = null;
    public static final C2288oK A0G = null;
    public static final Handler A0H;
    public InterfaceC1708en A00;
    public InterfaceC1708en A01;
    public C2145ly A04;
    public C2285oH A05;
    public C2288oK A06;
    public AbstractC1709eo A07;
    public final C1781fy A08;
    public final InterfaceC2224nG A09;
    public final C1713es A0A;
    public final C0958Hi A0B;
    public volatile boolean A0C;
    public long A03 = -1;
    public String A02 = null;

    public static String A07(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0D, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 8);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A08() {
        A0D = new byte[]{75, 110, 107, 122, 126, 111, 120, 42, 110, 101, 111, 121, 42, 100, 101, 126, 42, 111, 114, 99, 121, 126, 78, 107, 110, AbstractJsonLexerKt.TC_INVALID, 123, 106, 125, 47, 102, 124, 47, 97, 122, 99, 99, 47, 39, 108, 103, 110, 102, 97, 47, 97, 96, 123, 47, 99, 96, 110, 107, 106, 107, 38, 57, 28, 25, 8, 12, 29, 10, 88, 17, 11, 88, 22, 13, 20, 20, 88, 80, 27, 16, 25, 17, 22, 29, 28, 81, 45, 8, 13, 28, 24, 9, 30, 76, 5, 31, 76, 2, 25, 0, 0, 76, 68, 2, 3, 76, 15, 4, 13, 5, 2, 69, 78, 107, 110, AbstractJsonLexerKt.TC_INVALID, 123, 106, 125, 47, 102, 124, 47, 97, 122, 99, 99, 47, 96, 97, 47, 124, 123, 110, 125, 123, 78, 107, 5, 36, 107, 38, 36, 57, 46, 107, 42, 47, 107, 40, 42, 37, 47, 34, 47, 42, 63, 46, 56, 101, 122, 95, 66, 67, 74, 13, 76, 73, 76, 93, 89, 72, 95, 13, 89, 84, 93, 72, 3, 46, 43, 111, 46, 35, 61, 42, 46, 43, 54, 111, 60, 59, 46, 61, 59, 42, 43, 94, 91, 76, 52, 37, 60, 26, 17, 24, 16, 23, 38, 9, 24, 11, 24, 20, 10, 76, 91, 74, 79, 90, 79, 97, 76, 68, 75, 77, 90, 14, 71, 93, 14, 64, 91, 66, 66, 38, 45, 32, 49, 58, 51, 55, 38, 39, 28, 42, 39, 122, 113, 105, 118, 109, 112, 113, 114, 122, 113, 107, 63, 118, 108, 63, 122, 114, 111, 107, 102, 38, 50, 37, 49, 53, 37, 46, 35, 57, 31, 35, 33, 48, 48, 41, 46, 39, 28, 27, 3, 20, 25, 28, 17, 85, 5, 25, 20, 22, 16, 24, 16, 27, 1, 85, 28, 27, 85, 7, 16, 6, 5, 26, 27, 6, 16, 10, 9, 7, 2, 57, 18, 15, 11, 3, 57, 11, 21, 44, 59, 47, 43, 59, 45, 42, 1, 55, 58};
    }

    public abstract void A0O();

    public abstract void A0Q(InterfaceC1708en interfaceC1708en, C2145ly c2145ly, C2143lw c2143lw, C1782fz c1782fz);

    static {
        A08();
        AbstractC2428qe.A02();
        A0H = new Handler(Looper.getMainLooper());
    }

    public KI(C0958Hi c0958Hi, C1781fy c1781fy) {
        this.A0B = c0958Hi;
        this.A08 = c1781fy;
        if (A0G != null) {
            this.A06 = A0G;
        } else {
            this.A06 = new C2288oK(this.A0B);
        }
        this.A06.A0R(this);
        if (A0F != null) {
            this.A0A = A0F;
        } else {
            this.A0A = new C1713es();
        }
        DynamicLoaderFactory.makeLoader(this.A0B).getInitApi().onAdLoadInvoked(this.A0B);
        this.A09 = c0958Hi.A0A();
        this.A0B.A0F().A6D();
    }

    private void A09(C2145ly c2145ly) {
        this.A0B.A0F().AKk(c2145ly.A0G());
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x012d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A0A(GG gg2) throws JSONException {
        C2145ly placement = gg2.A00();
        if (placement == null || placement.A05() == null) {
            String strA07 = A07(279, 29, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE);
            C2262nt c2262nt = new C2262nt(AdErrorType.NO_AD_PLACEMENT, strA07);
            this.A0B.A0F().A6F(c2262nt.A03().getErrorCode(), strA07);
            if (this.A07 != null) {
                AbstractC1709eo abstractC1709eo = this.A07;
                if (A0E[6].charAt(21) == '6') {
                    throw new RuntimeException();
                }
                String[] strArr = A0E;
                strArr[4] = "hfobwSBumZGDhQ4bXq";
                strArr[1] = "msoQnE8enpyN8f";
                abstractC1709eo.A0G(c2262nt);
                return;
            }
            return;
        }
        this.A04 = placement;
        this.A00 = null;
        C2145ly c2145ly = this.A04;
        JSONObject jSONObjectA0D = c2145ly.A0D();
        String strA072 = A07(195, 3, 93);
        if (jSONObjectA0D == null) {
            C2143lw c2143lwA04 = c2145ly.A04();
            if (!A0E(c2145ly, c2143lwA04)) {
                return;
            }
            if (this.A00 == null) {
                this.A0B.A08().ABz(strA072, AbstractC2126lf.A0a, new C2127lg(A07(81, 26, 100), c2143lwA04.A02()));
                AEr(C2262nt.A00(AdErrorType.INTERNAL_ERROR));
                return;
            }
            A0Q(this.A00, c2145ly, c2143lwA04, new C1782fz(c2143lwA04.A04(), c2145ly.A05(), this.A08.A0A, c2145ly.A05().A0C()));
        } else {
            ArrayList arrayList = new ArrayList();
            C2143lw c2143lwA042 = c2145ly.A04();
            do {
                if (arrayList.isEmpty()) {
                    if (A0E(c2145ly, c2143lwA042)) {
                        arrayList.add(c2143lwA042);
                    } else {
                        return;
                    }
                } else {
                    boolean zA0D = A0D(c2143lwA042);
                    if (A0E[2].charAt(5) == 'Z') {
                        String[] strArr2 = A0E;
                        strArr2[4] = "D4dH5FuixlBYVHNYJB";
                        strArr2[1] = "4bAHADqJrSynaw";
                        if (zA0D) {
                        }
                    } else if (zA0D) {
                        arrayList.add(c2143lwA042);
                    }
                }
                c2143lwA042 = c2145ly.A04();
            } while (c2143lwA042 != null);
            if (this.A00 == null) {
                this.A0B.A08().ABz(strA072, AbstractC2126lf.A0a, new C2127lg(A07(56, 25, 112), ((C2143lw) arrayList.get(0)).A02()));
                AEr(C2262nt.A00(AdErrorType.INTERNAL_ERROR));
                return;
            }
            boolean z11 = false;
            try {
                if (arrayList.size() > 1 && this.A00 != null && this.A00.ALe()) {
                    JSONObject jSONObject = new JSONObject();
                    JSONArray jSONArray = new JSONArray();
                    Iterator it = arrayList.iterator();
                    while (it.hasNext()) {
                        jSONArray.put(((C2143lw) it.next()).A04());
                    }
                    jSONObject.put(A07(192, 3, 55), jSONArray);
                    jSONObject.put(A07(198, 12, 113), c2145ly.A0D());
                    A0Q(this.A00, c2145ly, c2143lwA042, new C1782fz(jSONObject, c2145ly.A05(), this.A08.A0A, c2145ly.A05().A0C()));
                    z11 = true;
                }
            } catch (Exception unused) {
                z11 = false;
            }
            if (!z11) {
                if (arrayList.isEmpty()) {
                    C2262nt c2262ntA01 = C2262nt.A01(AdErrorType.NO_FILL, A07(0, 0, 73));
                    this.A0B.A0F().A6F(c2262ntA01.A03().getErrorCode(), A07(Sdk.SDKError.Reason.OMSDK_JS_WRITE_FAILED_VALUE, 22, 67));
                    if (this.A07 != null) {
                        this.A07.A0G(c2262ntA01);
                        return;
                    }
                    return;
                }
                if (this.A00 == null) {
                    this.A0B.A08().ABz(strA072, AbstractC2126lf.A0a, new C2127lg(A07(22, 34, 7), ((C2143lw) arrayList.get(0)).A02()));
                    AEr(C2262nt.A00(AdErrorType.INTERNAL_ERROR));
                    return;
                }
                C2143lw c2143lw = (C2143lw) arrayList.get(0);
                A0Q(this.A00, c2145ly, c2143lw, new C1782fz(c2143lw.A04(), c2145ly.A05(), this.A08.A0A, c2145ly.A05().A0C()));
            }
        }
        A09(placement);
    }

    private final void A0B(String str, AdExperienceType adExperienceType) {
        this.A0B.A0F().A6G(str != null);
        this.A03 = System.currentTimeMillis();
        try {
            C2269o1 bidPayload = new C2269o1(this.A0B, str, this.A08.A0A, this.A08.A09);
            this.A05 = this.A08.A00(this.A0B, bidPayload, adExperienceType);
            if (this.A06 != null) {
                this.A06.A0Q(this.A05);
            }
        } catch (C2263nu e3) {
            AEr(C2262nt.A02(e3));
        }
    }

    private void A0C(JSONObject jSONObject) {
        if (jSONObject != null) {
            this.A02 = jSONObject.optString(A07(230, 12, 75));
            C1715eu.A01(this.A0B).A0O(jSONObject);
        }
    }

    private boolean A0D(C2143lw c2143lw) {
        return (c2143lw == null || c2143lw.A04() == null) ? false : true;
    }

    private boolean A0E(C2145ly c2145ly, C2143lw c2143lw) {
        String strA07 = A07(0, 0, 73);
        if (c2143lw == null) {
            C2262nt c2262ntA01 = C2262nt.A01(AdErrorType.NO_FILL, strA07);
            this.A0B.A0F().A6F(c2262ntA01.A03().getErrorCode(), A07(Sdk.SDKError.Reason.OMSDK_JS_WRITE_FAILED_VALUE, 22, 67));
            if (this.A07 != null) {
                AbstractC1709eo abstractC1709eo = this.A07;
                String[] strArr = A0E;
                if (strArr[7].charAt(9) == strArr[3].charAt(9)) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A0E;
                strArr2[7] = "7nYL2NF6M0xF4EMWgzzLH5X7HNcHVA2i";
                strArr2[3] = "4zdAiZz94ZfdEW2uI31voJBW941pIR5b";
                abstractC1709eo.A0G(c2262ntA01);
            }
            return false;
        }
        String strA02 = c2143lw.A02();
        InterfaceC1708en interfaceC1708enA00 = this.A0A.A00(this.A0B, c2145ly.A05().A0D());
        if (interfaceC1708enA00 == null) {
            this.A0B.A08().ABz(A07(195, 3, 93), AbstractC2126lf.A0a, new C2127lg(A07(0, 22, 2), strA02));
            AEr(C2262nt.A00(AdErrorType.INTERNAL_ERROR));
            return false;
        }
        if (!this.A08.A01().contains(interfaceC1708enA00.A9N())) {
            C2262nt c2262ntA012 = C2262nt.A01(AdErrorType.INTERNAL_ERROR, strA07);
            this.A0B.A0F().A6F(c2262ntA012.A03().getErrorCode(), A07(155, 19, 37));
            if (this.A07 != null) {
                this.A07.A0G(c2262ntA012);
            }
            return false;
        }
        this.A00 = interfaceC1708enA00;
        JSONObject jSONObjectA04 = c2143lw.A04();
        if (jSONObjectA04 != null) {
            String strOptString = jSONObjectA04.optString(A07(Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE, 10, 86));
            this.A0B.A0F().AL2(strOptString);
            this.A0B.A0D(strOptString);
            C0957Hh c0957HhA00 = AbstractC2094l9.A00();
            if (c0957HhA00 != null) {
                c0957HhA00.A0D(strOptString);
            }
            JSONObject dataObject = jSONObjectA04.optJSONObject(A07(262, 17, 72));
            A0C(dataObject);
            if (this.A05 == null) {
                String strA072 = A07(242, 20, 23);
                C2262nt c2262ntA013 = C2262nt.A01(AdErrorType.UNKNOWN_ERROR, strA072);
                this.A0B.A0F().A6F(c2262ntA013.A03().getErrorCode(), strA072);
                if (this.A07 != null) {
                    this.A07.A0G(c2262ntA013);
                }
                return false;
            }
            return true;
        }
        String strA073 = A07(Sdk.SDKError.Reason.PLACEMENT_SLEEP_VALUE, 18, 38);
        C2262nt c2262ntA014 = C2262nt.A01(AdErrorType.UNKNOWN_ERROR, strA073);
        this.A0B.A0F().A6F(c2262ntA014.A03().getErrorCode(), strA073);
        if (this.A07 != null) {
            this.A07.A0G(c2262ntA014);
        }
        return false;
    }

    public final long A0F() {
        if (this.A04 != null) {
            return this.A04.A03();
        }
        return -1L;
    }

    public final Handler A0G() {
        return A0H;
    }

    public AbstractC1734fD A0H() {
        if (this.A01 == null) {
            return null;
        }
        LG lg2 = (LG) this.A01;
        String[] strArr = A0E;
        if (strArr[0].charAt(1) == strArr[5].charAt(1)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0E;
        strArr2[7] = "5bjG0IlN5e6ox7gGPwyNsTo6l8HjLpNA";
        strArr2[3] = "l5hnmXhlsnMB98vwFTttotkGHt3lxhSt";
        return lg2.A0J();
    }

    public final C2146lz A0I() {
        if (this.A04 == null) {
            return null;
        }
        return this.A04.A05();
    }

    public final void A0J() {
        if (!C2203mv.A1v(this.A0B)) {
            return;
        }
        if (this.A01 != null) {
            C2328oz.A00(this.A0B).A0D(this.A01.A9N().toString(), this.A01.A7z());
        }
        if (this.A06 != null) {
            this.A06.A0R(null);
            this.A06 = null;
        }
        this.A07 = null;
        this.A00 = null;
        this.A01 = null;
    }

    public final void A0K() {
        String strA7z;
        this.A0B.A0F().A3n(C2416qS.A01(this.A03));
        if (this.A01 == null || (strA7z = this.A01.A7z()) == null) {
            return;
        }
        HashMap map = new HashMap();
        String strA05 = C2416qS.A05(this.A03);
        String clientToken = A07(Sdk.SDKError.Reason.AD_WIN_NOTIFICATION_ERROR_VALUE, 12, 110);
        map.put(clientToken, strA05);
        new C2232nO(strA7z, this.A09).A04(EnumC2231nN.A08, map);
    }

    public final void A0L() {
        InterfaceC1708en interfaceC1708en = this.A01;
        String strA07 = A07(195, 3, 93);
        if (interfaceC1708en == null) {
            String strA072 = A07(107, 26, 7);
            this.A0B.A08().ABz(strA07, AbstractC2126lf.A0Q, new C2127lg(strA072));
            AdErrorType adErrorType = AdErrorType.INTERNAL_ERROR;
            this.A0B.A0F().A6F(adErrorType.getErrorCode(), strA072);
            if (this.A07 != null) {
                AbstractC1709eo abstractC1709eo = this.A07;
                String errorMessage = adErrorType.getDefaultErrorMessage();
                abstractC1709eo.A0G(C2262nt.A01(adErrorType, errorMessage));
            }
            this.A0B.A0F().A6I();
            return;
        }
        if (this.A0C) {
            String strA073 = A07(174, 18, 71);
            this.A0B.A08().ABz(strA07, AbstractC2126lf.A0M, new C2127lg(strA073));
            AdErrorType adErrorType2 = AdErrorType.AD_ALREADY_STARTED;
            this.A0B.A0F().A6F(adErrorType2.getErrorCode(), strA073);
            if (this.A07 != null) {
                AbstractC1709eo abstractC1709eo2 = this.A07;
                String errorMessage2 = adErrorType2.getDefaultErrorMessage();
                abstractC1709eo2.A0G(C2262nt.A01(adErrorType2, errorMessage2));
            }
            this.A0B.A0F().A6H();
            return;
        }
        if (!TextUtils.isEmpty(this.A01.A7z())) {
            this.A09.ACq(this.A01.A7z());
        }
        this.A0B.A0F().A6J();
        this.A0C = true;
        A0O();
    }

    public final void A0M() {
        A0X(false);
    }

    public final void A0N() {
        if (this.A02 != null) {
            C1715eu.A01(this.A0B).A0N(this.A02);
        }
    }

    public final void A0P(InterfaceC1708en interfaceC1708en) {
        if (interfaceC1708en != null) {
            interfaceC1708en.onDestroy();
        }
    }

    public final void A0R(AbstractC1709eo abstractC1709eo) {
        this.A07 = abstractC1709eo;
    }

    public final void A0S(C1782fz c1782fz) {
        A0U(c1782fz.A03().optString(A07(Sdk.SDKError.Reason.AD_NOT_LOADED_VALUE, 2, 39)));
    }

    public void A0T(String str) {
        A0B(str, null);
    }

    public final void A0U(String str) {
        this.A0B.A0F().A6C();
        if (!TextUtils.isEmpty(str)) {
            new C2232nO(str, this.A09).A04(EnumC2231nN.A04, null);
        }
    }

    public final void A0V(String str) {
        A0T(str);
    }

    public final void A0W(String str, AdExperienceType adExperienceType) {
        A0B(str, adExperienceType);
    }

    public void A0X(boolean z11) {
        if (!z11 && !this.A0C) {
            return;
        }
        this.A0B.A0F().A6K();
        A0P(this.A01);
        this.A0C = false;
    }

    public final boolean A0Y() {
        return this.A04 == null || this.A04.A0H();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2287oJ
    public final synchronized void AEr(C2262nt c2262nt) {
        A0G().post(new KJ(this, c2262nt));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2287oJ
    public final synchronized void AHE(GG gg2) {
        try {
            A0A(gg2);
        } catch (Exception e3) {
            this.A0B.A08().ABz(A07(195, 3, 93), AbstractC2126lf.A0T, new C2127lg(e3));
        }
    }
}

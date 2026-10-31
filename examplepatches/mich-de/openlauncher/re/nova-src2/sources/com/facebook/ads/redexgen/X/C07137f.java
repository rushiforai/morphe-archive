package com.facebook.ads.redexgen.X;

import android.view.View;
import com.facebook.ads.internal.protocol.AdErrorType;
import com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.7f, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C07137f extends KI {
    public static byte[] A03;
    public long A00;
    public View A01;
    public C7D A02;

    static {
        A05();
    }

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 12);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A03 = new byte[]{60, 57, 46, 41, 42, 37, 37, 46, 57, 20, 57, 46, 45, 57, 46, 56, 35, 20, 63, 34, 38, 46, 4, 15, 6, 14, 9, 56, 23, 6, 21, 6, 10, 20, 3, 20, 109, 122, 122, 103, 122, 40, AbstractJsonLexerKt.TC_INVALID, 96, 97, 100, 109, 40, 120, 105, 122, 123, 97, 102, 111, 40, 107, 96, 105, 97, 102, 109, 108, 40, 105, 108, 123, 40, 74, 105, 102, 102, 109, 122};
    }

    public C07137f(C7D c7d, C1781fy c1781fy) {
        super(c7d, c1781fy);
        this.A00 = h.f42227c;
        this.A02 = c7d;
    }

    private KL A01(Runnable runnable) {
        return new KL(this, runnable);
    }

    private List<JSONObject> A04(C1782fz c1782fz) throws JSONException {
        ArrayList arrayList = new ArrayList();
        JSONObject jSONObjectA03 = c1782fz.A03();
        if (jSONObjectA03.has(A03(22, 12, 107))) {
            try {
                this.A00 = jSONObjectA03.getJSONObject(r1).optInt(A03(3, 19, 71), 10000);
                JSONArray adsArray = jSONObjectA03.getJSONArray(A03(0, 3, 81));
                if (adsArray.length() > 0) {
                    for (int i5 = 0; i5 < adsArray.length(); i5++) {
                        arrayList.add((JSONObject) adsArray.get(i5));
                    }
                }
            } catch (JSONException unused) {
                String strA03 = A03(36, 38, 4);
                this.A02.A0F().A6F(C2262nt.A01(AdErrorType.UNKNOWN_ERROR, strA03).A03().getErrorCode(), strA03);
                return arrayList;
            }
        } else {
            arrayList.add(jSONObjectA03);
        }
        return arrayList;
    }

    private void A06(MA ma2, JSONObject jSONObject, C2146lz c2146lz) {
        this.A0C = false;
        KK kk2 = new KK(this, ma2, AbstractC2392q4.A02(jSONObject, A03(34, 2, 108)));
        A0G().postDelayed(kk2, c2146lz.A05());
        if (this.A08.A08 != null) {
            ma2.ABb(this.A02, this.A09, this.A08.A08, A01(kk2), jSONObject, c2146lz);
        }
    }

    @Override // com.facebook.ads.redexgen.X.KI
    public final void A0O() {
        if (this.A01 != null) {
            this.A02.A0F().A55();
            if (this.A07 != null) {
                this.A07.A0E(this.A01);
                return;
            }
            return;
        }
        this.A02.A0F().A56();
    }

    @Override // com.facebook.ads.redexgen.X.KI
    public final void A0Q(InterfaceC1708en interfaceC1708en, C2145ly c2145ly, C2143lw c2143lw, final C1782fz c1782fz) throws JSONException {
        this.A02.A0F().A4z();
        final MA ma2 = (MA) interfaceC1708en;
        if (ma2.ALe()) {
            final List<JSONObject> listA04 = A04(c1782fz);
            A06(ma2, listA04.get(0), c1782fz.A01());
            if (listA04.size() > 1) {
                A0G().postDelayed(new Runnable() { // from class: com.facebook.ads.redexgen.X.g0
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.A02.A0Z(ma2, listA04, c1782fz);
                    }
                }, this.A00);
                return;
            }
            return;
        }
        A06(ma2, c1782fz.A03(), c1782fz.A01());
    }

    @Override // com.facebook.ads.redexgen.X.KI
    public final void A0T(String str) {
        this.A02.A0F().A54(str != null);
        super.A0T(str);
    }

    @Override // com.facebook.ads.redexgen.X.KI
    public final void A0X(boolean z11) {
        super.A0X(z11);
        this.A01 = null;
    }

    public final /* synthetic */ void A0Z(MA ma2, List list, C1782fz c1782fz) {
        A06(ma2, (JSONObject) list.get(1), c1782fz.A01());
    }
}

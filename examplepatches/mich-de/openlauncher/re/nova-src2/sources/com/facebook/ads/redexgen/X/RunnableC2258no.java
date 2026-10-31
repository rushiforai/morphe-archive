package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.no, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC2258no implements Runnable {
    public static byte[] A03;
    public final /* synthetic */ C2095lA A00;
    public final /* synthetic */ C2261nr A01;
    public final /* synthetic */ String A02;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.TPAT_ERROR_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{3, 27, 5, 60, 61, 39, 32, 59, 38, 45, 89, 78, 91, 68, 89, 95, 66, 69, 76, 54, 33, 53, 49, 33, 55, 48, 27, 45, 32};
    }

    public RunnableC2258no(C2261nr c2261nr, String str, C2095lA c2095lA) {
        this.A01 = c2261nr;
        this.A02 = str;
        this.A00 = c2095lA;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        ArrayList arrayList;
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            C2127lg nvl = new C2127lg(A00(0, 3, 52));
            JSONObject jSONObject = new JSONObject();
            JSONArray jSONArray = new JSONArray();
            jSONObject.put(A00(3, 7, 45), jSONArray);
            jSONObject.put(A00(19, 10, 61), this.A02);
            synchronized (this.A01.A0D) {
                arrayList = new ArrayList(this.A01.A0D);
                this.A01.A0D.clear();
            }
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                C2260nq c2260nq = (C2260nq) it.next();
                jSONArray.put(A00(0, 0, 60) + c2260nq.A00 + ';' + c2260nq.A02 + ';' + c2260nq.A01);
            }
            nvl.A07(jSONObject);
            nvl.A05(1);
            this.A00.A08().AC0(A00(10, 9, 82), AbstractC2126lf.A2R, nvl);
        } catch (JSONException unused) {
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}

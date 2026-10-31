package com.facebook.ads.redexgen.X;

import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.Log;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Map;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.Gw, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0946Gw implements InterfaceC2223nF {
    public static byte[] A0D;
    public static String[] A0E = {"uc0mqsrp7zbVSSUmEXyUZJQCGufws", "8g6ahr3vPydrTtk22", "YNqtB8iJmO2uVaHpbt6P5K9KH1grqDjF", "oDfi3coiS1yTvP0yt", "tbJDZpprNJoNbXk4MBqAl5O83qYFAo", "QKETic0g2MOurTT1w7cfpFQ", "PRNEoz9kKM8OadepDD5IPPYNQZFvnMHX", "tq93tXY5KQrS9ibGckbvCktGGZhVZKfr"};
    public static final String A0F;
    public int A00;
    public long A01;
    public final long A02;
    public final long A03;
    public final ConnectivityManager A04;
    public final C0957Hh A06;
    public final InterfaceC2222nE A07;
    public final InterfaceC1529bs A08;
    public volatile boolean A0C;
    public final Runnable A0A = new C0948Gy(this);
    public final Runnable A09 = new C0947Gx(this);
    public final ThreadPoolExecutor A0B = new ThreadPoolExecutor(1, 1, 0, TimeUnit.MILLISECONDS, new LinkedBlockingQueue());
    public final Handler A05 = new Handler(Looper.getMainLooper());

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0D, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 88);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A07() {
        A0D = new byte[]{-39, -22, -48, -44, -73, -36, -26, -29, -44, -25, -42, -37, -36, -31, -38, -109, -40, -23, -40, -31, -25, -109, -101, -45, 6, -15, -13, -2, 2, -9, -3, -4, -82, 5, -10, -9, -6, -13, -82, -14, -9, 1, -2, -17, 2, -15, -10, -9, -4, -11, -82, -13, 4, -13, -4, 2, 1, -68, -28, -10, 3, 7, -10, 3, -79, 1, 3, 0, -12, -10, 4, 4, -10, -11, -79, 1, -14, 3, 5, -6, -14, -3, -79, -13, -14, 5, -12, -7, -67, -79, -12, 0, -1, 5, -6, -1, 6, -6, -1, -8, -79, 5, 0, -79, -1, -10, 9, 5, -79, 0, -1, -10, -65, 27, 45, 58, 62, 45, 58, -24, 58, 45, 59, 56, 55, 54, 59, 45, -24, 49, 59, -24, 45, 53, 56, 60, 65, -10, -17, 1, 14, 18, 1, 14, -68, 14, 1, 16, 17, 14, 10, 1, 0, -68, -3, -68, 10, 11, 10, -55, 15, 17, -1, -1, 1, 15, 15, 2, 17, 8, -68, 15, 16, -3, 16, 17, 15, -68, -1, 11, 0, 1, -68, 11, 2, -68, -61, -43, -30, -26, -43, -30, -112, -25, -47, -29, -112, -27, -34, -47, -46, -36, -43, -112, -28, -33, -112, -32, -30, -33, -45, -43, -29, -29, -112, -47, -36, -36, -112, -43, -26, -43, -34, -28, -29, -100, -112, -28, -30, -23, -39, -34, -41, -112, -47, -41, -47, -39, -34, -98, -17, 7, 5, 12, 12, 5, 10, 3, -68, 0, 5, 15, 12, -3, 16, -1, 4, -68, 0, 17, 1, -68, 16, 11, -68, 8, -3, -1, 7, -68, 11, 2, -68, -1, 11, 10, 10, 1, -1, 16, 5, 18, 5, 16, 21, -54, -31, -12, -12, -27, -19, -16, -12, -59, -47, -48, -48, -57, -59, -42, -53, -40, -53, -42, -37, 47, 44, 63, 44, -22, -5, -22, -13, -7, -8, 36, 21, 45, 32, 35, 21, 24};
    }

    static {
        A07();
        A0F = InterfaceC2223nF.class.getSimpleName();
    }

    public C0946Gw(C0957Hh c0957Hh, InterfaceC2222nE interfaceC2222nE) {
        this.A07 = interfaceC2222nE;
        this.A06 = c0957Hh;
        this.A04 = (ConnectivityManager) c0957Hh.getSystemService(A03(293, 12, 10));
        this.A08 = C1454af.A01(c0957Hh);
        this.A03 = AbstractC2205mx.A0K(c0957Hh);
        this.A02 = AbstractC2205mx.A0J(c0957Hh);
    }

    public static /* synthetic */ int A00(C0946Gw c0946Gw) {
        int i5 = c0946Gw.A00 + 1;
        c0946Gw.A00 = i5;
        return i5;
    }

    private void A05() {
        this.A06.A05().AB6();
        this.A00 = 0;
        this.A01 = 0L;
        if (this.A0B.getQueue().size() == 0) {
            this.A07.ADq();
        }
    }

    private void A06() {
        if (this.A00 >= AbstractC2205mx.A09(this.A06)) {
            A05();
            A6a();
        } else {
            if (this.A00 == 1) {
                this.A01 = AbstractC2205mx.A0I(this.A06);
            } else {
                this.A01 *= 2;
            }
            A6b();
        }
    }

    private void A08(long j11) {
        this.A05.postDelayed(this.A09, j11);
    }

    private void A09(JSONObject jSONObject) throws JSONException {
        Map<String, String> shortEvnData = this.A06.A04().A69();
        for (Map.Entry<String, String> entry : shortEvnData.entrySet()) {
            jSONObject.put(entry.getKey(), entry.getValue());
        }
    }

    public final void A0B() throws JSONException {
        try {
            NetworkInfo activeNetwork = this.A04.getActiveNetworkInfo();
            if (activeNetwork == null || !activeNetwork.isConnectedOrConnecting()) {
                if (this.A06.A05().AB6()) {
                    Log.e(A0F, A03(240, 46, 68));
                }
                A08(this.A02);
                return;
            }
            this.A06.A05().AB6();
            JSONObject jSONObjectA5u = this.A07.A5u();
            if (jSONObjectA5u == null) {
                this.A06.A05().AB6();
                A05();
                return;
            }
            boolean zAB6 = this.A06.A05().AB6();
            String strA03 = A03(Sdk.SDKError.Reason.ASSET_FAILED_TO_DELETE_VALUE, 6, 45);
            if (zAB6 && jSONObjectA5u.has(strA03)) {
                JSONArray jSONArray = jSONObjectA5u.getJSONArray(strA03);
                for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                    String str = A03(4, 19, 27) + i5 + A03(0, 3, 88) + jSONArray.get(i5);
                }
            }
            JSONObject jSONObject = new JSONObject();
            jSONObject.put(A03(286, 7, 40), String.valueOf(this.A00));
            A09(jSONObject);
            jSONObjectA5u.put(A03(Sdk.SDKError.Reason.MRAID_BRIDGE_ERROR_VALUE, 4, 115), jSONObject);
            C1474az c1474az = new C1474az();
            c1474az.put(A03(Sdk.SDKError.Reason.JSON_PARAMS_ENCODE_ERROR_VALUE, 7, 92), jSONObjectA5u.toString());
            InterfaceC1533bw interfaceC1533bwAIA = this.A08.AIA(this.A06.A05().A8h(), c1474az.A08());
            String strA7d = interfaceC1533bwAIA != null ? interfaceC1533bwAIA.A7d() : null;
            if (!TextUtils.isEmpty(strA7d) && interfaceC1533bwAIA != null) {
                if (interfaceC1533bwAIA.A9p() != 200) {
                    if (this.A06.A05().AB6()) {
                        String responseBody = A0F;
                        Log.e(responseBody, A03(Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE, 48, 68) + interfaceC1533bwAIA.A9p() + A03(3, 1, 78));
                    }
                    int iA9p = interfaceC1533bwAIA.A9p();
                    if (A0E[4].length() != 29) {
                        String[] strArr = A0E;
                        strArr[1] = "880m74azdbQx5kAj6";
                        strArr[3] = "QSHShLBOeb5hWYBY9";
                        if (iA9p == 413 && C2203mv.A2a(this.A06)) {
                            this.A07.AGg();
                            A05();
                            return;
                        } else {
                            if (jSONObjectA5u.has(strA03)) {
                                this.A07.AEf(jSONObjectA5u.getJSONArray(strA03));
                            }
                            A06();
                            return;
                        }
                    }
                    throw new RuntimeException();
                }
                if (!this.A07.AEh(new JSONArray(strA7d))) {
                    if (this.A06.A05().AB6()) {
                        Log.w(A0F, A03(186, 54, 24));
                    }
                    A06();
                    return;
                } else {
                    if (this.A07.ABJ()) {
                        if (this.A06.A05().AB6()) {
                            Log.i(A0F, A03(58, 55, 57));
                        }
                        A06();
                        return;
                    }
                    A05();
                    return;
                }
            }
            if (this.A06.A05().AB6()) {
                Log.e(A0F, A03(113, 25, 112));
            }
            if (C2203mv.A2O(this.A06) && jSONObjectA5u.has(strA03)) {
                this.A07.AEf(jSONObjectA5u.getJSONArray(strA03));
            }
            A06();
        } catch (Exception e3) {
            if (this.A06.A05().AB6()) {
                Log.e(A0F, A03(23, 35, 54), e3);
            }
            A06();
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2223nF
    public final void A6a() {
        if (this.A0C) {
            return;
        }
        this.A0C = true;
        this.A05.removeCallbacks(this.A09);
        A08(this.A02);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2223nF
    public final void A6b() {
        this.A0C = true;
        this.A05.removeCallbacks(this.A09);
        A08(this.A03);
    }
}

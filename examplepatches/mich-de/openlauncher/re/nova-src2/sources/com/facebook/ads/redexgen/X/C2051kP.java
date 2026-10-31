package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.Looper;
import java.util.Arrays;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.kP, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2051kP {
    public static byte[] A07;
    public static String[] A08 = {"QC6ROF3GbFPL6U2BchtfuOIlWA", "mAXyphBg0ZoA2", "nmk1i7vNQUMlLTVPnMJLcVhB6M", "xf2dPS9SncVtV17kxTxgHOfrSuJpis3", "Y24xgR3", "pU5dMF2zEzzc2yzou8JPWDE5BQxzeO1x", "dnQEZ1usH0f6s5VsA3sVBX2XHmBfQenJ", "5qnsTvKOcggfe9NlhRnI8aAzom1PIzJ"};
    public final Handler A00;
    public final InterfaceC2050kO A01;
    public final C2086kz A02;
    public final String A03;
    public final String A04;
    public final JSONObject A05;
    public final boolean A06;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A07, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 52);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A07() {
        A07 = new byte[]{72, 90, 90, 76, 93, 90, 78, 65, 68, 77, 105, 109, 97, 103, 101, 0, 31, 18, 19, 25};
    }

    static {
        A07();
    }

    public C2051kP(C2086kz c2086kz, JSONObject jSONObject, String str, String str2, boolean z11, InterfaceC2050kO interfaceC2050kO) {
        this.A02 = c2086kz;
        this.A05 = jSONObject;
        this.A03 = str;
        this.A04 = str2;
        this.A06 = z11 && A0A(this.A05);
        this.A01 = interfaceC2050kO;
        this.A00 = new Handler(Looper.getMainLooper());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A09(boolean z11, C2049kN c2049kN) {
        String strA03 = A03(6, 4, 28);
        String strA032 = A03(15, 5, 66);
        String strA033 = A03(10, 5, 52);
        if (z11) {
            boolean zEquals = strA033.equals(c2049kN.A02);
            if (A08[6].charAt(22) == 'q') {
                throw new RuntimeException();
            }
            String[] strArr = A08;
            strArr[3] = "Ngd5gA2SMQ4Pqx2mjoy1oHjbJUKCicI";
            strArr[7] = "LorLYeRbgteEMpgZiQ82pTGbH7n24yI";
            if (zEquals) {
                this.A02.A0d(new C2084kx(c2049kN.A03, -1, -1, this.A04, this.A03));
                return;
            } else if (strA032.equals(c2049kN.A02)) {
                this.A02.A0a(new C2082kv(c2049kN.A03, this.A04, this.A03));
                return;
            } else {
                if (!strA03.equals(c2049kN.A02)) {
                    return;
                }
                this.A02.A0Z(new C2082kv(c2049kN.A03, this.A04, this.A03));
                return;
            }
        }
        if (strA033.equals(c2049kN.A02)) {
            this.A02.A0c(new C2084kx(c2049kN.A03, -1, -1, this.A04, this.A03));
        } else if (strA032.equals(c2049kN.A02)) {
            this.A02.A0b(new C2082kv(c2049kN.A03, this.A04, this.A03));
        } else {
            if (!strA03.equals(c2049kN.A02)) {
                return;
            }
            this.A02.A0Y(new C2082kv(c2049kN.A03, this.A04, this.A03));
        }
    }

    public static boolean A0A(JSONObject jSONObject) {
        return jSONObject != null && jSONObject.has(A03(0, 6, 29));
    }

    public final void A0B() {
        if (!this.A06) {
            this.A01.ADu();
        }
        ExecutorC2431qh.A06.execute(new I0(this));
    }
}

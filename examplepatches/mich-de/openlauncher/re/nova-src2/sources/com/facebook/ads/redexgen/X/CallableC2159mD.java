package com.facebook.ads.redexgen.X;

import android.content.SharedPreferences;
import android.os.Build;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.concurrent.Callable;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.mD, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class CallableC2159mD implements Callable<Boolean> {
    public static byte[] A04;
    public static String[] A05 = {"CoyLTTqL9oN", "BQ7yf8H5Dy6", "lyn", "mKjKy3YozjHGjndyHmGPrtRgt1Zkpmof", "kCMvlxHItYqHUu0uJG5AXtsVRpKoPm5F", "PZWzUgGQe3CdPYsrWXqgA6txhpTzavVR", "1z7bJiu6sIQ4w4e4OAYhOvPnvUYdbbgv", "yc5QaeADf08N4Bq6BgqF"};
    public final /* synthetic */ SharedPreferences A00;
    public final /* synthetic */ C2095lA A01;
    public final /* synthetic */ C2137lq A02;
    public final /* synthetic */ String A03;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A04 = new byte[]{24, 61, 51, 46, 61, 45, 17, 29, 31, 92, 19, 28, 22, 0, 29, 27, 22, 92, 4, 23, 28, 22, 27, 28, 21, 100, 116, 102, 119, 110, 112, 96, AbstractJsonLexerKt.TC_INVALID, 116, 112, 114, 112, 123, 112, 103, 124, 118};
    }

    static {
        A02();
    }

    public CallableC2159mD(C2095lA c2095lA, C2137lq c2137lq, SharedPreferences sharedPreferences, String str) {
        this.A01 = c2095lA;
        this.A02 = c2137lq;
        this.A00 = sharedPreferences;
        this.A03 = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:6:0x0017  */
    @Override // java.util.concurrent.Callable
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Boolean call() throws Exception {
        String strA01 = null;
        if (Build.VERSION.SDK_INT < 31) {
            String strA012 = A01(0, 1, 52);
            String checksumApiFingerprint = Build.VERSION.CODENAME;
            if (strA012.equals(checksumApiFingerprint)) {
                if (C2203mv.A2r(this.A01)) {
                    String strA0B = this.A02.A0B();
                    String checksumApiFingerprint2 = A01(6, 19, 13);
                    if (checksumApiFingerprint2.equals(strA0B)) {
                        C2095lA c2095lA = this.A01;
                        String checksumApiFingerprint3 = this.A01.getPackageName();
                        strA01 = C2388q0.A01(c2095lA, checksumApiFingerprint3);
                    }
                }
            }
        }
        String checksumApiFingerprint4 = A05[7];
        if (checksumApiFingerprint4.length() != 20) {
            throw new RuntimeException();
        }
        String[] strArr = A05;
        strArr[0] = "qQmXUpBlhYC";
        strArr[1] = "2roBSgd9zyy";
        if (strA01 == null) {
            C2095lA c2095lA2 = this.A01;
            String checksumApiFingerprint5 = this.A01.getPackageName();
            C2160mE.A00 = C2330p1.A02(c2095lA2, checksumApiFingerprint5);
        } else {
            if (C2203mv.A1k(this.A01)) {
                C2095lA c2095lA3 = this.A01;
                String checksumApiFingerprint6 = this.A01.getPackageName();
                String strA02 = C2330p1.A02(c2095lA3, checksumApiFingerprint6);
                String checksumApiFingerprint7 = A01(1, 5, 33);
                C2127lg c2127lg = new C2127lg(checksumApiFingerprint7);
                c2127lg.A05(1);
                c2127lg.A06(1);
                c2127lg.A0A(false);
                JSONObject jSONObject = new JSONObject();
                String checksumApiFingerprint8 = A01(25, 5, 120);
                jSONObject.put(checksumApiFingerprint8, strA01);
                String checksumApiFingerprint9 = A01(30, 5, 108);
                jSONObject.put(checksumApiFingerprint9, strA02);
                c2127lg.A07(jSONObject);
                InterfaceC2125le interfaceC2125leA08 = this.A01.A08();
                int i5 = AbstractC2126lf.A1I;
                String checksumApiFingerprint10 = A01(35, 7, 106);
                interfaceC2125leA08.AC0(checksumApiFingerprint10, i5, c2127lg);
            }
            C2160mE.A00 = strA01;
        }
        SharedPreferences.Editor editorEdit = this.A00.edit();
        String str = this.A03;
        String checksumApiFingerprint11 = C2160mE.A00;
        editorEdit.putString(str, checksumApiFingerprint11).apply();
        C2160mE.A05.set(2);
        return true;
    }
}

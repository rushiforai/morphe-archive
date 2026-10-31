package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.text.TextUtils;
import android.util.Log;
import com.facebook.ads.internal.api.AdSettingsApi;
import com.facebook.ads.internal.settings.AdInternalSettings;
import com.facebook.ads.internal.settings.MultithreadedBundleWrapper;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.UUID;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.jW, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1996jW implements AdSettingsApi {
    public static byte[] A00;
    public static String[] A01 = {"TFkOB7WAPr6F4oSDAD2lBM3orjMmpCql", "qm70b4Ur0FRBuwfAT3tN36vqG0Nf4UFd", "zPpQ1cnfbXvczPvVr", "8IvLkkrNdMNEKNCoxjkf6IUs19Br2Jri", "GW45NL8mXfcvSmeq7", "yk6fztNbTNbTdYOeWP4a4qU6KiJuVBGT", "Yi7aT5eKgI7tScmdPed7vydq7f2NoqCT", "ldtlhzHQs0POAzCz5K2SoOIZIeNjlq2l"};
    public static final String A02;
    public static final Collection<String> A03;
    public static volatile boolean A04;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 48);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{124, 119, 101, 8, 15, 9, 4, 31, 30, 13, 18, 24, 30, 4, 18, 31, 4, 19, 26, 8, 19, 4, 16, 30, 2, 107, 90, 76, 75, 31, 82, 80, 91, 90, 31, 91, 90, 73, 86, 92, 90, 31, 87, 94, 76, 87, 5, 31, 45, 18, 31, 20, 90, 14, 31, 9, 14, 19, 20, 29, 90, 3, 21, 15, 8, 90, 27, 10, 10, 90, 13, 19, 14, 18, 90, 60, 27, 25, 31, 24, 21, 21, 17, 93, 9, 90, 27, 30, 90, 15, 20, 19, 14, 9, 90, 3, 21, 15, 90, 23, 15, 9, 14, 90, 9, 10, 31, 25, 19, 28, 3, 90, 14, 18, 31, 90, 30, 31, 12, 19, 25, 31, 90, 18, 27, 9, 18, 31, 30, 90, 51, 62, 90, 14, 21, 90, 31, 20, 9, 15, 8, 31, 90, 14, 18, 31, 90, 30, 31, 22, 19, 12, 31, 8, 3, 90, 21, 28, 90, 14, 31, 9, 14, 90, 27, 30, 9, 86, 90, 27, 30, 30, 90, 14, 18, 31, 90, 28, 21, 22, 22, 21, 13, 19, 20, 29, 90, 25, 21, 30, 31, 90, 24, 31, 28, 21, 8, 31, 90, 22, 21, 27, 30, 19, 20, 29, 90, 27, 20, 90, 27, 30, 64, 90, 59, 30, 41, 31, 14, 14, 19, 20, 29, 9, 84, 27, 30, 30, 46, 31, 9, 14, 62, 31, 12, 19, 25, 31, 82, 88, 26, 27, 8, 23, 29, 27, 55, 26, 54, 31, 13, 22, 60, 52, 52, 60, 55, 62, 4, 40, 63, 48, 114, 101, 106, 102, 114, AbstractJsonLexerKt.TC_INVALID, 104, 40, 38, 96, 41, 61, 48, 39, 103, 105, 43, 47};
    }

    static {
        A01();
        A02 = AdInternalSettings.class.getSimpleName();
        A03 = new HashSet();
        A03.add(A00(262, 3, 49));
        A03.add(A00(252, 10, 107));
        A03.add(A00(265, 7, 32));
        A03.add(A00(272, 8, 111));
        A04 = false;
    }

    public static void A02(String str) {
        if (A04) {
            return;
        }
        A04 = true;
        Log.i(A02, A00(25, 23, 15) + str);
        Log.i(A02, A00(48, 192, 74) + str + A00(0, 3, 110));
    }

    @Override // com.facebook.ads.internal.api.AdSettingsApi
    public final boolean isTestMode(Context context) {
        if (AdInternalSettings.isDebugBuild() || AdInternalSettings.isExplicitTestMode() || A03.contains(Build.PRODUCT)) {
            return true;
        }
        MultithreadedBundleWrapper multithreadedBundleWrapper = AdInternalSettings.sSettingsBundle;
        String strA00 = A00(3, 22, 107);
        String string = multithreadedBundleWrapper.getString(strA00, null);
        if (string == null) {
            SharedPreferences sharedPreferencesA00 = AbstractC2297oU.A00(context);
            String strA002 = A00(240, 12, 78);
            string = sharedPreferencesA00.getString(strA002, null);
            if (TextUtils.isEmpty(string)) {
                UUID uuidRandomUUID = UUID.randomUUID();
                if (A01[6].charAt(4) == 'r') {
                    throw new RuntimeException();
                }
                String[] strArr = A01;
                strArr[4] = "ACuTT9OHS44wxpENU";
                strArr[2] = "rDA9ItLQjR7JTNF9w";
                string = uuidRandomUUID.toString();
                sharedPreferencesA00.edit().putString(strA002, string).apply();
            }
            AdInternalSettings.sSettingsBundle.putString(strA00, string);
        }
        if (AdInternalSettings.getTestDevicesList().contains(string)) {
            return true;
        }
        A02(string);
        return false;
    }

    @Override // com.facebook.ads.internal.api.AdSettingsApi
    public final void turnOnDebugger() {
        AbstractC2273o5.A02();
    }
}

package ai;

import android.content.SharedPreferences;
import android.text.TextUtils;

/* loaded from: classes3.dex */
public abstract class a4 {

    /* renamed from: a, reason: collision with root package name */
    public static final xk.r2 f12842a;

    static {
        xk.l0 l0Var = xk.v0.f96030b;
        Object[] objArr = new Object[24];
        objArr[0] = "Version";
        objArr[1] = "GoogleConsent";
        objArr[2] = "VendorConsent";
        objArr[3] = "VendorLegitimateInterest";
        objArr[4] = "gdprApplies";
        objArr[5] = "EnableAdvertiserConsentMode";
        objArr[6] = "PolicyVersion";
        objArr[7] = "PurposeConsents";
        objArr[8] = "PurposeOneTreatment";
        objArr[9] = "Purpose1";
        objArr[10] = "Purpose3";
        objArr[11] = "Purpose4";
        System.arraycopy(new String[]{"Purpose7", "CmpSdkID", "PublisherCC", "PublisherRestrictions1", "PublisherRestrictions3", "PublisherRestrictions4", "PublisherRestrictions7", "AuthorizePurpose1", "AuthorizePurpose3", "AuthorizePurpose4", "AuthorizePurpose7", "PurposeDiagnostics"}, 0, objArr, 12, 12);
        w20.e.c(24, objArr);
        f12842a = xk.v0.k(24, objArr);
    }

    public static String a(SharedPreferences sharedPreferences, String str) {
        try {
            return sharedPreferences.getString(str, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        } catch (ClassCastException unused) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
    }

    public static final boolean b(com.google.android.gms.internal.measurement.i0 i0Var, xk.w2 w2Var, xk.w2 w2Var2, xk.e1 e1Var, char[] cArr, int i5, int i11, int i12, String str, String str2, String str3, boolean z11, boolean z12) {
        z3 z3Var;
        char c11;
        int iC = c(i0Var);
        if (iC > 0 && (i11 != 1 || i5 != 1)) {
            cArr[iC] = '2';
        }
        if (g(i0Var, w2Var2) == com.google.android.gms.internal.measurement.j0.PURPOSE_RESTRICTION_NOT_ALLOWED) {
            c11 = '3';
        } else {
            if (i0Var == com.google.android.gms.internal.measurement.i0.IAB_TCF_PURPOSE_STORE_AND_ACCESS_INFORMATION_ON_A_DEVICE && i12 == 1 && e1Var.f95903e.equals(str)) {
                if (iC > 0 && cArr[iC] != '2') {
                    cArr[iC] = '1';
                }
                return true;
            }
            if (w2Var.containsKey(i0Var) && (z3Var = (z3) w2Var.get(i0Var)) != null) {
                int iOrdinal = z3Var.ordinal();
                com.google.android.gms.internal.measurement.j0 j0Var = com.google.android.gms.internal.measurement.j0.PURPOSE_RESTRICTION_REQUIRE_LEGITIMATE_INTEREST;
                if (iOrdinal != 0) {
                    com.google.android.gms.internal.measurement.j0 j0Var2 = com.google.android.gms.internal.measurement.j0.PURPOSE_RESTRICTION_REQUIRE_CONSENT;
                    if (iOrdinal != 1) {
                        if (iOrdinal == 2) {
                            return g(i0Var, w2Var2) == j0Var ? f(i0Var, cArr, str3, z12) : e(i0Var, cArr, str2, z11);
                        }
                        if (iOrdinal == 3) {
                            return g(i0Var, w2Var2) == j0Var2 ? e(i0Var, cArr, str2, z11) : f(i0Var, cArr, str3, z12);
                        }
                        c11 = '0';
                    } else if (g(i0Var, w2Var2) != j0Var2) {
                        return f(i0Var, cArr, str3, z12);
                    }
                } else if (g(i0Var, w2Var2) != j0Var) {
                    return e(i0Var, cArr, str2, z11);
                }
                c11 = '8';
            } else {
                c11 = '0';
            }
        }
        if (iC <= 0 || cArr[iC] == '2') {
            return false;
        }
        cArr[iC] = c11;
        return false;
    }

    public static final int c(com.google.android.gms.internal.measurement.i0 i0Var) {
        if (i0Var == com.google.android.gms.internal.measurement.i0.IAB_TCF_PURPOSE_STORE_AND_ACCESS_INFORMATION_ON_A_DEVICE) {
            return 1;
        }
        if (i0Var == com.google.android.gms.internal.measurement.i0.IAB_TCF_PURPOSE_CREATE_A_PERSONALISED_ADS_PROFILE) {
            return 2;
        }
        if (i0Var == com.google.android.gms.internal.measurement.i0.IAB_TCF_PURPOSE_SELECT_PERSONALISED_ADS) {
            return 3;
        }
        return i0Var == com.google.android.gms.internal.measurement.i0.IAB_TCF_PURPOSE_MEASURE_AD_PERFORMANCE ? 4 : -1;
    }

    public static final String d(com.google.android.gms.internal.measurement.i0 i0Var, String str, String str2) {
        String strValueOf = "0";
        String strValueOf2 = (TextUtils.isEmpty(str) || str.length() < i0Var.zza()) ? "0" : String.valueOf(str.charAt(i0Var.zza() - 1));
        if (!TextUtils.isEmpty(str2) && str2.length() >= i0Var.zza()) {
            strValueOf = String.valueOf(str2.charAt(i0Var.zza() - 1));
        }
        return String.valueOf(strValueOf2).concat(String.valueOf(strValueOf));
    }

    public static final boolean e(com.google.android.gms.internal.measurement.i0 i0Var, char[] cArr, String str, boolean z11) {
        char c11;
        int iC = c(i0Var);
        if (!z11) {
            c11 = '4';
        } else {
            if (str.length() >= i0Var.zza()) {
                char cCharAt = str.charAt(i0Var.zza() - 1);
                boolean z12 = cCharAt == '1';
                if (iC > 0 && cArr[iC] != '2') {
                    cArr[iC] = cCharAt != '1' ? '6' : '1';
                }
                return z12;
            }
            c11 = '0';
        }
        if (iC > 0 && cArr[iC] != '2') {
            cArr[iC] = c11;
        }
        return false;
    }

    public static final boolean f(com.google.android.gms.internal.measurement.i0 i0Var, char[] cArr, String str, boolean z11) {
        char c11;
        int iC = c(i0Var);
        if (!z11) {
            c11 = '5';
        } else {
            if (str.length() >= i0Var.zza()) {
                char cCharAt = str.charAt(i0Var.zza() - 1);
                boolean z12 = cCharAt == '1';
                if (iC > 0 && cArr[iC] != '2') {
                    cArr[iC] = cCharAt != '1' ? '7' : '1';
                }
                return z12;
            }
            c11 = '0';
        }
        if (iC > 0 && cArr[iC] != '2') {
            cArr[iC] = c11;
        }
        return false;
    }

    public static final com.google.android.gms.internal.measurement.j0 g(com.google.android.gms.internal.measurement.i0 i0Var, xk.w2 w2Var) {
        Object obj = w2Var.get(i0Var);
        if (obj == null) {
            obj = com.google.android.gms.internal.measurement.j0.PURPOSE_RESTRICTION_UNDEFINED;
        }
        return (com.google.android.gms.internal.measurement.j0) obj;
    }
}

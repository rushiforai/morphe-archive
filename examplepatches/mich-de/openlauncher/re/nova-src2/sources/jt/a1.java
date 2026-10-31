package jt;

import android.content.Context;
import com.instabridge.mobilesdk.internal.analytics.PaymentReasons;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class a1 {
    public static final String a(Context context, String str, String str2, String str3) {
        String strB = b(context, str3);
        if (strB != null) {
            return strB;
        }
        String strB2 = b(context, str2);
        if (strB2 != null) {
            return strB2;
        }
        if (str != null) {
            return str;
        }
        String string = context.getString(2132020030);
        Intrinsics.f(string, "getString(...)");
        return string;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:10:0x0029  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00ea  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final String b(Context context, String str) {
        Integer num = 2132019811;
        Intrinsics.g(context, "<this>");
        if (str != null) {
            switch (str.hashCode()) {
                case -2011738994:
                    if (!str.equals("generic_decline")) {
                        num = null;
                        break;
                    } else {
                        num = 2132019792;
                        break;
                    }
                case -1109249604:
                    if (str.equals("invalid_expiry_month")) {
                        num = 2132019814;
                        break;
                    }
                    break;
                case -952840184:
                    if (str.equals("invalid_cvc")) {
                        num = 2132019812;
                        break;
                    }
                    break;
                case -857379549:
                    if (!str.equals("incorrect_number")) {
                    }
                    break;
                case -822522913:
                    if (str.equals("invalid_owner_name")) {
                        num = 2132019816;
                        break;
                    }
                    break;
                case -343766564:
                    if (str.equals("processing_error")) {
                        num = 2132019997;
                        break;
                    }
                    break;
                case -308669807:
                    if (!str.equals("invalid_number")) {
                    }
                    break;
                case 147203197:
                    if (str.equals(PaymentReasons.CARD_DECLINED)) {
                        num = 2132019739;
                        break;
                    }
                    break;
                case 657301889:
                    if (str.equals("invalid_expiry_year")) {
                        num = 2132019815;
                        break;
                    }
                    break;
                case 1436957674:
                    if (str.equals("expired_card")) {
                        num = 2132019778;
                        break;
                    }
                    break;
                case 1705388818:
                    if (str.equals("insufficient_funds")) {
                        num = 2132019807;
                        break;
                    }
                    break;
                case 1737231027:
                    if (str.equals("invalid_bank_account_iban")) {
                        num = 2132019809;
                        break;
                    }
                    break;
                case 2037370550:
                    if (!str.equals("incorrect_cvc")) {
                    }
                    break;
            }
        }
        if (num != null) {
            return context.getString(num.intValue());
        }
        return null;
    }
}

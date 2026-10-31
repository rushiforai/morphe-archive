package sg;

import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.text.TextUtils;
import android.util.Log;
import java.util.Locale;
import z.c1;

/* loaded from: classes3.dex */
public abstract class m {

    /* renamed from: a, reason: collision with root package name */
    public static final c1 f87449a = new c1(0);

    /* renamed from: b, reason: collision with root package name */
    public static Locale f87450b;

    public static String a(Context context, int i5) {
        Resources resources = context.getResources();
        switch (i5) {
            case 1:
                return resources.getString(2132017650);
            case 2:
                return resources.getString(2132017657);
            case 3:
                return resources.getString(2132017647);
            case 4:
            case 6:
            case 18:
                return null;
            case 5:
                Log.e("GoogleApiAvailability", "An invalid account was specified when connecting. Please provide a valid account.");
                return h(context, "common_google_play_services_invalid_account_title");
            case 7:
                Log.e("GoogleApiAvailability", "Network error occurred. Please retry request later.");
                return h(context, "common_google_play_services_network_error_title");
            case 8:
                Log.e("GoogleApiAvailability", "Internal error occurred. Please see logs for detailed information");
                return null;
            case 9:
                Log.e("GoogleApiAvailability", "Google Play services is invalid. Cannot recover.");
                return null;
            case 10:
                Log.e("GoogleApiAvailability", "Developer error occurred. Please see logs for detailed information");
                return null;
            case 11:
                Log.e("GoogleApiAvailability", "The application is not licensed to the user.");
                return null;
            case 12:
            case 13:
            case 14:
            case 15:
            case 19:
            default:
                StringBuilder sb2 = new StringBuilder(String.valueOf(i5).length() + 22);
                sb2.append("Unexpected error code ");
                sb2.append(i5);
                Log.e("GoogleApiAvailability", sb2.toString());
                return null;
            case 16:
                Log.e("GoogleApiAvailability", "One of the API components you attempted to connect to is not available.");
                return null;
            case 17:
                Log.e("GoogleApiAvailability", "The specified account could not be signed in.");
                return h(context, "common_google_play_services_sign_in_failed_title");
            case 20:
                Log.e("GoogleApiAvailability", "The current user profile is restricted and could not use authenticated features.");
                return h(context, "common_google_play_services_restricted_profile_title");
        }
    }

    public static String b(Context context, int i5) {
        String strH = i5 == 6 ? h(context, "common_google_play_services_resolution_required_title") : a(context, i5);
        return strH == null ? context.getResources().getString(2132017652) : strH;
    }

    public static String c(Context context, int i5) {
        Resources resources = context.getResources();
        String strF = f(context);
        if (i5 == 1) {
            return resources.getString(2132017649, strF);
        }
        if (i5 == 2) {
            return xg.b.e(context) ? resources.getString(2132017659) : resources.getString(2132017656, strF);
        }
        if (i5 == 3) {
            return resources.getString(2132017646, strF);
        }
        if (i5 == 5) {
            return g(context, "common_google_play_services_invalid_account_text", strF);
        }
        if (i5 == 7) {
            return g(context, "common_google_play_services_network_error_text", strF);
        }
        if (i5 == 9) {
            return resources.getString(2132017654, strF);
        }
        if (i5 == 20) {
            return g(context, "common_google_play_services_restricted_profile_text", strF);
        }
        switch (i5) {
            case 16:
                return g(context, "common_google_play_services_api_unavailable_text", strF);
            case 17:
                return g(context, "common_google_play_services_sign_in_failed_text", strF);
            case 18:
                return resources.getString(2132017658, strF);
            default:
                return resources.getString(2132017653, strF);
        }
    }

    public static String d(Context context, int i5) {
        return (i5 == 6 || i5 == 19) ? g(context, "common_google_play_services_resolution_required_text", f(context)) : c(context, i5);
    }

    public static String e(Context context, int i5) {
        Resources resources = context.getResources();
        return i5 != 1 ? i5 != 2 ? i5 != 3 ? resources.getString(17039370) : resources.getString(2132017645) : resources.getString(2132017655) : resources.getString(2132017648);
    }

    public static String f(Context context) {
        String packageName = context.getPackageName();
        try {
            Context context2 = zg.b.a(context).f19206a;
            return context2.getPackageManager().getApplicationLabel(context2.getPackageManager().getApplicationInfo(packageName, 0)).toString();
        } catch (PackageManager.NameNotFoundException | NullPointerException unused) {
            String str = context.getApplicationInfo().name;
            return TextUtils.isEmpty(str) ? packageName : str;
        }
    }

    public static String g(Context context, String str, String str2) throws Resources.NotFoundException {
        Resources resources = context.getResources();
        String strH = h(context, str);
        if (strH == null) {
            strH = resources.getString(2132017653);
        }
        return String.format(resources.getConfiguration().locale, strH, str2);
    }

    public static String h(Context context, String str) {
        Resources resourcesForApplication;
        c1 c1Var = f87449a;
        synchronized (c1Var) {
            try {
                Locale localeB = w4.g.f(context.getResources().getConfiguration().getLocales()).b(0);
                if (!localeB.equals(f87450b)) {
                    c1Var.clear();
                    f87450b = localeB;
                }
                String str2 = (String) c1Var.get(str);
                if (str2 != null) {
                    return str2;
                }
                int i5 = pg.d.f82563e;
                try {
                    resourcesForApplication = context.getPackageManager().getResourcesForApplication("com.google.android.gms");
                } catch (PackageManager.NameNotFoundException unused) {
                    resourcesForApplication = null;
                }
                if (resourcesForApplication != null) {
                    int identifier = resourcesForApplication.getIdentifier(str, "string", "com.google.android.gms");
                    if (identifier == 0) {
                        StringBuilder sb2 = new StringBuilder(str.length() + 18);
                        sb2.append("Missing resource: ");
                        sb2.append(str);
                        Log.w("GoogleApiAvailability", sb2.toString());
                    } else {
                        String string = resourcesForApplication.getString(identifier);
                        if (!TextUtils.isEmpty(string)) {
                            c1Var.put(str, string);
                            return string;
                        }
                        StringBuilder sb3 = new StringBuilder(str.length() + 20);
                        sb3.append("Got empty resource: ");
                        sb3.append(str);
                        Log.w("GoogleApiAvailability", sb3.toString());
                    }
                }
                return null;
            } finally {
            }
        }
    }
}

package pg;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.text.TextUtils;
import android.util.Log;
import com.amplitude.core.events.Identify;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes.dex */
public class c {

    /* renamed from: a, reason: collision with root package name */
    public static final int f82561a;

    /* renamed from: b, reason: collision with root package name */
    public static final c f82562b;

    static {
        AtomicBoolean atomicBoolean = e.f82564a;
        f82561a = 12451000;
        f82562b = new c();
    }

    public static void c(Context context) throws GooglePlayServicesRepairableException, GooglePlayServicesNotAvailableException {
        AtomicBoolean atomicBoolean = e.f82564a;
        c cVar = f82562b;
        int iB = cVar.b(context, 11925000);
        if (iB != 0) {
            Intent intentA = cVar.a(context, iB, "e");
            StringBuilder sb2 = new StringBuilder(String.valueOf(iB).length() + 46);
            sb2.append("GooglePlayServices not available due to error ");
            sb2.append(iB);
            Log.e("GooglePlayServicesUtil", sb2.toString());
            if (intentA != null) {
                throw new GooglePlayServicesRepairableException();
            }
            throw new GooglePlayServicesNotAvailableException(iB);
        }
    }

    public Intent a(Context context, int i5, String str) {
        if (i5 != 1 && i5 != 2) {
            if (i5 != 3) {
                return null;
            }
            Uri uriFromParts = Uri.fromParts("package", "com.google.android.gms", null);
            Intent intent = new Intent("android.settings.APPLICATION_DETAILS_SETTINGS");
            intent.setData(uriFromParts);
            return intent;
        }
        if (context != null && xg.b.e(context)) {
            Intent intent2 = new Intent("com.google.android.clockwork.home.UPDATE_ANDROID_WEAR_ACTION");
            intent2.setPackage("com.google.android.wearable.app");
            return intent2;
        }
        StringBuilder sb2 = new StringBuilder("gcore_");
        sb2.append(f82561a);
        sb2.append(Identify.UNSET_VALUE);
        if (!TextUtils.isEmpty(str)) {
            sb2.append(str);
        }
        sb2.append(Identify.UNSET_VALUE);
        if (context != null) {
            sb2.append(context.getPackageName());
        }
        sb2.append(Identify.UNSET_VALUE);
        if (context != null) {
            try {
                sb2.append(zg.b.a(context).c(0, context.getPackageName()).versionCode);
            } catch (PackageManager.NameNotFoundException unused) {
            }
        }
        String string = sb2.toString();
        Intent intent3 = new Intent("android.intent.action.VIEW");
        Uri.Builder builderAppendQueryParameter = Uri.parse("market://details").buildUpon().appendQueryParameter("id", "com.google.android.gms");
        if (!TextUtils.isEmpty(string)) {
            builderAppendQueryParameter.appendQueryParameter("pcampaignid", string);
        }
        intent3.setData(builderAppendQueryParameter.build());
        intent3.setPackage("com.android.vending");
        intent3.addFlags(524288);
        return intent3;
    }

    public int b(Context context, int i5) {
        int iB = e.b(context, i5);
        if (iB != 18 ? iB == 1 ? e.c(context) : false : true) {
            return 18;
        }
        return iB;
    }
}

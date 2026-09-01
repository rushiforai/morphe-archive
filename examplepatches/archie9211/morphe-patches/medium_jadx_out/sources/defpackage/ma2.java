package defpackage;

import android.app.UiModeManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.telephony.TelephonyManager;
import java.io.File;
import java.util.Arrays;
import java.util.Locale;
import sprig.b.VPIE.gYpYQDQkhfs;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class ma2 extends co6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;
    public final /* synthetic */ Context c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ma2(Context context, String str) {
        super(0);
        this.a = 1;
        this.b = str;
        this.c = context;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        boolean z = true;
        boolean z2 = false;
        String str = this.b;
        Context context = this.c;
        switch (i) {
            case 0:
                return new File(context.getCacheDir(), String.format(Locale.US, gYpYQDQkhfs.BwRIOu, Arrays.copyOf(new Object[]{str}, 1)));
            case 1:
                Object systemService = context.getSystemService("uimode");
                UiModeManager uiModeManager = systemService instanceof UiModeManager ? (UiModeManager) systemService : null;
                if (uiModeManager == null || uiModeManager.getCurrentModeType() != 4) {
                    PackageManager packageManager = context.getPackageManager();
                    packageManager.getClass();
                    if (!packageManager.hasSystemFeature("android.software.leanback") && !packageManager.hasSystemFeature("com.google.android.tv")) {
                        Locale locale = Locale.US;
                        locale.getClass();
                        String lowerCase = str.toLowerCase(locale);
                        lowerCase.getClass();
                        if (muc.Q(lowerCase, "tablet", false) || muc.Q(lowerCase, "sm-t", false) || context.getResources().getConfiguration().smallestScreenWidthDp >= 800) {
                            return ya3.TABLET;
                        }
                        String lowerCase2 = str.toLowerCase(locale);
                        lowerCase2.getClass();
                        if (!muc.Q(lowerCase2, "phone", false)) {
                            Object systemService2 = context.getSystemService("phone");
                            TelephonyManager telephonyManager = systemService2 instanceof TelephonyManager ? (TelephonyManager) systemService2 : null;
                            if (telephonyManager != null && telephonyManager.getPhoneType() == 0) {
                                z2 = true;
                            }
                            z = true ^ z2;
                        }
                        return z ? ya3.MOBILE : ya3.OTHER;
                    }
                }
                return ya3.TV;
            default:
                SharedPreferences sharedPreferences = context.getSharedPreferences(str, 0);
                sharedPreferences.getClass();
                return sharedPreferences;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ma2(int i, Context context, String str) {
        super(0);
        this.a = i;
        this.c = context;
        this.b = str;
    }
}

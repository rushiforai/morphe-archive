package com.tiktok.iap.billing;

import android.app.Application;
import android.text.TextUtils;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.TikTokBusinessSdk;
import com.tiktok.util.TTReflect;

/* loaded from: classes4.dex */
public class GPBillVersions {
    private static volatile String sVersion;

    public enum GPBillingVer {
        NONE,
        V1,
        V2_V4,
        V5_V8
    }

    public static GPBillingVer getMajorVersion() {
        try {
            String version = getVersion();
            if (version != null) {
                int i5 = Integer.parseInt(version.split("\\.")[0]);
                return i5 == 1 ? GPBillingVer.V1 : (i5 <= 1 || i5 >= 5) ? GPBillingVer.V5_V8 : GPBillingVer.V2_V4;
            }
        } catch (Throwable unused) {
        }
        return GPBillingVer.NONE;
    }

    public static String getVersion() {
        if (!TextUtils.isEmpty(sVersion)) {
            return sVersion;
        }
        sVersion = readFromMeta();
        if (!TextUtils.isEmpty(sVersion)) {
            return sVersion;
        }
        sVersion = readFromBuildConfig();
        return !TextUtils.isEmpty(sVersion) ? sVersion : b.f42142b;
    }

    private static String readFromBuildConfig() {
        try {
            String str = (String) TTReflect.on("com.android.billingclient.BuildConfig").findField("VERSION_NAME").getValue(null);
            if (str != null) {
                if (str.length() > 2) {
                    return str;
                }
            }
        } catch (Throwable unused) {
        }
        return null;
    }

    private static String readFromMeta() {
        try {
            Application applicationContext = TikTokBusinessSdk.getApplicationContext();
            if (applicationContext != null) {
                applicationContext.getPackageManager().getInstallerPackageName(b.f42142b);
                String string = applicationContext.getPackageManager().getApplicationInfo(applicationContext.getPackageName(), 128).metaData.getString("com.google.android.play.billingclient.version", null);
                if (string != null) {
                    if (string.length() > 2) {
                        return string;
                    }
                }
            }
        } catch (Throwable unused) {
        }
        return null;
    }
}

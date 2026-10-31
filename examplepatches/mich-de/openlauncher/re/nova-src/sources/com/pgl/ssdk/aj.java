package com.pgl.ssdk;

import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.webkit.WebView;

/* loaded from: classes.dex */
public class aj {
    public static String a() {
        ApplicationInfo applicationInfo;
        PackageInfo currentWebViewPackage = WebView.getCurrentWebViewPackage();
        return (currentWebViewPackage == null || (applicationInfo = currentWebViewPackage.applicationInfo) == null) ? "!error!" : applicationInfo.publicSourceDir;
    }
}

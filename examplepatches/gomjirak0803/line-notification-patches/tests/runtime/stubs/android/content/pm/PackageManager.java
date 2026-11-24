package android.content.pm;

import android.content.Intent;

public class PackageManager {
    public Intent getLaunchIntentForPackage(String packageName) {
        return new Intent("android.intent.action.MAIN").setClassName(packageName, "jp.naver.line.android.activity.SplashActivity");
    }
}

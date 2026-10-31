package o9;

import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;
import com.android.launcher3.LauncherWallpaperPickerActivity;

/* loaded from: classes2.dex */
public final class d3 extends y3 {

    /* renamed from: c, reason: collision with root package name */
    public ResolveInfo f79808c;

    /* renamed from: d, reason: collision with root package name */
    public String f79809d;

    /* renamed from: e, reason: collision with root package name */
    public int f79810e;

    @Override // o9.y3
    public final void c(LauncherWallpaperPickerActivity launcherWallpaperPickerActivity) {
        ActivityInfo activityInfo = this.f79808c.activityInfo;
        ComponentName componentName = new ComponentName(activityInfo.packageName, activityInfo.name);
        Intent intent = new Intent("android.intent.action.SET_WALLPAPER");
        intent.setComponent(componentName);
        launcherWallpaperPickerActivity.r0(6, intent);
    }
}

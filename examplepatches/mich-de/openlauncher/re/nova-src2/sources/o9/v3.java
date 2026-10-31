package o9;

import android.content.Intent;
import android.content.pm.PackageManager;
import android.view.View;
import com.android.launcher3.LauncherWallpaperPickerActivity;

/* loaded from: classes2.dex */
public final class v3 extends s3 {

    /* renamed from: e, reason: collision with root package name */
    public final n2 f80195e;

    public v3(View view, View view2, n2 n2Var) {
        super(view, view2);
        this.f80195e = n2Var;
    }

    @Override // o9.s3, o9.y3
    public final void c(LauncherWallpaperPickerActivity launcherWallpaperPickerActivity) {
        PackageManager packageManager = launcherWallpaperPickerActivity.getPackageManager();
        int i5 = LauncherWallpaperPickerActivity.H;
        if (!v30.a.f92040d && (!v30.a.f92037a || packageManager.queryIntentActivities(new Intent("android.service.wallpaper.CHANGE_LIVE_WALLPAPER"), 0).size() <= 0)) {
            Intent intent = new Intent("android.intent.action.SET_WALLPAPER");
            intent.setPackage("com.android.wallpaper.livepicker");
            launcherWallpaperPickerActivity.r0(-1, intent);
        } else {
            n2 n2Var = this.f80195e;
            n2Var.f80031f = true;
            new o80.e(n2Var, launcherWallpaperPickerActivity).execute(n2Var.f80027b.queryIntentServices(new Intent("android.service.wallpaper.WallpaperService"), 128));
            super.c(launcherWallpaperPickerActivity);
        }
    }
}

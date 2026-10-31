package o9;

import android.app.WallpaperInfo;
import android.app.WallpaperManager;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import com.android.launcher3.LauncherWallpaperPickerActivity;

/* loaded from: classes2.dex */
public final class m2 extends y3 {

    /* renamed from: c, reason: collision with root package name */
    public Drawable f79991c;

    /* renamed from: d, reason: collision with root package name */
    public WallpaperInfo f79992d;

    @Override // o9.y3
    public final void c(LauncherWallpaperPickerActivity launcherWallpaperPickerActivity) {
        Intent intent = new Intent("android.service.wallpaper.CHANGE_LIVE_WALLPAPER");
        WallpaperInfo wallpaperInfo = this.f79992d;
        intent.putExtra("android.service.wallpaper.extra.LIVE_WALLPAPER_COMPONENT", wallpaperInfo.getComponent());
        launcherWallpaperPickerActivity.E = wallpaperInfo;
        launcherWallpaperPickerActivity.C = WallpaperManager.getInstance(launcherWallpaperPickerActivity).getWallpaperInfo();
        launcherWallpaperPickerActivity.r0(7, intent);
    }
}

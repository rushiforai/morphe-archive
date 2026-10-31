package o9;

import android.util.Pair;
import com.android.launcher3.LauncherWallpaperPickerActivity;
import java.io.File;

/* loaded from: classes2.dex */
public final class y2 extends t3 {

    /* renamed from: d, reason: collision with root package name */
    public int f80262d;

    @Override // o9.y3
    public final void d(LauncherWallpaperPickerActivity launcherWallpaperPickerActivity) {
        z2 z2Var = launcherWallpaperPickerActivity.B;
        int i5 = this.f80262d;
        Pair pairA = z2Var.a(i5);
        File file = z2Var.f80290c;
        new File(file, (String) pairA.first).delete();
        new File(file, (String) pairA.second).delete();
        z2Var.f80288a.getWritableDatabase().delete("saved_wallpaper_images", "id = ?", new String[]{Integer.toString(i5)});
    }
}

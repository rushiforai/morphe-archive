package o9;

import android.view.View;
import com.android.launcher3.CheckableFrameLayout;
import com.android.launcher3.LauncherWallpaperPickerActivity;

/* loaded from: classes2.dex */
public final class o3 implements View.OnLongClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ LauncherWallpaperPickerActivity f80043a;

    public o3(LauncherWallpaperPickerActivity launcherWallpaperPickerActivity) {
        this.f80043a = launcherWallpaperPickerActivity;
    }

    @Override // android.view.View.OnLongClickListener
    public final boolean onLongClick(View view) {
        ((CheckableFrameLayout) view).toggle();
        LauncherWallpaperPickerActivity launcherWallpaperPickerActivity = this.f80043a;
        androidx.appcompat.view.b bVar = launcherWallpaperPickerActivity.f20980y;
        if (bVar != null) {
            bVar.i();
            return true;
        }
        launcherWallpaperPickerActivity.f20980y = launcherWallpaperPickerActivity.startSupportActionMode(launcherWallpaperPickerActivity.f20979x);
        int childCount = launcherWallpaperPickerActivity.f20977v.getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            launcherWallpaperPickerActivity.f20977v.getChildAt(i5).setSelected(false);
        }
        return true;
    }
}

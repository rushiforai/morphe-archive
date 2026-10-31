package o9;

import android.content.Intent;
import android.view.View;
import com.android.launcher3.LauncherWallpaperPickerActivity;

/* loaded from: classes2.dex */
public final class q3 implements View.OnLongClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ u3 f80081a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ LauncherWallpaperPickerActivity f80082b;

    public q3(LauncherWallpaperPickerActivity launcherWallpaperPickerActivity, u3 u3Var) {
        this.f80082b = launcherWallpaperPickerActivity;
        this.f80081a = u3Var;
    }

    @Override // android.view.View.OnLongClickListener
    public final boolean onLongClick(View view) {
        LauncherWallpaperPickerActivity launcherWallpaperPickerActivity = this.f80082b;
        if (launcherWallpaperPickerActivity.f20980y != null) {
            return true;
        }
        this.f80081a.getClass();
        Intent intent = new Intent("android.intent.action.GET_CONTENT");
        intent.setType("image/*");
        launcherWallpaperPickerActivity.r0(5, Intent.createChooser(intent, "Gallery"));
        return true;
    }
}

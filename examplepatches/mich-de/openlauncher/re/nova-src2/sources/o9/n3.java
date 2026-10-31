package o9;

import android.view.View;
import com.android.launcher3.LauncherWallpaperPickerActivity;

/* loaded from: classes2.dex */
public final class n3 implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f80032a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ LauncherWallpaperPickerActivity f80033b;

    public /* synthetic */ n3(LauncherWallpaperPickerActivity launcherWallpaperPickerActivity, int i5) {
        this.f80032a = i5;
        this.f80033b = launcherWallpaperPickerActivity;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        switch (this.f80032a) {
            case 0:
                LauncherWallpaperPickerActivity launcherWallpaperPickerActivity = this.f80033b;
                if (launcherWallpaperPickerActivity.f20980y == null) {
                    launcherWallpaperPickerActivity.f20988p.setEnabled(true);
                    y3 y3Var = (y3) view.getTag();
                    if (y3Var.b() && view.getVisibility() == 0) {
                        launcherWallpaperPickerActivity.o0(view);
                    }
                    y3Var.c(launcherWallpaperPickerActivity);
                    break;
                } else if (view.isLongClickable()) {
                    launcherWallpaperPickerActivity.f20981z.onLongClick(view);
                    break;
                }
                break;
            default:
                LauncherWallpaperPickerActivity launcherWallpaperPickerActivity2 = this.f80033b;
                if (launcherWallpaperPickerActivity2.f20974s == null) {
                    launcherWallpaperPickerActivity2.setResult(-1);
                    launcherWallpaperPickerActivity2.finish();
                    break;
                } else {
                    launcherWallpaperPickerActivity2.f0(new k30.e(this, 12));
                    break;
                }
        }
    }
}

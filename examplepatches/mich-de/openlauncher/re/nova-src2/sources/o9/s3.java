package o9;

import android.view.View;
import android.view.ViewPropertyAnimator;
import android.view.animation.DecelerateInterpolator;
import com.android.launcher3.LauncherWallpaperPickerActivity;

/* loaded from: classes2.dex */
public class s3 extends y3 {

    /* renamed from: c, reason: collision with root package name */
    public final View f80125c;

    /* renamed from: d, reason: collision with root package name */
    public final View f80126d;

    public s3(View view, View view2) {
        this.f80125c = view;
        this.f80126d = view2;
    }

    @Override // o9.y3
    public void c(LauncherWallpaperPickerActivity launcherWallpaperPickerActivity) {
        View view = this.f80126d;
        view.scrollTo(0, 0);
        view.setAlpha(0.0f);
        ViewPropertyAnimator duration = view.animate().alpha(1.0f).setDuration(300L);
        DecelerateInterpolator decelerateInterpolator = zx.d.f98808d;
        duration.setInterpolator(decelerateInterpolator).setListener(new r3(view)).start();
        View view2 = this.f80125c;
        view2.setAlpha(1.0f);
        view2.animate().alpha(0.0f).setDuration(300L).setInterpolator(decelerateInterpolator).setListener(new r3(view2)).start();
        launcherWallpaperPickerActivity.F.add(view);
    }
}

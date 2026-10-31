package o9;

import android.view.ViewTreeObserver;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import com.android.launcher3.LauncherWallpaperPickerActivity;

/* loaded from: classes2.dex */
public final class l3 implements ViewTreeObserver.OnGlobalLayoutListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ HorizontalScrollView f79985a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ LauncherWallpaperPickerActivity f79986b;

    public l3(LauncherWallpaperPickerActivity launcherWallpaperPickerActivity, HorizontalScrollView horizontalScrollView) {
        this.f79986b = launcherWallpaperPickerActivity;
        this.f79985a = horizontalScrollView;
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    public final void onGlobalLayout() {
        int width = ((LinearLayout) this.f79986b.findViewById(2131428315)).getWidth();
        HorizontalScrollView horizontalScrollView = this.f79985a;
        horizontalScrollView.scrollTo(width, 0);
        horizontalScrollView.getViewTreeObserver().removeOnGlobalLayoutListener(this);
    }
}

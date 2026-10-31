package o9;

import android.content.res.Resources;
import android.database.DataSetObserver;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import com.android.launcher3.LauncherWallpaperPickerActivity;

/* loaded from: classes2.dex */
public final class p3 extends DataSetObserver {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ LinearLayout f80069a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ n2 f80070b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ LauncherWallpaperPickerActivity f80071c;

    public p3(LauncherWallpaperPickerActivity launcherWallpaperPickerActivity, LinearLayout linearLayout, n2 n2Var) {
        this.f80071c = launcherWallpaperPickerActivity;
        this.f80069a = linearLayout;
        this.f80070b = n2Var;
    }

    @Override // android.database.DataSetObserver
    public final void onChanged() throws Resources.NotFoundException {
        LinearLayout linearLayout = this.f80069a;
        linearLayout.removeAllViews();
        LauncherWallpaperPickerActivity launcherWallpaperPickerActivity = this.f80071c;
        n2 n2Var = this.f80070b;
        launcherWallpaperPickerActivity.n0(linearLayout, n2Var, false);
        launcherWallpaperPickerActivity.m0(linearLayout, new j3(n2Var, 1));
        HorizontalScrollView horizontalScrollView = (HorizontalScrollView) launcherWallpaperPickerActivity.findViewById(2131429177);
        if (horizontalScrollView.getLayoutDirection() == 1) {
            horizontalScrollView.getViewTreeObserver().addOnGlobalLayoutListener(new l3(launcherWallpaperPickerActivity, horizontalScrollView));
        }
        launcherWallpaperPickerActivity.s0();
    }
}

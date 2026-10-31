package o9;

import android.app.WallpaperInfo;
import android.content.pm.PackageManager;
import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ListAdapter;
import android.widget.TextView;
import com.android.launcher3.LauncherWallpaperPickerActivity;
import java.util.ArrayList;

/* loaded from: classes2.dex */
public final class n2 extends BaseAdapter implements ListAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final LayoutInflater f80026a;

    /* renamed from: b, reason: collision with root package name */
    public final PackageManager f80027b;

    /* renamed from: d, reason: collision with root package name */
    public final int f80029d;

    /* renamed from: e, reason: collision with root package name */
    public final int f80030e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f80031f = false;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f80028c = new ArrayList();

    public n2(LauncherWallpaperPickerActivity launcherWallpaperPickerActivity) {
        this.f80026a = (LayoutInflater) launcherWallpaperPickerActivity.getSystemService("layout_inflater");
        this.f80027b = launcherWallpaperPickerActivity.getApplicationContext().getPackageManager();
        this.f80029d = launcherWallpaperPickerActivity.getResources().getDimensionPixelSize(2131166540);
        this.f80030e = launcherWallpaperPickerActivity.getResources().getDimensionPixelSize(2131166539);
    }

    @Override // android.widget.Adapter
    public final int getCount() {
        ArrayList arrayList = this.f80028c;
        if (arrayList == null) {
            return 0;
        }
        return arrayList.size();
    }

    @Override // android.widget.Adapter
    public final Object getItem(int i5) {
        return (m2) this.f80028c.get(i5);
    }

    @Override // android.widget.Adapter
    public final long getItemId(int i5) {
        return i5;
    }

    @Override // android.widget.Adapter
    public final View getView(int i5, View view, ViewGroup viewGroup) {
        if (view == null) {
            view = this.f80026a.inflate(2131624454, viewGroup, false);
        }
        LauncherWallpaperPickerActivity.q0((FrameLayout) view);
        m2 m2Var = (m2) this.f80028c.get(i5);
        m2Var.f80263a = view;
        WallpaperInfo wallpaperInfo = m2Var.f79992d;
        ImageView imageView = (ImageView) view.findViewById(2131429173);
        ImageView imageView2 = (ImageView) view.findViewById(2131429172);
        Drawable drawable = m2Var.f79991c;
        PackageManager packageManager = this.f80027b;
        if (drawable != null) {
            imageView.setImageDrawable(drawable);
            imageView2.setVisibility(8);
        } else {
            imageView2.setImageDrawable(wallpaperInfo.loadIcon(packageManager));
            imageView2.setVisibility(0);
        }
        ((TextView) view.findViewById(2131429174)).setText(wallpaperInfo.loadLabel(packageManager));
        return view;
    }
}

package o9;

import com.android.launcher3.LauncherWallpaperPickerActivity;

/* loaded from: classes2.dex */
public final /* synthetic */ class j3 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f79921a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ n2 f79922b;

    public /* synthetic */ j3(n2 n2Var, int i5) {
        this.f79921a = i5;
        this.f79922b = n2Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i5 = this.f79921a;
        n2 n2Var = this.f79922b;
        switch (i5) {
            case 0:
                int i11 = LauncherWallpaperPickerActivity.H;
                n2Var.f80031f = false;
                n2Var.f80028c.clear();
                n2Var.notifyDataSetChanged();
                break;
            default:
                n2Var.f80031f = false;
                n2Var.f80028c.clear();
                n2Var.notifyDataSetChanged();
                break;
        }
    }
}

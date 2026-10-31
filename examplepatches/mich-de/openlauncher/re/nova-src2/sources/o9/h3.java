package o9;

import android.os.AsyncTask;
import android.view.View;
import com.android.launcher3.CropView;
import com.android.launcher3.WallpaperCropActivity;

/* loaded from: classes2.dex */
public final class h3 extends AsyncTask {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ hb.c f79867a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ View f79868b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ WallpaperCropActivity f79869c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ boolean f79870d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ boolean f79871e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Runnable f79872f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ WallpaperCropActivity f79873g;

    public h3(WallpaperCropActivity wallpaperCropActivity, hb.c cVar, View view, WallpaperCropActivity wallpaperCropActivity2, boolean z11, boolean z12, Runnable runnable) {
        this.f79873g = wallpaperCropActivity;
        this.f79867a = cVar;
        this.f79868b = view;
        this.f79869c = wallpaperCropActivity2;
        this.f79870d = z11;
        this.f79871e = z12;
        this.f79872f = runnable;
    }

    @Override // android.os.AsyncTask
    public final Object doInBackground(Object[] objArr) {
        if (isCancelled()) {
            return null;
        }
        try {
            this.f79867a.b();
            return null;
        } catch (SecurityException e3) {
            if (!this.f79873g.isDestroyed()) {
                throw e3;
            }
            cancel(false);
            return null;
        }
    }

    @Override // android.os.AsyncTask
    public final void onPostExecute(Object obj) {
        if (!isCancelled()) {
            this.f79868b.setVisibility(4);
            hb.c cVar = this.f79867a;
            if (cVar.f59595d == 2) {
                WallpaperCropActivity wallpaperCropActivity = this.f79873g;
                wallpaperCropActivity.o.d(new hb.d(this.f79869c, cVar));
                CropView cropView = wallpaperCropActivity.o;
                cropView.f20936p = this.f79870d;
                if (this.f79871e) {
                    cropView.c();
                }
            }
        }
        this.f79872f.run();
    }
}

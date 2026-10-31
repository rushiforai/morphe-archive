package o9;

import android.graphics.Bitmap;
import android.graphics.Point;
import android.net.Uri;
import android.os.AsyncTask;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.android.launcher3.LauncherWallpaperPickerActivity;
import com.android.launcher3.WallpaperCropActivity;

/* loaded from: classes2.dex */
public final class m3 extends AsyncTask {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ LauncherWallpaperPickerActivity f79993a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Uri f79994b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Point f79995c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ ImageView f79996d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ FrameLayout f79997e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ LauncherWallpaperPickerActivity f79998f;

    public m3(LauncherWallpaperPickerActivity launcherWallpaperPickerActivity, LauncherWallpaperPickerActivity launcherWallpaperPickerActivity2, Uri uri, Point point, ImageView imageView, FrameLayout frameLayout) {
        this.f79998f = launcherWallpaperPickerActivity;
        this.f79993a = launcherWallpaperPickerActivity2;
        this.f79994b = uri;
        this.f79995c = point;
        this.f79996d = imageView;
        this.f79997e = frameLayout;
    }

    @Override // android.os.AsyncTask
    public final Object doInBackground(Object[] objArr) {
        LauncherWallpaperPickerActivity launcherWallpaperPickerActivity = this.f79993a;
        try {
            return LauncherWallpaperPickerActivity.l0(this.f79995c, launcherWallpaperPickerActivity, this.f79994b, null, WallpaperCropActivity.c0(null, 0, launcherWallpaperPickerActivity, this.f79994b), false);
        } catch (SecurityException e3) {
            if (!this.f79998f.isDestroyed()) {
                throw e3;
            }
            cancel(false);
            return null;
        }
    }

    @Override // android.os.AsyncTask
    public final void onPostExecute(Object obj) {
        Bitmap bitmap = (Bitmap) obj;
        if (isCancelled() || bitmap == null) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("Nova.WallpaperPicker");
            bVar.d("Error loading thumbnail for uri=%s", this.f79994b);
        } else {
            ImageView imageView = this.f79996d;
            imageView.setImageBitmap(bitmap);
            imageView.getDrawable().setDither(true);
            this.f79997e.setVisibility(0);
        }
    }
}

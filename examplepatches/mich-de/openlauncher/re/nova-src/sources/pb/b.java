package pb;

import android.view.SurfaceHolder;
import java.lang.ref.WeakReference;

/* loaded from: classes2.dex */
public final class b implements SurfaceHolder.Callback {

    /* renamed from: a, reason: collision with root package name */
    public final WeakReference f82491a;

    public b(d dVar) {
        this.f82491a = new WeakReference(dVar);
    }

    @Override // android.view.SurfaceHolder.Callback
    public final void surfaceChanged(SurfaceHolder surfaceHolder, int i5, int i11, int i12) {
        SurfaceHolder.Callback callback = (SurfaceHolder.Callback) this.f82491a.get();
        if (callback != null) {
            callback.surfaceChanged(surfaceHolder, i5, i11, i12);
        }
    }

    @Override // android.view.SurfaceHolder.Callback
    public final void surfaceCreated(SurfaceHolder surfaceHolder) {
        SurfaceHolder.Callback callback = (SurfaceHolder.Callback) this.f82491a.get();
        if (callback != null) {
            callback.surfaceCreated(surfaceHolder);
        }
    }

    @Override // android.view.SurfaceHolder.Callback
    public final void surfaceDestroyed(SurfaceHolder surfaceHolder) {
        SurfaceHolder.Callback callback = (SurfaceHolder.Callback) this.f82491a.get();
        if (callback != null) {
            callback.surfaceDestroyed(surfaceHolder);
        }
    }
}

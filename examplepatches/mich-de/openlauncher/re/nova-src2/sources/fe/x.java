package fe;

import android.graphics.SurfaceTexture;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.TextureView;

/* loaded from: classes3.dex */
public final class x implements SurfaceHolder.Callback, TextureView.SurfaceTextureListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ a0 f55061a;

    public x(a0 a0Var) {
        this.f55061a = a0Var;
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public final void onSurfaceTextureAvailable(SurfaceTexture surfaceTexture, int i5, int i11) {
        Surface surface = new Surface(surfaceTexture);
        a0 a0Var = this.f55061a;
        a0Var.l0(surface);
        a0Var.S = surface;
        a0Var.a0(i5, i11);
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public final boolean onSurfaceTextureDestroyed(SurfaceTexture surfaceTexture) {
        a0 a0Var = this.f55061a;
        a0Var.l0(null);
        a0Var.a0(0, 0);
        return true;
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public final void onSurfaceTextureSizeChanged(SurfaceTexture surfaceTexture, int i5, int i11) {
        this.f55061a.a0(i5, i11);
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public final void onSurfaceTextureUpdated(SurfaceTexture surfaceTexture) {
    }

    @Override // android.view.SurfaceHolder.Callback
    public final void surfaceChanged(SurfaceHolder surfaceHolder, int i5, int i11, int i12) {
        this.f55061a.a0(i11, i12);
    }

    @Override // android.view.SurfaceHolder.Callback
    public final void surfaceCreated(SurfaceHolder surfaceHolder) {
        a0 a0Var = this.f55061a;
        if (a0Var.V) {
            a0Var.l0(surfaceHolder.getSurface());
        }
    }

    @Override // android.view.SurfaceHolder.Callback
    public final void surfaceDestroyed(SurfaceHolder surfaceHolder) {
        a0 a0Var = this.f55061a;
        if (a0Var.V) {
            a0Var.l0(null);
        }
        a0Var.a0(0, 0);
    }
}

package pb;

import android.graphics.SurfaceTexture;
import android.view.SurfaceHolder;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import com.bytedance.sdk.openadsdk.core.syc.zb.lud;
import com.bytedance.sdk.openadsdk.oty.sya;

/* loaded from: classes2.dex */
public final class a extends TextureView implements TextureView.SurfaceTextureListener, f {

    /* renamed from: a, reason: collision with root package name */
    public lud f82490a;

    @Override // pb.f
    public final void a(lud ludVar) {
        this.f82490a = ludVar;
        setSurfaceTextureListener(this);
    }

    @Override // pb.f
    public final View c() {
        return this;
    }

    @Override // pb.f
    public final SurfaceHolder getHolder() {
        return null;
    }

    @Override // android.view.TextureView, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
    }

    @Override // android.view.View
    public final void onDetachedFromWindow() {
        try {
            super.onDetachedFromWindow();
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOUE7Un1YVE01ieB6ktTA==", "aN0fkA24bNW0T89JmQOlHlLrOg==", "VOAJkBe9as+FTvFPgxyXIVXqIoI=", 58);
        }
    }

    @Override // android.view.TextureView, android.view.View
    public final void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public final void onSurfaceTextureAvailable(SurfaceTexture surfaceTexture, int i5, int i11) {
        lud ludVar = this.f82490a;
        if (ludVar != null) {
            ludVar.ycx(surfaceTexture, i5, i11);
        }
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public final boolean onSurfaceTextureDestroyed(SurfaceTexture surfaceTexture) {
        lud ludVar = this.f82490a;
        if (ludVar != null) {
            return ludVar.ycx(surfaceTexture);
        }
        return false;
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public final void onSurfaceTextureSizeChanged(SurfaceTexture surfaceTexture, int i5, int i11) {
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public final void onSurfaceTextureUpdated(SurfaceTexture surfaceTexture) {
        lud ludVar = this.f82490a;
        if (ludVar != null) {
            ludVar.zb(surfaceTexture);
        }
    }

    @Override // android.view.View
    public final void onWindowVisibilityChanged(int i5) {
        super.onWindowVisibilityChanged(i5);
    }

    @Override // pb.f
    public final void ycx(int i5, int i11) {
        ViewGroup.LayoutParams layoutParams = getLayoutParams();
        layoutParams.height = i11;
        layoutParams.width = i5;
        setLayoutParams(layoutParams);
    }
}

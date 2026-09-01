package defpackage;

import android.media.ImageReader;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cp6 implements ImageReader.OnImageAvailableListener {
    public final /* synthetic */ x51 a;

    public cp6(x51 x51Var) {
        this.a = x51Var;
    }

    @Override // android.media.ImageReader.OnImageAvailableListener
    public final void onImageAvailable(ImageReader imageReader) {
        this.a.resumeWith(imageReader.acquireLatestImage());
    }
}

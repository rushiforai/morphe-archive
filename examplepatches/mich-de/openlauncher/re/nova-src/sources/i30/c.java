package i30;

import android.graphics.Bitmap;

/* loaded from: classes4.dex */
public final class c extends x {

    /* renamed from: q, reason: collision with root package name */
    public final Bitmap f61259q;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(Bitmap bitmap) {
        super(0);
        boolean z11 = false;
        if (bitmap != null && !bitmap.isRecycled()) {
            z11 = true;
        }
        f30.f.a(z11);
        this.f61259q = bitmap;
    }

    @Override // i30.x
    public final void k(Bitmap bitmap) {
    }

    @Override // i30.x
    public final Bitmap l() {
        return this.f61259q;
    }
}

package g8;

import android.graphics.drawable.Drawable;

/* loaded from: classes2.dex */
public final class c implements Drawable.Callback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f57202a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Drawable f57203b;

    public /* synthetic */ c(Drawable drawable, int i5) {
        this.f57202a = i5;
        this.f57203b = drawable;
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public final void invalidateDrawable(Drawable drawable) {
        switch (this.f57202a) {
            case 0:
                ((f) this.f57203b).invalidateSelf();
                break;
            default:
                ((j7.e) this.f57203b).invalidateSelf();
                break;
        }
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public final void scheduleDrawable(Drawable drawable, Runnable runnable, long j11) {
        switch (this.f57202a) {
            case 0:
                ((f) this.f57203b).scheduleSelf(runnable, j11);
                break;
            default:
                ((j7.e) this.f57203b).scheduleSelf(runnable, j11);
                break;
        }
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public final void unscheduleDrawable(Drawable drawable, Runnable runnable) {
        switch (this.f57202a) {
            case 0:
                ((f) this.f57203b).unscheduleSelf(runnable);
                break;
            default:
                ((j7.e) this.f57203b).unscheduleSelf(runnable);
                break;
        }
    }
}

package defpackage;

import android.graphics.drawable.Drawable;
import android.os.Handler;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bw implements Drawable.Callback {
    public final /* synthetic */ int a;
    public Object b;

    public /* synthetic */ bw(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public final void invalidateDrawable(Drawable drawable) {
        long jFloatToRawIntBits;
        switch (this.a) {
            case 0:
                ((fw) this.b).invalidateSelf();
                break;
            case 1:
                break;
            default:
                drawable.getClass();
                hm3 hm3Var = (hm3) this.b;
                k49 k49Var = hm3Var.g;
                k49Var.setValue(Integer.valueOf(((Number) k49Var.getValue()).intValue() + 1));
                Drawable drawable2 = hm3Var.f;
                vq6 vq6Var = im3.a;
                if (drawable2.getIntrinsicWidth() < 0 || drawable2.getIntrinsicHeight() < 0) {
                    jFloatToRawIntBits = 9205357640488583168L;
                } else {
                    jFloatToRawIntBits = (((long) Float.floatToRawIntBits(drawable2.getIntrinsicWidth())) << 32) | (((long) Float.floatToRawIntBits(drawable2.getIntrinsicHeight())) & 4294967295L);
                }
                hm3Var.h.setValue(new dfc(jFloatToRawIntBits));
                break;
        }
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public final void scheduleDrawable(Drawable drawable, Runnable runnable, long j) {
        switch (this.a) {
            case 0:
                ((fw) this.b).scheduleSelf(runnable, j);
                break;
            case 1:
                Drawable.Callback callback = (Drawable.Callback) this.b;
                if (callback != null) {
                    callback.scheduleDrawable(drawable, runnable, j);
                }
                break;
            default:
                drawable.getClass();
                runnable.getClass();
                ((Handler) im3.a.getValue()).postAtTime(runnable, j);
                break;
        }
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public final void unscheduleDrawable(Drawable drawable, Runnable runnable) {
        switch (this.a) {
            case 0:
                ((fw) this.b).unscheduleSelf(runnable);
                break;
            case 1:
                Drawable.Callback callback = (Drawable.Callback) this.b;
                if (callback != null) {
                    callback.unscheduleDrawable(drawable, runnable);
                }
                break;
            default:
                drawable.getClass();
                runnable.getClass();
                ((Handler) im3.a.getValue()).removeCallbacks(runnable);
                break;
        }
    }

    private final void a(Drawable drawable) {
    }
}

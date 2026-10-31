package ya;

import android.app.WallpaperManager;
import android.content.Context;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.SystemClock;
import android.util.Log;
import android.view.animation.DecelerateInterpolator;

/* loaded from: classes.dex */
public final class o0 extends Handler {

    /* renamed from: a, reason: collision with root package name */
    public final DecelerateInterpolator f97184a;

    /* renamed from: b, reason: collision with root package name */
    public final WallpaperManager f97185b;

    /* renamed from: c, reason: collision with root package name */
    public float f97186c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f97187d;

    /* renamed from: e, reason: collision with root package name */
    public long f97188e;

    /* renamed from: f, reason: collision with root package name */
    public float f97189f;

    /* renamed from: g, reason: collision with root package name */
    public float f97190g;

    /* renamed from: h, reason: collision with root package name */
    public float f97191h;

    public o0(Context context) {
        super(j.f97148c.f97215a.getLooper());
        this.f97186c = -1.0f;
        this.f97184a = s9.k.f86793f;
        this.f97185b = WallpaperManager.getInstance(context);
    }

    public final void a(IBinder iBinder) {
        try {
            this.f97185b.setWallpaperOffsets(iBinder, this.f97186c, 0.5f);
        } catch (IllegalArgumentException | SecurityException e3) {
            Log.e("WPOffsetInterpolator", "Error updating wallpaper offset: " + e3);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0082  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x008e  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x009a  */
    /* JADX WARN: Removed duplicated region for block: B:41:? A[RETURN, SYNTHETIC] */
    @Override // android.os.Handler
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void handleMessage(Message message) {
        WallpaperManager wallpaperManager;
        float f11;
        IBinder iBinder = (IBinder) message.obj;
        if (iBinder == null || (wallpaperManager = this.f97185b) == null) {
            return;
        }
        int i5 = message.what;
        if (i5 != 1) {
            if (i5 != 2) {
                if (i5 != 3) {
                    if (i5 == 4) {
                        float f12 = 1.0f / (message.arg1 - 1);
                        this.f97191h = f12;
                        wallpaperManager.setWallpaperOffsetSteps(f12, 1.0f);
                        return;
                    } else {
                        if (i5 != 5) {
                            return;
                        }
                        if (Float.compare(this.f97186c, this.f97190g) != 0) {
                            this.f97186c = this.f97190g;
                            a(iBinder);
                        }
                        this.f97187d = false;
                        return;
                    }
                }
            }
            f11 = this.f97186c;
            if (this.f97187d) {
                this.f97186c = this.f97190g;
            } else {
                long jUptimeMillis = SystemClock.uptimeMillis() - this.f97188e;
                float interpolation = this.f97184a.getInterpolation(jUptimeMillis / 250.0f);
                float f13 = this.f97189f;
                this.f97186c = a2.c.a(this.f97190g, f13, interpolation, f13);
                this.f97187d = jUptimeMillis < 250;
            }
            if (Float.compare(this.f97186c, f11) != 0) {
                a(iBinder);
                wallpaperManager.setWallpaperOffsetSteps(this.f97191h, 1.0f);
            }
            if (this.f97187d) {
                return;
            }
            Message.obtain(this, 3, iBinder).sendToTarget();
            return;
        }
        this.f97187d = true;
        this.f97189f = this.f97186c;
        this.f97188e = message.getWhen();
        this.f97190g = message.arg1 / message.arg2;
        f11 = this.f97186c;
        if (this.f97187d) {
        }
        if (Float.compare(this.f97186c, f11) != 0) {
        }
        if (this.f97187d) {
        }
    }
}

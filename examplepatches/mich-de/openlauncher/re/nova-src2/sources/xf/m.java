package xf;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.view.Choreographer;
import wf.v;

/* loaded from: classes3.dex */
public final class m implements Choreographer.FrameCallback, Handler.Callback {

    /* renamed from: e, reason: collision with root package name */
    public static final m f95803e = new m();

    /* renamed from: a, reason: collision with root package name */
    public volatile long f95804a = -9223372036854775807L;

    /* renamed from: b, reason: collision with root package name */
    public final Handler f95805b;

    /* renamed from: c, reason: collision with root package name */
    public Choreographer f95806c;

    /* renamed from: d, reason: collision with root package name */
    public int f95807d;

    public m() {
        HandlerThread handlerThread = new HandlerThread("ExoPlayer:FrameReleaseChoreographer");
        handlerThread.start();
        Looper looper = handlerThread.getLooper();
        int i5 = v.f94376a;
        Handler handler = new Handler(looper, this);
        this.f95805b = handler;
        handler.sendEmptyMessage(0);
    }

    @Override // android.view.Choreographer.FrameCallback
    public final void doFrame(long j11) {
        this.f95804a = j11;
        Choreographer choreographer = this.f95806c;
        choreographer.getClass();
        choreographer.postFrameCallbackDelayed(this, 500L);
    }

    @Override // android.os.Handler.Callback
    public final boolean handleMessage(Message message) {
        int i5 = message.what;
        if (i5 == 0) {
            try {
                this.f95806c = Choreographer.getInstance();
                return true;
            } catch (RuntimeException e3) {
                wf.a.E("VideoFrameReleaseHelper", "Vsync sampling disabled due to platform error", e3);
                return true;
            }
        }
        if (i5 == 1) {
            Choreographer choreographer = this.f95806c;
            if (choreographer != null) {
                int i11 = this.f95807d + 1;
                this.f95807d = i11;
                if (i11 == 1) {
                    choreographer.postFrameCallback(this);
                }
            }
        } else {
            if (i5 != 2) {
                return false;
            }
            Choreographer choreographer2 = this.f95806c;
            if (choreographer2 != null) {
                int i12 = this.f95807d - 1;
                this.f95807d = i12;
                if (i12 == 0) {
                    choreographer2.removeFrameCallback(this);
                    this.f95804a = -9223372036854775807L;
                    return true;
                }
            }
        }
        return true;
    }
}

package defpackage;

import android.os.Looper;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewTreeObserver;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ty1 implements sy1, ViewTreeObserver.OnDrawListener, Runnable {
    public final long a = SystemClock.uptimeMillis() + 10000;
    public Runnable b;
    public boolean c;
    public final /* synthetic */ xy1 d;

    public ty1(xy1 xy1Var) {
        this.d = xy1Var;
    }

    public final void a(View view) {
        if (this.c) {
            return;
        }
        this.c = true;
        view.getViewTreeObserver().addOnDrawListener(this);
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        runnable.getClass();
        this.b = runnable;
        View decorView = this.d.getWindow().getDecorView();
        decorView.getClass();
        if (!this.c) {
            decorView.postOnAnimation(new v0(11, this));
        } else if (g76.L(Looper.myLooper(), Looper.getMainLooper())) {
            decorView.invalidate();
        } else {
            decorView.postInvalidate();
        }
    }

    @Override // android.view.ViewTreeObserver.OnDrawListener
    public final void onDraw() {
        boolean z;
        Runnable runnable = this.b;
        if (runnable == null) {
            if (SystemClock.uptimeMillis() > this.a) {
                this.c = false;
                this.d.getWindow().getDecorView().post(this);
                return;
            }
            return;
        }
        runnable.run();
        this.b = null;
        l45 fullyDrawnReporter = this.d.getFullyDrawnReporter();
        synchronized (fullyDrawnReporter.b) {
            z = fullyDrawnReporter.c;
        }
        if (z) {
            this.c = false;
            this.d.getWindow().getDecorView().post(this);
        }
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.d.getWindow().getDecorView().getViewTreeObserver().removeOnDrawListener(this);
    }
}

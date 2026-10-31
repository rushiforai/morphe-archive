package g;

import android.os.Looper;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewTreeObserver;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class l implements k, ViewTreeObserver.OnDrawListener, Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final long f56419a = SystemClock.uptimeMillis() + 10000;

    /* renamed from: b, reason: collision with root package name */
    public Runnable f56420b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f56421c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ o f56422d;

    public l(o oVar) {
        this.f56422d = oVar;
    }

    public final void a(View view) {
        if (this.f56421c) {
            return;
        }
        this.f56421c = true;
        view.getViewTreeObserver().addOnDrawListener(this);
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        Intrinsics.g(runnable, "runnable");
        this.f56420b = runnable;
        View decorView = this.f56422d.getWindow().getDecorView();
        Intrinsics.f(decorView, "window.decorView");
        if (!this.f56421c) {
            decorView.postOnAnimation(new aa.x(this, 29));
        } else if (Intrinsics.b(Looper.myLooper(), Looper.getMainLooper())) {
            decorView.invalidate();
        } else {
            decorView.postInvalidate();
        }
    }

    @Override // android.view.ViewTreeObserver.OnDrawListener
    public final void onDraw() {
        Runnable runnable = this.f56420b;
        o oVar = this.f56422d;
        if (runnable == null) {
            if (SystemClock.uptimeMillis() > this.f56419a) {
                this.f56421c = false;
                oVar.getWindow().getDecorView().post(this);
                return;
            }
            return;
        }
        runnable.run();
        this.f56420b = null;
        if (oVar.getFullyDrawnReporter().b()) {
            this.f56421c = false;
            oVar.getWindow().getDecorView().post(this);
        }
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f56422d.getWindow().getDecorView().getViewTreeObserver().removeOnDrawListener(this);
    }
}

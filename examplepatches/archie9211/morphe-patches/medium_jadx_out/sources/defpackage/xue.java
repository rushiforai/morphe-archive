package defpackage;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.view.ViewTreeObserver;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xue implements ViewTreeObserver.OnGlobalLayoutListener {
    public static final HashMap d = new HashMap();
    public final WeakReference a;
    public final Handler b = new Handler(Looper.getMainLooper());
    public final AtomicBoolean c = new AtomicBoolean(false);

    public xue(Activity activity) {
        this.a = new WeakReference(activity);
    }

    public final void a() {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            b2a b2aVar = new b2a(10, this);
            if (Thread.currentThread() == Looper.getMainLooper().getThread()) {
                b2aVar.run();
            } else {
                this.b.post(b2aVar);
            }
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    public final void onGlobalLayout() {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            a();
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }
}

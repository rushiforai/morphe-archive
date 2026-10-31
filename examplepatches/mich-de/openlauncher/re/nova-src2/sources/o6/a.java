package o6;

import ai.e1;
import android.os.Handler;
import android.os.Looper;
import java.util.concurrent.atomic.AtomicBoolean;
import mg.d;
import mk.w;

/* loaded from: classes2.dex */
public final class a implements Runnable {

    /* renamed from: f, reason: collision with root package name */
    public static Handler f79609f;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ d f79614e;

    /* renamed from: b, reason: collision with root package name */
    public volatile int f79611b = 1;

    /* renamed from: c, reason: collision with root package name */
    public final AtomicBoolean f79612c = new AtomicBoolean();

    /* renamed from: d, reason: collision with root package name */
    public final AtomicBoolean f79613d = new AtomicBoolean();

    /* renamed from: a, reason: collision with root package name */
    public final b f79610a = new b(this, new e1(this, 2));

    public a(d dVar) {
        this.f79614e = dVar;
    }

    public final void a(Object obj) {
        Handler handler;
        synchronized (a.class) {
            try {
                if (f79609f == null) {
                    f79609f = new Handler(Looper.getMainLooper());
                }
                handler = f79609f;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        handler.post(new w((Object) this, obj, false, 4));
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f79614e.b();
    }
}

package ba;

import aa.x;
import android.os.Handler;
import java.util.concurrent.Executor;
import java.util.function.Consumer;
import java.util.function.Supplier;

/* loaded from: classes2.dex */
public final class e implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final Handler f17742a;

    /* renamed from: b, reason: collision with root package name */
    public final Supplier f17743b;

    /* renamed from: c, reason: collision with root package name */
    public final Executor f17744c;

    /* renamed from: d, reason: collision with root package name */
    public final Consumer f17745d;

    /* renamed from: e, reason: collision with root package name */
    public final Runnable f17746e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f17747f = false;

    /* renamed from: g, reason: collision with root package name */
    public boolean f17748g = false;

    public e(Handler handler, Supplier supplier, Executor executor, Consumer consumer, Runnable runnable) {
        this.f17742a = handler;
        this.f17743b = supplier;
        this.f17744c = executor;
        this.f17745d = consumer;
        this.f17746e = runnable;
    }

    public final void a() {
        this.f17742a.removeCallbacks(this);
        this.f17748g = true;
        this.f17744c.execute(new x(this, 13));
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f17744c.execute(new ae.c(8, this, this.f17743b.get()));
    }
}

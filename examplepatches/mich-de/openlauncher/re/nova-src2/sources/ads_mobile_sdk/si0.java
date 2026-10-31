package ads_mobile_sdk;

import android.content.Context;
import android.database.ContentObserver;
import android.media.AudioManager;
import android.os.Handler;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes2.dex */
public final class si0 extends ContentObserver {

    /* renamed from: a, reason: collision with root package name */
    public final Handler f9565a;

    /* renamed from: b, reason: collision with root package name */
    public final Context f9566b;

    /* renamed from: c, reason: collision with root package name */
    public final AudioManager f9567c;

    /* renamed from: d, reason: collision with root package name */
    public final bk.e f9568d;

    /* renamed from: e, reason: collision with root package name */
    public final p72 f9569e;

    /* renamed from: f, reason: collision with root package name */
    public final AtomicReference f9570f;

    /* renamed from: g, reason: collision with root package name */
    public final AtomicBoolean f9571g;

    /* renamed from: h, reason: collision with root package name */
    public final ExecutorService f9572h;

    public si0(Handler handler, Context context, bk.e eVar, p72 p72Var) {
        super(handler);
        this.f9570f = new AtomicReference(Float.valueOf(-1.0f));
        this.f9571g = new AtomicBoolean(false);
        this.f9572h = Executors.newSingleThreadExecutor();
        this.f9565a = handler;
        this.f9566b = context;
        this.f9567c = (AudioManager) context.getSystemService("audio");
        this.f9568d = eVar;
        this.f9569e = p72Var;
    }

    @Override // android.database.ContentObserver
    public final void onChange(boolean z11) {
        if (this.f9571g.getAndSet(true)) {
            return;
        }
        this.f9572h.submit(new qj3(this, 1));
    }
}

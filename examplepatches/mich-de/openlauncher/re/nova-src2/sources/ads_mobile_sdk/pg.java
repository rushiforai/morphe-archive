package ads_mobile_sdk;

import android.content.Context;
import android.view.View;
import cl.d1;
import cl.t;
import cl.w0;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.HashMap;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
public final class pg implements b.j1, b.v1 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f8263a;

    /* renamed from: b, reason: collision with root package name */
    public final vi3 f8264b;

    /* renamed from: c, reason: collision with root package name */
    public final j7 f8265c;

    /* renamed from: d, reason: collision with root package name */
    public final d1 f8266d;

    /* renamed from: e, reason: collision with root package name */
    public final AtomicBoolean f8267e = new AtomicBoolean(false);

    /* renamed from: f, reason: collision with root package name */
    public ListenableFuture f8268f = w0.b("E");

    public pg(Context context, vi3 vi3Var, j7 j7Var, d1 d1Var) {
        this.f8263a = context;
        this.f8264b = vi3Var;
        this.f8265c = j7Var;
        this.f8266d = d1Var;
    }

    @Override // b.j1
    public final void a(HashMap map) {
        c(map);
    }

    @Override // b.j1
    public final void b(HashMap map) {
        c(map);
    }

    public final void c(HashMap map) {
        synchronized (this) {
            map.put("ai", this.f8268f);
        }
    }

    @Override // b.j1
    public final void a(HashMap map, Context context, View view) {
        c(map);
    }

    @Override // b.v1
    public final ListenableFuture a() {
        if (this.f8267e.getAndSet(true)) {
            return cl.z0.f20092b;
        }
        return ((t) this.f8266d).submit((Callable) new ab.e(this, 4));
    }
}

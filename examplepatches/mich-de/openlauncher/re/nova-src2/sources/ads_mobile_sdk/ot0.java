package ads_mobile_sdk;

import a5.i;
import android.content.Context;
import android.view.View;
import cl.d1;
import cl.m1;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.HashMap;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes.dex */
public final class ot0 implements b.j1, b.v1 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f7995a;

    /* renamed from: b, reason: collision with root package name */
    public final vi3 f7996b;

    /* renamed from: c, reason: collision with root package name */
    public final d1 f7997c;

    /* renamed from: d, reason: collision with root package name */
    public final j7 f7998d;

    /* renamed from: e, reason: collision with root package name */
    public final AtomicBoolean f7999e;

    /* renamed from: f, reason: collision with root package name */
    public final i f8000f;

    /* renamed from: g, reason: collision with root package name */
    public final b.g7 f8001g;

    /* renamed from: h, reason: collision with root package name */
    public ListenableFuture f8002h;

    public ot0(Context context, vi3 vi3Var, d1 d1Var, j7 j7Var, b.g7 g7Var) {
        i iVar = new i(2);
        this.f7999e = new AtomicBoolean(false);
        this.f8002h = cl.z0.f20092b;
        this.f7995a = context;
        this.f7996b = vi3Var;
        this.f7997c = d1Var;
        this.f7998d = j7Var;
        this.f8000f = iVar;
        this.f8001g = g7Var;
    }

    @Override // b.j1
    public final void a(HashMap map) {
        map.put("gs", this.f8002h);
    }

    @Override // b.j1
    public final void b(HashMap map) {
        map.put("gs", this.f8002h);
    }

    @Override // b.j1
    public final void a(HashMap map, Context context, View view) {
        map.put("gs", this.f8002h);
    }

    @Override // b.v1
    public final ListenableFuture a() {
        if (this.f7999e.getAndSet(true)) {
            return cl.z0.f20092b;
        }
        if (!this.f7998d.w()) {
            return cl.z0.f20092b;
        }
        m1 m1VarR = m1.r();
        this.f8002h = m1VarR;
        this.f7996b.a(yk0.EVENT_ID_INIT_GASS_TRACKER, new ae.c(5, this, m1VarR));
        return cl.z0.f20092b;
    }
}

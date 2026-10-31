package ads_mobile_sdk;

import android.content.ComponentName;
import android.content.Context;
import android.os.RemoteException;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class i80 extends w.k {

    /* renamed from: a, reason: collision with root package name */
    public final Context f4664a;

    /* renamed from: b, reason: collision with root package name */
    public final t70.j0 f4665b;

    /* renamed from: c, reason: collision with root package name */
    public final kz2 f4666c;

    /* renamed from: d, reason: collision with root package name */
    public w.l f4667d;

    /* renamed from: e, reason: collision with root package name */
    public w.j f4668e;

    /* renamed from: f, reason: collision with root package name */
    public final AtomicBoolean f4669f;

    public i80(Context applicationContext, t70.j0 backgroundScope, kz2 rootTraceCreator) {
        Intrinsics.g(applicationContext, "applicationContext");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        this.f4664a = applicationContext;
        this.f4665b = backgroundScope;
        this.f4666c = rootTraceCreator;
        this.f4669f = new AtomicBoolean(false);
    }

    @Override // w.k
    public final void onCustomTabsServiceConnected(ComponentName name, w.j jVar) {
        Intrinsics.g(name, "name");
        this.f4668e = jVar;
        try {
            jVar.f93398a.warmup(0L);
        } catch (RemoteException unused) {
        }
        this.f4667d = jVar.c(new h80(this));
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        this.f4667d = null;
        this.f4668e = null;
    }
}

package i50;

import h50.q;
import java.util.ArrayList;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final c50.e f61373a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f61374b;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f61375c;

    /* renamed from: d, reason: collision with root package name */
    public final q f61376d;

    public b(s50.a key, c50.e client, Object pluginConfig) {
        Intrinsics.g(key, "key");
        Intrinsics.g(client, "client");
        Intrinsics.g(pluginConfig, "pluginConfig");
        this.f61373a = client;
        this.f61374b = pluginConfig;
        this.f61375c = new ArrayList();
        this.f61376d = new q(1);
    }

    public final void a(a aVar, SuspendLambda suspendLambda) {
        this.f61375c.add(new e(aVar, suspendLambda));
    }
}

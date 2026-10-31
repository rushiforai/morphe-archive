package i50;

import h50.q;
import java.io.Closeable;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class d implements Closeable {

    /* renamed from: a, reason: collision with root package name */
    public final s50.a f61382a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f61383b;

    /* renamed from: c, reason: collision with root package name */
    public final Function1 f61384c;

    /* renamed from: d, reason: collision with root package name */
    public Function0 f61385d;

    public d(s50.a key, Object config, Function1 function1) {
        Intrinsics.g(key, "key");
        Intrinsics.g(config, "config");
        this.f61382a = key;
        this.f61383b = config;
        this.f61384c = function1;
        this.f61385d = new q(2);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.f61385d.invoke();
    }
}

package h6;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class e1 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final c0 f59358a;

    /* renamed from: b, reason: collision with root package name */
    public final s f59359b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f59360c;

    public e1(c0 registry, s event) {
        Intrinsics.g(registry, "registry");
        Intrinsics.g(event, "event");
        this.f59358a = registry;
        this.f59359b = event;
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (this.f59360c) {
            return;
        }
        this.f59358a.f(this.f59359b);
        this.f59360c = true;
    }
}

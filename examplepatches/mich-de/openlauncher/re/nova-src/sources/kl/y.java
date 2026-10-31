package kl;

import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes3.dex */
public final class y {

    /* renamed from: b, reason: collision with root package name */
    public static final y f71651b = new y();

    /* renamed from: c, reason: collision with root package name */
    public static final x f71652c = new x();

    /* renamed from: a, reason: collision with root package name */
    public final AtomicReference f71653a = new AtomicReference();

    public static y b() {
        return f71651b;
    }

    public final x a() {
        x xVar = (x) this.f71653a.get();
        return xVar == null ? f71652c : xVar;
    }
}

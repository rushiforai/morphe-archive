package z4;

import fa.t;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class c extends t {

    /* renamed from: c, reason: collision with root package name */
    public final Object f98204c;

    public c(int i5) {
        super(i5, 6);
        this.f98204c = new Object();
    }

    @Override // fa.t
    public final Object a() {
        Object objA;
        synchronized (this.f98204c) {
            objA = super.a();
        }
        return objA;
    }

    @Override // fa.t
    public final boolean n(Object instance) {
        boolean zN;
        Intrinsics.g(instance, "instance");
        synchronized (this.f98204c) {
            zN = super.n(instance);
        }
        return zN;
    }
}

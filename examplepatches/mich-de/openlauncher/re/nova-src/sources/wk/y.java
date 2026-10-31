package wk;

import java.lang.ref.ReferenceQueue;

/* loaded from: classes3.dex */
public class y implements z {

    /* renamed from: a, reason: collision with root package name */
    public final Object f94589a;

    public y(Object obj) {
        this.f94589a = obj;
    }

    @Override // wk.z
    public int a() {
        return 1;
    }

    @Override // wk.z
    public final boolean b() {
        return true;
    }

    @Override // wk.z
    public final boolean c() {
        return false;
    }

    @Override // wk.z
    public final void d(Object obj) {
    }

    @Override // wk.z
    public final z e(ReferenceQueue referenceQueue, Object obj, h0 h0Var) {
        return this;
    }

    @Override // wk.z
    public final h0 f() {
        return null;
    }

    @Override // wk.z
    public final Object get() {
        return this.f94589a;
    }
}

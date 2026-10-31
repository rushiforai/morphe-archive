package wk;

import java.lang.ref.ReferenceQueue;
import java.lang.ref.SoftReference;

/* loaded from: classes3.dex */
public class q extends SoftReference implements z {

    /* renamed from: a, reason: collision with root package name */
    public final h0 f94570a;

    public q(ReferenceQueue referenceQueue, Object obj, h0 h0Var) {
        super(obj, referenceQueue);
        this.f94570a = h0Var;
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
    public z e(ReferenceQueue referenceQueue, Object obj, h0 h0Var) {
        return new q(referenceQueue, obj, h0Var);
    }

    @Override // wk.z
    public final h0 f() {
        return this.f94570a;
    }
}

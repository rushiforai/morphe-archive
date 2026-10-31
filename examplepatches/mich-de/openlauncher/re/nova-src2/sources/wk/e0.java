package wk;

import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;

/* loaded from: classes3.dex */
public class e0 extends WeakReference implements z {

    /* renamed from: a, reason: collision with root package name */
    public final h0 f94515a;

    public e0(ReferenceQueue referenceQueue, Object obj, h0 h0Var) {
        super(obj, referenceQueue);
        this.f94515a = h0Var;
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
        return new e0(referenceQueue, obj, h0Var);
    }

    @Override // wk.z
    public final h0 f() {
        return this.f94515a;
    }
}

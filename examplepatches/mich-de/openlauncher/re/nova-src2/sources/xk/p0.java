package xk;

import java.util.Collection;

/* loaded from: classes3.dex */
public abstract class p0 extends x0 {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f95985d;

    @Override // xk.x0
    public q0 f() {
        throw new AssertionError("should never be called");
    }

    @Override // xk.x0
    /* renamed from: j */
    public q0 values() {
        switch (this.f95985d) {
            case 0:
                return ((q2) this).f96002i.keySet();
            default:
                return super.values();
        }
    }

    @Override // xk.x0, java.util.Map, java.util.SortedMap
    public Collection values() {
        switch (this.f95985d) {
            case 0:
                return ((q2) this).f96002i.keySet();
            default:
                return super.values();
        }
    }
}

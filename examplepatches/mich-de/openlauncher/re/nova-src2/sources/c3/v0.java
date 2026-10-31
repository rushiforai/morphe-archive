package c3;

import kotlin.Unit;

/* loaded from: classes.dex */
public final class v0 implements p1.k0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f19449a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f19450b;

    public /* synthetic */ v0(Object obj, int i5) {
        this.f19449a = i5;
        this.f19450b = obj;
    }

    @Override // p1.k0
    public final void dispose() {
        Unit unit;
        switch (this.f19449a) {
            case 0:
                ((c2) this.f19450b).f19242b.invoke();
                return;
            default:
                j.h hVar = ((h.a) this.f19450b).f58687a;
                if (hVar != null) {
                    hVar.b();
                    unit = Unit.f71706a;
                } else {
                    unit = null;
                }
                if (unit == null) {
                    throw new IllegalStateException("Launcher has not been initialized");
                }
                return;
        }
    }
}

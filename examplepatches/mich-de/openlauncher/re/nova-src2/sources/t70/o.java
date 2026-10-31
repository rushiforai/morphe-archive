package t70;

import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.Result;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class o extends t1 {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f88843e;

    /* renamed from: f, reason: collision with root package name */
    public final m f88844f;

    public /* synthetic */ o(int i5, m mVar) {
        this.f88843e = i5;
        this.f88844f = mVar;
    }

    @Override // t70.t1
    public final boolean j() {
        switch (this.f88843e) {
            case 0:
                return true;
            default:
                return false;
        }
    }

    @Override // t70.t1
    public final void k(Throwable th2) {
        int i5 = this.f88843e;
        m mVar = this.f88844f;
        switch (i5) {
            case 0:
                Throwable thR = mVar.r(i());
                if (mVar.y()) {
                    y70.f fVar = (y70.f) mVar.f88823d;
                    AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = y70.f.f96792h;
                    while (true) {
                        Object obj = atomicReferenceFieldUpdater.get(fVar);
                        if (Intrinsics.b(obj, y70.g.f96798b)) {
                            if (x8.h.f(atomicReferenceFieldUpdater, fVar, thR)) {
                                break;
                            }
                        } else if (obj instanceof Throwable) {
                            break;
                        } else if (x8.h.e(atomicReferenceFieldUpdater, fVar, obj)) {
                        }
                    }
                }
                mVar.a(thR);
                if (!mVar.y()) {
                    mVar.p();
                    break;
                }
                break;
            default:
                int i11 = Result.f71687b;
                mVar.resumeWith(Unit.f71706a);
                break;
        }
    }
}

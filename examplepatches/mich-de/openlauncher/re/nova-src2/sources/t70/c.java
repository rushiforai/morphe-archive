package t70;

import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.Result;
import kotlinx.coroutines.DispatchException;

/* loaded from: classes.dex */
public final class c extends t1 {

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f88774h = AtomicReferenceFieldUpdater.newUpdater(c.class, Object.class, "_disposer$volatile");
    private volatile /* synthetic */ Object _disposer$volatile;

    /* renamed from: e, reason: collision with root package name */
    public final m f88775e;

    /* renamed from: f, reason: collision with root package name */
    public a1 f88776f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ e f88777g;

    public c(e eVar, m mVar) {
        this.f88777g = eVar;
        this.f88775e = mVar;
    }

    @Override // t70.t1
    public final boolean j() {
        return false;
    }

    @Override // t70.t1
    public final void k(Throwable th2) throws DispatchException {
        m mVar = this.f88775e;
        if (th2 != null) {
            mVar.getClass();
            w50.g gVarG = mVar.G(new v(false, th2), null);
            if (gVarG != null) {
                mVar.x(gVarG);
                d dVar = (d) f88774h.get(this);
                if (dVar != null) {
                    dVar.b();
                    return;
                }
                return;
            }
            return;
        }
        AtomicIntegerFieldUpdater atomicIntegerFieldUpdater = e.f88785b;
        e eVar = this.f88777g;
        if (atomicIntegerFieldUpdater.decrementAndGet(eVar) == 0) {
            p0[] p0VarArr = eVar.f88786a;
            ArrayList arrayList = new ArrayList(p0VarArr.length);
            for (p0 p0Var : p0VarArr) {
                arrayList.add(p0Var.e());
            }
            int i5 = Result.f71687b;
            mVar.resumeWith(arrayList);
        }
    }
}

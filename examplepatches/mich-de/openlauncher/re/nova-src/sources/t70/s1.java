package t70;

import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.Unit;

/* loaded from: classes.dex */
public class s1 extends x1 implements t {

    /* renamed from: c, reason: collision with root package name */
    public final boolean f88858c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s1(r1 r1Var) {
        super(true);
        boolean z11 = true;
        U(r1Var);
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = x1.f88883b;
        p pVar = (p) atomicReferenceFieldUpdater.get(this);
        q qVar = pVar instanceof q ? (q) pVar : null;
        if (qVar == null) {
            z11 = false;
            break;
        }
        x1 x1VarI = qVar.i();
        while (!x1VarI.N()) {
            p pVar2 = (p) atomicReferenceFieldUpdater.get(x1VarI);
            q qVar2 = pVar2 instanceof q ? (q) pVar2 : null;
            if (qVar2 == null) {
                z11 = false;
                break;
            }
            x1VarI = qVar2.i();
        }
        this.f88858c = z11;
    }

    @Override // t70.x1
    public final boolean N() {
        return this.f88858c;
    }

    @Override // t70.x1
    public final boolean O() {
        return true;
    }

    public final boolean j0() {
        return X(Unit.f71706a);
    }
}

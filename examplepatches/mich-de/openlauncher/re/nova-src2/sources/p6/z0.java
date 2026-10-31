package p6;

import java.util.List;
import java.util.ListIterator;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.FilteringSequence;

/* loaded from: classes2.dex */
public abstract class z0 {

    /* renamed from: a, reason: collision with root package name */
    public o f82312a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f82313b;

    public abstract e0 a();

    public final o b() {
        o oVar = this.f82312a;
        if (oVar != null) {
            return oVar;
        }
        throw new IllegalStateException("You cannot access the Navigator's state until the Navigator is attached");
    }

    public e0 c(e0 e0Var) {
        return e0Var;
    }

    public void d(List list, n0 n0Var) {
        FilteringSequence.AnonymousClass1 anonymousClass1 = new FilteringSequence.AnonymousClass1();
        while (anonymousClass1.hasNext()) {
            b().f((n) anonymousClass1.next());
        }
    }

    public void e(n popUpTo, boolean z11) {
        Intrinsics.g(popUpTo, "popUpTo");
        List list = (List) b().f82215e.f93973a.getValue();
        if (!list.contains(popUpTo)) {
            throw new IllegalStateException(("popBackStack was called with " + popUpTo + " which does not exist in back stack " + list).toString());
        }
        ListIterator listIterator = list.listIterator(list.size());
        n nVar = null;
        while (f()) {
            nVar = (n) listIterator.previous();
            if (Intrinsics.b(nVar, popUpTo)) {
                break;
            }
        }
        if (nVar != null) {
            b().c(nVar, z11);
        }
    }

    public boolean f() {
        return true;
    }
}

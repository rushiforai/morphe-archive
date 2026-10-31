package u1;

import java.util.Iterator;
import kotlin.collections.AbstractCollection;

/* loaded from: classes2.dex */
public final class o extends AbstractCollection {

    /* renamed from: a, reason: collision with root package name */
    public final c f90352a;

    public o(c cVar) {
        this.f90352a = cVar;
    }

    @Override // kotlin.collections.AbstractCollection
    public final int c() {
        return this.f90352a.c();
    }

    @Override // kotlin.collections.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return this.f90352a.containsValue(obj);
    }

    @Override // java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        p pVar = this.f90352a.f90331d;
        q[] qVarArr = new q[8];
        for (int i5 = 0; i5 < 8; i5++) {
            qVarArr[i5] = new s(1);
        }
        return new n(pVar, qVarArr);
    }
}

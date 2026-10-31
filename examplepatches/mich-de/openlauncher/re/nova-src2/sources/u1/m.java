package u1;

import java.util.Iterator;
import kotlin.collections.AbstractSet;

/* loaded from: classes2.dex */
public final class m extends AbstractSet implements s1.c {

    /* renamed from: b, reason: collision with root package name */
    public final c f90351b;

    public m(c cVar) {
        this.f90351b = cVar;
    }

    @Override // kotlin.collections.AbstractCollection
    public final int c() {
        return this.f90351b.c();
    }

    @Override // kotlin.collections.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return this.f90351b.containsKey(obj);
    }

    @Override // kotlin.collections.AbstractSet, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        p pVar = this.f90351b.f90331d;
        q[] qVarArr = new q[8];
        for (int i5 = 0; i5 < 8; i5++) {
            qVarArr[i5] = new s(0);
        }
        return new n(pVar, qVarArr);
    }
}

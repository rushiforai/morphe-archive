package u1;

import java.util.Iterator;
import kotlin.collections.AbstractMutableCollection;

/* loaded from: classes2.dex */
public final class j extends AbstractMutableCollection {

    /* renamed from: a, reason: collision with root package name */
    public final e f90349a;

    public j(e eVar) {
        this.f90349a = eVar;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean add(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // kotlin.collections.AbstractMutableCollection
    public final int c() {
        return this.f90349a.c();
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final void clear() {
        this.f90349a.clear();
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean contains(Object obj) {
        return this.f90349a.containsValue(obj);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        q[] qVarArr = new q[8];
        for (int i5 = 0; i5 < 8; i5++) {
            qVarArr[i5] = new s(1);
        }
        return new i(this.f90349a, qVarArr);
    }
}

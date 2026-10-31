package u1;

import java.util.Iterator;
import java.util.Map;
import kotlin.collections.AbstractSet;

/* loaded from: classes.dex */
public final class k extends AbstractSet implements s1.c {

    /* renamed from: b, reason: collision with root package name */
    public final c f90350b;

    public k(c cVar) {
        this.f90350b = cVar;
    }

    @Override // kotlin.collections.AbstractCollection
    public final int c() {
        return this.f90350b.c();
    }

    @Override // kotlin.collections.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        if (!(obj instanceof Map.Entry)) {
            return false;
        }
        Map.Entry entry = (Map.Entry) obj;
        Object key = entry.getKey();
        c cVar = this.f90350b;
        Object obj2 = cVar.get(key);
        return obj2 != null ? obj2.equals(entry.getValue()) : entry.getValue() == null && cVar.containsKey(entry.getKey());
    }

    @Override // kotlin.collections.AbstractSet, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        p pVar = this.f90350b.f90331d;
        q[] qVarArr = new q[8];
        for (int i5 = 0; i5 < 8; i5++) {
            qVarArr[i5] = new r();
        }
        return new l(pVar, qVarArr);
    }
}

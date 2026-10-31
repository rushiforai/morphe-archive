package u1;

import java.util.Iterator;
import java.util.Map;
import kotlin.collections.AbstractMutableSet;

/* loaded from: classes2.dex */
public final class g extends AbstractMutableSet {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f90346a;

    /* renamed from: b, reason: collision with root package name */
    public final e f90347b;

    public /* synthetic */ g(int i5, e eVar) {
        this.f90346a = i5;
        this.f90347b = eVar;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean add(Object obj) {
        switch (this.f90346a) {
            case 0:
                throw new UnsupportedOperationException();
            default:
                throw new UnsupportedOperationException();
        }
    }

    @Override // kotlin.collections.AbstractMutableSet
    public final int c() {
        switch (this.f90346a) {
        }
        return this.f90347b.c();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final void clear() {
        switch (this.f90346a) {
            case 0:
                this.f90347b.clear();
                break;
            default:
                this.f90347b.clear();
                break;
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        switch (this.f90346a) {
            case 0:
                if (!(obj instanceof Map.Entry)) {
                    return false;
                }
                Map.Entry entry = (Map.Entry) obj;
                Object key = entry.getKey();
                e eVar = this.f90347b;
                Object obj2 = eVar.get(key);
                return obj2 != null ? obj2.equals(entry.getValue()) : entry.getValue() == null && eVar.containsKey(entry.getKey());
            default:
                return this.f90347b.containsKey(obj);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        switch (this.f90346a) {
            case 0:
                return new h(this.f90347b);
            default:
                q[] qVarArr = new q[8];
                for (int i5 = 0; i5 < 8; i5++) {
                    qVarArr[i5] = new s(0);
                }
                return new i(this.f90347b, qVarArr);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean remove(Object obj) {
        switch (this.f90346a) {
            case 0:
                if (!(obj instanceof Map.Entry)) {
                    return false;
                }
                Map.Entry entry = (Map.Entry) obj;
                return this.f90347b.remove(entry.getKey(), entry.getValue());
            default:
                e eVar = this.f90347b;
                if (!eVar.containsKey(obj)) {
                    return false;
                }
                eVar.remove(obj);
                return true;
        }
    }
}

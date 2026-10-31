package z;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/* loaded from: classes.dex */
public class e extends c1 implements Map {

    /* renamed from: d, reason: collision with root package name */
    public androidx.datastore.preferences.protobuf.e1 f97760d;

    /* renamed from: e, reason: collision with root package name */
    public b f97761e;

    /* renamed from: f, reason: collision with root package name */
    public d f97762f;

    public e() {
        super(0);
    }

    @Override // java.util.Map
    public Set entrySet() {
        androidx.datastore.preferences.protobuf.e1 e1Var = this.f97760d;
        if (e1Var != null) {
            return e1Var;
        }
        androidx.datastore.preferences.protobuf.e1 e1Var2 = new androidx.datastore.preferences.protobuf.e1(this, 7);
        this.f97760d = e1Var2;
        return e1Var2;
    }

    public final boolean k(Collection collection) {
        Iterator it = collection.iterator();
        while (it.hasNext()) {
            if (!super.containsKey(it.next())) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.Map
    public final Set keySet() {
        b bVar = this.f97761e;
        if (bVar != null) {
            return bVar;
        }
        b bVar2 = new b(this);
        this.f97761e = bVar2;
        return bVar2;
    }

    public final boolean l(Collection collection) {
        int i5 = this.f97753c;
        Iterator it = collection.iterator();
        while (it.hasNext()) {
            super.remove(it.next());
        }
        return i5 != this.f97753c;
    }

    public final boolean m(Collection collection) {
        int i5 = this.f97753c;
        for (int i11 = i5 - 1; i11 >= 0; i11--) {
            if (!collection.contains(f(i11))) {
                h(i11);
            }
        }
        return i5 != this.f97753c;
    }

    @Override // java.util.Map
    public final void putAll(Map map) {
        b(map.size() + this.f97753c);
        for (Map.Entry entry : map.entrySet()) {
            put(entry.getKey(), entry.getValue());
        }
    }

    @Override // java.util.Map
    public final Collection values() {
        d dVar = this.f97762f;
        if (dVar != null) {
            return dVar;
        }
        d dVar2 = new d(this);
        this.f97762f = dVar2;
        return dVar2;
    }
}

package mh;

import java.util.Iterator;
import java.util.Map;

/* loaded from: classes3.dex */
public final class n extends l {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ o f76360d;

    public n(o oVar) {
        this.f76360d = oVar;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        if (obj instanceof Map.Entry) {
            Map.Entry entry = (Map.Entry) obj;
            Object obj2 = this.f76360d.get(entry.getKey());
            if (obj2 != null && obj2.equals(entry.getValue())) {
                return true;
            }
        }
        return false;
    }

    @Override // mh.f
    public final a0 e() {
        return g().listIterator(0);
    }

    @Override // mh.l
    public final j h() {
        return new m(this);
    }

    @Override // mh.l, java.util.Collection, java.util.Set
    public final int hashCode() {
        return a.b(this.f76360d.entrySet());
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final /* synthetic */ Iterator iterator() {
        return g().listIterator(0);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.f76360d.f76364d.size();
    }
}

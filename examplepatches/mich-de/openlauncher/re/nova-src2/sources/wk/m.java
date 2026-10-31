package wk;

import java.util.AbstractSet;
import java.util.Iterator;
import java.util.Map;

/* loaded from: classes3.dex */
public final class m extends AbstractSet {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ g0 f94551a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f94552b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ g0 f94553c;

    public m(g0 g0Var, int i5) {
        this.f94552b = i5;
        this.f94553c = g0Var;
        this.f94551a = g0Var;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final void clear() {
        this.f94551a.clear();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        Map.Entry entry;
        Object key;
        g0 g0Var;
        Object obj2;
        switch (this.f94552b) {
            case 0:
                return (obj instanceof Map.Entry) && (key = (entry = (Map.Entry) obj).getKey()) != null && (obj2 = (g0Var = this.f94553c).get(key)) != null && g0Var.f94526f.m(entry.getValue(), obj2);
            default:
                return this.f94553c.containsKey(obj);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean isEmpty() {
        return this.f94551a.isEmpty();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        switch (this.f94552b) {
            case 0:
                return new l(this.f94553c, 0);
            default:
                return new l(this.f94553c, 1);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean remove(Object obj) {
        Map.Entry entry;
        Object key;
        switch (this.f94552b) {
            case 0:
                if ((obj instanceof Map.Entry) && (key = (entry = (Map.Entry) obj).getKey()) != null && this.f94553c.remove(key, entry.getValue())) {
                }
                break;
            default:
                if (this.f94553c.remove(obj) != null) {
                }
                break;
        }
        return false;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.f94551a.size();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final Object[] toArray() {
        return g0.a(this).toArray();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final Object[] toArray(Object[] objArr) {
        return g0.a(this).toArray(objArr);
    }
}

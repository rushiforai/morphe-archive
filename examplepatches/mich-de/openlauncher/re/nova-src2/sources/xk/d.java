package xk;

import androidx.compose.ui.node.LayoutNode;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

/* loaded from: classes3.dex */
public final class d extends g3 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f95888a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f95889b;

    public /* synthetic */ d(Object obj, int i5) {
        this.f95888a = i5;
        this.f95889b = obj;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final void clear() {
        switch (this.f95888a) {
            case 0:
                ((f) this.f95889b).clear();
                break;
            default:
                ((n0) ((t) this.f95889b)).clear();
                break;
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        switch (this.f95888a) {
            case 0:
                Set setEntrySet = ((f) this.f95889b).f95908c.entrySet();
                setEntrySet.getClass();
                try {
                    return setEntrySet.contains(obj);
                } catch (ClassCastException | NullPointerException unused) {
                    return false;
                }
            default:
                return ((t) this.f95889b).contains(obj);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public boolean containsAll(Collection collection) {
        switch (this.f95888a) {
            case 1:
                return ((t) this.f95889b).containsAll(collection);
            default:
                return super.containsAll(collection);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean isEmpty() {
        switch (this.f95888a) {
            case 0:
                return ((f) this.f95889b).isEmpty();
            default:
                return ((t) this.f95889b).isEmpty();
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        switch (this.f95888a) {
            case 0:
                return new e((f) this.f95889b);
            default:
                return new o((n0) ((t) this.f95889b));
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean remove(Object obj) {
        Object objRemove;
        switch (this.f95888a) {
            case 0:
                if (!contains(obj)) {
                    return false;
                }
                Map.Entry entry = (Map.Entry) obj;
                Objects.requireNonNull(entry);
                d2 d2Var = ((f) this.f95889b).f95909d;
                Object key = entry.getKey();
                Map map = d2Var.f95893d;
                map.getClass();
                try {
                    objRemove = map.remove(key);
                } catch (ClassCastException | NullPointerException unused) {
                    objRemove = null;
                }
                Collection collection = (Collection) objRemove;
                if (collection != null) {
                    int size = collection.size();
                    collection.clear();
                    d2Var.f95894e -= size;
                }
                return true;
            default:
                return ((n0) ((t) this.f95889b)).d(LayoutNode.NotPlacedPlaceOrder, obj) > 0;
        }
    }

    @Override // xk.g3, java.util.AbstractSet, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public boolean removeAll(Collection collection) {
        switch (this.f95888a) {
            case 0:
                try {
                    collection.getClass();
                    return w.x(this, collection);
                } catch (UnsupportedOperationException unused) {
                    Iterator it = collection.iterator();
                    boolean zRemove = false;
                    while (it.hasNext()) {
                        zRemove |= remove(it.next());
                    }
                    return zRemove;
                }
            default:
                return super.removeAll(collection);
        }
    }

    @Override // xk.g3, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public boolean retainAll(Collection collection) {
        switch (this.f95888a) {
            case 0:
                try {
                    collection.getClass();
                    return super.retainAll(collection);
                } catch (UnsupportedOperationException unused) {
                    HashSet hashSetU = w.u(collection.size());
                    for (Object obj : collection) {
                        if (contains(obj) && (obj instanceof Map.Entry)) {
                            hashSetU.add(((Map.Entry) obj).getKey());
                        }
                    }
                    return ((f) this.f95889b).keySet().retainAll(hashSetU);
                }
            default:
                return super.retainAll(collection);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        switch (this.f95888a) {
            case 0:
                return ((f) this.f95889b).f95908c.size();
            default:
                return ((s) ((t) this.f95889b).entrySet()).size();
        }
    }
}

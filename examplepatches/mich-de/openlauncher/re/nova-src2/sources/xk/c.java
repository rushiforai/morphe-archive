package xk;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Objects;

/* loaded from: classes3.dex */
public final class c implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public final Iterator f95873a;

    /* renamed from: b, reason: collision with root package name */
    public Object f95874b = null;

    /* renamed from: c, reason: collision with root package name */
    public Collection f95875c = null;

    /* renamed from: d, reason: collision with root package name */
    public Iterator f95876d = r1.f96005a;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ d2 f95877e;

    public c(d2 d2Var) {
        this.f95877e = d2Var;
        this.f95873a = d2Var.f95893d.entrySet().iterator();
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f95873a.hasNext() || this.f95876d.hasNext();
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (!this.f95876d.hasNext()) {
            Map.Entry entry = (Map.Entry) this.f95873a.next();
            this.f95874b = entry.getKey();
            Collection collection = (Collection) entry.getValue();
            this.f95875c = collection;
            this.f95876d = collection.iterator();
        }
        return this.f95876d.next();
    }

    @Override // java.util.Iterator
    public final void remove() {
        this.f95876d.remove();
        Collection collection = this.f95875c;
        Objects.requireNonNull(collection);
        if (collection.isEmpty()) {
            this.f95873a.remove();
        }
        d2 d2Var = this.f95877e;
        d2Var.f95894e--;
    }
}

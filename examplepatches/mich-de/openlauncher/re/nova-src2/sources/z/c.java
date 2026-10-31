package z;

import java.util.Iterator;
import java.util.Map;
import java.util.NoSuchElementException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class c implements Iterator, Map.Entry {

    /* renamed from: a, reason: collision with root package name */
    public int f97746a;

    /* renamed from: b, reason: collision with root package name */
    public int f97747b = -1;

    /* renamed from: c, reason: collision with root package name */
    public boolean f97748c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ e f97749d;

    public c(e eVar) {
        this.f97749d = eVar;
        this.f97746a = eVar.f97753c - 1;
    }

    @Override // java.util.Map.Entry
    public final boolean equals(Object obj) {
        if (!this.f97748c) {
            throw new IllegalStateException("This container does not support retaining Map.Entry objects");
        }
        if (!(obj instanceof Map.Entry)) {
            return false;
        }
        Map.Entry entry = (Map.Entry) obj;
        Object key = entry.getKey();
        int i5 = this.f97747b;
        e eVar = this.f97749d;
        return Intrinsics.b(key, eVar.f(i5)) && Intrinsics.b(entry.getValue(), eVar.j(this.f97747b));
    }

    @Override // java.util.Map.Entry
    public final Object getKey() {
        if (this.f97748c) {
            return this.f97749d.f(this.f97747b);
        }
        throw new IllegalStateException("This container does not support retaining Map.Entry objects");
    }

    @Override // java.util.Map.Entry
    public final Object getValue() {
        if (this.f97748c) {
            return this.f97749d.j(this.f97747b);
        }
        throw new IllegalStateException("This container does not support retaining Map.Entry objects");
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f97747b < this.f97746a;
    }

    @Override // java.util.Map.Entry
    public final int hashCode() {
        if (!this.f97748c) {
            throw new IllegalStateException("This container does not support retaining Map.Entry objects");
        }
        int i5 = this.f97747b;
        e eVar = this.f97749d;
        Object objF = eVar.f(i5);
        Object objJ = eVar.j(this.f97747b);
        return (objF == null ? 0 : objF.hashCode()) ^ (objJ != null ? objJ.hashCode() : 0);
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        this.f97747b++;
        this.f97748c = true;
        return this;
    }

    @Override // java.util.Iterator
    public final void remove() {
        if (!this.f97748c) {
            throw new IllegalStateException();
        }
        this.f97749d.h(this.f97747b);
        this.f97747b--;
        this.f97746a--;
        this.f97748c = false;
    }

    @Override // java.util.Map.Entry
    public final Object setValue(Object obj) {
        if (this.f97748c) {
            return this.f97749d.i(this.f97747b, obj);
        }
        throw new IllegalStateException("This container does not support retaining Map.Entry objects");
    }

    public final String toString() {
        return getKey() + "=" + getValue();
    }
}

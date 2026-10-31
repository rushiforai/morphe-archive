package z1;

import java.util.Set;
import kotlin.jvm.internal.CollectionToArray;
import kotlin.jvm.internal.markers.KMutableSet;

/* loaded from: classes2.dex */
public abstract class n implements Set, KMutableSet {

    /* renamed from: a, reason: collision with root package name */
    public final s f97953a;

    public n(s sVar) {
        this.f97953a = sVar;
    }

    @Override // java.util.Set, java.util.Collection
    public final void clear() {
        this.f97953a.clear();
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean isEmpty() {
        return this.f97953a.isEmpty();
    }

    @Override // java.util.Set, java.util.Collection
    public final int size() {
        return this.f97953a.size();
    }

    @Override // java.util.Set, java.util.Collection
    public final Object[] toArray() {
        return CollectionToArray.a(this);
    }

    @Override // java.util.Set, java.util.Collection
    public final Object[] toArray(Object[] objArr) {
        return CollectionToArray.b(this, objArr);
    }
}

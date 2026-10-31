package v1;

import java.util.Iterator;
import kotlin.collections.AbstractSet;
import kotlin.jvm.internal.Intrinsics;
import s1.g;

/* loaded from: classes.dex */
public final class b extends AbstractSet implements g {

    /* renamed from: e, reason: collision with root package name */
    public static final b f91889e;

    /* renamed from: b, reason: collision with root package name */
    public final Object f91890b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f91891c;

    /* renamed from: d, reason: collision with root package name */
    public final u1.c f91892d;

    static {
        u1.c cVar = u1.c.f90330f;
        Intrinsics.e(cVar, "null cannot be cast to non-null type androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableMap.PersistentHashMap<K of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableMap.PersistentHashMap.Companion.emptyOf, V of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableMap.PersistentHashMap.Companion.emptyOf>");
        w1.b bVar = w1.b.f93640a;
        f91889e = new b(bVar, bVar, cVar);
    }

    public b(Object obj, Object obj2, u1.c cVar) {
        this.f91890b = obj;
        this.f91891c = obj2;
        this.f91892d = cVar;
    }

    @Override // kotlin.collections.AbstractCollection
    public final int c() {
        return this.f91892d.c();
    }

    @Override // kotlin.collections.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return this.f91892d.containsKey(obj);
    }

    @Override // kotlin.collections.AbstractSet, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        return new c(this.f91890b, this.f91892d);
    }
}

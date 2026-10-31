package x8;

import b.c9;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;

/* loaded from: classes.dex */
public final class p implements Iterable, KMappedMarker {

    /* renamed from: b, reason: collision with root package name */
    public static final p f95365b = new p(b70.h.f17594a);

    /* renamed from: a, reason: collision with root package name */
    public final Map f95366a;

    public p(Map map) {
        this.f95366a = map;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof p) {
            return Intrinsics.b(this.f95366a, ((p) obj).f95366a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f95366a.hashCode();
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        Map map = this.f95366a;
        ArrayList arrayList = new ArrayList(map.size());
        for (Map.Entry entry : map.entrySet()) {
            arrayList.add(new Pair((String) entry.getKey(), (o) entry.getValue()));
        }
        return arrayList.iterator();
    }

    public final String toString() {
        return c9.l(new StringBuilder("Parameters(entries="), this.f95366a, ')');
    }
}

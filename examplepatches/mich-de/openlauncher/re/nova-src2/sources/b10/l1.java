package b10;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import kotlin.collections.IndexedValue;
import kotlin.collections.IndexingIterable;
import kotlin.collections.IndexingIterator;
import kotlin.collections.builders.ListBuilder;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class l1 {

    /* renamed from: a, reason: collision with root package name */
    public final List f16773a;

    /* renamed from: b, reason: collision with root package name */
    public final Set f16774b;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f16775c;

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f16776d;

    public l1(ListBuilder listBuilder) {
        this.f16773a = listBuilder;
        IndexingIterable indexingIterableO1 = b70.g.O1(listBuilder);
        ArrayList arrayList = new ArrayList();
        Iterator it = indexingIterableO1.iterator();
        while (true) {
            IndexingIterator indexingIterator = (IndexingIterator) it;
            if (!indexingIterator.f71738a.hasNext()) {
                break;
            }
            Object next = indexingIterator.next();
            if (((k1) ((IndexedValue) next).f71736b).f16761c) {
                arrayList.add(next);
            }
        }
        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            arrayList2.add(Integer.valueOf(((IndexedValue) it2.next()).f71735a));
        }
        this.f16774b = b70.g.N1(arrayList2);
        List list = this.f16773a;
        ArrayList arrayList3 = new ArrayList(b70.c.u0(list, 10));
        Iterator it3 = list.iterator();
        while (it3.hasNext()) {
            arrayList3.add(((k1) it3.next()).f16759a);
        }
        this.f16775c = arrayList3;
        List list2 = this.f16773a;
        ArrayList arrayList4 = new ArrayList(b70.c.u0(list2, 10));
        Iterator it4 = list2.iterator();
        while (it4.hasNext()) {
            arrayList4.add(Integer.valueOf(((k1) it4.next()).f16760b));
        }
        this.f16776d = arrayList4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof l1) && Intrinsics.b(this.f16773a, ((l1) obj).f16773a);
    }

    public final int hashCode() {
        return this.f16773a.hashCode();
    }

    public final String toString() {
        return "OnboardingPageLayout(pages=" + this.f16773a + ")";
    }
}

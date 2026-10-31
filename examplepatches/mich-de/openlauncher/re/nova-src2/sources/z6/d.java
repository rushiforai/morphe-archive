package z6;

import a80.m;
import b.u4;
import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import r70.j;

/* loaded from: classes2.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final String f98265a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f98266b;

    /* renamed from: c, reason: collision with root package name */
    public final List f98267c;

    /* renamed from: d, reason: collision with root package name */
    public final List f98268d;

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r5v1, types: [java.util.Collection] */
    /* JADX WARN: Type inference failed for: r5v2 */
    /* JADX WARN: Type inference failed for: r5v4, types: [java.util.ArrayList] */
    public d(String str, boolean z11, List columns, List orders) {
        Intrinsics.g(columns, "columns");
        Intrinsics.g(orders, "orders");
        this.f98265a = str;
        this.f98266b = z11;
        this.f98267c = columns;
        this.f98268d = orders;
        List arrayList = orders;
        if (arrayList.isEmpty()) {
            int size = columns.size();
            arrayList = new ArrayList(size);
            for (int i5 = 0; i5 < size; i5++) {
                arrayList.add("ASC");
            }
        }
        this.f98268d = (List) arrayList;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof d) {
            d dVar = (d) obj;
            String str = dVar.f98265a;
            if (this.f98266b == dVar.f98266b && Intrinsics.b(this.f98267c, dVar.f98267c) && Intrinsics.b(this.f98268d, dVar.f98268d)) {
                String str2 = this.f98265a;
                return j.I0(str2, "index_", false) ? j.I0(str, "index_", false) : str2.equals(str);
            }
        }
        return false;
    }

    public final int hashCode() {
        String str = this.f98265a;
        return this.f98268d.hashCode() + u4.c((((j.I0(str, "index_", false) ? -1184239155 : str.hashCode()) * 31) + (this.f98266b ? 1 : 0)) * 31, 31, this.f98267c);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Index{name='");
        sb2.append(this.f98265a);
        sb2.append("', unique=");
        sb2.append(this.f98266b);
        sb2.append(", columns=");
        sb2.append(this.f98267c);
        sb2.append(", orders=");
        return m.j(sb2, this.f98268d, "'}");
    }
}

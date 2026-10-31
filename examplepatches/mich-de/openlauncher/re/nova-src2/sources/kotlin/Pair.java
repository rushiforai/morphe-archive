package kotlin;

import com.google.android.gms.internal.measurement.k2;
import java.io.Serializable;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\b\u0018\u0000*\u0006\b\u0000\u0010\u0001 \u0001*\u0006\b\u0001\u0010\u0002 \u00012\u00060\u0003j\u0002`\u0004¨\u0006\u0005"}, d2 = {"Lkotlin/Pair;", "A", "B", "Ljava/io/Serializable;", "Lkotlin/io/Serializable;", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final /* data */ class Pair<A, B> implements Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final Object f71683a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f71684b;

    public Pair(Object obj, Object obj2) {
        this.f71683a = obj;
        this.f71684b = obj2;
    }

    /* renamed from: a, reason: from getter */
    public final Object getF71684b() {
        return this.f71684b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Pair)) {
            return false;
        }
        Pair pair = (Pair) obj;
        return Intrinsics.b(this.f71683a, pair.f71683a) && Intrinsics.b(this.f71684b, pair.f71684b);
    }

    public final int hashCode() {
        Object obj = this.f71683a;
        int iHashCode = (obj == null ? 0 : obj.hashCode()) * 31;
        Object obj2 = this.f71684b;
        return iHashCode + (obj2 != null ? obj2.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("(");
        sb2.append(this.f71683a);
        sb2.append(", ");
        return k2.j(sb2, this.f71684b, ')');
    }
}

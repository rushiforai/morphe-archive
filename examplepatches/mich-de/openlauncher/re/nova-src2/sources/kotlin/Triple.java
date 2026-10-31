package kotlin;

import com.google.android.gms.internal.measurement.k2;
import java.io.Serializable;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\b\u0018\u0000*\u0006\b\u0000\u0010\u0001 \u0001*\u0006\b\u0001\u0010\u0002 \u0001*\u0006\b\u0002\u0010\u0003 \u00012\u00060\u0004j\u0002`\u0005¨\u0006\u0006"}, d2 = {"Lkotlin/Triple;", "A", "B", "C", "Ljava/io/Serializable;", "Lkotlin/io/Serializable;", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final /* data */ class Triple<A, B, C> implements Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final Object f71690a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f71691b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f71692c;

    public Triple(Object obj, Object obj2, Object obj3) {
        this.f71690a = obj;
        this.f71691b = obj2;
        this.f71692c = obj3;
    }

    /* renamed from: a, reason: from getter */
    public final Object getF71690a() {
        return this.f71690a;
    }

    /* renamed from: b, reason: from getter */
    public final Object getF71691b() {
        return this.f71691b;
    }

    /* renamed from: c, reason: from getter */
    public final Object getF71692c() {
        return this.f71692c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Triple)) {
            return false;
        }
        Triple triple = (Triple) obj;
        return Intrinsics.b(this.f71690a, triple.f71690a) && Intrinsics.b(this.f71691b, triple.f71691b) && Intrinsics.b(this.f71692c, triple.f71692c);
    }

    public final int hashCode() {
        Object obj = this.f71690a;
        int iHashCode = (obj == null ? 0 : obj.hashCode()) * 31;
        Object obj2 = this.f71691b;
        int iHashCode2 = (iHashCode + (obj2 == null ? 0 : obj2.hashCode())) * 31;
        Object obj3 = this.f71692c;
        return iHashCode2 + (obj3 != null ? obj3.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("(");
        sb2.append(this.f71690a);
        sb2.append(", ");
        sb2.append(this.f71691b);
        sb2.append(", ");
        return k2.j(sb2, this.f71692c, ')');
    }
}

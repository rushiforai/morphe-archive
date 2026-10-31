package kotlin.collections;

import com.google.android.gms.internal.measurement.k2;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\b\u0086\b\u0018\u0000*\u0006\b\u0000\u0010\u0001 \u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lkotlin/collections/IndexedValue;", "T", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final /* data */ class IndexedValue<T> {

    /* renamed from: a, reason: collision with root package name */
    public final int f71735a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f71736b;

    public IndexedValue(int i5, Object obj) {
        this.f71735a = i5;
        this.f71736b = obj;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof IndexedValue)) {
            return false;
        }
        IndexedValue indexedValue = (IndexedValue) obj;
        return this.f71735a == indexedValue.f71735a && Intrinsics.b(this.f71736b, indexedValue.f71736b);
    }

    public final int hashCode() {
        int iHashCode = Integer.hashCode(this.f71735a) * 31;
        Object obj = this.f71736b;
        return iHashCode + (obj == null ? 0 : obj.hashCode());
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("IndexedValue(index=");
        sb2.append(this.f71735a);
        sb2.append(", value=");
        return k2.j(sb2, this.f71736b, ')');
    }
}

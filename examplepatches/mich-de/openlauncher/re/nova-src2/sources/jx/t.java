package jx;

import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class t {

    /* renamed from: b, reason: collision with root package name */
    public static final t f70426b = new t(EmptyList.f71733a);

    /* renamed from: a, reason: collision with root package name */
    public final List f70427a;

    public t(List list) {
        this.f70427a = list;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof t) && Intrinsics.b(this.f70427a, ((t) obj).f70427a);
    }

    public final int hashCode() {
        return this.f70427a.hashCode();
    }

    public final String toString() {
        return "WifiData(records=" + this.f70427a + ")";
    }
}

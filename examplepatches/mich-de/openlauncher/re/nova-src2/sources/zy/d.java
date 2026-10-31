package zy;

import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final String f98832a;

    /* renamed from: b, reason: collision with root package name */
    public final Map f98833b;

    public d(String str, Map map) {
        this.f98832a = str;
        this.f98833b = map;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        return Intrinsics.b(this.f98832a, dVar.f98832a) && Intrinsics.b(this.f98833b, dVar.f98833b);
    }

    public final int hashCode() {
        int iHashCode = this.f98832a.hashCode() * 31;
        Map map = this.f98833b;
        return iHashCode + (map == null ? 0 : map.hashCode());
    }

    public final String toString() {
        return "QueuedEvent(name=" + this.f98832a + ", params=" + this.f98833b + ")";
    }
}

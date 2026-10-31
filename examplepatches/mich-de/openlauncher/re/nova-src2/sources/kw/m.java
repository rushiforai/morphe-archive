package kw;

import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m implements o {

    /* renamed from: a, reason: collision with root package name */
    public final Map f72475a;

    public m(Map map) {
        this.f72475a = map;
    }

    @Override // kw.o
    public final Map a() {
        return this.f72475a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof m) && Intrinsics.b(this.f72475a, ((m) obj).f72475a);
    }

    public final int hashCode() {
        Map map = this.f72475a;
        if (map == null) {
            return 0;
        }
        return map.hashCode();
    }

    public final String toString() {
        return "OnExpandForm(values=" + this.f72475a + ")";
    }
}

package dx;

import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final Map f49705a;

    /* renamed from: b, reason: collision with root package name */
    public final j0 f49706b;

    /* renamed from: c, reason: collision with root package name */
    public final h0 f49707c;

    public h(Map map, j0 j0Var, h0 debug) {
        Intrinsics.g(debug, "debug");
        this.f49705a = map;
        this.f49706b = j0Var;
        this.f49707c = debug;
    }

    public static h a(h hVar, h0 debug) {
        Map map = hVar.f49705a;
        j0 j0Var = hVar.f49706b;
        hVar.getClass();
        Intrinsics.g(debug, "debug");
        return new h(map, j0Var, debug);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h)) {
            return false;
        }
        h hVar = (h) obj;
        return Intrinsics.b(this.f49705a, hVar.f49705a) && Intrinsics.b(this.f49706b, hVar.f49706b) && Intrinsics.b(this.f49707c, hVar.f49707c);
    }

    public final int hashCode() {
        return this.f49707c.hashCode() + ((this.f49706b.hashCode() + (this.f49705a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        return "AdConfig(placements=" + this.f49705a + ", global=" + this.f49706b + ", debug=" + this.f49707c + ")";
    }
}

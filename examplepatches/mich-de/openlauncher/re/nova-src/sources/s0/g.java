package s0;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class g extends a {
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return Intrinsics.b(this.f86504a, gVar.f86504a) && Intrinsics.b(this.f86505b, gVar.f86505b) && Intrinsics.b(this.f86506c, gVar.f86506c) && Intrinsics.b(this.f86507d, gVar.f86507d);
    }

    public final int hashCode() {
        return this.f86507d.hashCode() + ((this.f86506c.hashCode() + ((this.f86505b.hashCode() + (this.f86504a.hashCode() * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "RoundedCornerShape(topStart = " + this.f86504a + ", topEnd = " + this.f86505b + ", bottomEnd = " + this.f86506c + ", bottomStart = " + this.f86507d + ')';
    }
}

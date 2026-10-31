package an;

import java.util.HashSet;
import java.util.Set;

/* loaded from: classes3.dex */
public final class d extends f {

    /* renamed from: a, reason: collision with root package name */
    public final HashSet f13554a;

    public d(HashSet hashSet) {
        this.f13554a = hashSet;
    }

    @Override // an.f
    public final Set b() {
        return this.f13554a;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof f)) {
            return false;
        }
        return this.f13554a.equals(((d) ((f) obj)).f13554a);
    }

    public final int hashCode() {
        return this.f13554a.hashCode() ^ 1000003;
    }

    public final String toString() {
        return "RolloutsState{rolloutAssignments=" + this.f13554a + "}";
    }
}

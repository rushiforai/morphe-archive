package sd;

import java.util.ArrayList;

/* loaded from: classes.dex */
public final class o extends a0 {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f87205a;

    public o(ArrayList arrayList) {
        this.f87205a = arrayList;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof a0)) {
            return false;
        }
        return this.f87205a.equals(((o) ((a0) obj)).f87205a);
    }

    public final int hashCode() {
        return this.f87205a.hashCode() ^ 1000003;
    }

    public final String toString() {
        return "BatchedLogRequest{logRequests=" + this.f87205a + "}";
    }
}

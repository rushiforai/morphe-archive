package cp;

import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes4.dex */
public final class o extends p implements Iterable {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f47780a = new ArrayList();

    public final boolean equals(Object obj) {
        if (obj != this) {
            return (obj instanceof o) && ((o) obj).f47780a.equals(this.f47780a);
        }
        return true;
    }

    public final int hashCode() {
        return this.f47780a.hashCode();
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return this.f47780a.iterator();
    }
}

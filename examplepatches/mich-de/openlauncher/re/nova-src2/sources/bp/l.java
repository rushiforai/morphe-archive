package bp;

import java.net.URI;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.Objects;

/* loaded from: classes4.dex */
public final class l extends d {
    public final lp.b o;

    public l(lp.b bVar, i iVar, LinkedHashSet linkedHashSet, uo.a aVar, String str, URI uri, lp.b bVar2, lp.b bVar3, LinkedList linkedList, Date date, Date date2, Date date3, g gVar) {
        super(h.f18392d, iVar, linkedHashSet, aVar, str, uri, bVar2, bVar3, linkedList, date, date2, date3, gVar);
        Objects.requireNonNull(bVar, "The key value must not be null");
        this.o = bVar;
    }

    @Override // bp.d
    public final boolean b() {
        return true;
    }

    @Override // bp.d
    public final HashMap d() {
        HashMap mapD = super.d();
        mapD.put("k", this.o.f75082a);
        return mapD;
    }

    @Override // bp.d
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if ((obj instanceof l) && super.equals(obj)) {
            return Objects.equals(this.o, ((l) obj).o);
        }
        return false;
    }

    @Override // bp.d
    public final int hashCode() {
        return Objects.hash(Integer.valueOf(super.hashCode()), this.o);
    }
}

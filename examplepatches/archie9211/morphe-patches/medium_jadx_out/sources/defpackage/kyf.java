package defpackage;

import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kyf extends fyf {
    public final /* synthetic */ nyf h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public kyf(nyf nyfVar) {
        super(3);
        this.h = nyfVar;
    }

    @Override // defpackage.fyf
    public final ayf B() {
        return new hyf(this);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        if (!(obj instanceof Map.Entry)) {
            return false;
        }
        Map.Entry entry = (Map.Entry) obj;
        Object obj2 = this.h.get(entry.getKey());
        return obj2 != null && obj2.equals(entry.getValue());
    }

    @Override // defpackage.fyf, java.util.Collection, java.util.Set
    public final int hashCode() {
        return lk7.H(this.h.entrySet());
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final /* synthetic */ Iterator iterator() {
        return A().listIterator(0);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.h.d.size();
    }

    @Override // defpackage.ogf
    public final ugf v() {
        return A().listIterator(0);
    }
}

package defpackage;

import j$.util.Objects;
import java.util.AbstractMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rgg extends ugf {
    public final cgg b;
    public Object c;
    public ugf d;

    public rgg(xgg xggVar) {
        super(6);
        this.b = xggVar.a.entrySet().s().listIterator(0);
        this.c = null;
        this.d = ygg.e;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.d.hasNext() || this.b.hasNext();
    }

    @Override // defpackage.ugf, java.util.Iterator
    public final /* bridge */ /* synthetic */ Object next() {
        if (!this.d.hasNext()) {
            Map.Entry entry = (Map.Entry) this.b.next();
            this.c = entry.getKey();
            this.d = ((agg) entry.getValue()).d();
        }
        Object obj = this.c;
        Objects.requireNonNull(obj);
        return new AbstractMap.SimpleImmutableEntry(obj, this.d.next());
    }
}

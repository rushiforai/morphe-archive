package defpackage;

import java.util.AbstractMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hyf extends ayf {
    public final /* synthetic */ kyf g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hyf(kyf kyfVar) {
        super(3);
        this.g = kyfVar;
    }

    @Override // java.util.List
    public final /* bridge */ /* synthetic */ Object get(int i) {
        nyf nyfVar = this.g.h;
        return new AbstractMap.SimpleImmutableEntry(nyfVar.c.j.get(i), nyfVar.d.get(i));
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.g.h.d.size();
    }
}

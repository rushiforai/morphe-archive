package defpackage;

import java.util.AbstractCollection;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sfg extends AbstractCollection {
    public final /* synthetic */ tfg a;

    public /* synthetic */ sfg(tfg tfgVar) {
        this.a = tfgVar;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final void clear() {
        this.a.clear();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        tfg tfgVar = this.a;
        Map mapD = tfgVar.d();
        return mapD != null ? mapD.values().iterator() : new ofg(tfgVar, 2);
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final int size() {
        return this.a.size();
    }
}

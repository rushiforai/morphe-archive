package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class r70 extends bs1 {
    public final q70 b;

    public r70() {
        super(gc6.a);
        a0c a0cVar = gc6.b;
        a0cVar.getClass();
        this.b = new q70(a0cVar);
    }

    @Override // defpackage.pj6
    public final xzb a() {
        return this.b;
    }

    @Override // defpackage.u0
    public final Object e() {
        return new ArrayList();
    }

    @Override // defpackage.u0
    public final int f(Object obj) {
        ArrayList arrayList = (ArrayList) obj;
        arrayList.getClass();
        return arrayList.size();
    }

    @Override // defpackage.u0
    public final Iterator g(Object obj) {
        Collection collection = (Collection) obj;
        collection.getClass();
        return collection.iterator();
    }

    @Override // defpackage.u0
    public final int h(Object obj) {
        Collection collection = (Collection) obj;
        collection.getClass();
        return collection.size();
    }

    @Override // defpackage.u0
    public final Object k(Object obj) {
        throw null;
    }

    @Override // defpackage.u0
    public final Object l(Object obj) {
        ArrayList arrayList = (ArrayList) obj;
        arrayList.getClass();
        return arrayList;
    }

    @Override // defpackage.bs1
    public final void m(Object obj, int i, Object obj2) {
        ArrayList arrayList = (ArrayList) obj;
        arrayList.getClass();
        arrayList.add(i, obj2);
    }
}

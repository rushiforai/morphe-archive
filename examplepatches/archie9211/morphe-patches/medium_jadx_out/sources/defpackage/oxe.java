package defpackage;

import com.medium.android.graphql.CollectionIsMutedQuery;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class oxe {
    public final kla a;

    public oxe(kla klaVar) {
        this.a = klaVar;
    }

    public final bo4 a(String str, boolean z) {
        bo4 u50Var;
        if (str != null) {
            e00 e00Var = this.a.a;
            CollectionIsMutedQuery collectionIsMutedQuery = new CollectionIsMutedQuery(str);
            e00Var.getClass();
            uz uzVar = new uz(e00Var, collectionIsMutedQuery);
            uzVar.b.i = Boolean.valueOf(z);
            yd4 yd4Var = yd4.CacheFirst;
            u50Var = new mxe(new zz(new xz(gr7.F((uz) gr7.x((h68) gr7.i(uzVar, yd4Var), yd4.CacheOnly)), yd4Var, 15), 0), str, 1);
        } else {
            u50Var = new u50(7, d88.CANT_MUTE);
        }
        return m40.J(u50Var);
    }
}

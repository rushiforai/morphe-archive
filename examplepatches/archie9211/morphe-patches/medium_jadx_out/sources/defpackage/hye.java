package defpackage;

import com.medium.android.graphql.PostFeaturingStatusQuery;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hye {
    public final cba a;

    public hye(cba cbaVar) {
        cbaVar.getClass();
        this.a = cbaVar;
    }

    public final mxe a(String str, boolean z) {
        str.getClass();
        cba cbaVar = this.a;
        cbaVar.getClass();
        e00 e00Var = cbaVar.a;
        PostFeaturingStatusQuery postFeaturingStatusQuery = new PostFeaturingStatusQuery(str);
        e00Var.getClass();
        uz uzVar = new uz(e00Var, postFeaturingStatusQuery);
        uzVar.b.i = Boolean.valueOf(z);
        yd4 yd4Var = yd4.CacheFirst;
        return new mxe(new zz(new xz(gr7.F((uz) gr7.x((h68) gr7.i(uzVar, yd4Var), yd4.CacheOnly)), yd4Var, 13), 0), str, 2);
    }
}

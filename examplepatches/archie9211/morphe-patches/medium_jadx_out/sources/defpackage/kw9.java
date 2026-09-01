package defpackage;

import com.medium.android.graphql.fragment.PostMetaData;
import com.medium.proto.event.PostFeaturedLabelPresented;
import com.medium.proto.event.PostMocLabelPresented;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kw9 implements te9 {
    public final /* synthetic */ sw9 a;
    public final /* synthetic */ String b;
    public final /* synthetic */ PostMetaData.Collection c;

    public kw9(sw9 sw9Var, String str, PostMetaData.Collection collection) {
        this.a = sw9Var;
        this.b = str;
        this.c = collection;
    }

    @Override // defpackage.te9
    public final void a(SourceParameter sourceParameter, String str, String str2) {
        str.getClass();
        sourceParameter.getClass();
        sw9 sw9Var = this.a;
        vx0.c0(f76.F(sw9Var), null, null, new fs9(sw9Var, str, str2, sourceParameter, null, 9), 3);
    }

    @Override // defpackage.te9
    public final void b(tf9 tf9Var) {
        tf9Var.getClass();
        sw9 sw9Var = this.a;
        vx0.c0(f76.F(sw9Var), null, null, new jw9(sw9Var, tf9Var, this.b, this.c, null), 3);
    }

    @Override // defpackage.te9
    public final void c(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        sw9 sw9Var = this.a;
        ty2 ty2Var = sw9Var.n;
        String str2 = sw9Var.d;
        String strU = gp7.u(sourceParameter);
        String str3 = sw9Var.D0;
        ty2Var.getClass();
        str2.getClass();
        str3.getClass();
        rqd.a(ty2Var.a, new PostMocLabelPresented(null, str, null, 5, null), str2, strU, false, null, str3, 24);
    }

    @Override // defpackage.te9
    public final void d(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        sw9 sw9Var = this.a;
        ty2 ty2Var = sw9Var.n;
        String str3 = sw9Var.d;
        String strU = gp7.u(sourceParameter);
        String str4 = sw9Var.D0;
        ty2Var.getClass();
        str3.getClass();
        str4.getClass();
        rqd.a(ty2Var.a, new PostFeaturedLabelPresented(null, str, str2, null, 9, null), str3, strU, false, null, str4, 24);
    }
}

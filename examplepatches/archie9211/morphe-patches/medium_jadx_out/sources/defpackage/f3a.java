package defpackage;

import com.medium.android.graphql.UserProfileByIdQuery;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class f3a extends que {
    public final String b;
    public final zxc c;
    public final String d;
    public final wua e;

    public f3a(String str, String str2, zxc zxcVar, hx4 hx4Var, ble bleVar) {
        str.getClass();
        str2.getClass();
        this.b = str;
        this.c = zxcVar;
        this.d = "profile_premium";
        e00 e00Var = bleVar.a;
        UserProfileByIdQuery userProfileByIdQuery = new UserProfileByIdQuery(str);
        e00Var.getClass();
        uz uzVar = new uz(e00Var, userProfileByIdQuery);
        yd4 yd4Var = yd4.CacheFirst;
        this.e = bo.e0(new sp4(m40.J(new zz(new xz(gr7.F((uz) gr7.x((h68) gr7.i(uzVar, yd4Var), yd4.CacheOnly)), yd4Var, 21), 0)), hx4Var, this, 2), f76.F(this), l7c.b, z2a.b);
    }

    public final String e() {
        return gp7.u(new SourceParameter(this.d, this.b, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -4, 8191, null));
    }
}

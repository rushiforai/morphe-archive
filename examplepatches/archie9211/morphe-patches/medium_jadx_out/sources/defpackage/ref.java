package defpackage;

import com.medium.android.yourfollowingfeed.ui.FollowedType;
import com.medium.proto.event.FollowingPageViewed;
import gen.model.SourceParameter;
import java.util.LinkedHashMap;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lref;", "Lque;", "bp2", "aef", "fdf", "yourfollowingfeed_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ref extends que {
    public final sp4 A;
    public final pc1 B;
    public final wua C;
    public boolean D;
    public final LinkedHashMap E;
    public final LinkedHashMap F;
    public String G;
    public String H;
    public final LinkedHashMap I;
    public final String b;
    public final vob c;
    public final dv4 d;
    public final zv4 e;
    public final cw4 f;
    public final x9d g;
    public final fw4 h;
    public final iw4 i;
    public final dp5 j;
    public final my6 k;
    public final fr9 l;
    public final tl m;
    public final yx2 n;
    public final ty2 o;
    public final ax2 p;
    public final String q;
    public final SourceParameter r;
    public final r6c s;
    public final uua t;
    public final wua u;
    public final wua v;
    public final xpc w;
    public final xpc x;
    public final hk1 y;
    public final to4 z;

    public ref(String str, vob vobVar, dv4 dv4Var, zv4 zv4Var, cw4 cw4Var, x9d x9dVar, fw4 fw4Var, iw4 iw4Var, dp5 dp5Var, my6 my6Var, fr9 fr9Var, tl tlVar, lb5 lb5Var, yx2 yx2Var, ty2 ty2Var, ax2 ax2Var, kb2 kb2Var) {
        str.getClass();
        vobVar.getClass();
        x9dVar.getClass();
        this.b = str;
        this.c = vobVar;
        this.d = dv4Var;
        this.e = zv4Var;
        this.f = cw4Var;
        this.g = x9dVar;
        this.h = fw4Var;
        this.i = iw4Var;
        this.j = dp5Var;
        this.k = my6Var;
        this.l = fr9Var;
        this.m = tlVar;
        this.n = yx2Var;
        this.o = ty2Var;
        this.p = ax2Var;
        this.q = "home_following";
        n92 n92Var = null;
        SourceParameter sourceParameter = new SourceParameter("home_following", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null);
        this.r = sourceParameter;
        r6c r6cVarX = k40.x(0, 7, null);
        this.s = r6cVarX;
        this.t = bo.z(r6cVarX);
        FollowedType followedType = FollowedType.WRITERS_AND_PUBLICATIONS;
        wua wuaVarC = vobVar.c("selected_followed_type", followedType);
        this.u = wuaVarC;
        wua wuaVarC2 = vobVar.c("selected_entity_id", null);
        wua wuaVarC3 = vobVar.c("selected_tag_id", null);
        wua wuaVarC4 = vobVar.c("selected_tag_sort", wdf.RECOMMENDED);
        this.v = wuaVarC4;
        Boolean bool = Boolean.FALSE;
        xpc xpcVarJ = vv2.j(bool);
        this.w = xpcVarJ;
        xpc xpcVarJ2 = vv2.j(bool);
        this.x = xpcVarJ2;
        this.y = ip4.b(wuaVarC2, new nef(0, n92Var, this));
        int i = 1;
        int i2 = 3;
        this.z = new to4(ip4.b(wuaVarC3, new nef(i, n92Var, this)), new cef(i, n92Var, this), 3);
        this.A = new sp4(dv4Var.b.Q(new cv4(dv4Var, new gef(this, null), null)), wuaVarC2, new rl2(this, n92Var, 14), 0);
        int i3 = 2;
        this.B = k40.T(fw4Var.b.Q(new kg(fw4Var, new i12(i2, 4, n92Var), n92Var, 9)), wuaVarC4, wuaVarC3, new fdd(i3, n92Var, this));
        int i4 = 8;
        bo4 bo4VarR = w2g.r(k40.R(ip4.b(wuaVarC, new gd1(new au2(i3, i4, n92Var), n92Var, i2)), ip4.b(wuaVarC, new nef(i3, n92Var, this)), new sp4(ip4.b(wuaVarC, new nef(i2, n92Var, this)), lb5Var.a.f, new m14(i2, i4, n92Var), 0), xpcVarJ, xpcVarJ2, new qef(this, null)), kb2Var);
        gp1 gp1VarF = f76.F(this);
        vpc vpcVar = wuaVarC.a;
        gw4 gw4Var = new gw4(followedType, vpcVar.getValue() == followedType);
        FollowedType followedType2 = FollowedType.TAGS;
        this.C = bo.e0(bo4VarR, gp1VarF, l7c.b, new aef(false, d46.R(gw4Var, new gw4(followedType2, vpcVar.getValue() == followedType2)), qdf.a, z46.x, sourceParameter));
        this.E = new LinkedHashMap();
        this.F = new LinkedHashMap();
        this.G = "none";
        this.H = "none";
        this.I = new LinkedHashMap();
    }

    public static void f(ref refVar, String str, String str2, String str3, int i) {
        String str4 = (i & 1) != 0 ? null : str;
        String str5 = (i & 2) != 0 ? null : str2;
        String str6 = (i & 4) != 0 ? null : str3;
        yx2 yx2Var = refVar.n;
        String str7 = refVar.b;
        String str8 = refVar.q;
        String strU = gp7.u(refVar.r);
        yx2Var.getClass();
        str7.getClass();
        str8.getClass();
        rqd.a(yx2Var.a, new FollowingPageViewed(null, str5, str4, str6, null, 17, null), str7, strU, false, null, str8, 24);
    }

    public final wdf e() {
        wdf wdfVar = (wdf) this.c.a("selected_tag_sort");
        return wdfVar == null ? wdf.RECOMMENDED : wdfVar;
    }
}

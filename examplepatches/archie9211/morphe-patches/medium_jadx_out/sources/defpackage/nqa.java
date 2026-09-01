package defpackage;

import gen.model.SourceParameter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"Lnqa;", "Lque;", "kqa", "nr2", "pushnotificationsettings_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class nqa extends que {
    public final String b;
    public final vob c;
    public final ax2 d;
    public final m5e e;
    public final wua f;
    public final r6c g;
    public final xpc h;
    public final r6c i;
    public final SourceParameter j;
    public final String k;
    public boolean l;
    public final wua m;

    public nqa(String str, vob vobVar, ax2 ax2Var, m5e m5eVar, wjc wjcVar, kb2 kb2Var) {
        str.getClass();
        vobVar.getClass();
        this.b = str;
        this.c = vobVar;
        this.d = ax2Var;
        this.e = m5eVar;
        Boolean bool = Boolean.FALSE;
        this.f = vobVar.c("notification_permission_granted", bool);
        n92 n92Var = null;
        r6c r6cVarX = k40.x(1, 5, null);
        this.g = r6cVarX;
        this.h = vv2.j(bool);
        this.i = k40.x(0, 7, null);
        this.j = new SourceParameter("notification_settings", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null);
        this.k = "notification_settings";
        this.m = bo.e0(w2g.r(ip4.b(new to4(new a74(2, 3, n92Var), r6cVarX), new gd1(n92Var, this, wjcVar, 10)), kb2Var), f76.F(this), l7c.b, iqa.a);
    }
}

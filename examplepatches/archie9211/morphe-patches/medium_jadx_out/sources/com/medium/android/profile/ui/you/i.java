package com.medium.android.profile.ui.you;

import defpackage.ax2;
import defpackage.b0b;
import defpackage.bo;
import defpackage.f76;
import defpackage.k40;
import defpackage.kb2;
import defpackage.l7c;
import defpackage.mg7;
import defpackage.mya;
import defpackage.n92;
import defpackage.que;
import defpackage.ro4;
import defpackage.to4;
import defpackage.u47;
import defpackage.vob;
import defpackage.vv2;
import defpackage.w2g;
import defpackage.wbf;
import defpackage.wua;
import defpackage.xpc;
import defpackage.zk2;
import gen.model.SourceParameter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"Lcom/medium/android/profile/ui/you/i;", "Lque;", "xbf", "ap2", "profile_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class i extends que {
    public final YouProfileTab b;
    public final String c;
    public final ax2 d;
    public final ax2 e;
    public final vob f;
    public final String g;
    public int h;
    public final String i;
    public boolean j;
    public final xpc k;
    public final wua l;

    public i(YouProfileTab youProfileTab, String str, mya myaVar, zk2 zk2Var, ax2 ax2Var, ax2 ax2Var2, vob vobVar, kb2 kb2Var) {
        youProfileTab.getClass();
        str.getClass();
        zk2Var.getClass();
        vobVar.getClass();
        this.b = youProfileTab;
        this.c = str;
        this.d = ax2Var;
        this.e = ax2Var2;
        this.f = vobVar;
        String strM = zk2Var.m();
        this.g = strM;
        this.h = 3;
        this.i = "you_tab/".concat(strM);
        xpc xpcVarJ = vv2.j(0);
        this.k = xpcVarJ;
        n92 n92Var = null;
        to4 to4VarW = mya.w(myaVar, null, 7);
        wua wuaVarC = vobVar.c("selected_tab", youProfileTab);
        int i = 4;
        this.l = bo.e0(w2g.r(new ro4(k40.T(to4VarW, wuaVarC, new b0b(xpcVarJ, i), new mg7(i, n92Var, this)), new u47(3, 1, n92Var), 1), kb2Var), f76.F(this), l7c.b, wbf.a);
    }

    public final SourceParameter e() {
        return new SourceParameter("you_tab", null, null, null, null, null, null, null, null, null, null, null, this.g, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -4098, 8191, null);
    }
}

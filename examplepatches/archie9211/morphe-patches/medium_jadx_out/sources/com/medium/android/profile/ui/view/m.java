package com.medium.android.profile.ui.view;

import com.medium.android.graphql.type.UserDismissableFlags;
import com.medium.android.profile.ui.view.UserProfileReference;
import defpackage.ax2;
import defpackage.b0b;
import defpackage.bo;
import defpackage.dm4;
import defpackage.eoc;
import defpackage.f76;
import defpackage.f88;
import defpackage.hha;
import defpackage.hhe;
import defpackage.k40;
import defpackage.kb2;
import defpackage.l7c;
import defpackage.lje;
import defpackage.lod;
import defpackage.mya;
import defpackage.n92;
import defpackage.nl4;
import defpackage.o2b;
import defpackage.og3;
import defpackage.qd0;
import defpackage.que;
import defpackage.r6c;
import defpackage.s26;
import defpackage.slc;
import defpackage.tz7;
import defpackage.u50;
import defpackage.uua;
import defpackage.vob;
import defpackage.vv2;
import defpackage.w2g;
import defpackage.wua;
import defpackage.xpc;
import defpackage.ygf;
import gen.model.SourceParameter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/medium/android/profile/ui/view/m;", "Lque;", "nje", "hje", "so2", "profile_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class m extends que {
    public SourceParameter A;
    public final r6c B;
    public final uua C;
    public final xpc D;
    public final wua E;
    public final UserProfileReference b;
    public final UserProfileTab c;
    public final String d;
    public final lod e;
    public final f88 f;
    public final o2b g;
    public final f88 h;
    public final o2b i;
    public final mya j;
    public final eoc k;
    public final hhe l;
    public final og3 m;
    public final tz7 n;
    public final ax2 o;
    public final ax2 p;
    public final ax2 q;
    public final s26 r;
    public final slc s;
    public final vob t;
    public final boolean u;
    public boolean v;
    public boolean w;
    public boolean x;
    public int y;
    public final String z;

    public m(UserProfileReference userProfileReference, UserProfileTab userProfileTab, String str, lod lodVar, f88 f88Var, o2b o2bVar, f88 f88Var2, o2b o2bVar2, mya myaVar, eoc eocVar, hhe hheVar, og3 og3Var, hha hhaVar, tz7 tz7Var, ax2 ax2Var, ax2 ax2Var2, ax2 ax2Var3, s26 s26Var, slc slcVar, dm4 dm4Var, kb2 kb2Var, vob vobVar) {
        String userId;
        userProfileReference.getClass();
        userProfileTab.getClass();
        str.getClass();
        slcVar.getClass();
        dm4Var.getClass();
        vobVar.getClass();
        this.b = userProfileReference;
        this.c = userProfileTab;
        this.d = str;
        this.e = lodVar;
        this.f = f88Var;
        this.g = o2bVar;
        this.h = f88Var2;
        this.i = o2bVar2;
        this.j = myaVar;
        this.k = eocVar;
        this.l = hheVar;
        this.m = og3Var;
        this.n = tz7Var;
        this.o = ax2Var;
        this.p = ax2Var2;
        this.q = ax2Var3;
        this.r = s26Var;
        this.s = slcVar;
        this.t = vobVar;
        this.u = dm4Var.b(nl4.SEE_ACTIVE_VARIANTS);
        this.v = true;
        this.y = 4;
        this.z = "user_profile_page";
        n92 n92Var = null;
        if (userProfileReference instanceof UserProfileReference.UserId) {
            userId = ((UserProfileReference.UserId) userProfileReference).getUserId();
        } else {
            if (!(userProfileReference instanceof UserProfileReference.Username)) {
                ygf.a();
                throw null;
            }
            userId = null;
        }
        this.A = new SourceParameter("user_profile_page", null, null, null, null, null, null, null, null, null, null, null, userId, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -4098, 8191, null);
        r6c r6cVarX = k40.x(0, 7, null);
        this.B = r6cVarX;
        this.C = bo.z(r6cVarX);
        xpc xpcVarJ = vv2.j(0);
        this.D = xpcVarJ;
        this.E = bo.e0(w2g.r(k40.S(new u50(12, new qd0(hheVar, userProfileReference, n92Var, 6)), vobVar.c("selected_tab", userProfileTab), new b0b(xpcVarJ, 3), hhaVar.k(UserDismissableFlags.USER_PROFILE_ACTIVITY_FEED_TOOLTIP), new l(this, null)), kb2Var), f76.F(this), l7c.b, lje.a);
    }
}

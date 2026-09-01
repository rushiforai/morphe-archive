package defpackage;

import sprig.g.Hq.fiHTiFJ;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final /* synthetic */ class n2c implements b55 {
    public final /* synthetic */ int a;

    public /* synthetic */ n2c(int i) {
        this.a = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        String str;
        String str2;
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                dm2.d((x12) obj, tr7.y(1));
                return c1eVar;
            case 1:
                return ((v7c) obj2).c();
            case 2:
                ((Integer) obj2).getClass();
                er7.q((x12) obj, tr7.y(1));
                return c1eVar;
            case 3:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    tp7.c(1.0f, 384, 1, ((zo7) p65Var.j(kt7.b)).z, p65Var, null);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 4:
                ((Integer) obj).intValue();
                ixc ixcVar = (ixc) obj2;
                ixcVar.getClass();
                return ka1.r("subscriber_list_item", ixcVar.a);
            case 5:
                ((Integer) obj2).getClass();
                guc.j((x12) obj, tr7.y(1));
                return c1eVar;
            case 6:
                ((Integer) obj).getClass();
                c3f c3fVar = (c3f) obj2;
                c3fVar.getClass();
                return ka1.r("who_to_follow_item_", c3fVar.getId());
            case 7:
                eid eidVar = (eid) obj2;
                return d46.R(Float.valueOf(eidVar.a.g()), Boolean.valueOf(((hw8) eidVar.f.getValue()) == hw8.Vertical));
            case 8:
                lpb lpbVar = (lpb) obj;
                uid uidVar = (uid) obj2;
                return d46.t(qpb.a(uidVar.a, qpb.a, lpbVar), qpb.a(new bkd(uidVar.b), qpb.p, lpbVar));
            case 9:
                gb2 gb2Var = (gb2) obj2;
                if (!(gb2Var instanceof zkd)) {
                    return obj;
                }
                Integer num = obj instanceof Integer ? (Integer) obj : null;
                int iIntValue2 = num != null ? num.intValue() : 1;
                return iIntValue2 == 0 ? gb2Var : Integer.valueOf(iIntValue2 + 1);
            case 10:
                zkd zkdVar = (zkd) obj;
                gb2 gb2Var2 = (gb2) obj2;
                if (zkdVar != null) {
                    return zkdVar;
                }
                if (gb2Var2 instanceof zkd) {
                    return (zkd) gb2Var2;
                }
                return null;
            case 11:
                fld fldVar = (fld) obj;
                gb2 gb2Var3 = (gb2) obj2;
                if (gb2Var3 instanceof zkd) {
                    zkd zkdVar2 = (zkd) gb2Var3;
                    ib2 ib2Var = fldVar.a;
                    Object objB = zkdVar2.b();
                    Object[] objArr = fldVar.b;
                    int i2 = fldVar.d;
                    objArr[i2] = objB;
                    zkd[] zkdVarArr = fldVar.c;
                    fldVar.d = i2 + 1;
                    zkdVarArr[i2] = zkdVar2;
                }
                return fldVar;
            case 12:
                vod vodVar = (vod) obj2;
                return d46.R(Float.valueOf(vodVar.a), Float.valueOf(vodVar.c.g()), Float.valueOf(vodVar.b.g()));
            case 13:
                ((Integer) obj).intValue();
                hne hneVar = (hne) obj2;
                hneVar.getClass();
                return ka1.r("up_voter_item_", hneVar.a);
            case 14:
                ((aq6) obj).E = true;
                return c1eVar;
            case 15:
                ((Integer) obj).intValue();
                bae baeVar = (bae) obj2;
                baeVar.getClass();
                if (baeVar instanceof x9e) {
                    str = ((x9e) baeVar).a;
                    str2 = "user_activities_clapped_";
                } else if (baeVar instanceof y9e) {
                    str = ((y9e) baeVar).a;
                    str2 = "user_activities_highlighted_";
                } else if (baeVar instanceof z9e) {
                    str = ((z9e) baeVar).a;
                    str2 = "user_activities_response_to_post_";
                } else {
                    if (!(baeVar instanceof aae)) {
                        ygf.a();
                        return null;
                    }
                    str = ((aae) baeVar).a;
                    str2 = "user_activities_response_to_response_";
                }
                return ka1.r(str2, str);
            case 16:
                ((Integer) obj).getClass();
                jt0 jt0Var = (jt0) obj2;
                jt0Var.getClass();
                return "book_item_".concat(bu1.F0(jt0Var.g, null, null, null, null, 63));
            case 17:
                ((Integer) obj).getClass();
                dr9 dr9Var = (dr9) obj2;
                dr9Var.getClass();
                return "user_profile_post_".concat(dr9Var.a);
            case 18:
                ((Integer) obj).intValue();
                j8b j8bVar = (j8b) obj2;
                j8bVar.getClass();
                return ka1.r(fiHTiFJ.ygoTNQWazOvR, j8bVar.a);
            case 19:
                int iIntValue3 = ((Integer) obj).intValue();
                uwe uweVar = (uwe) obj2;
                uweVar.getClass();
                StringBuilder sbU = y30.u("voice-selector-item-", uweVar.c, "-", uweVar.d, "-");
                sbU.append(iIntValue3);
                return sbU.toString();
            case 20:
                ((Integer) obj).getClass();
                dr9 dr9Var2 = (dr9) obj2;
                dr9Var2.getClass();
                return "you_posts_post_".concat(dr9Var2.a);
            case 21:
                ((Integer) obj).getClass();
                dr9 dr9Var3 = (dr9) obj2;
                dr9Var3.getClass();
                return "your_following_feed_post_".concat(dr9Var3.C);
            case 22:
                ((Integer) obj).getClass();
                dr9 dr9Var4 = (dr9) obj2;
                dr9Var4.getClass();
                return "your_following_feed_post_".concat(dr9Var4.C);
            default:
                ((Integer) obj).getClass();
                dr9 dr9Var5 = (dr9) obj2;
                dr9Var5.getClass();
                return "your_responses_item_".concat(dr9Var5.a);
        }
    }

    public /* synthetic */ n2c(int i, int i2) {
        this.a = i2;
    }
}

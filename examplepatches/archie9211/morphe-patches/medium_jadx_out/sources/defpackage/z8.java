package defpackage;

import android.content.Context;
import com.medium.android.common.post.body.EditPostBodyView;
import com.medium.android.core.susi.SusiOperation;
import com.medium.android.donkey.DonkeyApplication;
import com.medium.android.donkey.write.EditPostFragment;
import com.medium.proto.event.PostFeaturedLabelInformationViewed;
import com.medium.proto.event.PublicationFeaturedPostsScreenViewed;
import com.medium.proto.event.SignUpSignInAddInfoViewed;
import gen.model.SourceParameter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z8 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public final /* synthetic */ Object c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ z8(Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.c = obj;
    }

    private final Object i(Object obj) {
        br7.v(obj);
        mg3 mg3Var = (mg3) this.c;
        synchronized (mg3Var.h) {
            if (!mg3Var.m || mg3Var.n) {
                return c1e.a;
            }
            try {
                mg3Var.R();
            } catch (IOException unused) {
                mg3Var.o = true;
            }
            try {
                if (mg3Var.j >= 2000) {
                    mg3Var.U();
                }
            } catch (IOException unused2) {
                mg3Var.p = true;
                mg3Var.k = new xua(new as0());
            }
            return c1e.a;
        }
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.c;
        switch (i) {
            case 0:
                return new z8((c9) obj2, n92Var, 0);
            case 1:
                return new z8((x9) obj2, n92Var, 1);
            case 2:
                return new z8((wb) obj2, n92Var, 2);
            case 3:
                return new z8((gc) obj2, n92Var, 3);
            case 4:
                return new z8((tf) obj2, n92Var, 4);
            case 5:
                return new z8((ig) obj2, n92Var, 5);
            case 6:
                return new z8((wg) obj2, n92Var, 6);
            case 7:
                return new z8((oh) obj2, n92Var, 7);
            case 8:
                return new z8((hi) obj2, n92Var, 8);
            case 9:
                return new z8((ti) obj2, n92Var, 9);
            case 10:
                return new z8((fj) obj2, n92Var, 10);
            case 11:
                return new z8((cb0) obj2, n92Var, 11);
            case 12:
                return new z8((wc0) obj2, n92Var, 12);
            case 13:
                return new z8((yd0) obj2, n92Var, 13);
            case 14:
                return new z8((pod) obj2, n92Var, 14);
            case 15:
                return new z8((y81) obj2, n92Var, 15);
            case 16:
                return new z8((c8f) obj2, n92Var, 16);
            case 17:
                return new z8((Context) obj2, n92Var, 17);
            case 18:
                return new z8((uf3) obj2, n92Var, 18);
            case 19:
                return new z8((mg3) obj2, n92Var, 19);
            case 20:
                return new z8((DonkeyApplication) obj2, n92Var, 20);
            case 21:
                return new z8((EditPostFragment) obj2, n92Var, 21);
            case 22:
                return new z8((ob4) obj2, n92Var, 22);
            case 23:
                return new z8((uc4) obj2, n92Var, 23);
            case 24:
                return new z8((lm4) obj2, n92Var, 24);
            case 25:
                return new z8((xm4) obj2, n92Var, 25);
            case 26:
                return new z8((rt4) obj2, n92Var, 26);
            case 27:
                return new z8((lw4) obj2, n92Var, 27);
            case 28:
                return new z8((zx4) obj2, n92Var, 28);
            default:
                return new z8((ty4) obj2, n92Var, 29);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((z8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 1:
                ((z8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 2:
                ((z8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 3:
                ((z8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 4:
                ((z8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 5:
                ((z8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 6:
                ((z8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 7:
                ((z8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 8:
                ((z8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 9:
                ((z8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 10:
                ((z8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 11:
                ((z8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 12:
                ((z8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 13:
                ((z8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 14:
                ((z8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 15:
                ((z8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 16:
                ((z8) create((m72) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 17:
                ((z8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 18:
                ((z8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 19:
                break;
            case 20:
                ((z8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 21:
                ((z8) create((ns3) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 22:
                ((z8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 23:
                ((z8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 24:
                ((z8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 25:
                ((z8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 26:
                ((z8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 27:
                ((z8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 28:
                ((z8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            default:
                ((z8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object[] objArr = 0;
        switch (this.b) {
            case 0:
                br7.v(obj);
                r9 r9Var = ((c9) this.c).b;
                String str = r9Var.b;
                String str2 = r9Var.j;
                String str3 = r9Var.i;
                if (!r9Var.l) {
                    r9Var.l = true;
                    a13 a13Var = r9Var.f;
                    l3d susiMethod = r9Var.c.getSusiMethod();
                    SusiOperation susiOperation = r9Var.k;
                    a13Var.getClass();
                    susiOperation.getClass();
                    str3.getClass();
                    str2.getClass();
                    str.getClass();
                    rqd.a(a13Var.a, new SignUpSignInAddInfoViewed(null, "app", susiOperation.getValue(), a13Var.b.p(), susiMethod != null ? susiMethod.getValue() : null, null, 33, null), str, str2, false, null, str3, 24);
                    r9Var.g.j(str, str2, str3);
                }
                return c1e.a;
            case 1:
                br7.v(obj);
                ua uaVar = ((x9) this.c).b;
                if (!uaVar.p) {
                    uaVar.p = true;
                    uaVar.g.j(uaVar.h, gp7.u(uaVar.o), uaVar.n);
                }
                return c1e.a;
            case 2:
                br7.v(obj);
                wb wbVar = (wb) this.c;
                if (!wbVar.e) {
                    wbVar.e = true;
                    wbVar.d.j(wbVar.b, "admin_internal_status", "admin_internal_status");
                }
                return c1e.a;
            case 3:
                br7.v(obj);
                oc ocVar = ((gc) this.c).a;
                if (!ocVar.o) {
                    ocVar.o = true;
                    ocVar.k.j(ocVar.b, ocVar.m, ocVar.n);
                }
                return c1e.a;
            case 4:
                br7.v(obj);
                eg egVar = ((tf) this.c).a;
                if (!egVar.l) {
                    egVar.l = true;
                    egVar.h.j(egVar.b, gp7.u(egVar.k), egVar.j);
                }
                return c1e.a;
            case 5:
                br7.v(obj);
                ug ugVar = ((ig) this.c).a;
                if (!ugVar.h) {
                    ugVar.h = true;
                    ugVar.g.j(ugVar.b, gp7.u(ugVar.k), ugVar.j);
                }
                return c1e.a;
            case 6:
                br7.v(obj);
                gh ghVar = ((wg) this.c).a;
                if (!ghVar.h) {
                    ghVar.h = true;
                    ghVar.g.j(ghVar.b, gp7.u(ghVar.k), ghVar.j);
                }
                return c1e.a;
            case 7:
                br7.v(obj);
                bi biVar = ((oh) this.c).a;
                if (!biVar.k) {
                    biVar.k = true;
                    biVar.g.j(biVar.b, gp7.u(biVar.j), biVar.i);
                }
                return c1e.a;
            case 8:
                br7.v(obj);
                si siVar = ((hi) this.c).a;
                if (!siVar.n) {
                    siVar.n = true;
                    siVar.g.j(siVar.b, gp7.u(siVar.i), siVar.h);
                }
                return c1e.a;
            case 9:
                br7.v(obj);
                ej ejVar = ((ti) this.c).a;
                if (!ejVar.h) {
                    ejVar.h = true;
                    ejVar.g.j(ejVar.b, gp7.u(ejVar.k), ejVar.j);
                }
                return c1e.a;
            case 10:
                br7.v(obj);
                rj rjVar = ((fj) this.c).a;
                if (!rjVar.k) {
                    rjVar.k = true;
                    rjVar.g.j(rjVar.b, gp7.u(rjVar.j), rjVar.i);
                }
                return c1e.a;
            case 11:
                br7.v(obj);
                lb0 lb0Var = ((cb0) this.c).a;
                if (!lb0Var.i) {
                    lb0Var.i = true;
                    lb0Var.e.j(lb0Var.c, gp7.u(lb0Var.h), lb0Var.g);
                }
                return c1e.a;
            case 12:
                br7.v(obj);
                yd0 yd0Var = ((wc0) this.c).a;
                vx0.c0(f76.F(yd0Var), null, null, new z8(yd0Var, objArr == true ? 1 : 0, 13), 3);
                return c1e.a;
            case 13:
                c1e c1eVar = c1e.a;
                br7.v(obj);
                yd0 yd0Var2 = (yd0) this.c;
                if (!yd0Var2.o) {
                    yd0Var2.o = true;
                    yd0Var2.h.f(yd0Var2.e, yd0Var2.g(), yd0Var2.i(), yd0Var2.c);
                }
                return c1eVar;
            case 14:
                br7.v(obj);
                ((pod) this.c).a();
                return c1e.a;
            case 15:
                br7.v(obj);
                ((y81) this.c).h();
                return c1e.a;
            case 16:
                br7.v(obj);
                String str4 = y62.a;
                c8f c8fVar = (c8f) this.c;
                d87.h().d(str4, "Constraints changed for " + c8fVar);
                return c1e.a;
            case 17:
                br7.v(obj);
                Context context = (Context) this.c;
                o32 o32VarA = o32.a(q32.i, null, null, 8189);
                q32 q32Var = new q32(o32VarA, "pubdc5f8936f65c72d098e042aed41a7ea3", "release", "external", "donkey", true, fy3.a, null);
                tqd tqdVar = tqd.GRANTED;
                a1a a1aVar = uu2.a;
                context.getClass();
                tqdVar.getClass();
                a1a a1aVar2 = uu2.a;
                synchronized (a1aVar2) {
                    if (((l66) ((LinkedHashMap) a1aVar2.c).get("_dd.sdk_core.default")) != null) {
                        f49.K(ymb.a, d66.WARN, e66.USER, ot2.e, null, false, 56);
                    } else {
                        z46 z46Var = uu2.b;
                        String str5 = "null/" + o32VarA.f.getSiteName$dd_sdk_android_core_release();
                        z46Var.getClass();
                        String strG = z46.g(str5);
                        if (strG == null) {
                            f49.K(ymb.a, d66.ERROR, e66.USER, ot2.f, null, false, 56);
                        } else {
                            String str6 = "_dd.sdk_core.default";
                            yu2 yu2Var = new yu2(context, strG, "_dd.sdk_core.default");
                            yu2Var.j(q32Var);
                            yu2Var.i().k.c(tqdVar);
                            LinkedHashMap linkedHashMap = (LinkedHashMap) a1aVar2.c;
                            if (linkedHashMap.containsKey("_dd.sdk_core.default")) {
                                f49.K((f66) a1aVar2.b, d66.WARN, e66.USER, new hm0(str6, 21), null, false, 56);
                            } else {
                                linkedHashMap.put("_dd.sdk_core.default", yu2Var);
                            }
                        }
                    }
                }
                return c1e.a;
            case 18:
                br7.v(obj);
                uf3 uf3Var = (uf3) this.c;
                if (!uf3Var.j) {
                    uf3Var.j = true;
                    uf3Var.d.j(uf3Var.b, uf3Var.i, uf3Var.h);
                }
                return c1e.a;
            case 19:
                return i(obj);
            case 20:
                br7.v(obj);
                DonkeyApplication donkeyApplication = (DonkeyApplication) this.c;
                int i = DonkeyApplication.m;
                donkeyApplication.d();
                donkeyApplication.b();
                return c1e.a;
            case 21:
                br7.v(obj);
                EditPostFragment editPostFragment = (EditPostFragment) this.c;
                int i2 = EditPostFragment.Q0;
                xq3 xq3Var = editPostFragment.j1().x;
                if (xq3Var != null) {
                    nvg nvgVar = (nvg) xq3Var.h;
                    ArrayList arrayList = (ArrayList) nvgVar.c;
                    iv2 iv2Var = editPostFragment.F0;
                    if (iv2Var == null) {
                        g76.g0("binding");
                        throw null;
                    }
                    EditPostBodyView editPostBodyView = (EditPostBodyView) iv2Var.h;
                    editPostBodyView.setUserMentionAdapter(new kde(editPostFragment.S(), new xi1(2, editPostFragment.j1(), ht3.class, "fetchUsersForTypeahead", "fetchUsersForTypeahead-gIAlu-s(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", 0, 3)));
                    editPostBodyView.setChangeMonitor(editPostFragment.w0);
                    editPostBodyView.setNameGenerator(editPostFragment.j1().o);
                    tg1 tg1Var = editPostFragment.D0;
                    if (tg1Var == null) {
                        g76.g0("catalogUiModelMapper");
                        throw null;
                    }
                    editPostBodyView.setCatalogUiModelMapper(tg1Var);
                    i03 i03Var = editPostFragment.B0;
                    if (i03Var == null) {
                        g76.g0("mediumUris");
                        throw null;
                    }
                    editPostBodyView.setMediumUris(i03Var);
                    d39 d39Var = editPostFragment.E0;
                    if (d39Var == null) {
                        g76.g0("grafStylerFactory");
                        throw null;
                    }
                    editPostBodyView.setParagraphStylerFactory(d39Var);
                    editPostBodyView.setDraft(ak3.a((ak3) xq3Var.c, null, null, 0, ((fb9) nvgVar.b).build(), null, nvgVar.b(xq3Var.a), 351));
                    editPostBodyView.setListener(editPostFragment);
                    editPostBodyView.setSelection(editPostFragment.N0);
                    xq3Var.l = editPostBodyView;
                    xq3Var.a = 0;
                    xq3Var.n(d73.INIT);
                    int i3 = nvgVar.a;
                    if (i3 == -1) {
                        if (i3 != -1) {
                            ygf.f("Can only have one normalization checkpoint");
                            return null;
                        }
                        nvgVar.a = arrayList.size();
                        b1 b1Var = (b1) bu1.I0(arrayList);
                        if (b1Var != null) {
                            b1Var.d = true;
                        }
                    }
                    editPostFragment.M0 = true;
                }
                return c1e.a;
            case 22:
                br7.v(obj);
                qb4 qb4Var = ((ob4) this.c).b;
                ty2 ty2Var = qb4Var.e;
                String str7 = qb4Var.b;
                String str8 = qb4Var.c;
                String str9 = qb4Var.d;
                String str10 = qb4Var.g;
                String str11 = qb4Var.f;
                ty2Var.getClass();
                str7.getClass();
                str8.getClass();
                str9.getClass();
                str10.getClass();
                str11.getClass();
                rqd.a(ty2Var.a, new PostFeaturedLabelInformationViewed(null, str7, str8, null, 9, null), str9, str10, false, null, str11, 24);
                return c1e.a;
            case 23:
                br7.v(obj);
                uc4 uc4Var = (uc4) this.c;
                ax2 ax2Var = uc4Var.g;
                String str12 = uc4Var.b;
                String str13 = uc4Var.c;
                String strU = gp7.u(uc4Var.j);
                String str14 = uc4Var.i;
                ax2Var.getClass();
                str12.getClass();
                str13.getClass();
                str14.getClass();
                rqd.a(ax2Var.b, new PublicationFeaturedPostsScreenViewed(null, str12, null, 5, null), str13, strU, false, null, str14, 24);
                return c1e.a;
            case 24:
                br7.v(obj);
                xm4 xm4Var = ((lm4) this.c).a;
                if (!xm4Var.j) {
                    xm4Var.j = true;
                    xm4Var.f.j(xm4Var.b, xm4Var.h, xm4Var.i);
                }
                return c1e.a;
            case 25:
                br7.v(obj);
                ((xm4) this.c).c.O(null);
                return c1e.a;
            case 26:
                br7.v(obj);
                qu4 qu4Var = ((rt4) this.c).a;
                String str15 = qu4Var.m;
                SourceParameter sourceParameter = qu4Var.n;
                String str16 = qu4Var.d;
                if (!qu4Var.o) {
                    qu4Var.o = true;
                    qu4Var.k.j(str16, gp7.u(sourceParameter), str15);
                    ax2 ax2Var2 = qu4Var.l;
                    Object value = qu4Var.s.a.getValue();
                    value.getClass();
                    ax2Var2.i(((gu4) value).f, str16, gp7.u(sourceParameter), str15);
                }
                return c1e.a;
            case 27:
                br7.v(obj);
                ((lw4) this.c).h();
                return c1e.a;
            case 28:
                br7.v(obj);
                sza szaVar = ((zx4) this.c).a;
                if (!szaVar.r) {
                    szaVar.r = true;
                    szaVar.g.j(szaVar.b, szaVar.p, szaVar.n);
                }
                return c1e.a;
            default:
                br7.v(obj);
                ty4 ty4Var = (ty4) this.c;
                if (!ty4Var.f) {
                    ty4Var.f = true;
                    ty4Var.d.j(ty4Var.b, gp7.u(ty4Var.e), "user_following_page");
                }
                return c1e.a;
        }
    }
}

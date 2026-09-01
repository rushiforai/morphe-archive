package defpackage;

import androidx.work.impl.yX.VrhD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class jd3 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ int b;

    public /* synthetic */ jd3(int i, int i2) {
        this.a = i2;
        this.b = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        String str;
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.b;
        switch (i) {
            case 0:
                ((Integer) obj).getClass();
                dr9 dr9Var = (dr9) obj2;
                dr9Var.getClass();
                return "digest_section_" + i2 + "_post_" + dr9Var.a;
            case 1:
                int iIntValue = ((Integer) obj).intValue();
                que queVar = (que) obj2;
                queVar.getClass();
                if (queVar instanceof n39) {
                    return VrhD.fCwbaZI + ((n39) queVar).b.getName() + "_" + i2;
                }
                if (queVar instanceof gf0) {
                    return "post_page_author_header";
                }
                if (queVar instanceof ve0) {
                    return "post_page_author_footer";
                }
                if (queVar instanceof iia) {
                    return "post_page_publication_footer";
                }
                if (queVar instanceof ve9) {
                    return "post_page_post_chips";
                }
                if (queVar instanceof r35) {
                    return "post_page_friend_link_banner";
                }
                if (queVar instanceof yn8) {
                    return "post_page_offer_banner";
                }
                if (queVar instanceof pj9) {
                    return "post_page_paywall";
                }
                if (queVar instanceof zh9) {
                    return "post_page_meter";
                }
                if (queVar instanceof ko9) {
                    return "post_page_responses";
                }
                if (queVar instanceof gqd) {
                    return "post_page_topics";
                }
                if (queVar instanceof ni3) {
                    str = "post_page_divider_";
                } else {
                    if (queVar instanceof j06) {
                        return "post_page_in_response_to_post";
                    }
                    if (queVar instanceof h1e) {
                        return "post_page_unlisted_badge";
                    }
                    if (queVar instanceof u38) {
                        return "post_page_more_from_author_and_collection";
                    }
                    if (!(queVar instanceof qg5)) {
                        if (queVar instanceof uvb) {
                            return "post_page_see_all_from_author_and_collection";
                        }
                        if (queVar instanceof kwa) {
                            return "post_page_recommended_from_medium";
                        }
                        if (queVar instanceof xvb) {
                            return "post_page_see_more_recommendations";
                        }
                        if (queVar instanceof if1) {
                            return "post_page_catalog_recirc_header";
                        }
                        if (queVar instanceof me9) {
                            return "post_page_post_carousel_items";
                        }
                        if (queVar instanceof mf1) {
                            return "post_page_catalog_recirc_see_list";
                        }
                        if (queVar instanceof ii9) {
                            return "post_page_non_member_upsell";
                        }
                        ygf.f(ka1.r("Unexpected item type in PostContent: ", n1b.a.b(queVar.getClass()).d()));
                        return null;
                    }
                    str = "post_page_grid_posts_";
                }
                return b09.w(iIntValue, str);
            case 2:
                ((Integer) obj2).getClass();
                nk7.Y((x12) obj, tr7.y(i2 | 1));
                return c1eVar;
            case 3:
                ((Integer) obj2).getClass();
                nk7.U((x12) obj, tr7.y(i2 | 1));
                return c1eVar;
            case 4:
                ((Integer) obj2).getClass();
                nk7.c0((x12) obj, tr7.y(i2 | 1));
                return c1eVar;
            default:
                ((Integer) obj2).getClass();
                p65 p65Var = (p65) ((x12) obj);
                return km4.w(p65Var, 2110269414, i2, p65Var, false);
        }
    }
}

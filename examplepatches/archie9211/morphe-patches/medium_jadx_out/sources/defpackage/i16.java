package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.net.ConnectivityManager;
import android.os.Bundle;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.core.membership.UpsellReferrer;
import com.medium.android.core.navigation.ResponsesReference;
import com.medium.android.core.share.RepostShareData;
import com.medium.android.data.settings.NotificationNetwork;
import com.medium.android.payments.ui.subscription.SubscriptionBottomSheetDialogFragment;
import com.medium.android.payments.ui.subscription.SubscriptionViewModel;
import com.medium.android.payments.ui.subscription.a;
import com.medium.android.publication.ui.main.PublicationFragment;
import com.medium.android.publication.ui.writers.PublicationWritersFragment;
import com.medium.proto.event.ResponsesHighlightResponsesSeeAll;
import com.medium.proto.event.TagShare;
import com.medium.reader.R;
import com.medium.refinerecommendations.RefineRecommendationsFragment;
import com.medium.refinerecommendations.muted.seeall.writers.c;
import gen.model.SourceParameter;
import java.util.Calendar;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class i16 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public /* synthetic */ i16(Object obj, Object obj2, Object obj3, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.m45
    public final Object invoke() throws PendingIntent.CanceledException {
        int i = this.a;
        int i2 = 2;
        int i3 = 1;
        Object[] objArr = 0;
        Object[] objArr2 = 0;
        Object[] objArr3 = 0;
        c1e c1eVar = c1e.a;
        Object obj = this.d;
        Object obj2 = this.c;
        Object obj3 = this.b;
        switch (i) {
            case 0:
                ConnectivityManager connectivityManager = (ConnectivityManager) obj2;
                j16 j16Var = (j16) obj;
                if (((nya) obj3).a) {
                    d87.h().d(a7f.a, "NetworkRequestConstraintController unregister callback");
                    connectivityManager.unregisterNetworkCallback(j16Var);
                }
                break;
            case 1:
                break;
            case 2:
                kv6 kv6Var = (kv6) obj2;
                xu6 xu6Var = (xu6) ((j83) obj3).getValue();
                break;
            case 3:
                ((l78) obj).setValue(Boolean.FALSE);
                ((x45) obj3).invoke((xqc) obj2);
                break;
            case 4:
                ex7 ex7Var = (ex7) obj2;
                f31 f31Var = (f31) obj;
                Collection collection = (Collection) obj3;
                int iP = ei7.P(cu1.k0(collection, 10));
                if (iP < 16) {
                    iP = 16;
                }
                LinkedHashMap linkedHashMap = new LinkedHashMap(iP);
                for (Object obj4 : collection) {
                    linkedHashMap.put(obj4, ex7Var.e((String) obj4, f31Var));
                }
                LinkedHashMap linkedHashMap2 = new LinkedHashMap();
                for (Map.Entry entry : linkedHashMap.entrySet()) {
                    if (((twa) entry.getValue()) == null) {
                        linkedHashMap2.put(entry.getKey(), entry.getValue());
                    }
                }
                Set setKeySet = linkedHashMap2.keySet();
                ex7 ex7Var2 = ex7Var.a;
                Collection<twa> collectionG = ex7Var2 != null ? ex7Var2.g(setKeySet, f31Var) : null;
                if (collectionG == null) {
                    collectionG = ey3.a;
                }
                for (twa twaVar : collectionG) {
                    ex7Var.c.L(twaVar.a, new bx7(twaVar));
                }
                break;
            case 5:
                sb2 sb2Var = (sb2) obj2;
                v7c v7cVar = (v7c) obj;
                if (((Boolean) ((x45) ((v7c) obj3).e.d).invoke(w7c.Expanded)).booleanValue()) {
                    vx0.c0(sb2Var, null, null, new fx0(v7cVar, objArr == true ? 1 : 0, 14), 3);
                }
                break;
            case 6:
                ((l78) obj).setValue(Boolean.FALSE);
                ((x45) obj3).invoke((Calendar) obj2);
                break;
            case 7:
                i88 i88Var = (i88) obj3;
                String str = (String) obj2;
                int iIntValue = ((u88) obj).a.intValue();
                i88Var.getClass();
                str.getClass();
                RefineRecommendationsFragment refineRecommendationsFragment = i88Var.b.a;
                refineRecommendationsFragment.Z();
                m4.w(refineRecommendationsFragment.S(), R.id.allMutedWritersFragment, c.a(iIntValue, str), null, 12);
                break;
            case 8:
                i88 i88Var2 = (i88) obj3;
                String str2 = (String) obj2;
                int iIntValue2 = ((t88) obj).a.intValue();
                i88Var2.getClass();
                str2.getClass();
                RefineRecommendationsFragment refineRecommendationsFragment2 = i88Var2.b.a;
                refineRecommendationsFragment2.Z();
                m4.w(refineRecommendationsFragment2.S(), R.id.allMutedCollectionsFragment, com.medium.refinerecommendations.muted.seeall.collections.c.a(iIntValue2, str2), null, 12);
                break;
            case 9:
                ((l78) obj).setValue(Boolean.FALSE);
                xpc xpcVar = ((i88) obj3).a.n;
                xpcVar.getClass();
                xpcVar.m(null, (s88) obj2);
                break;
            case 10:
                k65 k65Var = (k65) obj3;
                igc igcVar = (igc) obj2;
                kv8 kv8Var = (kv8) obj;
                if (k65Var != null) {
                    igcVar.a(igcVar.c(k65Var) - igcVar.t);
                }
                List listC = sgg.C(igcVar, null, igcVar.t, null);
                p12 p12Var = (p12) bu1.I0(listC);
                Integer num = p12Var != null ? p12Var.b : null;
                List listS = kv8Var.s(num);
                if (num != null && !listS.isEmpty()) {
                    listS = bu1.Q0(bu1.s0(listS, 1), d46.Q(new p12(((p12) bu1.x0(listS)).a, null, num)));
                }
                break;
            case 11:
                sh9 sh9Var = (sh9) obj3;
                dr9 dr9Var = (dr9) obj2;
                if (((Boolean) ((upc) obj).getValue()).booleanValue()) {
                    sh9Var.e(dr9Var.a, dr9Var.x.b);
                } else {
                    sh9Var.n(dr9Var.a, dr9Var.x.b);
                }
                break;
            case 12:
                sw9 sw9Var = ((fj9) obj3).c;
                vx0.c0(f76.F(sw9Var), null, null, new bv9(sw9Var, (rg1) obj2, objArr2 == true ? 1 : 0, i3), 3);
                ((l78) obj).setValue(null);
                break;
            case 13:
                ((sw9) obj3).f.O(null);
                ((l78) obj2).setValue(Boolean.FALSE);
                ((l78) obj).setValue(Boolean.TRUE);
                break;
            case 14:
                m73 m73Var = (m73) obj3;
                ki9 ki9Var = (ki9) obj2;
                upc upcVar = (upc) obj;
                float fA = ki9Var.b - ki9Var.a();
                if (fA < 0.0f) {
                    fA = 0.0f;
                }
                break;
            case 15:
                SourceParameter sourceParameter = (SourceParameter) obj;
                ((iq9) obj3).I(((kq9) obj2).a, sourceParameter.copy(((-9) & 1) != 0 ? sourceParameter.name : null, ((-9) & 2) != 0 ? sourceParameter.user_id : null, ((-9) & 4) != 0 ? sourceParameter.timestamp : null, ((-9) & 8) != 0 ? sourceParameter.dimension : "post_top_bar", ((-9) & 16) != 0 ? sourceParameter.collection_id : null, ((-9) & 32) != 0 ? sourceParameter.post_id : null, ((-9) & 64) != 0 ? sourceParameter.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter.promo_id : null, ((-9) & 256) != 0 ? sourceParameter.index : null, ((-9) & 512) != 0 ? sourceParameter.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter.author_id : null, ((-9) & 8192) != 0 ? sourceParameter.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter.post_source : null, ((-9) & 524288) != 0 ? sourceParameter.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter.notification_type : null, (8191 & 1) != 0 ? sourceParameter.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter.email_location : null, (8191 & 32) != 0 ? sourceParameter.book_id : null, (8191 & 64) != 0 ? sourceParameter.edition_id : null, (8191 & 128) != 0 ? sourceParameter.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.item_type : null, (8191 & 4096) != 0 ? sourceParameter.unknownFields() : null));
                break;
            case 16:
                iaa iaaVar = (iaa) obj2;
                String str3 = iaaVar.c;
                pkf pkfVar = iaaVar.a;
                naa naaVar = (naa) obj;
                int i4 = jaa.a[((maa) obj3).a.ordinal()];
                if (i4 == 1) {
                    SourceParameter sourceParameter2 = naaVar.g;
                    sourceParameter2.getClass();
                    str3.getClass();
                    ((kia) ((sja) pkfVar.a)).a(str3, sourceParameter2);
                } else if (i4 != 2) {
                    ygf.a();
                } else {
                    SourceParameter sourceParameter3 = naaVar.g;
                    sourceParameter3.getClass();
                    str3.getClass();
                    PublicationFragment publicationFragment = ((kia) ((sja) pkfVar.a)).a;
                    publicationFragment.Z();
                    Context contextS = publicationFragment.S();
                    String strU = gp7.u(sourceParameter3);
                    Bundle bundle = new Bundle();
                    bundle.putParcelable("bundle_info", new PublicationWritersFragment.BundleInfo(str3, strU));
                    m4.w(contextS, R.id.publicationWritersFragment, bundle, null, 12);
                }
                break;
            case 17:
                ((l78) obj).setValue(Boolean.FALSE);
                ((nba) obj3).b.m.d("selected_sort", (rba) obj2);
                break;
            case 18:
                String str4 = (String) obj2;
                str4.getClass();
                sw9 sw9Var2 = ((cv9) obj3).a;
                vx0.c0(f76.F(sw9Var2), null, null, new gs9(sw9Var2, str4, (SourceParameter) obj, null, 14), 3);
                break;
            case 19:
                ((x45) obj3).invoke((NotificationNetwork) obj2);
                ((l78) obj).setValue(Boolean.FALSE);
                break;
            case 20:
                k8b k8bVar = (k8b) obj2;
                dr9 dr9Var2 = (dr9) obj;
                RepostShareData repostShareData = ((j8b) obj3).j;
                if (repostShareData != null) {
                    k8bVar.k(repostShareData, dr9Var2.x);
                }
                break;
            case 21:
                lgb lgbVar = (lgb) obj3;
                nib nibVar = lgbVar.c;
                ax2 ax2Var = nibVar.v;
                String str5 = nibVar.F;
                ResponsesReference responsesReference = nibVar.c;
                responsesReference.getClass();
                String groupId = ((ResponsesReference.HighlightResponses) responsesReference).getGroupId();
                String str6 = nibVar.b;
                String str7 = nibVar.L;
                String str8 = nibVar.J;
                ax2Var.getClass();
                str5.getClass();
                groupId.getClass();
                str6.getClass();
                str7.getClass();
                str8.getClass();
                rqd.a(ax2Var.b, new ResponsesHighlightResponsesSeeAll(null, str5, groupId, null, 9, null), str6, str7, false, null, str8, 24);
                lgbVar.J(new ResponsesReference.Post(((zhb) obj2).o, null, null, null, null, 30, null), ((zhb) ((aib) obj)).n);
                break;
            case 22:
                aib aibVar = (aib) obj2;
                ((l78) obj).setValue(Boolean.FALSE);
                ((lgb) obj3).e(aibVar.b(), aibVar.c());
                break;
            case 23:
                ((qqc) obj3).b(((vqc) obj2).a, ((wqc) obj).m);
                break;
            case 24:
                hsc hscVar = ((isc) obj2).b;
                jsc jscVar = (jsc) obj;
                xqc xqcVar = ((msc) obj3).b;
                if (xqcVar == xqc.LIFETIME_EARNINGS_DESC || xqcVar == xqc.LIFETIME_EARNINGS_ASC) {
                    SourceParameter sourceParameter4 = jscVar.c;
                    sourceParameter4.getClass();
                    hscVar.c(sourceParameter4);
                } else {
                    SourceParameter sourceParameter5 = jscVar.c;
                    sourceParameter5.getClass();
                    hscVar.b(sourceParameter5);
                }
                break;
            case 25:
                ((sh9) obj3).q(((xq9) obj2).a, ((dr9) obj).x.b);
                break;
            case 26:
                SubscriptionViewModel subscriptionViewModel = (SubscriptionViewModel) obj3;
                cyc cycVar = (cyc) obj2;
                if (((c0d) ((l78) obj).getValue()) instanceof ezc) {
                    UpsellReferrer referrer = subscriptionViewModel.b.getReferrer();
                    UpsellReferrer upsellReferrer = UpsellReferrer.ONBOARDING;
                    if (referrer == upsellReferrer) {
                        subscriptionViewModel.i.a(subscriptionViewModel.v, subscriptionViewModel.f(), upsellReferrer.getValue(), subscriptionViewModel.c);
                    }
                    ((a) cycVar).a(subscriptionViewModel.f());
                } else {
                    subscriptionViewModel.i();
                    SubscriptionBottomSheetDialogFragment subscriptionBottomSheetDialogFragment = ((a) cycVar).a;
                    if (!k40.X(subscriptionBottomSheetDialogFragment).f()) {
                        subscriptionBottomSheetDialogFragment.Q().getOnBackPressedDispatcher().d();
                    }
                }
                break;
            case 27:
                ((l78) obj).setValue(Boolean.FALSE);
                ((q1d) obj3).a.c.d("selectedFilter", (d2d) obj2);
                break;
            case 28:
                vx0.c0((sb2) obj3, null, null, new nm1((ou) obj2, (ou) obj, objArr3 == true ? 1 : 0, i2), 3);
                break;
            default:
                ycd ycdVar = (ycd) obj2;
                String str9 = ((ocd) ycdVar.b).e.b;
                odd oddVar = ((lbd) obj3).a;
                ax2 ax2Var2 = oddVar.q;
                String str10 = oddVar.c;
                String strE = oddVar.e();
                String str11 = oddVar.P;
                ax2Var2.getClass();
                str10.getClass();
                str11.getClass();
                rqd.a(ax2Var2.b, new TagShare(null, null, str9, null, 11, null), str10, strE, false, null, str11, 24);
                ((d9d) obj).f(((ocd) ycdVar.b).e);
                break;
        }
        return c1eVar;
    }
}

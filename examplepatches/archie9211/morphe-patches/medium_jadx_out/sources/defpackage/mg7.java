package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.graphql.fragment.CatalogPreviewData;
import com.medium.android.profile.ui.you.YouProfileTab;
import com.medium.android.profile.ui.you.i;
import gen.model.SourceParameter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class mg7 extends p4d implements d55 {
    public final /* synthetic */ int b;
    public /* synthetic */ boolean c;
    public /* synthetic */ Object d;
    public /* synthetic */ Object e;
    public final /* synthetic */ que f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ mg7(int i, n92 n92Var, que queVar) {
        super(4, n92Var);
        this.b = i;
        this.f = queVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        boolean z;
        List list;
        CatalogPreviewData catalogPreviewData;
        zw7 zw7Var;
        Object next;
        int i = this.b;
        que queVar = this.f;
        switch (i) {
            case 0:
                sg7 sg7Var = (sg7) queVar;
                lv0 lv0Var = (lv0) this.d;
                rj2 rj2Var = (rj2) this.e;
                boolean z2 = this.c;
                br7.v(obj);
                if (rj2Var == null) {
                    return new cg7(sg7Var.H, lv0Var);
                }
                String str = rj2Var.d;
                return new eg7(str != null ? str : null, rj2Var.i, z2, sg7Var.H, lv0Var);
            case 1:
                p9a p9aVar = (p9a) this.d;
                k9a k9aVar = (k9a) this.e;
                boolean z3 = this.c;
                br7.v(obj);
                boolean z4 = p9aVar instanceof m9a;
                if (z4 || (k9aVar instanceof h9a)) {
                    return new g9a(z4 ? ((m9a) p9aVar).a : k9aVar instanceof h9a ? ((h9a) k9aVar).a : new w14(null, true));
                }
                return ((p9aVar instanceof o9a) && (k9aVar instanceof i9a)) ? new f9a((o9a) p9aVar, (i9a) k9aVar, !z3, ((w9a) queVar).k) : l9a.a;
            case 2:
                bjb bjbVar = (bjb) this.d;
                uid uidVar = (uid) this.e;
                boolean z5 = this.c;
                br7.v(obj);
                if (bjbVar == null) {
                    return w9b.a;
                }
                Object obj2 = bjbVar.a;
                z9b z9bVar = (z9b) queVar;
                Throwable thB = bjb.b(obj2);
                if (thB != null) {
                    return new v9b(m4.I(thB));
                }
                t9b t9bVar = (t9b) obj2;
                return new u9b(t9bVar.a, t9bVar.b, t9bVar.c, uidVar, z5, z9bVar.k);
            case 3:
                ide ideVar = (ide) queVar;
                SourceParameter sourceParameter = ideVar.p;
                tg1 tg1Var = ideVar.h;
                boolean z6 = this.c;
                Object obj3 = this.d;
                Object obj4 = this.e;
                br7.v(obj);
                boolean z7 = obj3 instanceof ajb;
                if (z7 && (obj4 instanceof ajb)) {
                    Throwable thB2 = bjb.b(obj3);
                    Throwable thB3 = bjb.b(obj4);
                    rj2 rj2VarA = ideVar.d.a();
                    if (rj2VarA == null || (zw7Var = rj2VarA.i) == null) {
                        zw7Var = zw7.NOT_A_MEMBER;
                    }
                    b24 b24VarI = thB2 != null ? m4.I(thB2) : thB3 != null ? m4.I(thB3) : null;
                    if (b24VarI != null) {
                        return new uce(b24VarI, zw7Var.getOfflineReadingEnabled());
                    }
                    ay0.e("Required value was null.");
                    return null;
                }
                if (z7) {
                    obj3 = null;
                }
                ff1 ff1Var = (ff1) obj3;
                List listS = d46.S((ff1Var == null || (catalogPreviewData = ff1Var.a) == null) ? null : tg1Var.a(gp7.u(sourceParameter), catalogPreviewData));
                int size = listS.size() - 1;
                if (size < 0) {
                    size = 0;
                }
                boolean z8 = obj4 instanceof ajb;
                f09 f09Var = (f09) (z8 ? null : obj4);
                List list2 = f09Var != null ? (List) f09Var.a : null;
                if (list2 == null) {
                    list2 = ey3.a;
                }
                ArrayList arrayList = new ArrayList(cu1.k0(list2, 10));
                int i2 = 0;
                for (Object obj5 : list2) {
                    int i3 = i2 + 1;
                    if (i2 < 0) {
                        d46.i0();
                        throw null;
                    }
                    CatalogPreviewData catalogPreviewData2 = ((ff1) obj5).a;
                    SourceParameter sourceParameter2 = ideVar.p;
                    arrayList.add(tg1Var.a(gp7.u(sourceParameter2.copy(((-9) & 1) != 0 ? sourceParameter2.name : null, ((-9) & 2) != 0 ? sourceParameter2.user_id : null, ((-9) & 4) != 0 ? sourceParameter2.timestamp : null, ((-9) & 8) != 0 ? sourceParameter2.dimension : null, ((-9) & 16) != 0 ? sourceParameter2.collection_id : null, ((-9) & 32) != 0 ? sourceParameter2.post_id : null, ((-9) & 64) != 0 ? sourceParameter2.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter2.promo_id : null, ((-9) & 256) != 0 ? sourceParameter2.index : new Integer(i2 + size), ((-9) & 512) != 0 ? sourceParameter2.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter2.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter2.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter2.author_id : null, ((-9) & 8192) != 0 ? sourceParameter2.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter2.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter2.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter2.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter2.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter2.post_source : null, ((-9) & 524288) != 0 ? sourceParameter2.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter2.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter2.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter2.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter2.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter2.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter2.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter2.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter2.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter2.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter2.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter2.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter2.notification_type : null, (8191 & 1) != 0 ? sourceParameter2.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter2.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter2.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter2.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter2.email_location : null, (8191 & 32) != 0 ? sourceParameter2.book_id : null, (8191 & 64) != 0 ? sourceParameter2.edition_id : null, (8191 & 128) != 0 ? sourceParameter2.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter2.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter2.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter2.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter2.item_type : null, (8191 & 4096) != 0 ? sourceParameter2.unknownFields() : null)), catalogPreviewData2));
                    i2 = i3;
                }
                if (ff1Var == null || !ff1Var.b) {
                    f09 f09Var2 = (f09) (z8 ? null : obj4);
                    if (f09Var2 != null && (list = (List) f09Var2.a) != null && !list.isEmpty()) {
                        Iterator it2 = list.iterator();
                        while (it2.hasNext()) {
                            if (((ff1) it2.next()).b) {
                                z = true;
                            }
                        }
                    }
                    z = false;
                } else {
                    z = true;
                }
                ideVar.r = z;
                boolean z9 = z6 && !z;
                az5 az5VarF0 = bo.f0(listS);
                az5 az5VarF02 = bo.f0(arrayList);
                f09 f09Var3 = (f09) (z8 ? null : obj4);
                return new tce(z9, az5VarF0, az5VarF02, f09Var3 != null ? ((Boolean) f09Var3.b).booleanValue() : false, gp7.u(sourceParameter));
            default:
                rj2 rj2Var2 = (rj2) this.e;
                YouProfileTab youProfileTab = (YouProfileTab) this.d;
                boolean z10 = this.c;
                br7.v(obj);
                i iVar = (i) queVar;
                if (rj2Var2 == null) {
                    return vbf.a;
                }
                Long l = rj2Var2.w;
                if (l == null || l.longValue() <= 0) {
                    l = null;
                }
                f17 f17VarB = d46.B();
                if (l != null) {
                    f17VarB.add(YouProfileTab.Posts.INSTANCE);
                }
                f17VarB.add(YouProfileTab.Reposts.INSTANCE);
                f17VarB.add(YouProfileTab.Activities.INSTANCE);
                if (rj2Var2.q) {
                    f17VarB.add(YouProfileTab.Books.INSTANCE);
                }
                if (rj2Var2.p) {
                    f17VarB.add(YouProfileTab.Catalogs.INSTANCE);
                }
                f17VarB.add(YouProfileTab.About.INSTANCE);
                f17 f17VarW = d46.w(f17VarB);
                ListIterator listIterator = f17VarW.listIterator(0);
                while (true) {
                    wn5 wn5Var = (wn5) listIterator;
                    if (wn5Var.hasNext()) {
                        next = wn5Var.next();
                        if (g76.L((YouProfileTab) next, youProfileTab)) {
                        }
                    } else {
                        next = null;
                    }
                }
                YouProfileTab youProfileTab2 = (YouProfileTab) next;
                if (youProfileTab2 == null) {
                    youProfileTab2 = (YouProfileTab) bu1.x0(f17VarW);
                }
                YouProfileTab youProfileTab3 = youProfileTab2;
                iVar.h = f17VarW.b;
                String str2 = rj2Var2.a;
                String str3 = rj2Var2.d;
                return new ubf(str2, rj2Var2.b, str3 != null ? str3 : null, rj2Var2.i == zw7.PREMIUM, rj2Var2.g, rj2Var2.h, rj2Var2.q, rj2Var2.u, f17VarW, youProfileTab3, iVar.e(), z10);
        }
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        que queVar = this.f;
        switch (i) {
            case 0:
                boolean zBooleanValue = ((Boolean) obj3).booleanValue();
                mg7 mg7Var = new mg7(0, (n92) obj4, (sg7) queVar);
                mg7Var.d = (lv0) obj;
                mg7Var.e = (rj2) obj2;
                mg7Var.c = zBooleanValue;
                return mg7Var.invokeSuspend(c1eVar);
            case 1:
                boolean zBooleanValue2 = ((Boolean) obj3).booleanValue();
                mg7 mg7Var2 = new mg7(1, (n92) obj4, (w9a) queVar);
                mg7Var2.d = (p9a) obj;
                mg7Var2.e = (k9a) obj2;
                mg7Var2.c = zBooleanValue2;
                return mg7Var2.invokeSuspend(c1eVar);
            case 2:
                boolean zBooleanValue3 = ((Boolean) obj3).booleanValue();
                mg7 mg7Var3 = new mg7(2, (n92) obj4, (z9b) queVar);
                mg7Var3.d = (bjb) obj;
                mg7Var3.e = (uid) obj2;
                mg7Var3.c = zBooleanValue3;
                return mg7Var3.invokeSuspend(c1eVar);
            case 3:
                boolean zBooleanValue4 = ((Boolean) obj).booleanValue();
                Object obj5 = ((bjb) obj2).a;
                Object obj6 = ((bjb) obj3).a;
                mg7 mg7Var4 = new mg7(3, (n92) obj4, (ide) queVar);
                mg7Var4.c = zBooleanValue4;
                mg7Var4.d = obj5;
                mg7Var4.e = obj6;
                return mg7Var4.invokeSuspend(c1eVar);
            default:
                boolean zBooleanValue5 = ((Boolean) obj3).booleanValue();
                mg7 mg7Var5 = new mg7(4, (n92) obj4, (i) queVar);
                mg7Var5.e = (rj2) obj;
                mg7Var5.d = (YouProfileTab) obj2;
                mg7Var5.c = zBooleanValue5;
                return mg7Var5.invokeSuspend(c1eVar);
        }
    }
}

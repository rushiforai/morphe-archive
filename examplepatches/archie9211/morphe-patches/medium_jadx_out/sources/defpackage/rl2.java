package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.unsplash.data.UnsplashPhoto;
import gen.model.SourceParameter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class rl2 extends p4d implements c55 {
    public final /* synthetic */ int b;
    public /* synthetic */ Object c;
    public /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ rl2(Object obj, n92 n92Var, int i) {
        super(3, n92Var);
        this.b = i;
        this.e = obj;
    }

    private final Object i(Object obj) {
        k3e k3eVar = (k3e) this.e;
        atb atbVar = (atb) this.c;
        qz8 qz8Var = (qz8) this.d;
        br7.v(obj);
        if (qz8Var instanceof pz8) {
            return !k3eVar.g.isEmpty() ? new e3e(bo.f0(k3eVar.g), atbVar, false, true) : g3e.a;
        }
        if (!(qz8Var instanceof oz8)) {
            if (qz8Var instanceof nz8) {
                return new f3e(m4.I(((nz8) qz8Var).a));
            }
            ygf.a();
            return null;
        }
        oz8 oz8Var = (oz8) qz8Var;
        List list = oz8Var.a;
        HashSet hashSet = new HashSet();
        ArrayList arrayList = new ArrayList();
        for (Object obj2 : list) {
            if (hashSet.add(((UnsplashPhoto) obj2).getId())) {
                arrayList.add(obj2);
            }
        }
        k3eVar.g = arrayList;
        return new e3e(bo.f0(arrayList), atbVar, oz8Var.c, oz8Var.d);
    }

    private final Object n(Object obj) {
        Object next;
        oge ogeVar = (oge) this.e;
        SourceParameter sourceParameter = ogeVar.j;
        ege egeVar = (ege) this.c;
        Boolean bool = (Boolean) this.d;
        br7.v(obj);
        if (!(egeVar instanceof cge)) {
            if (egeVar instanceof ufe) {
                return new hge(sourceParameter);
            }
            if (egeVar instanceof age) {
                return new lge(sourceParameter);
            }
            if ((egeVar instanceof vfe) || (egeVar instanceof xfe) || (egeVar instanceof dge)) {
                return new jge(new w14(null, true));
            }
            if (egeVar instanceof yfe) {
                return new jge(m4.I(((yfe) egeVar).a));
            }
            if (egeVar instanceof zfe) {
                return kge.a;
            }
            if (egeVar instanceof wfe) {
                ygf.f("This screen should not be displayed when there are no books.");
                return null;
            }
            ygf.a();
            return null;
        }
        cge cgeVar = (cge) egeVar;
        List list = cgeVar.a;
        ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
        Iterator it2 = list.iterator();
        int i = 0;
        while (it2.hasNext()) {
            Object next2 = it2.next();
            int i2 = i + 1;
            if (i < 0) {
                d46.i0();
                throw null;
            }
            bge bgeVar = (bge) next2;
            String str = ogeVar.b;
            String str2 = bgeVar.a;
            ArrayList arrayList2 = bgeVar.c;
            String str3 = bgeVar.b;
            str3.getClass();
            Iterator it3 = bgeVar.d.iterator();
            while (true) {
                if (!it3.hasNext()) {
                    next = null;
                    break;
                }
                next = it3.next();
                if (!muc.b0((String) next)) {
                    break;
                }
            }
            Long l = bgeVar.e;
            List list2 = bgeVar.f;
            SourceParameter sourceParameter2 = ogeVar.j;
            arrayList.add(new jt0(str, str2, arrayList2, str3, (String) next, l, list2, sourceParameter2.copy(((-9) & 1) != 0 ? sourceParameter2.name : null, ((-9) & 2) != 0 ? sourceParameter2.user_id : null, ((-9) & 4) != 0 ? sourceParameter2.timestamp : null, ((-9) & 8) != 0 ? sourceParameter2.dimension : null, ((-9) & 16) != 0 ? sourceParameter2.collection_id : null, ((-9) & 32) != 0 ? sourceParameter2.post_id : null, ((-9) & 64) != 0 ? sourceParameter2.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter2.promo_id : null, ((-9) & 256) != 0 ? sourceParameter2.index : new Integer(i), ((-9) & 512) != 0 ? sourceParameter2.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter2.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter2.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter2.author_id : ogeVar.b, ((-9) & 8192) != 0 ? sourceParameter2.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter2.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter2.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter2.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter2.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter2.post_source : null, ((-9) & 524288) != 0 ? sourceParameter2.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter2.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter2.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter2.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter2.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter2.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter2.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter2.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter2.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter2.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter2.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter2.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter2.notification_type : null, (8191 & 1) != 0 ? sourceParameter2.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter2.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter2.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter2.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter2.email_location : null, (8191 & 32) != 0 ? sourceParameter2.book_id : null, (8191 & 64) != 0 ? sourceParameter2.edition_id : null, (8191 & 128) != 0 ? sourceParameter2.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter2.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter2.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter2.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter2.item_type : null, (8191 & 4096) != 0 ? sourceParameter2.unknownFields() : null)));
            it2 = it2;
            i = i2;
        }
        return new ige(sourceParameter, arrayList, g76.L(bool, Boolean.FALSE), cgeVar.b);
    }

    private final Object o(Object obj) {
        uaf tafVar;
        qz8 qz8Var = (qz8) this.c;
        q53 q53Var = (q53) this.d;
        br7.v(obj);
        paf pafVar = (paf) this.e;
        if (qz8Var instanceof nz8) {
            tafVar = new qaf(m4.I(((nz8) qz8Var).a));
        } else if (qz8Var instanceof oz8) {
            oz8 oz8Var = (oz8) qz8Var;
            List list = oz8Var.a;
            tafVar = list.isEmpty() ? saf.a : new taf(list, oz8Var.c, q53Var, oz8Var.d);
        } else {
            if (!g76.L(qz8Var, pz8.a)) {
                ygf.a();
                return null;
            }
            tafVar = raf.a;
        }
        return new vaf(pafVar, tafVar);
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        Object obj4 = this.e;
        switch (i) {
            case 0:
                Object obj5 = ((bjb) obj2).a;
                rl2 rl2Var = new rl2((sl2) obj4, (n92) obj3, 0);
                rl2Var.c = (rj2) obj;
                rl2Var.d = obj5;
                return rl2Var.invokeSuspend(c1eVar);
            case 1:
                rl2 rl2Var2 = new rl2((ap5) obj4, (n92) obj3, 1);
                rl2Var2.c = (qz8) obj;
                rl2Var2.d = (Map) obj2;
                return rl2Var2.invokeSuspend(c1eVar);
            case 2:
                rl2 rl2Var3 = new rl2((bq5) obj4, (n92) obj3, 2);
                rl2Var3.c = (qz8) obj;
                rl2Var3.d = (Map) obj2;
                return rl2Var3.invokeSuspend(c1eVar);
            case 3:
                rl2 rl2Var4 = new rl2((hx4) obj4, (n92) obj3, 3);
                rl2Var4.c = (Map) obj;
                rl2Var4.d = (Set) obj2;
                return rl2Var4.invokeSuspend(c1eVar);
            case 4:
                rl2 rl2Var5 = new rl2((x88) obj4, (n92) obj3, 4);
                rl2Var5.c = (s88) obj;
                rl2Var5.d = (u85) obj2;
                return rl2Var5.invokeSuspend(c1eVar);
            case 5:
                rl2 rl2Var6 = new rl2((sza) obj4, (n92) obj3, 5);
                rl2Var6.c = (eza) obj;
                rl2Var6.d = (m85) obj2;
                return rl2Var6.invokeSuspend(c1eVar);
            case 6:
                rl2 rl2Var7 = new rl2((zsc) obj4, (n92) obj3, 6);
                rl2Var7.c = (tsc) obj;
                rl2Var7.d = (osc) obj2;
                return rl2Var7.invokeSuspend(c1eVar);
            case 7:
                rl2 rl2Var8 = new rl2((qxc) obj4, (n92) obj3, 7);
                rl2Var8.c = (g0f) obj;
                rl2Var8.d = (qz8) obj2;
                return rl2Var8.invokeSuspend(c1eVar);
            case 8:
                rl2 rl2Var9 = new rl2((j2d) obj4, (n92) obj3, 8);
                rl2Var9.c = (d2d) obj;
                rl2Var9.d = (fc5) obj2;
                return rl2Var9.invokeSuspend(c1eVar);
            case 9:
                rl2 rl2Var10 = new rl2((p8d) obj4, (n92) obj3, 9);
                rl2Var10.c = (l2b) obj;
                rl2Var10.d = (s2b) obj2;
                return rl2Var10.invokeSuspend(c1eVar);
            case 10:
                rl2 rl2Var11 = new rl2((qed) obj4, (n92) obj3, 10);
                rl2Var11.c = (l2b) obj;
                rl2Var11.d = (qz8) obj2;
                return rl2Var11.invokeSuspend(c1eVar);
            case 11:
                rl2 rl2Var12 = new rl2((k3e) obj4, (n92) obj3, 11);
                rl2Var12.c = (atb) obj;
                rl2Var12.d = (qz8) obj2;
                return rl2Var12.invokeSuspend(c1eVar);
            case 12:
                rl2 rl2Var13 = new rl2((oge) obj4, (n92) obj3, 12);
                rl2Var13.c = (ege) obj;
                rl2Var13.d = (Boolean) obj2;
                return rl2Var13.invokeSuspend(c1eVar);
            case 13:
                rl2 rl2Var14 = new rl2((paf) obj4, (n92) obj3, 13);
                rl2Var14.c = (qz8) obj;
                rl2Var14.d = (q53) obj2;
                return rl2Var14.invokeSuspend(c1eVar);
            default:
                rl2 rl2Var15 = new rl2((ref) obj4, (n92) obj3, 14);
                rl2Var15.c = (qz8) obj;
                rl2Var15.d = (d04) obj2;
                return rl2Var15.invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:243:0x050a  */
    /* JADX WARN: Removed duplicated region for block: B:248:0x0519  */
    /* JADX WARN: Removed duplicated region for block: B:473:0x0d05  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x017b  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r71) {
        /*
            Method dump skipped, instruction units count: 3374
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rl2.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}

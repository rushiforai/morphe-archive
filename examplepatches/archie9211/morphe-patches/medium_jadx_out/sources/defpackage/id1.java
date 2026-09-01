package defpackage;

import android.os.Bundle;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.common.ui.Ezz.Plbho;
import com.medium.android.core.navigation.CatalogDetailReference;
import com.medium.android.graphql.fragment.CatalogDetailData;
import com.medium.android.graphql.fragment.CatalogSummaryData;
import gen.model.SourceParameter;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\b\b\u0001\u0018\u00002\u00020\u0001:\u0007\u0002\u0003\u0004\u0005\u0006\u0007\b¨\u0006\t"}, d2 = {"Lid1;", "Lque;", "jc1", "ua1", "bc1", "ya1", "la1", "ja1", "ip2", "catalogs_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class id1 extends que {
    public final ze1 A;
    public final fr9 B;
    public final tl C;
    public final ax2 D;
    public CatalogDetailData E;
    public boolean F;
    public Integer G;
    public pg1 H;
    public boolean I;
    public la1 J;
    public u4b K;
    public final r6c L;
    public final r6c M;
    public final xpc N;
    public final wua O;
    public final xpc P;
    public final wua Q;
    public final r6c R;
    public final r6c S;
    public final wua T;
    public final wua U;
    public final String V;
    public boolean W;
    public final CatalogDetailReference b;
    public final String c;
    public final qi1 d;
    public final yo8 e;
    public final ax2 f;
    public final ty2 g;
    public final ax2 h;
    public final ws4 i;
    public final a1a j;
    public final hha k;
    public final xa5 l;
    public final n53 m;
    public final n53 n;
    public final xc4 o;
    public final r4e p;
    public final mya q;
    public final m50 r;
    public final ws4 s;
    public final mya t;
    public final ku3 u;
    public final o2b v;
    public final o2b w;
    public final eoc x;
    public final gn9 y;
    public final vob z;

    public id1(CatalogDetailReference catalogDetailReference, String str, qi1 qi1Var, yo8 yo8Var, ax2 ax2Var, ty2 ty2Var, ax2 ax2Var2, ws4 ws4Var, a1a a1aVar, hha hhaVar, xa5 xa5Var, n53 n53Var, n53 n53Var2, xc4 xc4Var, r4e r4eVar, mya myaVar, mya myaVar2, m50 m50Var, ws4 ws4Var2, mya myaVar3, ku3 ku3Var, o2b o2bVar, o2b o2bVar2, eoc eocVar, gn9 gn9Var, vob vobVar, ze1 ze1Var, fr9 fr9Var, tl tlVar, ax2 ax2Var3, kb2 kb2Var) {
        catalogDetailReference.getClass();
        str.getClass();
        qi1Var.getClass();
        gn9Var.getClass();
        vobVar.getClass();
        this.b = catalogDetailReference;
        this.c = str;
        this.d = qi1Var;
        this.e = yo8Var;
        this.f = ax2Var;
        this.g = ty2Var;
        this.h = ax2Var2;
        this.i = ws4Var;
        this.j = a1aVar;
        this.k = hhaVar;
        this.l = xa5Var;
        this.m = n53Var;
        this.n = n53Var2;
        this.o = xc4Var;
        this.p = r4eVar;
        this.q = myaVar2;
        this.r = m50Var;
        this.s = ws4Var2;
        this.t = myaVar3;
        this.u = ku3Var;
        this.v = o2bVar;
        this.w = o2bVar2;
        this.x = eocVar;
        this.y = gn9Var;
        this.z = vobVar;
        this.A = ze1Var;
        this.B = fr9Var;
        this.C = tlVar;
        this.D = ax2Var3;
        this.I = true;
        n92 n92Var = null;
        r6c r6cVarX = k40.x(0, 7, null);
        this.L = r6cVarX;
        this.M = r6cVarX;
        xpc xpcVarJ = vv2.j(null);
        this.N = xpcVarJ;
        this.O = bo.A(xpcVarJ);
        xpc xpcVarJ2 = vv2.j(null);
        this.P = xpcVarJ2;
        this.Q = bo.A(xpcVarJ2);
        this.R = k40.x(0, 7, null);
        this.S = k40.x(0, 7, null);
        this.T = bo.e0(m40.J(new zh(mya.w(myaVar, yd4.CacheFirst, 4), 4)), f76.F(this), new ync(5000L, Long.MAX_VALUE), Boolean.FALSE);
        this.U = bo.e0(w2g.r(ip4.b(new u50(12, new l0(this, n92Var, 21)), new yk(1, n92Var, this)), kb2Var), f76.F(this), new ync(5000L, Long.MAX_VALUE), new ic1(new v81(false, false, "", vm1.a, 0, false, j())));
        this.V = Plbho.WbRCl;
    }

    public final void e() {
        CatalogDetailData catalogDetailData = this.E;
        n92 n92Var = null;
        if (catalogDetailData == null) {
            g76.g0("catalogDetailData");
            throw null;
        }
        String strR = ka1.r("Download catalog with id ", catalogDetailData.getId());
        km4.I(wld.a, null, strR, new Object[0], strR);
        vx0.c0(f76.F(this), null, null, new lc1(0, this, n92Var), 3);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.io.Serializable f(defpackage.p92 r8) {
        /*
            r7 = this;
            boolean r0 = r8 instanceof defpackage.rc1
            if (r0 == 0) goto L14
            r0 = r8
            rc1 r0 = (defpackage.rc1) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.d = r1
        L12:
            r6 = r0
            goto L1a
        L14:
            rc1 r0 = new rc1
            r0.<init>(r7, r8)
            goto L12
        L1a:
            java.lang.Object r8 = r6.b
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r6.d
            r2 = 0
            r3 = 1
            if (r1 == 0) goto L30
            if (r1 != r3) goto L2a
            defpackage.br7.v(r8)
            goto L66
        L2a:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r2
        L30:
            defpackage.br7.v(r8)
            com.medium.android.graphql.fragment.CatalogDetailData r8 = r7.E
            if (r8 == 0) goto L3c
            java.lang.String r7 = r8.getId()
            return r7
        L3c:
            com.medium.android.core.navigation.CatalogDetailReference r8 = r7.b
            boolean r1 = r8 instanceof com.medium.android.core.navigation.CatalogDetailReference.CatalogDetailById
            if (r1 == 0) goto L49
            com.medium.android.core.navigation.CatalogDetailReference$CatalogDetailById r8 = (com.medium.android.core.navigation.CatalogDetailReference.CatalogDetailById) r8
            java.lang.String r7 = r8.getCatalogId()
            return r7
        L49:
            boolean r1 = r8 instanceof com.medium.android.core.navigation.CatalogDetailReference.PredefinedCatalogDetail
            if (r1 == 0) goto L98
            com.medium.android.core.navigation.CatalogDetailReference$PredefinedCatalogDetail r8 = (com.medium.android.core.navigation.CatalogDetailReference.PredefinedCatalogDetail) r8
            java.lang.String r2 = r8.getUsername()
            com.medium.android.graphql.type.PredefinedCatalogType r8 = r8.getPredefinedCatalogType()
            r6.d = r3
            yd4 r4 = defpackage.yd4.CacheFirst
            r5 = 1
            xa5 r1 = r7.l
            r3 = r8
            java.lang.Object r8 = r1.a(r2, r3, r4, r5, r6)
            if (r8 != r0) goto L66
            return r0
        L66:
            cb5 r8 = (defpackage.cb5) r8
            boolean r7 = r8 instanceof defpackage.bb5
            if (r7 == 0) goto L71
            bb5 r8 = (defpackage.bb5) r8
            java.lang.String r7 = r8.a
            return r7
        L71:
            boolean r7 = r8 instanceof defpackage.ya5
            if (r7 == 0) goto L7f
            ya5 r8 = (defpackage.ya5) r8
            java.lang.Throwable r7 = r8.a
            ajb r8 = new ajb
            r8.<init>(r7)
            return r8
        L7f:
            java.lang.IllegalStateException r7 = new java.lang.IllegalStateException
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            java.lang.String r1 = "Unexpected result: "
            r0.<init>(r1)
            r0.append(r8)
            java.lang.String r8 = r0.toString()
            r7.<init>(r8)
            ajb r8 = new ajb
            r8.<init>(r7)
            return r8
        L98:
            defpackage.ygf.a()
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.id1.f(p92):java.io.Serializable");
    }

    public final String g() {
        CatalogDetailData catalogDetailData = this.E;
        String str = this.V;
        if (catalogDetailData == null) {
            return str;
        }
        if (catalogDetailData != null) {
            return b09.y(str, "/", catalogDetailData.getId());
        }
        g76.g0("catalogDetailData");
        throw null;
    }

    public final Map h() {
        Bundle bundle = (Bundle) this.z.a("movements");
        if (bundle == null) {
            return fy3.a;
        }
        Set<String> setKeySet = bundle.keySet();
        setKeySet.getClass();
        Set<String> set = setKeySet;
        int iP = ei7.P(cu1.k0(set, 10));
        if (iP < 16) {
            iP = 16;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(iP);
        for (Object obj : set) {
            linkedHashMap.put(obj, Integer.valueOf(bundle.getInt((String) obj)));
        }
        return linkedHashMap;
    }

    public final String i() {
        return gp7.u(j());
    }

    public final SourceParameter j() {
        SourceParameter sourceParameter = new SourceParameter(this.V, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null);
        CatalogDetailData catalogDetailData = this.E;
        if (catalogDetailData == null) {
            return sourceParameter;
        }
        if (catalogDetailData != null) {
            return sourceParameter.copy(((-9) & 1) != 0 ? sourceParameter.name : null, ((-9) & 2) != 0 ? sourceParameter.user_id : null, ((-9) & 4) != 0 ? sourceParameter.timestamp : null, ((-9) & 8) != 0 ? sourceParameter.dimension : null, ((-9) & 16) != 0 ? sourceParameter.collection_id : null, ((-9) & 32) != 0 ? sourceParameter.post_id : null, ((-9) & 64) != 0 ? sourceParameter.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter.promo_id : null, ((-9) & 256) != 0 ? sourceParameter.index : null, ((-9) & 512) != 0 ? sourceParameter.catalog_id : catalogDetailData.getId(), ((-9) & 1024) != 0 ? sourceParameter.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter.author_id : null, ((-9) & 8192) != 0 ? sourceParameter.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter.post_source : null, ((-9) & 524288) != 0 ? sourceParameter.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter.notification_type : null, (8191 & 1) != 0 ? sourceParameter.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter.email_location : null, (8191 & 32) != 0 ? sourceParameter.book_id : null, (8191 & 64) != 0 ? sourceParameter.edition_id : null, (8191 & 128) != 0 ? sourceParameter.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.item_type : null, (8191 & 4096) != 0 ? sourceParameter.unknownFields() : null);
        }
        g76.g0("catalogDetailData");
        throw null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x0089, code lost:
    
        if (r10.a(defpackage.za1.a, r7) == r8) goto L56;
     */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00c7  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x010a A[PHI: r2 r3 r11
      0x010a: PHI (r2v7 int) = (r2v6 int), (r2v6 int), (r2v12 int) binds: [B:38:0x00c5, B:42:0x0103, B:20:0x005a] A[DONT_GENERATE, DONT_INLINE]
      0x010a: PHI (r3v2 java.lang.Object) = (r3v1 java.lang.Object), (r3v1 java.lang.Object), (r3v9 java.lang.Object) binds: [B:38:0x00c5, B:42:0x0103, B:20:0x005a] A[DONT_GENERATE, DONT_INLINE]
      0x010a: PHI (r11v4 java.lang.Throwable) = (r11v3 java.lang.Throwable), (r11v3 java.lang.Throwable), (r11v7 java.lang.Throwable) binds: [B:38:0x00c5, B:42:0x0103, B:20:0x005a] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0110  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x014c  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object k(int r32, defpackage.p92 r33) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 354
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.id1.k(int, p92):java.lang.Object");
    }

    public final void l(String str) {
        str.getClass();
        vx0.c0(f76.F(this), null, null, new zc1(this, str, null, 0), 3);
    }

    public final void m(Map map) {
        Bundle bundle = new Bundle(map.size());
        for (Map.Entry entry : map.entrySet()) {
            bundle.putInt((String) entry.getKey(), ((Number) entry.getValue()).intValue());
        }
        this.z.d("movements", bundle);
    }

    public final void n(boolean z) {
        n92 n92Var = null;
        if (this.F) {
            vx0.c0(f76.F(this), null, null, new kc1(14, this, n92Var), 3);
        } else if (z) {
            vx0.c0(f76.F(this), null, null, new kc1(4, this, n92Var), 3);
        } else {
            vx0.c0(f76.F(this), null, null, new xc1(1, this, n92Var), 3);
        }
    }

    public final void o(String str) {
        CatalogDetailData catalogDetailData = this.E;
        if (catalogDetailData == null) {
            g76.g0("catalogDetailData");
            throw null;
        }
        if (catalogDetailData != null) {
            this.E = CatalogDetailData.copy$default(catalogDetailData, null, null, null, false, 0L, 0L, null, null, CatalogSummaryData.copy$default(catalogDetailData.getCatalogSummaryData(), null, null, null, null, null, null, null, str, 0L, 0, null, 1919, null), null, 767, null);
        } else {
            g76.g0("catalogDetailData");
            throw null;
        }
    }
}

package com.medium.android.profile.ui.view;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.core.models.EntityType;
import com.medium.android.profile.ui.view.UserProfileTab;
import defpackage.ag8;
import defpackage.ahe;
import defpackage.bg8;
import defpackage.bhe;
import defpackage.br7;
import defpackage.bt4;
import defpackage.bu1;
import defpackage.c1e;
import defpackage.cg8;
import defpackage.che;
import defpackage.d46;
import defpackage.d88;
import defpackage.dhe;
import defpackage.e55;
import defpackage.ehe;
import defpackage.f17;
import defpackage.g76;
import defpackage.ije;
import defpackage.jje;
import defpackage.kje;
import defpackage.lje;
import defpackage.m4;
import defpackage.mje;
import defpackage.muc;
import defpackage.n92;
import defpackage.ns0;
import defpackage.p4d;
import defpackage.pme;
import defpackage.w14;
import defpackage.wge;
import defpackage.wu4;
import defpackage.xge;
import defpackage.yf8;
import defpackage.yge;
import defpackage.ygf;
import defpackage.zge;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class l extends p4d implements e55 {
    public /* synthetic */ ehe b;
    public /* synthetic */ UserProfileTab c;
    public /* synthetic */ boolean d;
    public /* synthetic */ Boolean e;
    public final /* synthetic */ m f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l(m mVar, n92 n92Var) {
        super(5, n92Var);
        this.f = mVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        ehe eheVar = this.b;
        UserProfileTab userProfileTab = this.c;
        boolean z = this.d;
        Boolean bool = this.e;
        br7.v(obj);
        boolean z2 = eheVar instanceof che;
        m mVar = this.f;
        if (!z2) {
            if (eheVar instanceof wge) {
                return new ije(mVar.A);
            }
            if (eheVar instanceof bhe) {
                return new mje(mVar.A);
            }
            if ((eheVar instanceof xge) || (eheVar instanceof yge) || (eheVar instanceof dhe)) {
                return new kje(new w14(null, false));
            }
            if (eheVar instanceof zge) {
                return new kje(m4.I(((zge) eheVar).a));
            }
            if (eheVar instanceof ahe) {
                return lje.a;
            }
            ygf.a();
            return null;
        }
        SourceParameter sourceParameter = mVar.A;
        che cheVar = (che) eheVar;
        String str = cheVar.b;
        String str2 = cheVar.r;
        Boolean bool2 = cheVar.n;
        boolean z3 = cheVar.i;
        boolean z4 = cheVar.l;
        mVar.A = sourceParameter.copy(((-9) & 1) != 0 ? sourceParameter.name : null, ((-9) & 2) != 0 ? sourceParameter.user_id : null, ((-9) & 4) != 0 ? sourceParameter.timestamp : null, ((-9) & 8) != 0 ? sourceParameter.dimension : null, ((-9) & 16) != 0 ? sourceParameter.collection_id : null, ((-9) & 32) != 0 ? sourceParameter.post_id : null, ((-9) & 64) != 0 ? sourceParameter.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter.promo_id : null, ((-9) & 256) != 0 ? sourceParameter.index : null, ((-9) & 512) != 0 ? sourceParameter.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter.author_id : cheVar.a, ((-9) & 8192) != 0 ? sourceParameter.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter.post_source : null, ((-9) & 524288) != 0 ? sourceParameter.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter.notification_type : null, (8191 & 1) != 0 ? sourceParameter.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter.email_location : null, (8191 & 32) != 0 ? sourceParameter.book_id : null, (8191 & 64) != 0 ? sourceParameter.edition_id : null, (8191 & 128) != 0 ? sourceParameter.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.item_type : null, (8191 & 4096) != 0 ? sourceParameter.unknownFields() : null);
        mVar.x = z4;
        Boolean bool3 = cheVar.p;
        boolean zBooleanValue = bool3 != null ? bool3.booleanValue() : false;
        boolean z5 = cheVar.m;
        f17 f17VarB = d46.B();
        if (zBooleanValue || !z5) {
            f17VarB.add(UserProfileTab.Posts.INSTANCE);
        }
        if (!zBooleanValue && z5) {
            f17VarB.add(UserProfileTab.Catalogs.INSTANCE);
        }
        f17VarB.add(UserProfileTab.Reposts.INSTANCE);
        f17VarB.add(UserProfileTab.Activity.INSTANCE);
        Boolean bool4 = Boolean.TRUE;
        if (g76.L(bool2, bool4)) {
            f17VarB.add(UserProfileTab.Books.INSTANCE);
        }
        if (zBooleanValue && z5) {
            f17VarB.add(UserProfileTab.Catalogs.INSTANCE);
        }
        f17VarB.add(UserProfileTab.About.INSTANCE);
        f17 f17VarW = d46.w(f17VarB);
        if (!f17VarW.contains(userProfileTab)) {
            userProfileTab = (UserProfileTab) bu1.x0(f17VarW);
            mVar.t.d("selected_tab", userProfileTab);
        }
        UserProfileTab userProfileTab2 = userProfileTab;
        mVar.y = f17VarW.getSize();
        String str3 = cheVar.a;
        String str4 = cheVar.c;
        if (str4 == null) {
            str4 = null;
        }
        String str5 = cheVar.b;
        Long l = cheVar.g;
        Long l2 = cheVar.h;
        EntityType entityType = EntityType.AUTHOR;
        bt4 bt4Var = (z4 || z3) ? bt4.CANT_FOLLOW : cheVar.j ? bt4.FOLLOWING : bt4.NOT_FOLLOWING;
        bt4 bt4Var2 = bt4Var;
        cg8 ag8Var = yf8.a;
        if (!z4 && !z3) {
            ag8Var = (!g76.L(cheVar.s, bool4) || str2 == null) ? new ag8(str2) : new bg8(str2);
        }
        wu4 wu4Var = new wu4(str3, str5, entityType, bt4Var2, ag8Var, mVar.A);
        d88 d88Var = z4 ? d88.CANT_MUTE : cheVar.k ? d88.MUTED : d88.NOT_MUTED;
        ns0 ns0Var = z4 ? ns0.CANT_BLOCK : z3 ? ns0.BLOCKED : ns0.NOT_BLOCKED;
        boolean z6 = !z4;
        String str6 = cheVar.d;
        return new jje(f17VarW, userProfileTab2, str3, str4, str5, l, l2, wu4Var, d88Var, ns0Var, z6, mVar.u, (str == null || muc.b0(str) || str6 == null || muc.b0(str6)) ? null : new pme(mVar.n.h(str6, cheVar.f), cheVar.a, str), g76.L(bool2, bool4), g76.L(cheVar.o, bool4), g76.L(cheVar.q, bool4), cheVar.e, mVar.A, cheVar.t && z, g76.L(bool, Boolean.FALSE));
    }

    @Override // defpackage.e55
    public final Object s(Object obj, Object obj2, Object obj3, Object obj4, Object obj5) {
        boolean zBooleanValue = ((Boolean) obj3).booleanValue();
        l lVar = new l(this.f, (n92) obj5);
        lVar.b = (ehe) obj;
        lVar.c = (UserProfileTab) obj2;
        lVar.d = zBooleanValue;
        lVar.e = (Boolean) obj4;
        return lVar.invokeSuspend(c1e.a);
    }
}

package defpackage;

import com.medium.android.core.membership.UpsellInfo;
import com.medium.android.core.membership.UpsellPromoId;
import com.medium.proto.event.BookClicked;
import com.medium.proto.event.IapPurchaseFailure;
import com.medium.proto.event.IapPurchaseSuccess;
import com.medium.proto.event.IapReceiptSent;
import com.medium.proto.event.UpsellClicked;
import com.medium.proto.event.UpsellViewed;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yx2 implements oqa {
    public final rqd a;

    public /* synthetic */ yx2(rqd rqdVar) {
        this.a = rqdVar;
    }

    public void a(String str, String str2, String str3, String str4) {
        b09.I(str, str2, str4);
        rqd.a(this.a, new BookClicked(null, str, null, 5, null), str2, str3, false, null, str4, 24);
    }

    public void b(String str, String str2, Integer num, String str3, String str4, String str5) {
        str3.getClass();
        str4.getClass();
        rqd.a(this.a, new IapPurchaseFailure(null, str2, str, null, Integer.valueOf(num != null ? num.intValue() : 0), null, 41, null), str3, str4, true, null, str5, 16);
    }

    public void c(String str, String str2, String str3, String str4, String str5) {
        ho2.Q(str, str2, str3, str4);
        rqd.a(this.a, new IapPurchaseSuccess(null, str, str2, null, 9, null), str3, str4, true, null, str5, 16);
    }

    public void d(String str, String str2, String str3, String str4, String str5) {
        ho2.Q(str, str2, str3, str4);
        rqd.a(this.a, new IapReceiptSent(null, str, str2, null, null, 25, null), str3, str4, true, null, str5, 16);
    }

    public void e(UpsellInfo upsellInfo, String str, String str2, String str3) {
        upsellInfo.getClass();
        str.getClass();
        str3.getClass();
        String dimension = upsellInfo.getDimension();
        String dimension2 = upsellInfo.getDimension();
        String postId = upsellInfo.getPostId();
        String authorId = upsellInfo.getAuthorId();
        UpsellPromoId promoId = upsellInfo.getPromoId();
        rqd.a(this.a, new UpsellClicked(null, dimension2, dimension, null, postId, authorId, null, promoId != null ? promoId.getValue() : null, null, null, 841, null), str3, str2, false, upsellInfo.getReferrer().getValue(), str, 8);
    }

    public void f(UpsellInfo upsellInfo, String str, String str2, String str3) {
        upsellInfo.getClass();
        str.getClass();
        str3.getClass();
        String dimension = upsellInfo.getDimension();
        String dimension2 = upsellInfo.getDimension();
        String postId = upsellInfo.getPostId();
        String authorId = upsellInfo.getAuthorId();
        UpsellPromoId promoId = upsellInfo.getPromoId();
        rqd.a(this.a, new UpsellViewed(null, dimension2, dimension, null, postId, authorId, null, promoId != null ? promoId.getValue() : null, null, 329, null), str3, str2, false, upsellInfo.getReferrer().getValue(), str, 8);
    }
}

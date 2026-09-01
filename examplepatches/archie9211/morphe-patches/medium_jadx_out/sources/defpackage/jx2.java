package defpackage;

import com.android.billingclient.api.Purchase;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class jx2 extends x55 implements x45 {
    public static final jx2 a = new jx2(1, Purchase.class, "getOriginalJson", "getOriginalJson()Ljava/lang/String;", 0);

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        Purchase purchase = (Purchase) obj;
        purchase.getClass();
        return purchase.getOriginalJson();
    }
}

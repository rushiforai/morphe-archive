package defpackage;

import android.content.Context;
import com.android.billingclient.api.DeveloperProvidedBillingListener;
import com.android.billingclient.api.PurchasesUpdatedListener;
import com.android.billingclient.api.UserChoiceBillingListener;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tlf {
    public final Context a;
    public final PurchasesUpdatedListener b;
    public final UserChoiceBillingListener c;
    public final DeveloperProvidedBillingListener d;
    public final d0g e;
    public final dlf f;
    public final dlf g;
    public boolean h;
    public gyf i;

    public tlf(Context context, PurchasesUpdatedListener purchasesUpdatedListener, UserChoiceBillingListener userChoiceBillingListener, DeveloperProvidedBillingListener developerProvidedBillingListener, zjf zjfVar) {
        int i = gyf.c;
        this.i = zyf.j;
        this.a = context;
        this.b = purchasesUpdatedListener;
        this.c = userChoiceBillingListener;
        this.d = developerProvidedBillingListener;
        this.e = zjfVar;
        this.f = new dlf(this, true);
        this.g = new dlf(this, false);
    }
}

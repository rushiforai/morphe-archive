package io;

import com.instabridge.mobilesdk.internal.payment.StripePaymentSheetHost;
import com.stripe.android.challenge.passive.warmer.activity.PassiveChallengeWarmerCompleted;
import com.stripe.android.paymentsheet.addresselement.AddressLauncherResult;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final /* synthetic */ class a implements j.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f61774a;

    public /* synthetic */ a(int i5) {
        this.f61774a = i5;
    }

    @Override // j.a
    public final void onActivityResult(Object obj) {
        switch (this.f61774a) {
            case 0:
                break;
            case 1:
                Intrinsics.g((PassiveChallengeWarmerCompleted) obj, "it");
                break;
            default:
                AddressLauncherResult it = (AddressLauncherResult) obj;
                Intrinsics.g(it, "it");
                StripePaymentSheetHost.Companion.register$lambda$1(it);
                break;
        }
    }

    public /* synthetic */ a(a5.i iVar) {
        this.f61774a = 2;
    }
}

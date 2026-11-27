package de.rossmann.app.android.business.coupon;

import de.rossmann.app.android.models.coupon.Coupon;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/**
 * Compile-only stub of Rossmann's ActivateCoupon use case, verified against
 * 5.11.1 (versionCode 421000110).
 *
 * The method name c and the ContinuationImpl parameter are the app's R8 output
 * and match the shipped descriptor exactly:
 *
 * (Lde/rossmann/app/android/models/coupon/Coupon;Lkotlin/coroutines/jvm/internal/ContinuationImpl;)Ljava/lang/Object;
 *
 * The real method is the app's own suspend activate action. It performs the
 * wallet checks, writes the coupon to the local wallet database and triggers
 * the wallet sync with the backend. It returns
 * Either&lt;CouponToggleResult.Failure, CouponToggleResult.Success&gt; through
 * the continuation when it suspends.
 *
 * This class is never shipped; see Coupon's stub note.
 */
public class ActivateCoupon {

    public Object c(Coupon coupon, ContinuationImpl continuation) {
        throw new UnsupportedOperationException("stub");
    }
}

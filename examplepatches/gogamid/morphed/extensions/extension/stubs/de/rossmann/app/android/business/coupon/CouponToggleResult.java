package de.rossmann.app.android.business.coupon;

/** Compile-only marker for a completed activation (not local-only or no change). */
public interface CouponToggleResult {
    interface Success {
        final class Full implements Success {
        }
    }
}

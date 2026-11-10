/*
 * Forked from Hushfacebook (https://github.com/SysAdminDoc/Hushfacebook, GPL-3.0),
 * extensions/facebook/.../ads/AffiliateLinks.java. Copyright 2026 Hushfacebook contributors.
 * Modified for facebook-morphe-patches, 2026: always on, no settings or diagnostics.
 */
package app.fbpatches.extension.facebook.ads;

import android.util.Log;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/** What Hide affiliate product links answers in each place a shop card shows. Fails open. */
@SuppressWarnings("unused")
public final class AffiliateLinks {
    private static final String TAG = "FbPatches";

    /** The reel overlay's call-to-action kinds that sell something. */
    static final Set<String> SHOP_CTAS = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "AFFILIATE_BANNER", "AFFILIATE_EYEBROW", "PRODUCT_TAGGING", "PRODUCT_TAGGING_V2", "STOREFRONT",
            "SHOP_SIMILAR")));

    private AffiliateLinks() {
    }

    /** Injection point: the "Commission eligible" label flag. Kept as Facebook answers it. */
    public static boolean keepCommissionLabel(int commissionEligible) {
        return commissionEligible != 0;
    }

    /** Injection point: each answer of a reel product card predicate. */
    public static boolean keepReelCard(int showsCard) {
        return false;
    }

    /** Injection point: the feed attachment's server-built footer id. Null builds the plain footer. */
    public static String keepFooter(String footerId) {
        return null;
    }

    /** Injection point: the comment sheet's floating product card model (up to 584). */
    public static Object keepCommentCard(Object card) {
        return null;
    }

    /** Injection point: the comment sheet's floating product card check (585). */
    public static boolean keepCommentCard(int showsCard) {
        return false;
    }

    /**
     * Injection point: each answer of the reel overlay's call-to-action filter, with the full list
     * beside it. Null keeps the full list, as Facebook reads it.
     */
    public static List<?> keepReelCtas(List<?> filtered, List<?> all) {
        try {
            List<?> shown = filtered != null ? filtered : all;
            if (shown == null || shown.isEmpty()) return filtered;
            List<Object> kept = new ArrayList<>(shown.size());
            boolean dropped = false;
            for (Object cta : shown) {
                if (cta instanceof Enum && SHOP_CTAS.contains(((Enum<?>) cta).name())) {
                    dropped = true;
                } else {
                    kept.add(cta);
                }
            }
            return dropped ? kept : filtered;
        } catch (Throwable failure) {
            Log.w(TAG, "AffiliateLinks.keepReelCtas failed", failure);
            return filtered;
        }
    }

    /** Injection point: the tag a reel or post stores on the profile it opens, which shows the shop banner. */
    public static String keepProfileEntry(String entryPoint) {
        return null;
    }
}

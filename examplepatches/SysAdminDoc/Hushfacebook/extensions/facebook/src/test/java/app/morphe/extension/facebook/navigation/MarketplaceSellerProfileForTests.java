/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

/** Show View profile on Marketplace sellers, asked from tests in other packages. */
public final class MarketplaceSellerProfileForTests {
    private MarketplaceSellerProfileForTests() {
    }

    /** Whether the seller page's flag is answered true without asking Facebook. */
    public static boolean givesSellersViewProfile() {
        return MarketplaceSellerProfile.answerTrue(MarketplaceSellerProfile.FLAG);
    }
}

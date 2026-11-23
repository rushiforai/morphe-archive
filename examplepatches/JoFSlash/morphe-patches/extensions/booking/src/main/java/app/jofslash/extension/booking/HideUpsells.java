package app.jofslash.extension.booking;

/**
 * Used by the Hide upsells patch. Decides which server-driven promotional areas and which
 * cross-sell placements the app leaves out. On any problem the area or placement stays.
 */
@SuppressWarnings("unused")
public final class HideUpsells {
    /**
     * The app's server-driven page areas (ShellRegionId) that Booking names promotional, such as
     * STAYS_BOOKING_PROCESS_PROMOTIONAL, STAYS_PROPERTY_PAGE_PROMOTIONAL_HERO and
     * MY_ACCOUNT_PROMOTIONAL_AREA. The areas for things you must see (USER_MUST_SEE,
     * BUSINESS_MUST_SHOW), the Genius loyalty area and the home screen sheets don't have it.
     */
    private static final String PROMOTIONAL = "PROMOTIONAL";

    /**
     * Cross-sell placements (crosssellservices.PlacementType) that offer taxis, car rentals,
     * flights and attractions for a stay: "Plan ahead" on the confirmation, booking details and
     * manage booking pages, the sheet after booking, "Add to your stay" in the booking form, the
     * inline banners on the hotel, room and booking pages, the offers on the cancellation page and
     * the "discover more" cards, and on the home screen the carousels of attractions, cars and
     * taxis for your upcoming trip (UpcomingTrip) and for your last search (RecentSearches). My
     * Trips' next steps, rewards you have unlocked and the booking loader stay; your recent
     * searches themselves are another block and stay too.
     */
    private static final String[] CROSS_SELL = {
            "PlanAhead", "ConfirmationModal", "Modal", "AddToYourStay", "ListInlineBanner",
            "CancelInfo", "DiscoverySupply", "InFeedBanner", "InFeedCarTaxiBanner",
            "UpcomingTrip", "RecentSearches",
    };

    private HideUpsells() {
    }

    /** True when the page area [region] (a ShellRegionId) is promotional and should stay empty. */
    public static boolean hideShellRegion(Enum<?> region) {
        try {
            return region != null && region.name().contains(PROMOTIONAL);
        } catch (Throwable t) {
            return false;
        }
    }

    /** True when the cross-sell placement [placementType] (a PlacementType) should not load. */
    public static boolean hideCrossSell(Enum<?> placementType) {
        try {
            if (placementType == null) return false;
            String name = placementType.name();
            for (String hidden : CROSS_SELL) {
                if (hidden.equals(name)) return true;
            }
            return false;
        } catch (Throwable t) {
            return false;
        }
    }
}

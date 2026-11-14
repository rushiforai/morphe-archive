package semicoloncolonel.mobilestream.extension.shared.misc;

import android.util.Log;

/**
 * "Hide sponsored listings" for the shopping apps.
 *
 * Asks the store's own services for results without sponsored products, using the switches
 * those services already have. Everything is decided on-device; nothing is sent anywhere by
 * this class.
 */
@SuppressWarnings("unused")
public final class ShoppingAdsFilter {
    private static final String TAG = "MSP-ADS";

    private static boolean logged;

    private ShoppingAdsFilter() {
    }

    /**
     * Amazon draws search results and product pages as web pages. Sponsored products there are
     * marked by Amazon's own markup: the ad holder and sponsored-label classes in search
     * results, the sponsored-products and ad-placement sections on product pages, and the
     * ad frames used for sponsored brands and video.
     */
    private static final String[] AMAZON_SPONSORED = {
            // Search results
            ".s-result-item.AdHolder",
            ".s-result-item:has(.puis-sponsored-label-text)",
            ".s-result-item:has([data-component-type=\"sp-sponsored-result\"])",
            ".s-result-item:has(.sbv-ad-content-container)",
            ".s-result-item:has([data-ad-feedback])",
            ".sbv-video-single-product",
            // Product pages
            "#sponsoredProducts_feature_div",
            "#sponsoredProducts2_feature_div",
            "[id^=\"sp_detail\"]",
            ".sponsored-products-detail-mobile",
            "[cel_widget_id*=\"sp_atf\"]",
            "[cel_widget_id*=\"sp_btf\"]",
            "[cel_widget_id*=\"adplacements\"]",
            // Carousels and ad frames anywhere
            ".a-carousel-card:has(.p13n-sc-sponsored-label)",
            ".a-carousel-card:has([data-ad-placement-metadata])",
            "[data-ad-id]",
            ".amzn-safe-frame-container",
            "[id^=\"ape_\"]",
    };

    private static final String HIDE_AMAZON_SPONSORED = "(function () {\n"
            + "  if (document.getElementById('msp-hide-sponsored')) { return; }\n"
            + "  var style = document.createElement('style');\n"
            + "  style.id = 'msp-hide-sponsored';\n"
            + "  style.textContent = " + jsString(android.text.TextUtils.join(",", AMAZON_SPONSORED)) + "\n"
            + "    + '{display:none !important}';\n"
            + "  (document.head || document.documentElement).appendChild(style);\n"
            + "})();";

    private static String jsString(String value) {
        return "'" + value.replace("\\", "\\\\").replace("'", "\\'") + "'";
    }

    /** Amazon: hides sponsored products on the page the app's web view is showing. */
    public static void hideAmazonSponsored(android.webkit.WebView webView) {
        try {
            if (webView != null) {
                webView.evaluateJavascript(HIDE_AMAZON_SPONSORED, null);
            }
        } catch (Throwable t) {
            Log.w(TAG, "hide Amazon sponsored products failed: " + t);
        }
    }

    /**
     * Target: called with each search parameter's name and value as the request is built.
     * include_sponsored is answered with false; every other parameter keeps its value.
     */
    public static String targetSearchParameter(String name, String value) {
        if (!"include_sponsored".equals(name)) {
            return value;
        }
        if (!logged) {
            logged = true;
            Log.i(TAG, "search without sponsored products");
        }
        return "false";
    }

    /**
     * Lowe's: called with each query parameter's name and value as Retrofit builds a request.
     * enableSponsoredSearch is answered with false; every other parameter keeps its value.
     */
    public static String lowesQueryParameter(String name, String value) {
        if (!"enableSponsoredSearch".equals(name)) {
            return value;
        }
        if (!logged) {
            logged = true;
            Log.i(TAG, "search without sponsored products");
        }
        return "false";
    }

    /**
     * Lowe's: the feature switches for the sponsored products row on product pages, the ad
     * banner on collection pages, and the partner offers after checkout.
     */
    public static boolean isLowesAdSwitch(Object featureSwitch) {
        if (!(featureSwitch instanceof Enum)) {
            return false;
        }
        String name = ((Enum<?>) featureSwitch).name();
        return "ENABLE_SPONSORED_PRODUCTS_ON_PDP".equals(name)
                || "ENABLE_GAM_BANNER_ON_CDP".equals(name)
                || "ENABLE_ROKT_ADS".equals(name);
    }

    /**
     * Walgreens: the feature flags for the Criteo sponsored carousels and display banners
     * (criteo...), the Google Ad Manager banners and promo cards (gam...), and the Rokt offers
     * after checkout (ROKT). The flag's class is renamed in every release, so its key is read
     * through getKey() by reflection. A flag whose key cannot be read is left alone.
     */
    public static boolean isWalgreensAdFlag(Object flag) {
        if (flag == null) {
            return false;
        }
        try {
            Object key = flag.getClass().getMethod("getKey").invoke(flag);
            if (!(key instanceof String)) {
                return false;
            }
            String k = (String) key;
            return k.startsWith("criteo") || k.startsWith("gam") || k.equals("ROKT");
        } catch (Throwable t) {
            return false;
        }
    }

    // ── Walmart ─────────────────────────────────────────────────────────────

    private static final String[] WALMART_AD_SUFFIXES = {
            ".reqenable", ".reqenabled", ".req.enabled",
            ".renderenable", ".renderenabled", ".render.enabled",
    };

    private static final java.util.Set<String> WALMART_AD_KEYS = new java.util.HashSet<>(java.util.Arrays.asList(
            // With this on, one server model decides every ad surface and the flags below are
            // not read.
            "ads.primaryCCM.enabled",
            "ads.ip.sponsoredPrompt.enabled",
            "ads.deals.mosaic.enabled",
            "ads.gam.enabled",
            "ads.ty.ob.fluent.enabled",
            "ads.checkin.videoCard.enable",
            "ads.miniGallery.enabled",
            "ads.ip.galTop.enabled",
            "ads.ip.galMiddle.enabled",
            "ads.ip.galBottom.enabled",
            "ads.supportPostTxnSkylineAds.enabled",
            "ads.sp.sv.prompt.enabled",
            "ads.ip.bb.spVideo.enabled",
            "homepage.sponsored.carousel.enabled",
            "contentPages.sponsored.carousel.enabled",
            "checkout.thankYou.ads.enabled",
            "feature.search.tileTakeOverAd.enabled",
            "feature.browse.tileTakeOverAd.enabled",
            "feature.shop.tileTakeOverAd.enabled"));

    /**
     * Walmart: the on/off flags of its ad surfaces. Each surface has a "request" and a
     * "render" flag in the ads. namespace (ads.sp.spc.reqEnable, ads.ip.sba.render.enabled, and
     * so on), and a few surfaces have a flag of their own. Flags that tune layout or tracking,
     * and the flags where true hides an ad, are left alone.
     */
    public static boolean isWalmartAdKey(String key) {
        if (key == null) {
            return false;
        }
        if (WALMART_AD_KEYS.contains(key)) {
            return true;
        }
        if (!key.startsWith("ads.")) {
            return false;
        }
        String k = key.toLowerCase(java.util.Locale.US);
        for (String suffix : WALMART_AD_SUFFIXES) {
            if (k.endsWith(suffix)) {
                return true;
            }
        }
        return false;
    }

    private static final java.util.Map<String, java.lang.reflect.Method> getters =
            new java.util.concurrent.ConcurrentHashMap<>();

    /** Calls a no-argument getter by name, or answers null when the object has none. */
    private static Object get(Object target, String getter) {
        if (target == null) {
            return null;
        }
        try {
            String id = target.getClass().getName() + '#' + getter;
            java.lang.reflect.Method method = getters.get(id);
            if (method == null) {
                method = target.getClass().getMethod(getter);
                getters.put(id, method);
            }
            return method.invoke(target);
        } catch (Throwable t) {
            return null;
        }
    }

    /**
     * Walmart: called with the products of each search or category result as the response is
     * read. A product is sponsored when its item or product tile carries sponsoredProduct data,
     * which is the test the app itself uses. Those are left out of the list that is returned.
     * When anything is unexpected, the list is returned as it came.
     */
    public static java.util.List<?> walmartSearchItems(java.util.List<?> items) {
        if (items == null || items.isEmpty()) {
            return items;
        }
        try {
            java.util.ArrayList<Object> kept = new java.util.ArrayList<>(items.size());
            for (Object item : items) {
                boolean sponsored = get(get(item, "getItemFragment"), "getSponsoredProduct") != null
                        || get(get(item, "getProductTileSharedFragment"), "getSponsoredProduct") != null;
                if (!sponsored) {
                    kept.add(item);
                }
            }
            if (kept.size() == items.size()) {
                return items;
            }
            if (!logged) {
                logged = true;
                Log.i(TAG, "left out " + (items.size() - kept.size()) + " sponsored products");
            }
            return kept;
        } catch (Throwable t) {
            return items;
        }
    }

    // ── The Home Depot ──────────────────────────────────────────────────────

    /**
     * The Home Depot: called with the children of each product list on the newer search and
     * category pages. A child that is a ProductItem holds a ProductModel, whose only boolean
     * field says whether the product is sponsored. The member names are renamed in every
     * release, so they are found by type. Sponsored products are left out of the list that is
     * returned. When anything is unexpected, the list is returned as it came.
     */
    public static java.util.List<?> homeDepotProductList(java.util.List<?> children) {
        if (children == null || children.isEmpty()) {
            return children;
        }
        try {
            java.util.ArrayList<Object> kept = new java.util.ArrayList<>(children.size());
            for (Object child : children) {
                if (!isHomeDepotSponsored(child)) {
                    kept.add(child);
                }
            }
            return kept.size() == children.size() ? children : kept;
        } catch (Throwable t) {
            return children;
        }
    }

    private static boolean isHomeDepotSponsored(Object child) throws IllegalAccessException {
        if (child == null || !child.getClass().getName().endsWith("SDUIComponent$ProductItem")) {
            return false;
        }
        for (java.lang.reflect.Field field : child.getClass().getDeclaredFields()) {
            if (!field.getType().getName().endsWith(".ProductModel")) {
                continue;
            }
            field.setAccessible(true);
            Object model = field.get(child);
            if (model == null) {
                return false;
            }
            java.lang.reflect.Field flag = null;
            for (java.lang.reflect.Field candidate : model.getClass().getDeclaredFields()) {
                if (candidate.getType() == boolean.class
                        && !java.lang.reflect.Modifier.isStatic(candidate.getModifiers())) {
                    if (flag != null) {
                        return false; // More than one boolean: not the model this was written for.
                    }
                    flag = candidate;
                }
            }
            if (flag == null) {
                return false;
            }
            flag.setAccessible(true);
            return flag.getBoolean(model);
        }
        return false;
    }

    // ── CVS ─────────────────────────────────────────────────────────────────

    /** CVS: the flag for the sponsored suggestion at the top of search suggestions. */
    public static boolean isCvsAdFlag(Object flag) {
        return "unified-sponsored-search-results".equals(get(flag, "getKey"));
    }

    private static final String[] CVS_SPONSORED_SYSTEMS = {
            "EXCLUDE_CRITEO_INGRID", "EXCLUDE_CREALYTICS", "EXCLUDE_CRITEO_BUTTERFLY",
    };

    /**
     * CVS: called with the list of systems a search request asks the server to leave out. The
     * sponsored product systems are added, which is what the app's own Buy It Again and Deals
     * searches send. A request without a list gets the app's default as well, since the app
     * only fills that in for a missing list. When anything is unexpected, the list is returned
     * as it came.
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static java.util.List<?> cvsSearchExclusions(java.util.List<?> exclusions) {
        try {
            Class<? extends Enum> type = Class
                    .forName("com.cvs.shop.network.productSearch.api.models.SystemExclusions")
                    .asSubclass(Enum.class);
            java.util.ArrayList<Object> all = new java.util.ArrayList<>();
            if (exclusions == null) {
                all.add(Enum.valueOf(type, "EXCLUDE_STORE_SERVICE"));
            } else {
                all.addAll(exclusions);
            }
            for (String name : CVS_SPONSORED_SYSTEMS) {
                Object system = Enum.valueOf(type, name);
                if (!all.contains(system)) {
                    all.add(system);
                }
            }
            return all;
        } catch (Throwable t) {
            return exclusions;
        }
    }

    // ── Flipp ───────────────────────────────────────────────────────────────

    /**
     * Flipp: called with the slots of the home feed as the server's response is read. A slot
     * whose component is a Google native ad, an AdAdapted ad, or a unified web ad is left out
     * of the list that is returned. When anything is unexpected, the list is returned as it
     * came.
     */
    public static java.util.List<?> flippFeedSlots(java.util.List<?> slots) {
        if (slots == null || slots.isEmpty()) {
            return slots;
        }
        try {
            java.util.ArrayList<Object> kept = new java.util.ArrayList<>(slots.size());
            for (Object slot : slots) {
                Object component = get(slot, "getComponent");
                String type = component == null ? "" : component.getClass().getName();
                boolean ad = type.equals("maestro.components.GoogleNativeAd")
                        || type.equals("maestro.components.AdAdaptedAd")
                        || type.equals("maestro.components.UnifiedAd");
                if (!ad) {
                    kept.add(slot);
                }
            }
            if (kept.size() == slots.size()) {
                return slots;
            }
            Log.i(TAG, "left out " + (slots.size() - kept.size()) + " ad slots from the feed");
            return kept;
        } catch (Throwable t) {
            return slots;
        }
    }

    /**
     * Flipp: the preference keys that record a tutorial, spotlight, or education sheet as
     * shown. "Skip tutorials" reads them as true.
     */
    public static boolean isFlippTutorialKey(String key) {
        if (key == null) {
            return false;
        }
        if (key.startsWith("tutorial_showed_")
                || key.equals("TUTORIAL_SHOWED_FAVOURITES_KEY")
                || key.equals("post_onboarding_educational_bottom_sheet")) {
            return true;
        }
        return key.endsWith("_SHOWN")
                && (key.contains("TUTORIAL") || key.contains("SPOTLIGHT") || key.contains("EDUCATION"));
    }

    // ── Slickdeals ──────────────────────────────────────────────────────────

    /**
     * Slickdeals: called with the segments of each feed as it is built. The app's classes are
     * renamed in every release, but its data classes keep their toString text, which names
     * every field. A segment is left out when it is an ad segment ("adSegment=" is set) or a
     * sponsored carousel ("isSponsored=true" in its CarouselDetail). Inside the segments that
     * remain, list items that are ads ("adItem=" is set) or deals flagged PROMOTED are left
     * out. When anything is unexpected, the feed is returned as it came.
     */
    public static java.util.List<?> slickdealsFeedSegments(java.util.List<?> segments) {
        if (segments == null || segments.isEmpty()) {
            return segments;
        }
        try {
            java.util.ArrayList<Object> kept = new java.util.ArrayList<>(segments.size());
            int dropped = 0;
            for (Object segment : segments) {
                String text = String.valueOf(segment);
                if (isSet(text, ", adSegment=") || isSponsoredCarousel(text)) {
                    dropped++;
                    continue;
                }
                dropped += dropSlickdealsItems(segment);
                kept.add(segment);
            }
            if (dropped > 0) {
                Log.i(TAG, "left out " + dropped + " ads and promoted deals from the feed");
            }
            return kept;
        } catch (Throwable t) {
            return segments;
        }
    }

    /** The field after [label] in a data class's toString text has a value other than null. */
    private static boolean isSet(String text, String label) {
        int at = text.indexOf(label);
        return at >= 0 && !text.startsWith("null", at + label.length());
    }

    private static boolean isSponsoredCarousel(String text) {
        int at = text.indexOf("CarouselDetail(id=");
        while (at >= 0) {
            int flag = text.indexOf(", isSponsored=", at);
            if (flag < 0) {
                return false;
            }
            if (text.startsWith("true", flag + ", isSponsored=".length())) {
                return true;
            }
            at = text.indexOf("CarouselDetail(id=", flag);
        }
        return false;
    }

    private static boolean isSlickdealsAdOrPromoted(Object item) {
        String text = String.valueOf(item);
        return (text.startsWith("Item(") && isSet(text, ", adItem="))
                || text.contains(", flag=PROMOTED,") || text.contains(", flag=PROMOTED)");
    }

    /**
     * Removes ad items and promoted deals from the lists one level inside a segment: the
     * segment holds one typed part (deals, carousel, comments, ...), and that part holds the
     * list. Returns how many items were removed.
     */
    private static int dropSlickdealsItems(Object segment) throws IllegalAccessException {
        int dropped = 0;
        for (java.lang.reflect.Field part : segment.getClass().getDeclaredFields()) {
            if (java.lang.reflect.Modifier.isStatic(part.getModifiers()) || part.getType().isPrimitive()) {
                continue;
            }
            part.setAccessible(true);
            Object value = part.get(segment);
            if (value == null || value instanceof CharSequence || value instanceof Enum) {
                continue;
            }
            for (java.lang.reflect.Field field : value.getClass().getDeclaredFields()) {
                if (java.lang.reflect.Modifier.isStatic(field.getModifiers())
                        || !java.util.List.class.isAssignableFrom(field.getType())) {
                    continue;
                }
                field.setAccessible(true);
                Object list = field.get(value);
                if (!(list instanceof java.util.List)) {
                    continue;
                }
                java.util.List<?> items = (java.util.List<?>) list;
                java.util.ArrayList<Object> kept = new java.util.ArrayList<>(items.size());
                for (Object item : items) {
                    if (!isSlickdealsAdOrPromoted(item)) {
                        kept.add(item);
                    }
                }
                if (kept.size() != items.size()) {
                    dropped += items.size() - kept.size();
                    field.set(value, kept);
                }
            }
        }
        return dropped;
    }

    private static final java.util.Set<String> SLICKDEALS_DONE_KEYS = new java.util.HashSet<>(java.util.Arrays.asList(
            "has_seen_initial_onboarding",
            "has_seen_notification_prompt",
            "has_seen_image_tooltip",
            "never_prompt_again_key"));

    /**
     * Slickdeals: called with each DataStore preference key and the value just read for it.
     * The keys that record the sign-up flow, the notification prompt, the image tooltip, and
     * the rating prompt as done read as true. A preference key's toString is its name.
     */
    public static Object slickdealsPreference(Object key, Object value) {
        try {
            if (key != null && SLICKDEALS_DONE_KEYS.contains(key.toString())) {
                return Boolean.TRUE;
            }
        } catch (Throwable ignored) {
        }
        return value;
    }

    /** Checkout 51: what {@link #checkout51Offers} drops. */
    public static final int CHECKOUT51_ADS = 1;
    public static final int CHECKOUT51_REVIEW_PROMPT = 2;

    /**
     * Checkout 51: called with the offer models before they become list rows, in the offer list
     * and in search. CHECKOUT51_ADS drops Google ad rows (isDfpAd) and highlight-carousel ads (a
     * highlight whose meta names an ad unit). CHECKOUT51_REVIEW_PROMPT drops the rate-the-app row,
     * an offer model carrying the "_app_review_prompt_" label. Returns the list unchanged on error.
     */
    public static java.util.List checkout51Offers(java.util.List offers, int drop) {
        if (offers == null || offers.isEmpty()) {
            return offers;
        }
        try {
            java.util.ArrayList kept = new java.util.ArrayList(offers.size());
            int dropped = 0;
            for (Object offer : offers) {
                if (offer != null && isCheckout51Dropped(offer, drop)) {
                    dropped++;
                } else {
                    kept.add(offer);
                }
            }
            if (dropped == 0) {
                return offers;
            }
            Log.i(TAG, "Checkout 51: left out " + dropped + (drop == CHECKOUT51_ADS ? " ads" : " review prompts"));
            return kept;
        } catch (Throwable t) {
            Log.w(TAG, "Checkout 51 filter failed: " + t);
            return offers;
        }
    }

    private static boolean isCheckout51Dropped(Object offer, int drop) throws Exception {
        Class<?> type = offer.getClass();
        if (drop == CHECKOUT51_ADS) {
            if (Boolean.TRUE.equals(type.getMethod("isDfpAd").invoke(offer))) {
                return true;
            }
            if (Boolean.TRUE.equals(type.getMethod("isHighlight").invoke(offer))) {
                Object meta = type.getMethod("getMeta").invoke(offer);
                return meta != null && meta.getClass().getMethod("getHighlightAdId").invoke(meta) != null;
            }
            return false;
        }
        if (drop == CHECKOUT51_REVIEW_PROMPT) {
            Object labels = type.getMethod("getLabels").invoke(offer);
            return labels instanceof java.util.Collection
                    && ((java.util.Collection<?>) labels).contains("_app_review_prompt_");
        }
        return false;
    }

    /** Walmart: flags that turn on credit and debit card promotions. Paying with a card is unaffected. */
    private static final java.util.Set<String> WALMART_CARD_OFFER_KEYS = new java.util.HashSet<>(java.util.Arrays.asList(
            "item.enableOneDebitCardBanner.enabled",
            "feature.item.onePayCCp13n.enabled",
            "feature.item.onepayprequal.enabled",
            "feature.capitalone.preApproval.enabled",
            "cart.onePayLater.prequal.enabled",
            "checkout.onePayLater.prequal.enabled",
            "checkout.buyNow.onePayLater.prequal.enabled",
            "checkout.buyNow.onePayCreditCardBanner.enabled",
            "checkout.thankYou.oneBanner.enabled",
            "checkout.thankYou.capOneBanner.enabled",
            "paymentTransaction.oneCreditCardBanner.enabled",
            "ac.oneCreditCardBanner.enabled",
            "account.oneCreditCard.splashScreen.enabled",
            "account.wallet.oneCreditCardBanner.enabled",
            "services.onedebitcard.landingTabSplashEnabled"));

    /** Walmart: true for a config key that turns on a card promotion. */
    public static boolean isWalmartCardOfferKey(String key) {
        return key != null && WALMART_CARD_OFFER_KEYS.contains(key);
    }

    private static java.util.Set<String> setOf(String... values) {
        return new java.util.HashSet<>(java.util.Arrays.asList(values));
    }

    /** Walmart: Tempo module types for card promotions. */
    private static final java.util.Set<String> WALMART_CARD_OFFER_MODULES = setOf(
            "OneDebitCardBanner", "OneCreditCardBanner", "CapitalOneBanner", "OnePayLaterBanner",
            "SynchronyCreditBanner", "ThankYouOneBanner");

    /** Walmart: Tempo module types that advertise Walmart+ to non-members. */
    private static final java.util.Set<String> WALMART_PLUS_MODULES = setOf(
            "WalmartPlusBanner", "WalmartPlusEarlyAccessBeforeEvent", "WalmartPlusEarlyAccessDuringEvent",
            "FreeTrialModule", "PrismWalmartPlusEventBanner", "WalmartPlusSignupSharedBanner",
            "WalmartPlusAcquisitionBanner", "WalmartPlusAcquisitionBottomsheet", "MembershipUpgradeBanner",
            "WalmartPlusMPSInterstitialModule", "PrismEvergreenBanner");

    /** Walmart: Tempo module types for creator and social video sections. */
    private static final java.util.Set<String> WALMART_CREATOR_VIDEO_MODULES = setOf(
            "MobileSocialContent", "VideoCarousel");

    /** Walmart: Tempo module types that nag: sign-in, review, and survey prompts. */
    private static final java.util.Set<String> WALMART_NAG_MODULES = setOf(
            "SignInNudge", "SignInNudgeV1", "WriteAReviewBanner", "SurveyNudge", "EventSplashScreen");

    /** Walmart: promo banners that carry one asset; dropped when that asset names a marker. */
    private static final java.util.Set<String> WALMART_SINGLE_PROMO_MODULES = setOf(
            "PrismTimerBanner", "PrismAdjustableBanner", "PrismEvergreenBanner", "PrismBanner",
            "PrismHeroBanner", "PrismImageBanner");

    /** Text that marks a Walmart+ promotion inside a module: asset names, titles, and links. */
    private static final String[] WALMART_PLUS_MARKERS = {
            "-WPL-", "WalmartPlusNonMember", "WalmartPlusNevermember", "title=Walmart+,", "title=Walmart+)",
            "text=Join Walmart+"};

    /** Text that marks a card promotion inside a module. */
    private static final String[] WALMART_CARD_MARKERS = {
            "title=Credit Card,", "title=Credit Card)", "OnePay", "CapitalOne", "Capital One"};

    /** Walmart: a Tempo page's modules without the card promotions. */
    public static java.util.List walmartCardOfferModules(java.util.List modules) {
        return withoutWalmartModules(modules, WALMART_CARD_OFFER_MODULES, WALMART_CARD_MARKERS, "card offers");
    }

    /** Walmart: a Tempo page's modules without the Walmart+ promotions. */
    public static java.util.List walmartPlusModules(java.util.List modules) {
        return withoutWalmartModules(modules, WALMART_PLUS_MODULES, WALMART_PLUS_MARKERS, "Walmart+ promotions");
    }

    /** Walmart: a Tempo page's modules without creator videos. */
    public static java.util.List walmartCreatorVideoModules(java.util.List modules) {
        return withoutWalmartModules(modules, WALMART_CREATOR_VIDEO_MODULES, null, "creator video sections");
    }

    /** Walmart: a Tempo page's modules without nudges and event splash screens. */
    public static java.util.List walmartNagModules(java.util.List modules) {
        return withoutWalmartModules(modules, WALMART_NAG_MODULES, null, "nudges");
    }

    /**
     * Leaves out every module whose Tempo type (getType()) is in {@code types}. With
     * {@code markers}, a single-asset promo banner whose content names a marker is left out too,
     * and inside every other module the list items that name a marker are removed: a carousel
     * keeps its other slides and a navigation row its other chips.
     */
    private static java.util.List withoutWalmartModules(java.util.List modules, java.util.Set<String> types,
            String[] markers, String what) {
        if (modules == null || modules.isEmpty()) {
            return modules;
        }
        try {
            java.util.ArrayList kept = new java.util.ArrayList(modules.size());
            int dropped = 0;
            int[] pruned = {0};
            for (Object module : modules) {
                Object type = module == null ? null : get(module, "getType");
                String name = type == null ? "" : type.toString();
                if (types.contains(name)) {
                    dropped++;
                    continue;
                }
                if (markers != null && module != null) {
                    String text = String.valueOf(module);
                    if (containsAny(text, markers)) {
                        if (WALMART_SINGLE_PROMO_MODULES.contains(name)) {
                            dropped++;
                            continue;
                        }
                        pruneMarked(module, markers, 4, pruned);
                    }
                }
                kept.add(module);
            }
            if (dropped > 0 || pruned[0] > 0) {
                Log.i(TAG, "Walmart: left out " + dropped + " " + what + " and " + pruned[0] + " items inside others");
            }
            return dropped == 0 ? modules : kept;
        } catch (Throwable t) {
            Log.w(TAG, "Walmart module filter failed: " + t);
            return modules;
        }
    }

    private static boolean containsAny(String text, String[] markers) {
        for (String marker : markers) {
            if (text.contains(marker)) {
                return true;
            }
        }
        return false;
    }

    /**
     * Walks the object's fields. In a list where some items name a marker and some do not, the
     * marked items are removed. A list whose items all name a marker is a wrapper: the walk
     * goes into its items instead.
     */
    private static void pruneMarked(Object target, String[] markers, int depth, int[] pruned) {
        if (target == null || depth <= 0) {
            return;
        }
        for (Class<?> type = target.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            String typeName = type.getName();
            if (typeName.startsWith("java.") || typeName.startsWith("kotlin.") || typeName.startsWith("android.")) {
                return;
            }
            for (java.lang.reflect.Field field : type.getDeclaredFields()) {
                if (java.lang.reflect.Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) {
                    continue;
                }
                try {
                    field.setAccessible(true);
                    Object value = field.get(target);
                    if (value instanceof java.util.List) {
                        java.util.List list = (java.util.List) value;
                        java.util.ArrayList keep = new java.util.ArrayList(list.size());
                        java.util.ArrayList marked = new java.util.ArrayList();
                        for (Object item : list) {
                            if (item != null && containsAny(String.valueOf(item), markers)) {
                                marked.add(item);
                            } else {
                                keep.add(item);
                            }
                        }
                        if (marked.isEmpty()) {
                            continue;
                        }
                        if (keep.isEmpty()) {
                            for (Object item : marked) {
                                pruneMarked(item, markers, depth - 1, pruned);
                            }
                        } else {
                            field.set(target, keep);
                            pruned[0] += marked.size();
                        }
                    } else if (value != null && !(value instanceof CharSequence) && !(value instanceof Number)
                            && !(value instanceof Boolean) && containsAny(String.valueOf(value), markers)) {
                        pruneMarked(value, markers, depth - 1, pruned);
                    }
                } catch (Throwable ignored) {
                }
            }
        }
    }

    /** Walmart: flags that turn on Walmart+ promotions to non-members. Member features are unaffected. */
    private static final java.util.Set<String> WALMART_PLUS_KEYS = setOf(
            "membership.autoLaunchFullScreenVideoOnMLP.enabled",
            "feature.membership.splashPage.autoLaunchEnabled",
            "feature.membership.hub.isAutoLaunchEnabled",
            "feature.membership.screentakeover.enabled",
            "feature.membership.contextualSplash.enabled",
            "feature.membership.eaAcquisitionBottomSheetV2.enabled",
            "feature.membership.eaMemberAcquisitionBottomSheetV2.enabled",
            "item.earlyAccess.wPlusSplashPage.enabled",
            "item.showUpgradeToPlus.enabled",
            "item.wPlusFulfillmentBottomSheet.enabled",
            "item.freeTrialAddOnBundles.enabled",
            "feature.search.shop.wPlusEarlyAccess.banner.enabled",
            "feature.search.shop.wPlusEarlyAccess.timer.enabled",
            "cart.walmartPlus.signUpBanner.enabled",
            "cart.walmartPlus.newSignUpBanner.enabled",
            "cart.walmartPlus.guestBanner.enabled",
            "cart.shared.walmartPlusSignUpOfferBanner.enabled",
            "cart.postCartLoad.wplusBanners.enabled",
            "cart.walmartPlus.30DayTrial.enabled",
            "cart.walmartPlus.earlyAccess.enabled",
            "checkout.walmartPlus.signupSplash.enabled",
            "checkout.walmartPlus.cxoOptInSplash.enabled",
            "checkout.walmartPlus.30DayTrial.enabled",
            "checkout.walmartPlus.earlyAccess.enabled",
            "checkout.guestMembershipBanner.enabled",
            "checkout.thankYou.evergreenWplus.enabled",
            "feature.pay.wPlusAcquisitionBanner.enabled",
            "feature.returns.lmd.wplusAcquisition.enabled",
            "account.nonMemberWPlusBanner.enabled",
            "cxo.walmartPlus.eaOffer.signUpBanner.enabled",
            "bookSlot.walmartPlusIntegratedSignUp.enabled",
            "feature.membership.plusUpsCancellationSurvey.enabled");

    /** Walmart: true for a config key that turns on a Walmart+ promotion. */
    public static boolean isWalmartPlusKey(String key) {
        return key != null && WALMART_PLUS_KEYS.contains(key);
    }

    /** Walmart: flags for surveys, review requests, notification banners, tooltips, and splashes. */
    private static final java.util.Set<String> WALMART_POPUP_KEYS = setOf(
            "checkout.thankYou.launchSurveyWhenTYPStarts.enabled",
            "checkout.thankYou.isThankYouPageDynamicSurveyEnabled.enabled",
            "checkout.thankYou.typReviewSolicitation.enabled",
            "checkout.thankYou.pushNotificationBanner.enabled",
            "platform.app.nudgeUpgrade.enabled",
            "platform.feature.nudgeUpgrade.enabled",
            "tooltip.homepage.amends",
            "tooltip.homepage.quickadd",
            "tooltip.myitems.nav",
            "tooltip.homepage.storeselector",
            "cart.onboardingTooltip.enabled",
            "search.feature.instoreFilterCoachmark.enabled",
            "feature.search.onBoarding",
            "platform.event.holiday.splash.isEnabled",
            "help.feedbackSurvey.enabled",
            "feature.qualtrics.feedback.isEnabled");

    /** Walmart: true for a config key that turns on a survey, prompt, tooltip, or splash. */
    public static boolean isWalmartPopupKey(String key) {
        return key != null && WALMART_POPUP_KEYS.contains(key);
    }
}

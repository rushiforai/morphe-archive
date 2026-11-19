package app.smartlife.patches.smartlife.ad

import app.morphe.patcher.Fingerprint

/**
 * HomeAdvertisementDataSource.queryContentData(HomeCardData): the data source of the home
 * (favorites) screen's ad card, HomeAdvertisementCard (card type 95). HomeAdvCardService adds
 * that card in code, so it is not in home_fragment_new.json and removing JSON entries does not
 * reach it.
 *
 * It returns null (no card) unless an ad is to be shown; that is what it already does on a
 * tablet ("!isShowBanner || isPad"). isShowBanner turns true as soon as the advertisement service
 * reports AdMob as available, which depends only on AbsAdMobService being registered, not on
 * the is_admob_support flag. The card then hosts the AdMob native ad slot.
 *
 * The class and method names are not obfuscated (7.12.0 and 7.12.6).
 */
internal object HomeAdvertisementQueryFingerprint : Fingerprint(
    definingClass = "Lcom/thingclips/smart/home/adv/data/HomeAdvertisementDataSource;",
    name = "queryContentData",
    returnType = "Lcom/thingclips/smart/home/adv/api/bean/HomeCardDataDiff;",
    parameters = listOf("Lcom/thingclips/smart/home/adv/api/ui/HomeCardData;"),
)

/**
 * The AbsAdMobService lookup inside AdvertisementService (the implementation of
 * AbsAdvertisementService). Every AdMob ad slot the advertisement service hands out goes
 * through it: the slot view for "devList" (home, both the home.adv card and the DPC marketing
 * card) and "ty_user_center" (profile), and the ADMOB/LEGACY ad type it reports to the home
 * card. When it returns null, the service reports LEGACY and falls back to the legacy
 * (non-AdMob) banner, which the rest of this patch already disables.
 *
 * 7.12.0: private W2()AbsAdMobService      7.12.6: public static z0()AbsAdMobService
 *
 * Matched by the unobfuscated defining class plus the return type, which is unique there.
 */
internal object AdMobServiceLookupFingerprint : Fingerprint(
    definingClass = "Lcom/thingclips/smart/advertisement/AdvertisementService;",
    returnType = "Lcom/thingclips/smart/advertisement/admob/api/AbsAdMobService;",
    parameters = emptyList(),
)

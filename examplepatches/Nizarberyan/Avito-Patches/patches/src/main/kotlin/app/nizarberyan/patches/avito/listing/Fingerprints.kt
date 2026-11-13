package app.nizarberyan.patches.avito.listing

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

/**
 * `ListingAd.Published.toString()`.
 *
 * The first boolean field read after the ", isStore=" label is the isStore field.
 */
internal object PublishedListingToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("Published(id="),
        string(", isStore="),
        fieldAccess(definingClass = "this", opcode = Opcode.IGET_BOOLEAN),
    ),
)

/**
 * `ListingAd.Premium.toString()`.
 *
 * The first boolean field read after the ", isStore=" label is the isStore field.
 */
internal object PremiumListingToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("Premium(id="),
        string(", isStore="),
        fieldAccess(definingClass = "this", opcode = Opcode.IGET_BOOLEAN),
    ),
)

/**
 * `SearchAdsQuery.toString()`.
 *
 * The first field read after the "SearchAdsQuery(storeId=" label is the store id,
 * which is only set when the search is scoped to the page of a single shop.
 */
internal object SearchAdsQueryToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("SearchAdsQuery(storeId="),
        fieldAccess(
            definingClass = "this",
            type = "Ljava/lang/String;",
            opcode = Opcode.IGET_OBJECT,
        ),
    ),
)

/**
 * `GetRecommendedAdsQuery.document()`, the GraphQL query of the home screen feed.
 */
internal object RecommendedAdsQueryDocumentFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("query GetRecommendedAds(", StringComparisonType.STARTS_WITH),
    ),
)

/**
 * Paging source `load()` of the search results.
 *
 * Matches the call that maps a GraphQL ad to a `ListingAd`, and its result.
 *
 * @param listingAdType The obfuscated type of the `ListingAd` interface.
 */
internal fun searchPagingLoadFingerprint(listingAdType: String) = Fingerprint(
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        methodCall(returnType = listingAdType, opcode = Opcode.INVOKE_STATIC),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
    ),
    strings = listOf("fb_mobile_search", "search_result"),
)

/**
 * Method of the search paging source that returns the selected seller type
 * (private or professional) as an analytics parameter,
 * or null if no seller type is selected in the search filters.
 *
 * @param searchPagingSourceType The obfuscated type of the search paging source.
 */
internal fun selectedSellerTypeFingerprint(searchPagingSourceType: String) = Fingerprint(
    definingClass = searchPagingSourceType,
    returnType = "L",
    parameters = listOf(),
    filters = listOf(
        string("seller_type"),
        string("seller_type_v2"),
    ),
)

/**
 * Paging source `load()` of the home screen feed.
 *
 * Matches the call that maps a GraphQL ad to a `ListingAd`, its result,
 * and the call that adds the result to the list of loaded ads.
 *
 * @param recommendedAdsQueryType The obfuscated type of the GetRecommendedAds query.
 * @param listingAdType The obfuscated type of the `ListingAd` interface.
 */
internal fun recommendedPagingLoadFingerprint(
    recommendedAdsQueryType: String,
    listingAdType: String,
) = Fingerprint(
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        newInstance(recommendedAdsQueryType),
        methodCall(returnType = listingAdType, opcode = Opcode.INVOKE_STATIC),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
        methodCall(
            definingClass = "Ljava/util/ArrayList;",
            name = "add",
            location = MatchAfterImmediately(),
        ),
    ),
)

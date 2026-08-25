package app.template.patches.rustore.ads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PERSONAL_RECOMMENDATION_ADVERTISEMENT_DTO =
    "Lru/vk/store/feature/storeapp/recommendation/personal/impl/data/" +
        "PersonalRecommendationAdvertisementDto;"
private const val PROMO_SCREEN_TYPE_DTO =
    "Lru/vk/store/feature/promo/impl/data/PromoScreenTypeDto;"
private val PROMO_SCREEN_FIELDS =
    setOf("INTERESTING", "APPS", "GAMES", "KIOSK", "APP_CARD", "SEARCH")

/**
 * Matches `RawAdvertisementRepositoryImpl.get()`, the central entry point
 * used to load SSP, MyTarget, and VKR advertisements.
 */
object RawAdvertisementRepoGetFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Ljava/util/List;",
        "L",
        "Ljava/util/List;",
        "L",
        "Ljava/util/Set;",
        "Ljava/util/UUID;",
        "Z",
        "Z",
        "L",
    ),
    custom = { method, classDef ->
        classDef.sourceFile == "RawAdvertisementRepositoryImpl.kt" &&
            method.implementation != null
    },
)

/**
 * Matches the independent personal-recommendation slot producer. Returning an
 * empty list here avoids its feature lookup, JSON decoding, and downstream ad
 * request even if a caller bypasses the central raw-advertisement repository.
 */
object PersonalRecommendationAdvertisementRepoGetFingerprint : Fingerprint(
    returnType = "Ljava/io/Serializable;",
    parameters = listOf("L"),
    custom = { method, classDef ->
        val dtoCalls = method.implementation?.instructions
            ?.mapNotNull { instruction ->
                (instruction as? ReferenceInstruction)?.reference as? MethodReference
            }
            ?.filter { methodReference ->
                methodReference.definingClass == PERSONAL_RECOMMENDATION_ADVERTISEMENT_DTO
            }
            ?.map { methodReference -> methodReference.name }
            ?.toSet()

        classDef.sourceFile == "PersonalRecommendationAdvertisementRepositoryImpl.kt" &&
            dtoCalls == setOf("getSlotId", "getSource", "getScreen")
    },
)

/**
 * Matches the screen-dispatch entry point of the server-driven promo
 * repository. It is the common producer for promo carousels, stickers,
 * stories, search-bar promos, running lines, and overlay promos.
 */
object PromoRepositoryGetFingerprint : Fingerprint(
    returnType = "Ljava/io/Serializable;",
    parameters = listOf("L", "L"),
    custom = { method, classDef ->
        val promoScreenFields = method.implementation?.instructions
            ?.mapNotNull { instruction ->
                (instruction as? ReferenceInstruction)?.reference as? FieldReference
            }
            ?.filter { fieldReference ->
                fieldReference.definingClass == PROMO_SCREEN_TYPE_DTO
            }
            ?.map { fieldReference -> fieldReference.name }
            ?.toSet()

        classDef.sourceFile == "PromoRepositoryImpl.kt" &&
            promoScreenFields == PROMO_SCREEN_FIELDS
    },
)

/**
 * Matches `SearchZeroState.Content`, whose first, second, and fourth fields
 * contain recommendations shown before a search query is entered.
 */
object SearchZeroContentConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "L",
        "Ljava/util/List;",
        "L",
        "L",
        "Ljava/util/Map;",
        "Ljava/util/Map;",
    ),
    custom = { method, classDef ->
        classDef.sourceFile == "SearchZeroState.kt" &&
            method.implementation != null
    },
)

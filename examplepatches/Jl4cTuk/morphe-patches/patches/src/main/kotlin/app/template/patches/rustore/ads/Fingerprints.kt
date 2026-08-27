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
private const val GOOGLE_ADVERTISING_ID_CLIENT =
    "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;"
private const val GOOGLE_ADVERTISING_ID_INFO =
    "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;"
private const val IN_APP_STORY_MANAGER =
    "Lcom/inappstory/sdk/InAppStoryManager;"
private val PROMO_SCREEN_FIELDS =
    setOf("INTERESTING", "APPS", "GAMES", "KIOSK", "APP_CARD", "SEARCH")

private val AdvertisementIdsClassFingerprint = Fingerprint(
    strings = listOf("AdvertisementIds(gaid=", ", hoaid=", ", androidId="),
)

private val AdvertisingSettingClassFingerprint = Fingerprint(
    strings = listOf("Setting(settingId=", ", iconUrl=", ", value="),
)

private val AdvertisingAgreementSettingClassFingerprint = Fingerprint(
    strings = listOf("AgreementSetting(id=", ", value="),
)

/** Matches the model carrying stable advertising identifiers. */
object AdvertisementIdsConstructorFingerprint : Fingerprint(
    classFingerprint = AdvertisementIdsClassFingerprint,
    name = "<init>",
    returnType = "V",
    parameters = List(6) { "Ljava/lang/String;" },
)

/** Matches the advertising preference shown in the settings list. */
object AdvertisingSettingConstructorFingerprint : Fingerprint(
    classFingerprint = AdvertisingSettingClassFingerprint,
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "J",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Z",
    ),
)

/** Matches the compact advertising-consent model used by the agreement API. */
object AdvertisingAgreementSettingConstructorFingerprint : Fingerprint(
    classFingerprint = AdvertisingAgreementSettingClassFingerprint,
    name = "<init>",
    returnType = "V",
    parameters = listOf("J", "Z"),
)

/** Matches every construction of a Google advertising-ID result. */
object GoogleAdvertisingIdInfoConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Z"),
    custom = { _, classDef -> classDef.type == GOOGLE_ADVERTISING_ID_INFO },
)

/** Matches the static Google advertising-ID lookup entry point. */
object GoogleAdvertisingIdLookupFingerprint : Fingerprint(
    name = "getAdvertisingIdInfo",
    returnType = GOOGLE_ADVERTISING_ID_INFO,
    parameters = listOf("Landroid/content/Context;"),
    custom = { _, classDef -> classDef.type == GOOGLE_ADVERTISING_ID_CLIENT },
)

/** Matches the internal lookup used by `AdvertisingIdClient.getInfo()`. */
object GoogleAdvertisingIdInternalLookupFingerprint : Fingerprint(
    name = "zzf",
    returnType = GOOGLE_ADVERTISING_ID_INFO,
    parameters = listOf("I"),
    custom = { _, classDef -> classDef.type == GOOGLE_ADVERTISING_ID_CLIENT },
)

/** Matches the Google advertising-ID debug lookup. */
object GoogleAdvertisingIdDebugLookupFingerprint : Fingerprint(
    name = "getIsAdIdFakeForDebugLogging",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    custom = { _, classDef -> classDef.type == GOOGLE_ADVERTISING_ID_CLIENT },
)

/** Matches MyTarget's manifest-driven automatic initializer. */
object MyTargetAutoInitFingerprint : Fingerprint(
    name = "onCreate",
    returnType = "Z",
    parameters = emptyList(),
    custom = { _, classDef ->
        classDef.type == "Lcom/my/target/common/MyTargetContentProvider;"
    },
)

/** Matches RuStore's coroutine entry point that initializes InAppStory. */
object InAppStoryInitializerFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    custom = { method, classDef ->
        val inAppStoryCalls = method.implementation?.instructions
            ?.mapNotNull { instruction ->
                (instruction as? ReferenceInstruction)?.reference as? MethodReference
            }
            ?.filter { methodReference ->
                methodReference.definingClass == IN_APP_STORY_MANAGER
            }
            ?.map { methodReference -> methodReference.name }
            ?.toSet()
            .orEmpty()

        classDef.sourceFile == "InAppStoryInitializerImpl.kt" &&
            "initSDK" !in inAppStoryCalls &&
            setOf(
                "setCallToActionCallback",
                "setCloseStoryCallback",
                "setShowSlideCallback",
            ).all(inAppStoryCalls::contains)
    },
)

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

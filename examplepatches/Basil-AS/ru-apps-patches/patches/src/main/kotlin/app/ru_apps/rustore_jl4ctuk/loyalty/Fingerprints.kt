// Ported from Jl4cTuk/morphe-patches (GPLv3), app/template/patches/rustore/loyalty/Fingerprints.kt.
package app.ru_apps.rustore_jl4ctuk.loyalty

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val LOYALTY_FLAG_KEY = "featureLoyaltyEnabled"
private const val LOYALTY_CASHBACK_BANNER_DTO =
    "Lru/vk/store/feature/loyalty/accumulation/impl/data/LoyaltyCashbackBannerDto;"
private val LOYALTY_CASHBACK_BANNER_GETTERS =
    setOf(
        "getCashback",
        "getTitle",
        "getDescription",
        "getButtonTitle",
        "getIcon",
        "getPosition",
    )

/**
 * Matches the loyalty feature's remote-config accessor. A live decompile
 * (ru.vk.store 1.111.0.3, 2026-10) found the static `<clinit>`-based
 * `Features.kt` registry this used to target no longer exists: every feature
 * flag now has its own wrapper class (`LoyaltyRemoteConfig`) whose suspend
 * `isEnabled()` forwards the raw key string straight to a remote-config
 * provider interface (`Lnt2/b;->b(key, default, useCache, continuation)`),
 * falling back to the literal `false` default when the key is unknown - so
 * renaming the key string here still disables the feature client-side.
 */
object LoyaltyFeatureRegistryFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    strings = listOf(LOYALTY_FLAG_KEY),
    custom = { method, classDef ->
        classDef.sourceFile == "LoyaltyRemoteConfig.kt" &&
            method.implementation != null
    },
)

/**
 * Matches the RuStore Pay SDK adapter that reads the raw loyalty key directly
 * instead of using the app's central feature registry.
 */
object SdkPayLoyaltyConfigFingerprint : Fingerprint(
    returnType = "L",
    parameters = emptyList(),
    strings = listOf(LOYALTY_FLAG_KEY),
    custom = { method, _ ->
        val calls = method.implementation?.instructions
            ?.mapNotNull { instruction ->
                (instruction as? ReferenceInstruction)?.reference as? MethodReference
            }

        calls?.let { methodCalls ->
            methodCalls.any { methodReference ->
                methodReference.definingClass == "Ljava/util/Map;" &&
                    methodReference.name == "get" &&
                    methodReference.parameterTypes == listOf("Ljava/lang/Object;") &&
                    methodReference.returnType == "Ljava/lang/Object;"
            } &&
                methodCalls.any { methodReference ->
                    methodReference.definingClass == "Ljava/lang/Boolean;" &&
                        methodReference.name == "parseBoolean" &&
                        methodReference.parameterTypes == listOf("Ljava/lang/String;") &&
                        methodReference.returnType == "Z"
                }
        } == true
    },
)

/**
 * Matches the independent cashback-banner producer used by the loyalty
 * accumulation screens. Its consumers explicitly support a null banner.
 */
object LoyaltyCashbackBannerRepositoryGetFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    custom = { method, classDef ->
        val dtoCalls = method.implementation?.instructions
            ?.mapNotNull { instruction ->
                (instruction as? ReferenceInstruction)?.reference as? MethodReference
            }
            ?.filter { methodReference ->
                methodReference.definingClass == LOYALTY_CASHBACK_BANNER_DTO
            }
            ?.map { methodReference -> methodReference.name }
            ?.toSet()

        classDef.sourceFile == "LoyaltyCashbackBannerRepository.kt" &&
            dtoCalls == LOYALTY_CASHBACK_BANNER_GETTERS
    },
)

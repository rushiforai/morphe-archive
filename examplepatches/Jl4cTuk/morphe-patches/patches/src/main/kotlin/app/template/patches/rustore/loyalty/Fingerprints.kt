package app.template.patches.rustore.loyalty

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

/** Matches the feature registry initializer that declares the loyalty flag. */
object LoyaltyFeatureRegistryFingerprint : Fingerprint(
    name = "<clinit>",
    returnType = "V",
    parameters = emptyList(),
    strings = listOf(LOYALTY_FLAG_KEY),
    custom = { method, classDef ->
        classDef.sourceFile == "Features.kt" &&
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

package app.template.patches.alza

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

object GodFragmentCreateViewFingerprint : Fingerprint(
    definingClass = "Lcz/alza/base/delegate/fragment/GodFragment;",
    name = "onCreateView",
    returnType = "Landroid/view/View;",
    parameters = listOf(
        "Landroid/view/LayoutInflater;",
        "Landroid/view/ViewGroup;",
        "Landroid/os/Bundle;"
    )
)

object ProductDetailParamsWithIdFingerprint : Fingerprint(
    definingClass = "Lcz/alza/base/api/product/detail/api/model/data/ProductDetailParams\$WithId;",
    name = "<init>",
    parameters = listOf(
        "I",
        "Lcz/alza/base/api/product/detail/api/model/data/ProductDetailContinue;",
        "Lcz/alza/base/api/product/detail/api/model/data/ProductDetailParams\$HashedProductIdentifier;",
        "Lcz/alza/base/api/product/detail/api/model/data/ProductDetailParams\$ProductInfo;"
    )
)

object ProductDetailParamsWithMetaFingerprint : Fingerprint(
    definingClass = "Lcz/alza/base/api/product/detail/api/model/data/ProductDetailParams\$WithMeta;",
    name = "<init>",
    parameters = listOf(
        "Lcz/alza/base/utils/navigation/model/data/Meta;",
        "Lcz/alza/base/api/product/detail/api/model/data/ProductDetailContinue;",
        "Lcz/alza/base/api/product/detail/api/model/data/ProductDetailParams\$HashedProductIdentifier;",
        "Lcz/alza/base/api/product/detail/api/model/data/ProductDetailParams\$ProductInfo;"
    )
)

object AndroidViewFingerprint : Fingerprint(
    returnType = "V",
    isStatic = true,
    custom = { method, _ ->
        if (method.parameterTypes.size != 6) {
            false
        } else {
            val p = method.parameterTypes
            p[4] == "I" && p[5] == "I" && p[0] == p[2] && !p[0].startsWith("Ljava/") && p[1] != "I" && p[3] != "I"
        }
    }
)

object PriceSectionContentFingerprint : Fingerprint(
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Ljava/lang/Object;",
        "Ljava/lang/Object;",
        "Ljava/lang/Object;"
    ),
    custom = { method, _ ->
        method.implementation?.instructions?.any { inst ->
            (inst as? ReferenceInstruction)?.reference?.toString()?.contains("getAlternativePrice") == true
        } == true
    }
)

object ProductPricesGetAlternativePriceFingerprint : Fingerprint(
    definingClass = "Lcz/alza/base/lib/product/detail/model/general/data/ProductPrices;",
    name = "getAlternativePrice",
    returnType = "Lcz/alza/base/lib/product/detail/model/general/data/AlternativePrice;"
)

object ThemeSettingsContentFingerprint : Fingerprint(
    returnType = "V",
    isStatic = true,
    custom = { method, _ ->
        method.parameterTypes.size == 4 &&
            method.parameterTypes[0] == "Lcz/alza/base/api/settings/api/model/ThemeMode;"
    }
)

object SettingsAndSecurityContentFingerprint : Fingerprint(
    returnType = "V",
    isStatic = true,
    custom = { method, _ ->
        method.parameterTypes.size == 15 &&
            method.parameterTypes.any { it == "Lcz/alza/base/lib/settings/model/data/ChatBotMagicButtonSettings;" } &&
            method.parameterTypes.any { it == "Lcz/alza/base/lib/settings/model/data/PasswordInfo;" }
    }
)

object AppMenuInfoFingerprint : Fingerprint(
    returnType = "V",
    isStatic = true,
    custom = { method, _ ->
        method.parameterTypes.size == 3 &&
            method.parameterTypes[2] == "I" &&
            method.implementation?.instructions?.any { inst ->
                (inst as? ReferenceInstruction)?.reference?.toString()?.contains("AppMenuInfo;->getAppVersion") == true
            } == true
    }
)


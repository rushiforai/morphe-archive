// © https://saadbinyousaf.dev/ © //
package dev.sby.patches.foodpanda

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.instanceOf
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

// © https://saadbinyousaf.dev/ © //
internal const val ADTECH_CREATIVES = "Lcom/deliveryhero/adtechsdk/data/model/CreativesResponse;"

// © https://saadbinyousaf.dev/ © //
internal val creativesGetterFingerprint = Fingerprint(
    returnType = "Ljava/util/List;",
    parameters = emptyList(),
    custom = { method, classDef ->
        classDef.type == ADTECH_CREATIVES && method.name == "getCreatives"
    },
)

// © https://saadbinyousaf.dev/ © //
internal val crossSellSheetFingerprint = Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;"),
    filters = listOf(
        string("CrossSellBottomSheet: shown with "),
    ),
)

// © https://saadbinyousaf.dev/ © //
internal val masGateFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    filters = listOf(
        newInstance("Lcom/deliveryhero/app/security/MasEvaluationException;"),
        string("MAS eval"),
        string("MAS evaluation failed."),
    ),
)

// © https://saadbinyousaf.dev/ © //
internal val blockScreenGuardFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Landroid/app/Activity;", "L"),
    filters = listOf(
        instanceOf("Lcom/deliveryhero/app/security/ui/BlockedActivity;"),
    ),
)

// © https://saadbinyousaf.dev/ © //
internal val getPackageInfoFingerprint = Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Landroid/content/pm/PackageManager;",
            name = "getPackageInfo",
            parameters = listOf("Ljava/lang/String;", "I"),
            returnType = "Landroid/content/pm/PackageInfo;",
        ),
    ),
)
// © https://saadbinyousaf.dev/ © //

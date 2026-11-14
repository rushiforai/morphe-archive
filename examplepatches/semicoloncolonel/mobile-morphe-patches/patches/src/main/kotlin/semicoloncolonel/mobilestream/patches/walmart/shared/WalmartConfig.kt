package semicoloncolonel.mobilestream.patches.walmart.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.hasSignature
import semicoloncolonel.mobilestream.patches.shared.misc.prependGate

internal const val WALMART_FILTER = "Lsemicoloncolonel/mobilestream/extension/shared/misc/ShoppingAdsFilter;"

private const val CONFIG_PACKAGE = "Lglass/platform/config/"

/**
 * Makes Walmart's config API answer false for every key that [filterMethod]
 * (a static `(Ljava/lang/String;)Z` on ShoppingAdsFilter) accepts. Each
 * implementation of the config API's getBoolean(String, Z) is gated, so the
 * key reads as off wherever the app asks for it.
 */
internal fun BytecodePatchContext.forceWalmartFlagsOff(filterMethod: String) {
    // The config API interface: the one in glass.platform.config.api with getBoolean(String, Z).
    val interfaces = mutableSetOf<String>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("${CONFIG_PACKAGE}api/") &&
            AccessFlags.INTERFACE.isSet(classDef.accessFlags) &&
            classDef.methods.any { it.name == "getBoolean" && it.hasSignature("Z", "Ljava/lang/String;", "Z") }
        ) {
            interfaces += classDef.type
        }
    }
    if (interfaces.isEmpty()) throw PatchException("Walmart config API interface not found")

    val gated = forEachMatchingMethod(
        { classDef ->
            classDef.type.startsWith(CONFIG_PACKAGE) &&
                !AccessFlags.INTERFACE.isSet(classDef.accessFlags) &&
                classDef.interfaces.any { it in interfaces }
        },
        { it.name == "getBoolean" && it.hasSignature("Z", "Ljava/lang/String;", "Z") },
    ) { method ->
        method.prependGate(
            """
                invoke-static/range { p1 .. p1 }, $WALMART_FILTER->$filterMethod(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :msp_orig
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
        )
    }
    if (gated == 0) throw PatchException("Walmart config getBoolean not found")
}

/**
 * Walmart builds every server-driven page from JSON into WireContentLayout or
 * WirePageLayout: (name, PageMetadata, modules, layouts). The third parameter
 * is the page's list of modules, each with its Tempo type (getType()). The
 * list goes through [filterMethod], a static `(Ljava/util/List;)Ljava/util/List;`
 * on ShoppingAdsFilter. A layout slot whose module is gone is left out, so no
 * gap remains.
 */
internal fun BytecodePatchContext.filterWalmartTempoModules(filterMethod: String) {
    val filtered = forEachMatchingMethod(
        { classDef ->
            classDef.type == "Lglass/platform/tempo/wire/WireContentLayout;" ||
                classDef.type == "Lglass/platform/tempo/wire/WirePageLayout;"
        },
        {
            it.name == "<init>" && it.hasSignature(
                "V",
                "Ljava/lang/String;",
                "Lglass/platform/tempo/api/content/layout/PageMetadata;",
                "Ljava/util/List;",
                "Ljava/util/List;",
            )
        },
    ) { method ->
        method.addInstructions(
            0,
            """
                invoke-static/range { p3 .. p3 }, $WALMART_FILTER->$filterMethod(Ljava/util/List;)Ljava/util/List;
                move-result-object p3
            """.trimIndent(),
        )
    }
    if (filtered != 2) throw PatchException("Walmart Tempo page layouts not found ($filtered of 2)")
}

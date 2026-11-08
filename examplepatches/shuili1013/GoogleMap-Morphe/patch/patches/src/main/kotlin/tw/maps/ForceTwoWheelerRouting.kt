package tw.maps

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

/** Morphe adapter for the separately compiled and tested Java transform.
 * The adapter itself still requires compilation against the real Morphe runtime.
 */
@Suppress("unused")
val forceTwoWheelerRouting = bytecodePatch(
    name = "Experimental projected CAR two-wheeler routing",
    description = "26.44.06.1006895251 only. Experimental route selector and builder; AA bridge and live reroute unverified.",
    default = false,
) {
    compatibleWith(
        Compatibility(
            name = "Google Maps",
            packageName = "com.google.android.apps.maps",
            apkFileType = ApkFileType.APKM,
            targets = listOf(
                AppTarget(
                    version = "26.44.06.1006895251",
                    versionCodes = mapOf(SupportedAbi.ARM64_V8A to 1068856906),
                    isExperimental = true,
                ),
            ),
        ),
    )
    execute {
        check(packageMetadata.packageName == "com.google.android.apps.maps")
        check(packageMetadata.versionName == "26.44.06.1006895251")
        check(packageMetadata.versionCode == "1068856906")

        val support = TwoWheelerCore.SUPPORT.keys.associateWith { signature ->
            classDefBy(signature.substringBefore("->")).methods.single { it.toString() == signature }
        }
        TwoWheelerCore.validateSupport(support)

        // Resolve and validate both complete bodies before modifying either one.
        val selectors = listOf("Lbtxk;" to TwoWheelerCore.SELECTOR, "Lqxa;" to TwoWheelerCore.BUILDER)
        val replacements = selectors.map { (type, signature) ->
            val method = classDefBy(type).methods.single { it.toString() == signature }
            TwoWheelerCore.validate(method)
            type to ImmutableMethod(
                method.definingClass, method.name, method.parameters, method.returnType,
                method.accessFlags, method.annotations, method.hiddenApiRestrictions,
                TwoWheelerCore.transform(method),
            )
        }
        replacements.forEach { (type, replacement) ->
            val methods = mutableClassDefBy(type).methods
            val old = methods.single { it.toString() == replacement.toString() }
            check(methods.remove(old))
            check(methods.add(MutableMethod(replacement)))
        }
    }
}

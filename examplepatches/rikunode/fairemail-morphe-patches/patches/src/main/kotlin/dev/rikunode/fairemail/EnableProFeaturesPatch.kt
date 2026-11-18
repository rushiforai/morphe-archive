package dev.rikunode.fairemail

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Experimental opt-in FairEmail Pro feature patch inspired by an independent
 * GPLv3 fork's `ActivityBilling.isPro(Context)` change.
 *
 * Important: this is a change to an application-internal entitlement check,
 * NOT an OS signature bypass. It cannot update a stock-signed installation
 * while preserving its private data on a non-rooted Android device.
 *
 * Neither this patch nor its companion export-only patch changes certificates,
 * Google OAuth, account databases, billing purchase records, or preferences.
 */
@Suppress("unused")
val enableProFeaturesPatch = bytecodePatch(
    name = "Enable local Pro features (experimental)",
    description = "Make FairEmail's local Pro feature checks return true. No purchases or signing changes. Does not preserve stock-install data across a signature mismatch.",
    default = false,
) {
    compatibleWith(
        Compatibility(
            name = "FairEmail",
            packageName = "eu.faircode.email",
            apkFileType = ApkFileType.APK,
            appIconColor = 0x157B9B,
            targets = listOf(
                AppTarget(version = "1.2337", versionCode = 2337),
                AppTarget(version = "1.2338", versionCode = 2338),
            ),
        )
    )

    execute {
        val className = "Leu/faircode/email/ActivityBilling;"
        val source = classDefBy(className)
        val matches = source.methods.filter {
            it.name == "isPro" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;") &&
                it.returnType == "Z"
        }.toList()
        require(matches.size == 1) { "Unsupported FairEmail: unexpected Pro check" }
        val original = matches.single()
        require((original.accessFlags and 0x0008) != 0) {
            "Unsupported FairEmail: Pro check must be static"
        }
        val implementation = requireNotNull(original.implementation) {
            "Unsupported FairEmail: Pro check has no body"
        }
        require(implementation.registerCount >= 2) {
            "Unsupported FairEmail: unexpected Pro method register count"
        }

        // Refuse to modify unrelated or restructured methods, e.g. another
        // flavor's billing class or a future version with changed semantics.
        val instructions = implementation.instructions.toList()
        val methodCalls = instructions
            .filterIsInstance<ReferenceInstruction>()
            .mapNotNull { it.reference as? MethodReference }
        require(methodCalls.any {
            it.definingClass == "Landroidx/preference/PreferenceManager;" &&
                it.name == "getDefaultSharedPreferences"
        }) { "Expected official Pro preference lookup missing" }
        require(methodCalls.any {
            it.definingClass == "Landroid/content/SharedPreferences;" &&
                it.name == "getBoolean" &&
                it.parameterTypes.map(CharSequence::toString) ==
                    listOf("Ljava/lang/String;", "Z") &&
                it.returnType == "Z"
        }) { "Expected official Pro flag getter missing" }
        require(instructions.filterIsInstance<ReferenceInstruction>()
            .mapNotNull { it.reference as? StringReference }
            .any { it.string == "pro" }) {
            "Expected official Pro preference key missing"
        }

        val mutable = mutableClassDefBy(className)
        val method = mutable.methods.single {
            it.name == "isPro" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;") &&
                it.returnType == "Z"
        }

        // Early return only. Preserves the original method signature.
        // `v0` is a non-parameter local in the source-reviewed 1.2337/1.2338
        // official APKs (three registers, one incoming argument).
        method.addInstructions(
            0,
            """
            const/4 v0, 0x1
            return v0
            """.trimIndent()
        )
    }
}

package org.ungoogled.patches.maps.ui

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import org.w3c.dom.Element

val COMPATIBILITY_MAPS = Compatibility(
    name = "Google Maps",
    packageName = "com.google.android.apps.maps"
)

private const val ACTIVITY = "rhubarbshoelaces.patches.maps.extension.RegionActivity"
private const val TITLE = "Custom Cartographic Region"

internal val regionExtensionPatch = bytecodePatch(
    description = "Adds the Custom Cartographic Region UI extension.",
) {
    extendWith("extension.mpe")
}

private val regionManifestPatch = resourcePatch(
    description = "Declares RegionActivity in AndroidManifest.xml",
) {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as Element
            val activity = manifest.createElement("activity")
            activity.setAttribute("android:name", ACTIVITY)
            activity.setAttribute("android:exported", "true")
            activity.setAttribute("android:label", TITLE)
            activity.setAttribute("android:theme", "@android:style/Theme.DeviceDefault.DayNight")
            application.appendChild(activity)
        }
    }
}

/** 1. Phenotype Payload Builder Fingerprint (aysg) */
object PhenotypePayloadBuilderFingerprint : Fingerprint(
    strings = listOf("GMM", "GMM_ANDROID", "www.google.com"),
    filters = listOf(
        string("GMM_ANDROID"),
        fieldAccess(opcode = Opcode.IPUT_OBJECT, type = "Ljava/lang/String;"),
        fieldAccess(opcode = Opcode.IPUT_OBJECT, type = "Ljava/lang/String;"),
        fieldAccess(opcode = Opcode.IPUT_OBJECT, type = "Ljava/lang/String;"), // cais.d
        fieldAccess(opcode = Opcode.IPUT_OBJECT, type = "Ljava/lang/String;"), // cais.k
        fieldAccess(opcode = Opcode.IPUT_OBJECT, type = "Ljava/lang/String;")  // cais.s
    )
)

/** 2. Live Telephony Region Resolver Fingerprint (aoxw) */
object SimCountryResolverFingerprint : Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Landroid/telephony/TelephonyManager;",
            name = "getSimCountryIso",
            returnType = "Ljava/lang/String;"
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT)
    )
)

val customRegionPatch = bytecodePatch(
    name = "Custom Cartographic Region",
    description = "Adds dynamic cartographic region overrides to Google Maps.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MAPS)
    dependsOn(regionExtensionPatch, regionManifestPatch)

    execute {
        // --- TARGET 1: Inject UI Row into Bear's CustomizationActivity ---
        try {
            val customizationClass = mutableClassDefBy("Lorg/ungoogled/ui/CustomizationActivity;")
            val onCreateMethod = customizationClass.methods.firstOrNull { it.name == "onCreate" }
            onCreateMethod?.let { method ->
                val returnIndex = method.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
                val insertIndex = if (returnIndex != -1) returnIndex else method.instructions.size

                method.addInstructions(
                    insertIndex,
                    """
                        invoke-static { p0 }, Lrhubarbshoelaces/patches/maps/extension/RegionActivity;->addRegionRow(Landroid/app/Activity;)V
                    """.trimIndent()
                )
            }
        } catch (ignored: Exception) {

        }

        // --- TARGET 2: Phenotype Registration (aysg) ---
        PhenotypePayloadBuilderFingerprint.let { match ->
            val method = match.method
            val matches = listOf(
                match.instructionMatches[3], // cais.d
                match.instructionMatches[4], // cais.k
                match.instructionMatches[5]  // cais.s
            )

            for (fieldMatch in matches.reversed()) {
                val valueReg = fieldMatch.getInstruction<TwoRegisterInstruction>().registerA
                val prevOpcode = method.instructions[fieldMatch.index - 1].opcode
                val insertIndex = if (prevOpcode == Opcode.INVOKE_VIRTUAL) fieldMatch.index - 1 else fieldMatch.index

                method.addInstructions(
                    insertIndex,
                    """
                        invoke-static { v$valueReg }, Lrhubarbshoelaces/patches/maps/extension/RegionActivity;->getForcedRegion(Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v$valueReg
                    """.trimIndent()
                )
            }
        }

        // --- TARGET 3: Live Telephony Region Resolver (aoxw) ---
        SimCountryResolverFingerprint.let { match ->
            val method = match.method
            val moveResultMatch = match.instructionMatches[1]
            val targetReg = moveResultMatch.getInstruction<OneRegisterInstruction>().registerA

            method.addInstructions(
                moveResultMatch.index + 1,
                """
                    invoke-static { v$targetReg }, Lrhubarbshoelaces/patches/maps/extension/RegionActivity;->getForcedRegion(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$targetReg
                """.trimIndent()
            )
        }
    }
}
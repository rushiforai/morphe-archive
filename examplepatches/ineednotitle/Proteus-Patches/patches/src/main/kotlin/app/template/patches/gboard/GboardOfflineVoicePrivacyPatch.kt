package app.template.patches.gboard

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.Constants.GBOARD_COMPATIBILITY
import app.template.patches.shared.clearBody
import app.template.patches.shared.ensureRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import org.w3c.dom.Element

private val gboardPrivacyResourcesPatch = resourcePatch(
    name = "Gboard offline voice and telemetry resources",
    description = "Applies Gboard manifest and managed-configuration privacy defaults.",
    default = false,
) {
    compatibleWith(GBOARD_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val application = doc.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("Gboard manifest has no <application> element")

            application.setAttribute("android:allowBackup", "false")
            application.removeAttribute("android:backupAgent")

            val metadata = doc.getElementsByTagName("meta-data")
            var cronetTelemetryFound = false
            for (index in metadata.length - 1 downTo 0) {
                val node = metadata.item(index) as? Element ?: continue
                when (node.getAttribute("android:name")) {
                    "com.google.android.backup.api_key" -> node.parentNode?.removeChild(node)
                    "android.net.http.EnableTelemetry" -> {
                        node.setAttribute("android:value", "false")
                        cronetTelemetryFound = true
                    }
                }
            }
            if (!cronetTelemetryFound) {
                throw PatchException("Gboard Cronet telemetry metadata was not found")
            }
        }

        // The restriction XML has a stable content shape but its decoded file name can
        // differ between the XAPK and standalone APK resource tables.
        val restrictionsPath = findRestrictionsFile()
        val requiredKeys = setOf(
            "enable_user_metrics",
            "user_enable_federated_training",
            "config_agentic_dictation",
            "config_clipboard",
        )
        val privacyDefaults = mapOf(
            "enable_user_metrics" to "false",
            "user_enable_federated_training" to "false",
            "config_agentic_dictation" to "false",
            "config_clipboard" to "false",
            "enable_scribe" to "false",
            "enable_voice_widget" to "false",
            "show_direct_to_dictation_access_point" to "false",
            "config_global_direct_to_dictation" to "false",
            "enable_global_direct_to_voice_toolbar" to "false",
            "writing_tools_enable_hybrid" to "false",
            "config_default_layouts" to "",
            "config_default_theme_file" to "",
            "config_default_dark_theme_file" to "",
        )

        document(restrictionsPath).use { doc ->
            val updatedKeys = mutableSetOf<String>()
            val restrictions = doc.getElementsByTagName("restriction")
            for (index in 0 until restrictions.length) {
                val restriction = restrictions.item(index) as? Element ?: continue
                val key = restriction.getAttribute("android:key")
                val value = privacyDefaults[key] ?: continue
                restriction.setAttribute("android:defaultValue", value)
                updatedKeys += key
            }
            val missingKeys = requiredKeys - updatedKeys
            if (missingKeys.isNotEmpty()) {
                throw PatchException(
                    "Gboard managed-configuration keys not found: ${missingKeys.joinToString()}",
                )
            }
        }
    }
}

private fun ResourcePatchContext.findRestrictionsFile(): String {
    val resDirectory = get("res")
    val candidates = resDirectory.walkTopDown()
        .filter { it.isFile && it.extension == "xml" }
    val file = candidates.firstOrNull { it.readText().contains("<restrictions") }
        ?: throw PatchException("Gboard managed-configuration restrictions XML was not found")
    return "res/" + file.relativeTo(resDirectory).invariantSeparatorsPath
}

/**
 * Replace the source register of a static flag assignment with the constant-false flag.
 */
private fun MutableMethod.forceStaticFlagsFalse(
    definingClass: String,
    fieldNames: Set<String>,
    fieldType: String = "Lokc;",
) {
    val instructions = implementation?.instructions
        ?: throw PatchException("Gboard $definingClass flags have no class initializer")

    val assignments = fieldNames.map { fieldName ->
        val matches = instructions.mapIndexedNotNull { index, instruction ->
            if (instruction.opcode != Opcode.SPUT_OBJECT) return@mapIndexedNotNull null
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                ?: return@mapIndexedNotNull null
            if (field.definingClass != definingClass || field.name != fieldName || field.type != fieldType) {
                return@mapIndexedNotNull null
            }
            val register = (instruction as? OneRegisterInstruction)?.registerA
                ?: throw PatchException("Gboard $definingClass.$fieldName assignment has no source register")
            index to register
        }
        if (matches.size != 1) {
            throw PatchException("Expected one Gboard $definingClass.$fieldName flag assignment, found ${matches.size}")
        }
        matches.single()
    }

    assignments.sortedByDescending { it.first }.forEach { (index, register) ->
        addInstructions(index, "sget-object v$register, Lokf;->b:Lokc;")
    }
}

private fun MutableMethod.replaceBody(requiredRegisters: Int, instructions: String) {
    ensureRegisters(requiredRegisters)
    clearBody()
    addInstructions(0, instructions.trimIndent())
}

/**
 * Rewrite the register feeding each Agentic Dictation flag assignment. Do not assume
 * <clinit>'s last instruction is return-void: this Gboard build has a nontrivial initializer.
 */
private fun MutableMethod.forceAgenticFlagsFalse() {
    val instructions = implementation?.instructions
        ?: throw PatchException("Gboard Agentic Dictation flags have no class initializer")

    val assignments = listOf("a", "c").map { fieldName ->
        val matches = instructions.mapIndexedNotNull { index, instruction ->
            if (instruction.opcode != Opcode.SPUT_OBJECT) return@mapIndexedNotNull null
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                ?: return@mapIndexedNotNull null
            if (field.definingClass != "Lnbx;" || field.name != fieldName || field.type != "Lokc;") {
                return@mapIndexedNotNull null
            }
            val register = (instruction as? OneRegisterInstruction)?.registerA
                ?: throw PatchException("Gboard Lnbx.$fieldName assignment has no source register")
            Triple(fieldName, index, register)
        }
        if (matches.size != 1) {
            throw PatchException("Expected one Gboard Lnbx.$fieldName flag assignment, found ${matches.size}")
        }
        matches.single()
    }

    // Insert from the end so the earlier instruction indices remain valid.
    assignments.sortedByDescending { it.second }.forEach { (_, index, register) ->
        addInstructions(index, "sget-object v$register, Lokf;->b:Lokc;")
    }
}

@Suppress("unused")
val gboardOfflineVoicePrivacyPatch = bytecodePatch(
    name = "Offline-only voice typing & telemetry reduction",
    description = """
        On Gboard 18.5.4.993608717 arm/arm64, routes core voice typing only through the on-device
        recognizers and returns no recognizer when a local provider/model is unavailable (no
        online fallback). Disables Agentic Dictation's server/batch retry path, reduces selected
        metrics/telemetry and disables app backup. INTERNET and unrelated network features are
        retained; this is best-effort telemetry reduction, not a guarantee of zero Google traffic.

        Requires the appropriate offline speech model/provider to be installed. Without one,
        voice typing is unavailable by design. Agentic Dictation is disabled.
    """.trimIndent(),
    default = false,
) {
    compatibleWith(GBOARD_COMPATIBILITY)
    dependsOn(gboardPrivacyResourcesPatch)

    execute {
        // SpeechRecognitionFacilitator: use only local recognizer providers. This intentionally
        // bypasses the original S3/Speech-IME recognizer path; null is the fail-closed result.
        Fingerprint(
            definingClass = "Lkqh;",
            name = "c",
            returnType = "Lktc;",
            parameters = listOf("Lkti;"),
        ).let { fingerprint ->
            val method = fingerprint.method
            method.ensureRegisters(6) // v0-v3 scratch plus p0/p1; original has more registers.
            method.clearBody() // Build a fresh label pool for this complete replacement body.
            method.addInstructionsWithLabels(
                0,
                """
                    iget-object v0, p0, Lkqh;->f:Lsgo;
                    iget-object v1, p0, Lkqh;->c:Lkqi;
                    iget-boolean v2, p1, Lkti;->n:Z
                    if-eqz v2, :normal_device

                    # Jetson Lite mode: local recognizer only; no S3 fallback.
                    invoke-virtual { v1, p1, v0 }, Lkqi;->b(Lkti;Lsgo;)Lktc;
                    move-result-object v2
                    return-object v2

                    :normal_device
                    iget-object v2, v1, Lkqi;->e:Landroid/content/Context;
                    invoke-static { v2, p1 }, Lkqi;->o(Landroid/content/Context;Lkti;)Z
                    move-result v3
                    if-eqz v3, :fallback_device
                    sget-object v3, Lkqi;->b:Lksx;
                    invoke-virtual { v1, v3, p1 }, Lkqi;->d(Lksy;Lkti;)Lktc;
                    move-result-object v3
                    if-eqz v3, :fallback_device
                    return-object v3

                    :fallback_device
                    invoke-static { v2, p1 }, Lkqi;->l(Landroid/content/Context;Lkti;)Z
                    move-result v3
                    if-eqz v3, :fail_closed
                    sget-object v3, Lkqi;->d:Lksx;
                    invoke-virtual { v1, v3, p1 }, Lkqi;->d(Lksy;Lkti;)Lktc;
                    move-result-object v3
                    return-object v3

                    :fail_closed
                    const/4 v3, 0x0
                    return-object v3
                """.trimIndent(),
            )
        }

        // MetricsManager sampling gate: drop event submissions.
        Fingerprint(
            definingClass = "Lqfk;",
            name = "B",
            returnType = "Z",
            parameters = listOf("Lqel;"),
        ).method.replaceBody(
            requiredRegisters = 3, // instance + argument + one local boolean scratch register
            instructions = """
                const/4 v0, 0x0
                return v0
            """,
        )

        // Clearcut: do not enqueue events or activate the upload adapter.
        Fingerprint(
            definingClass = "Lqet;",
            name = "l",
            returnType = "V",
            parameters = listOf("Ljava/lang/Runnable;"),
        ).method.replaceBody(requiredRegisters = 3, instructions = "return-void")

        Fingerprint(
            definingClass = "Lqet;",
            name = "h",
            returnType = "V",
            parameters = emptyList(),
        ).method.replaceBody(requiredRegisters = 2, instructions = "return-void")

        // Keep Primes on its built-in no-op instance rather than selecting Clearcut.
        Fingerprint(
            definingClass = "Luml;",
            name = "b",
            returnType = "V",
            parameters = listOf("Luml;"),
        ).method.replaceBody(requiredRegisters = 2, instructions = "return-void")

        // Disable Agentic Dictation's server/batch retry entry point.
        Fingerprint(
            definingClass = "Lfhv;",
            name = "D",
            returnType = "Z",
            parameters = listOf("Lfkh;"),
        ).method.replaceBody(
            requiredRegisters = 3, // instance + argument + one local boolean scratch register
            instructions = """
                const/4 v0, 0x0
                return v0
            """,
        )

        // Force both Agentic Dictation configuration holders false at their original assignments.
        // This works regardless of branches or trailing instructions in <clinit>.
        Fingerprint(
            definingClass = "Lnbx;",
            name = "<clinit>",
            returnType = "V",
            parameters = emptyList(),
        ).method.forceAgenticFlagsFalse()

        // Disable the clipboard feature even when no managed configuration is present.
        Fingerprint(
            definingClass = "Lfsc;",
            name = "<clinit>",
            returnType = "V",
            parameters = emptyList(),
        ).method.forceStaticFlagsFalse("Lfsc;", setOf("a"))

        // Hard-disable voice flags that bind Wi-Fi, request contacts or route through Bluetooth.
        Fingerprint(
            definingClass = "Lsgy;",
            name = "<clinit>",
            returnType = "V",
            parameters = emptyList(),
        ).method.forceStaticFlagsFalse("Lsgy;", setOf("f", "h", "i"))
    }
}

package app.navhi.patches.greatday.guard

import app.navhi.patches.greatday.shared.Constants.COMPATIBILITY_GREATDAY
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.Reference

private const val FLAGS = "Lapp/navhi/extension/greatday/Flags;"
private const val MOCK_CHECKER = "Lbosowa/hris/cordova/MockChecker;"
private const val GREATDAY_PLUGIN = "Lcom/greatday/plugins/GreatDayPlugin;"
private const val PLUGIN_RESULT = "Lorg/apache/cordova/PluginResult;"
private const val CORDOVA_INTERFACE = "Lorg/apache/cordova/CordovaInterface;"

/** Reads a switch from the Morphe Settings screen into [into]. */
private fun flagLookup(selfClass: String, self: String, key: String, into: Int, scratch: Int, keyRegister: Int) = """
    iget-object v$scratch, $self, $selfClass->cordova:$CORDOVA_INTERFACE
    invoke-interface { v$scratch }, $CORDOVA_INTERFACE->getActivity()Landroid/app/Activity;
    move-result-object v$scratch
    const-string v$keyRegister, "$key"
    invoke-static { v$scratch, v$keyRegister }, $FLAGS->get(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v$into
"""

/** The report the plugin logs right before answering the check. */
private val mockReportFingerprint = Fingerprint(
    definingClass = MOCK_CHECKER,
    name = "execute",
    filters = listOf(string("isMock: ")),
)

private val developerSettingsFingerprint = Fingerprint(
    definingClass = GREATDAY_PLUGIN,
    name = "execute",
    filters = listOf(string("development_settings_enabled")),
)

private val emulatorFingerprint = Fingerprint(
    definingClass = GREATDAY_PLUGIN,
    name = "execute",
    filters = listOf(string("google_sdk")),
)

/** Index of the first `new-instance PluginResult` after [from]. */
private fun pluginResultIndex(
    method: com.android.tools.smali.dexlib2.iface.Method,
    from: Int,
): Int {
    val instructions = method.implementation!!.instructions.toList()
    return (from until instructions.size).first { index ->
        val instruction = instructions[index]
        instruction.opcode == Opcode.NEW_INSTANCE &&
            (instruction as? ReferenceInstruction)?.reference?.let { (it as Reference).toString() } == PLUGIN_RESULT
    }
}

/** Every mock-location check answers with the switch value. */
@Suppress("unused")
val disableMockDetectionPatch = bytecodePatch(
    name = "Hide fake GPS apps",
    description = "The app stops listing the fake-GPS apps on the phone and reports location as not mocked.",
) {
    compatibleWith(COMPATIBILITY_GREATDAY)

    execute {
        mockReportFingerprint.let {
            it.method.addInstructions(
                it.instructionMatches.first().index,
                """
                    iget-object v0, p0, $MOCK_CHECKER->d:Lorg/json/JSONObject;
                    const-string v1, "isMock"
                    ${flagLookup(MOCK_CHECKER, "p0", "mock", 2, 3, 4)}
                    invoke-virtual { v0, v1, v2 }, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
                    move-result-object v0
                """,
            )
        }
    }
}

/** Developer options and emulator answer with their switch value. */
@Suppress("unused")
val disableDeveloperOptionsDetectionPatch = bytecodePatch(
    name = "Hide developer options and emulator",
    description = "Developer options and emulators no longer block attendance.",
) {
    compatibleWith(COMPATIBILITY_GREATDAY)

    execute {
        developerSettingsFingerprint.let {
            val method = it.method
            method.addInstructions(
                pluginResultIndex(method, it.instructionMatches.first().index),
                flagLookup(GREATDAY_PLUGIN, "v0", "devoptions", 5, 7, 8),
            )
        }

        emulatorFingerprint.let {
            val method = it.method
            method.addInstructions(
                pluginResultIndex(method, it.instructionMatches.first().index),
                flagLookup(GREATDAY_PLUGIN, "v0", "emulator", 5, 7, 8) + """
                    invoke-static { v5 }, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                    move-result-object v1
                """,
            )
        }
    }
}

package app.smartlife.patches.smartlife.shared.config

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.smartlife.patches.smartlife.misc.fix.signature.spoofSignaturePatch
import app.smartlife.patches.smartlife.shared.localRegisterCount
import app.smartlife.patches.smartlife.shared.logInfo
import app.smartlife.patches.smartlife.shared.logWarning
import app.smartlife.patches.smartlife.shared.matchAllLogged
import app.smartlife.patches.smartlife.shared.parameterRegister
import app.smartlife.patches.smartlife.shared.signature
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val EXTENSION_CLASS = "Lapp/smartlife/extension/ConfigOverrides;"
private const val FIXED_MARKER = "@smartlife-fixed-overrides@"

/** Flags forced at patch time by other patches, written into the extension in `finalize`. */
private val fixedOverrides = linkedMapOf<String, Boolean>()

/** How many PackConfig getters were hooked (0 means flag overrides are not in effect). */
internal var packConfigHookCount = 0
    private set

/**
 * Force a ThingNGConfig flag to [value] for every reader, independent of the runtime toggles.
 * Call from the `execute` block of a patch that depends on [configOverridePatch].
 */
internal fun forceConfigBoolean(key: String, value: Boolean) {
    fixedOverrides[key] = value
}

/**
 * Hooks the app's feature-flag getters so [ConfigOverrides] (extension) can override flags.
 * Shared dependency of the AI / ads / telemetry patches; not shown to users.
 */
internal val configOverridePatch = bytecodePatch(
    description = "Hooks the app's feature-flag getters so flags can be overridden.",
) {
    // Provides the extension (and the app context the AI toggle needs).
    dependsOn(spoofSignaturePatch)

    execute {
        // Dependents register their keys after this runs (they execute later).
        fixedOverrides.clear()
        packConfigHookCount = 0

        // 1. PackConfig getter: return the override before the reflection read.
        matchAllLogged(PackConfigGetterFingerprint, "PackConfig getter", expectUnique = true)
            .forEach { match ->
                val method = match.method
                val types = method.parameterTypes.map { it.toString() }
                val classRegister = parameterRegister(method, types.indexOf("Ljava/lang/Class;"))
                val keyRegister = parameterRegister(method, types.indexOf("Ljava/lang/String;"))
                val locals = localRegisterCount(method)

                val call = when {
                    locals < 1 -> null
                    classRegister <= 15 && keyRegister <= 15 ->
                        "invoke-static { v$classRegister, v$keyRegister }, "
                    locals >= 2 ->
                        "move-object/from16 v0, v$classRegister\n" +
                            "move-object/from16 v1, v$keyRegister\n" +
                            "invoke-static { v0, v1 }, "
                    else -> null
                }
                if (call == null) {
                    logWarning("PackConfig getter ${method.signature}: no free register, not hooked")
                    return@forEach
                }

                method.addInstructionsWithLabels(
                    0,
                    """
                        $call$EXTENSION_CLASS->override(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
                        move-result-object v0
                        if-eqz v0, :read_field
                        return-object v0
                        :read_field
                        nop
                    """,
                )
                packConfigHookCount++
            }
        if (packConfigHookCount == 0) {
            logWarning("PackConfig getter not hooked: flag overrides (AI / ads / telemetry) are not in effect")
        }

        // 2. Remote ("oem:config") boolean getter: a remote value can override PackConfig, so
        //    answer overridden keys before the remote lookup.
        matchAllLogged(RemoteConfigBooleanFingerprint, "Remote config getter", expectUnique = true)
            .forEach { match ->
                val method = match.method
                val keyRegister = parameterRegister(method, 0)
                if (localRegisterCount(method) < 1 || keyRegister > 15) {
                    logWarning("Remote config getter ${method.signature}: no free register, not hooked")
                    return@forEach
                }
                method.addInstructionsWithLabels(
                    0,
                    """
                        invoke-static { v$keyRegister }, $EXTENSION_CLASS->hasBooleanOverride(Ljava/lang/String;)Z
                        move-result v0
                        if-eqz v0, :read_remote
                        invoke-static { v$keyRegister }, $EXTENSION_CLASS->booleanOverride(Ljava/lang/String;)Z
                        move-result v0
                        return v0
                        :read_remote
                        nop
                    """,
                )
            }
    }

    finalize {
        if (fixedOverrides.isEmpty()) return@finalize

        // Append ";key=0|1" entries to the marker string returned by ConfigOverrides.fixedSpec().
        val method = mutableClassDefBy(EXTENSION_CLASS).methods.first { it.name == "fixedSpec" }
        val index = method.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.CONST_STRING &&
                ((instruction as ReferenceInstruction).reference as StringReference)
                    .string.startsWith(FIXED_MARKER)
        }
        if (index < 0) {
            logWarning("ConfigOverrides.fixedSpec marker not found: fixed flag overrides not applied")
            return@finalize
        }
        val register = (method.instructions[index] as OneRegisterInstruction).registerA
        val spec = FIXED_MARKER + fixedOverrides.entries.joinToString("") { (key, value) ->
            ";$key=${if (value) 1 else 0}"
        }
        method.replaceInstruction(index, "const-string v$register, \"$spec\"")
        logInfo("Fixed flag overrides: $fixedOverrides")
    }
}

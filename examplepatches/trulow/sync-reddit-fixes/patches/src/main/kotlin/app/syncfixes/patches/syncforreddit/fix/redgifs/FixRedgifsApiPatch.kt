/*
 * Adapted from KingOfPoptart/patcheddit (wchill/patcheddit#100) and wchill/patcheddit's Fix Redgifs API, GPLv3.
 */
package app.syncfixes.patches.syncforreddit.fix.redgifs

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.syncfixes.patches.syncforreddit.shared.Constants.COMPATIBILITY_SYNC_ALL
import app.syncfixes.patches.syncforreddit.shared.Constants.EXTENSION
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val fixRedgifsApiPatch = bytecodePatch(
    name = "Fix Redgifs API",
    description = "Fixes \"Error connecting to Redgifs\": answers the Redgifs endpoints Sync relies on that " +
        "were removed, uses Redgifs' temporary token, and fixes video ids taken from links like " +
        "redgifs.com/watch/{id}/?92. Works on Sync and Sync Pro. Turn off Patcheddit's \"Fix Redgifs API\" " +
        "when using this one: both change the same code.",
) {
    compatibleWith(*COMPATIBILITY_SYNC_ALL)

    extendWith(EXTENSION)

    execute {
        // Install the interceptor on the OkHttp client behind Volley: follow the getter BasicNetwork calls to
        // the static field it returns, then to the builder.build() whose result is stored in that field.
        val getterCall = VolleyClientGetterCallFingerprint.instructionMatches.first().instruction
        val getterRef = (getterCall as ReferenceInstruction).reference as MethodReference
        val helper = mutableClassDefBy(getterRef.definingClass)
        if (helper.sourceFile != "OkHttpHelper.java") {
            throw PatchException("Volley's OkHttp client getter is not in OkHttpHelper: ${getterRef.definingClass}")
        }
        val getter = helper.methods.single {
            it.name == getterRef.name && it.parameterTypes.isEmpty() && it.returnType == OKHTTP_CLIENT
        }
        val client = getter.instructions.single { it.opcode == Opcode.SGET_OBJECT }.fieldReference()

        val builder = helper.methods.singleOrNull { method ->
            method.implementation != null && method.instructions.any {
                it.opcode == Opcode.SPUT_OBJECT && it.fieldReference() == client
            }
        } ?: throw PatchException("No single method in OkHttpHelper sets $client")
        builder.apply {
            val store = instructions.indexOfFirst { it.opcode == Opcode.SPUT_OBJECT && it.fieldReference() == client }
            val build = instructions.subList(0, store).indexOfLast { instruction ->
                instruction is ReferenceInstruction && (instruction.reference as? MethodReference)?.let {
                    it.definingClass == OKHTTP_CLIENT_BUILDER && it.name == "build"
                } == true
            }
            if (build < 0) throw PatchException("OkHttpHelper.$name: no builder.build() before $client is set")
            val register = when (val call = instructions[build]) {
                is FiveRegisterInstruction -> call.registerC
                is RegisterRangeInstruction -> call.startRegister
                else -> throw PatchException("Unexpected build() call: ${call.opcode}")
            }
            replaceInstruction(
                build,
                "invoke-static/range { v$register .. v$register }, " +
                    "$EXTENSION_CLASS->install($OKHTTP_CLIENT_BUILDER)$OKHTTP_CLIENT",
            )
        }

        // Send Sync's own user agent: Redgifs ties each token to the user agent that requested it.
        ExtensionUserAgentFingerprint.method.addInstructions(
            0,
            """
                invoke-static { }, ${UserAgentFingerprint.method}
                move-result-object v0
                return-object v0
            """,
        )

        // Take the gif id from the URL with the query and fragment removed first.
        GetGfycatIdFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->extractGifId(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p0
                return-object p0
            """,
        )
    }
}

private fun Instruction.fieldReference() = ((this as? ReferenceInstruction)?.reference as? FieldReference)?.toString()

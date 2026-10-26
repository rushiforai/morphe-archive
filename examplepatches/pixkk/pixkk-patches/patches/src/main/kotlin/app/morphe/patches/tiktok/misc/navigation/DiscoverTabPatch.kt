/*
 * Copyright 2026 pixkk
 */
package app.morphe.patches.tiktok.misc.navigation

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.util.addInstruction
import app.morphe.util.addInstructions
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val WHAT = "Discover tab"
private const val EXTENSION = "Lapp/pixkk/extension/navigation/DiscoverTab;"
private const val MAP = "Ljava/util/Map;"

/**
 * The bottom bar's map of position to the tags of the tabs that may take it, as the class that
 * builds the bar ("BottomTabOperator") hands it out. It answers from one of two maps, once the
 * experiment has chosen, so it returns in four places. The class is renamed on every build; what
 * stays is the string its bar builder logs, and that this getter is the one instance method that
 * returns a map by calling two static map builders of its own class.
 */
internal object BottomTabMapFingerprint : Fingerprint(
    returnType = MAP,
    parameters = listOf(),
    custom = { method, classDef ->
        !AccessFlags.STATIC.isSet(method.accessFlags) &&
            classDef.methods.any { other ->
                other.implementation?.instructions?.any {
                    it.getReference<StringReference>()?.string == "BottomTabOperator"
                } == true
            } &&
            method.implementation?.instructions?.count { instruction ->
                val reference = instruction.getReference<MethodReference>()
                instruction.opcode == Opcode.INVOKE_STATIC && reference != null &&
                    reference.definingClass == classDef.type && reference.returnType == MAP
            } == 2
    },
)

/** The bar builder's tab list method, `LJII` of the class that logs "BottomTabOperator". */
internal object BottomTabOperatorFingerprint : Fingerprint(
    name = "LJII",
    returnType = "Lkotlin/Pair;",
    parameters = listOf(),
    custom = { _, classDef ->
        classDef.methods.any { other ->
            other.implementation?.instructions?.any {
                it.getReference<StringReference>()?.string == "BottomTabOperator"
            } == true
        }
    },
)

@Suppress("unused")
val discoverTabPatch = bytecodePatch(
    name = WHAT,
    description = "Puts the Discover tab (the compass) in the bottom bar where Friends is. It can " +
        "be turned off in the Pixkk Patches settings.",
) {
    category("Interface")
    compatibleWith(*AppCompatibilities.tiktok())
    dependsOn(sharedExtensionPatch)

    execute {
        run {
            val operator = BottomTabOperatorFingerprint.method
            val body = operator.implementation!!.instructions.toList()
            val cached = body.withIndex().firstNotNullOfOrNull { (at, instruction) ->
                val field = instruction.getReference<FieldReference>()
                if (instruction.opcode == Opcode.IGET_OBJECT && field != null && field.type == MAP &&
                    field.definingClass == operator.definingClass &&
                    body[at + 1].opcode == Opcode.IF_NEZ
                ) field else null
            } ?: throw PatchException("$WHAT: the bar builder keeps no cached map")
            operator.addInstructions(
                0,
                """
                    move-object/from16 v1, p0
                    iget-object v0, v1, $cached
                    invoke-static { v0 }, $EXTENSION->swap(Ljava/util/Map;)Ljava/util/Map;
                    move-result-object v0
                    iput-object v0, v1, $cached
                """,
            )
        }

        val matches = BottomTabMapFingerprint.matchAll()
        if (matches.size != 1) throw PatchException("$WHAT: ${matches.size} bottom tab maps found")
        val method = matches.single().method
        val returns = method.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_OBJECT }
        if (returns.isEmpty()) throw PatchException("$WHAT: the bottom tab map is never returned")
        // From the back, so an insert does not move the returns still to be written.
        returns.reversed().forEach { (index, instruction) ->
            val register = (instruction as OneRegisterInstruction).registerA
            if (register > 15) throw PatchException("$WHAT: the registers no longer fit a four-bit call")
            method.addInstructions(
                index,
                """
                    invoke-static { v$register }, $EXTENSION->swap(Ljava/util/Map;)Ljava/util/Map;
                    move-result-object v$register
                """,
            )
        }
    }
}

package app.swiftkey.patches.gesture

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByStrings
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.swiftkey.patches.shared.Constants.COMPATIBILITY_SWIFTKEY
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val GETTER_METHOD = "morpheIsGestureInputDisabled"
private const val SETTER_METHOD = "morpheSetGestureInputDisabled"

private fun fieldReference(field: Field): String =
    "${field.definingClass}->${field.name}:${field.type}"

private fun methodReference(method: MethodReference): String =
    "${method.definingClass}->${method.name}(" +
        method.parameterTypes.joinToString("") + ")${method.returnType}"

/**
 * Adds a third value, "Disabled", to SwiftKey's Gesture input setting.
 *
 * SwiftKey models gesture input as Flow, SWIPE, or NEITHER. NEITHER is already used when
 * accessibility "Explore by touch" is enabled, and it makes the keyboard add neither Flow
 * nor swipe handlers. This patch reuses that state for a user-selectable Disabled option.
 */
@Suppress("unused")
val gestureInputDisabledPatch = patch(
    name = "Gesture input: Disabled",
    description = "Adds a Disabled option to Gesture input, turning off both Flow and keyboard gestures.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SWIFTKEY)

    execute {
        // region Resources

        // Literal values are used so the patch does not depend on adding string resources and
        // resolving their generated ids.
        resourceXml("res/values/arrays.xml").use { arrays ->
            arrays.resource("pref_flow_gestures_entries").appendChild("item") {
                text = "Disabled\nNo Flow and no keyboard gestures."
            }
            arrays.resource("pref_flow_gestures_entry_values").appendChild("item") {
                text = DISABLED_VALUE
            }
        }

        // endregion

        // region Preference class

        val preferenceClass = mutableClassDefBy(FLOW_VS_GESTURES_CLASS)
        val prefsField = preferenceClass.fields.singleOrNull()?.takeIf { it.type.startsWith("L") }
            ?: throw PatchException(
                "Could not find the preferences field of FlowVsGesturesListPreference."
            )
        val prefsType = prefsField.type
        val prefsClass = mutableClassDefBy(prefsType)

        val sharedPreferencesField = prefsClass.fields.singleOrNull {
            it.type == "Landroid/content/SharedPreferences;"
        } ?: throw PatchException("Could not find the SharedPreferences field of $prefsType.")
        val sharedPreferencesRef = fieldReference(sharedPreferencesField)

        fun addHelperMethods() {
            if (prefsClass.methods.any { it.name == GETTER_METHOD || it.name == SETTER_METHOD }) {
                throw PatchException("SwiftKey already has the gesture preference helpers.")
            }

            prefsClass.methods.add(
                ImmutableMethod(
                    prefsType,
                    GETTER_METHOD,
                    emptyList(),
                    "Z",
                    AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                    null,
                    null,
                    MutableMethodImplementation(4),
                ).toMutable().apply {
                    addInstructions(
                        0,
                        """
                            iget-object v0, p0, $sharedPreferencesRef
                            const-string v1, "$DISABLED_PREF_KEY"
                            const/4 v2, 0x0
                            invoke-interface { v0, v1, v2 }, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
                            move-result v0
                            return v0
                        """,
                    )
                },
            )

            prefsClass.methods.add(
                ImmutableMethod(
                    prefsType,
                    SETTER_METHOD,
                    listOf(ImmutableMethodParameter("Z", null, null)),
                    "V",
                    AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                    null,
                    null,
                    MutableMethodImplementation(4),
                ).toMutable().apply {
                    addInstructions(
                        0,
                        """
                            iget-object v0, p0, $sharedPreferencesRef
                            invoke-interface { v0 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences${'$'}Editor;
                            move-result-object v0
                            const-string v1, "$DISABLED_PREF_KEY"
                            invoke-interface { v0, v1, p1 }, Landroid/content/SharedPreferences${'$'}Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences${'$'}Editor;
                            move-result-object v0
                            invoke-interface { v0 }, Landroid/content/SharedPreferences${'$'}Editor;->apply()V
                            return-void
                        """,
                    )
                },
            )
        }

        addHelperMethods()

        // endregion

        // region Store and restore the selected value

        val valueMethod = FlowVsGesturesValueFingerprint.method
        val valueMatches = FlowVsGesturesValueFingerprint.instructionMatches
        val summaryMatch = valueMatches[3]
        val summaryMethod = methodReference(summaryMatch.methodReference)

        // Insert before the Flow/Gestures summary branch, while the value parameter (v4)
        // still holds the selected entry value.
        val insertIndex = valueMatches[0].index + 1
        valueMethod.addInstructionsWithLabels(
            insertIndex,
            """
                const-string v1, "$DISABLED_VALUE"
                invoke-virtual { v4, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v2
                iget-object v0, v3, ${fieldReference(prefsField)}
                invoke-virtual { v0, v2 }, $prefsType->$SETTER_METHOD(Z)V
                if-eqz v2, :notDisabled
                const-string v1, "Disabled"
                invoke-virtual { v3, v1 }, $summaryMethod
                return-void
            """,
            ExternalLabel("notDisabled", insertIndex),
        )

        val stateMethod = FlowVsGesturesStateFingerprint.method
        val setValueMethod =
            "$FLOW_VS_GESTURES_CLASS->${valueMethod.name}(${valueMethod.parameterTypes.joinToString("")})V"

        stateMethod.addInstructionsWithLabels(
            0,
            """
                iget-object v0, p0, ${fieldReference(prefsField)}
                invoke-virtual { v0 }, $prefsType->$GETTER_METHOD()Z
                move-result v0
                if-eqz v0, :notDisabled
                const-string v2, "$DISABLED_VALUE"
                invoke-virtual { p0, v2 }, $setValueMethod
                return-void
            """,
            ExternalLabel("notDisabled", 0),
        )

        // endregion

        // region Keyboard layout

        // SwiftKey renames its obfuscated classes between releases. Locate the FLOW/SWIPE/NEITHER
        // enum and the method that chooses between them from the bytecode instead of naming them.
        val modes = findGestureModes()
        val decisionSite = findDecisionSite(modes)

        val presenterClass = mutableClassDefBy(decisionSite.method.definingClass)
        val presenterMethod = presenterClass.methods.first {
            it.name == decisionSite.method.name &&
                it.parameterTypes == decisionSite.method.parameterTypes &&
                it.returnType == decisionSite.method.returnType
        }
        val presenterPrefsField = presenterClass.fields.singleOrNull {
            it.type == prefsType && it.name == "d"
        } ?: throw PatchException(
            "Could not find the preferences field of ${decisionSite.method.definingClass}."
        )
        val neitherInstruction =
            presenterMethod.implementation!!.instructions[decisionSite.neitherIndex]

        // Reuse SwiftKey's own NEITHER state, which adds no Flow or swipe handlers.
        // The accessibility check is a branch target, so insert before that label to make
        // every layout path run this check.
        presenterMethod.addInstructionsAtControlFlowLabel(
            decisionSite.insertIndex,
            """
                iget-object v3, v0, ${fieldReference(presenterPrefsField)}
                invoke-virtual { v3 }, $prefsType->$GETTER_METHOD()Z
                move-result v3
                if-eqz v3, :continue
                goto :neither
                :continue
                nop
            """,
            ExternalLabel("neither", neitherInstruction),
        )

        // endregion
    }
}

private data class GestureModes(
    val enumType: String,
    val flow: FieldReference,
    val swipe: FieldReference,
    val neither: FieldReference,
)

private data class DecisionSite(
    val method: Method,
    val insertIndex: Int,
    val neitherIndex: Int,
)

/**
 * Finds the obfuscated enum that models gesture input as FLOW, SWIPE, and NEITHER.
 *
 * Enum constant names are kept in the static initializer strings even when the class and
 * fields are obfuscated.
 */
private fun findGestureModes(): GestureModes {
    for (classDef in classDefByStrings("NEITHER")) {
        if (classDef.fields.count { it.type == classDef.type } != 3) continue
        val initializer = classDef.methods.firstOrNull { it.name == "<clinit>" } ?: continue
        val references = mutableMapOf<String, FieldReference>()
        var lastString: String? = null

        val initializerInstructions = initializer.implementation?.instructions ?: continue
        for (instruction in initializerInstructions) {
            when (instruction.opcode) {
                Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO -> {
                    lastString = (instruction as ReferenceInstruction).reference
                        .let { (it as StringReference).string }
                }

                Opcode.SPUT_OBJECT -> {
                    val field = (instruction as ReferenceInstruction).reference as? FieldReference
                    val name = lastString
                    if (field != null && name != null && field.definingClass == classDef.type &&
                        field.type == classDef.type
                    ) {
                        references[name] = field
                    }
                }

                else -> {}
            }
        }

        val flow = references["FLOW"] ?: continue
        val swipe = references["SWIPE"] ?: continue
        val neither = references["NEITHER"] ?: continue
        return GestureModes(classDef.type, flow, swipe, neither)
    }

    throw PatchException("Could not find SwiftKey's gesture mode enum.")
}

/**
 * Finds the method that maps the Flow preference and accessibility state to the enum.
 *
 * The method contains the four enum reads `NEITHER, NEITHER, FLOW, SWIPE` in that order.
 */
private fun findDecisionSite(modes: GestureModes): DecisionSite {
    var result: DecisionSite? = null

    classDefForEach { classDef ->
        if (result != null) return@classDefForEach

        for (method in classDef.methods) {
            val instructions = method.implementation?.instructions?.toList() ?: continue
            val enumReads = instructions.withIndex().mapNotNull { (index, instruction) ->
                if (instruction.opcode != Opcode.SGET_OBJECT) return@mapNotNull null
                val field = (instruction as ReferenceInstruction).reference as? FieldReference
                    ?: return@mapNotNull null
                if (field.definingClass != modes.enumType) return@mapNotNull null
                index to field.toString()
            }

            for (start in 0..enumReads.size - 4) {
                val reads = enumReads.subList(start, start + 4)
                if (reads[0].second != modes.neither.toString() ||
                    reads[1].second != modes.neither.toString() ||
                    reads[2].second != modes.flow.toString() ||
                    reads[3].second != modes.swipe.toString()
                ) {
                    continue
                }

                val neitherIndex = reads[0].first
                var insertIndex = neitherIndex - 1
                while (insertIndex >= 0 && instructions[insertIndex].opcode != Opcode.IGET_OBJECT) {
                    insertIndex--
                }
                if (insertIndex < 0 || neitherIndex - insertIndex > 8) continue

                result = DecisionSite(method, insertIndex, neitherIndex)
                return@classDefForEach
            }
        }
    }

    return result ?: throw PatchException("Could not find SwiftKey's gesture mode selection.")
}

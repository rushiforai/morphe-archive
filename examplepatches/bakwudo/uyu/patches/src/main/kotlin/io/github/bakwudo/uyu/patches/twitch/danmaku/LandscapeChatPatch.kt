package io.github.bakwudo.uyu.patches.twitch.danmaku

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import io.github.bakwudo.uyu.patches.util.addInstructionsAtControlFlowLabel
import io.github.bakwudo.uyu.patches.util.thisRegister
import io.github.bakwudo.uyu.patches.util.writesRegister

private const val EXTENSION_CLASS = "$DANMAKU_EXTENSION_PACKAGE/LandscapeChatPatch;"

private const val STRING = "Ljava/lang/String;"
private const val SHARED_PREFERENCES = "Landroid/content/SharedPreferences;"

/**
 * Lets the extension keep the landscape chat off and hide the chat mode button.
 */
internal fun BytecodePatchContext.hookLandscapeChat() {
    hookPreferenceGetters()
    hookChatViewModel()
    hookBottomControlsRender()
}

/**
 * The landscape chat mode is read both directly and by a preference observer, and both go
 * through the string getters of Twitch's preferences base class. Each string getter first asks
 * the extension for a value to use instead. Each boolean getter passes the stored value through
 * the extension, which can change it.
 *
 * The getters use all their registers, so each one is moved to a new private method and
 * replaced with a method that calls it and the extension.
 */
private fun BytecodePatchContext.hookPreferenceGetters() {
    val baseClass = mutableClassDefBy(
        TheatrePreferencesConstructorFingerprint.classDef.superclass
            ?: throw PatchException("Theatre preferences have no superclass."),
    )

    fun getters(returnType: String, sharedPreferencesMethod: String) = baseClass.methods.filter { method ->
        method.returnType == returnType &&
            method.parameterTypes.map(CharSequence::toString) == listOf(STRING, returnType) &&
            !AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.instructions.any { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == SHARED_PREFERENCES && reference.name == sharedPreferencesMethod
            }
    }

    val stringGetters = getters(STRING, "getString")
    val booleanGetters = getters("Z", "getBoolean")
    if (stringGetters.isEmpty()) throw PatchException("String preference getters not found.")
    if (booleanGetters.isEmpty()) throw PatchException("Boolean preference getters not found.")

    stringGetters.forEach { getter ->
        baseClass.wrapMethod(getter) { original ->
            """
                invoke-static { p1 }, $EXTENSION_CLASS->overridePreference($STRING)$STRING
                move-result-object v0
                if-eqz v0, :original
                return-object v0
                :original
                invoke-direct { p0, p1, p2 }, $original
                move-result-object v0
                return-object v0
            """
        }
    }
    booleanGetters.forEach { getter ->
        baseClass.wrapMethod(getter) { original ->
            """
                invoke-direct { p0, p1, p2 }, $original
                move-result v0
                invoke-static { p1, v0 }, $EXTENSION_CLASS->overrideBooleanPreference(${STRING}Z)Z
                move-result v0
                return v0
            """
        }
    }
}

/**
 * Moves a `(String, value) -> value` method to a new private method, and replaces it with
 * [smali], which gets the smali reference of the moved method. The new code has v0 and the
 * parameters p0 to p2.
 */
private fun MutableClass.wrapMethod(method: MutableMethod, smali: (original: String) -> String) {
    val originalName = "uyuOriginal_${method.name}"
    val parameters = method.parameterTypes.joinToString("")

    methods.add(
        ImmutableMethod(
            type,
            originalName,
            method.parameters,
            method.returnType,
            AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
            null,
            null,
            MutableMethodImplementation(method.implementation!!),
        ).toMutable(),
    )

    methods.remove(method)
    methods.add(
        ImmutableMethod(
            type,
            method.name,
            method.parameters,
            method.returnType,
            method.accessFlags,
            method.annotations,
            method.hiddenApiRestrictions,
            MutableMethodImplementation(4),
        ).toMutable().apply {
            addInstructionsWithLabels(0, smali("$type->$originalName($parameters)${method.returnType}"))
        },
    )
}

/**
 * The theatre's chat view model holds the landscape chat mode and flags that open the chat
 * beside the video whatever the mode is: the chat overlay, the chat tray, expanded community
 * highlights, extensions, and the chat input. Its constructor combines those flags into one
 * field. When the extension says so, the end of the constructor sets the mode to hidden and
 * clears the flags and the combined field.
 *
 * The flags are the parameters the constructor tests to compute the combined field, so they
 * are found without relying on their names.
 */
private fun BytecodePatchContext.hookChatViewModel() {
    val viewModel = TheatreChatViewModelToStringFingerprint.classDef
    val modeType = viewModel.fields.singleOrNull {
        !AccessFlags.STATIC.isSet(it.accessFlags) && classDefByOrNull(it.type)?.superclass == "Ljava/lang/Enum;"
    }?.type ?: throw PatchException("Chat mode field not found in the chat view model.")
    if (classDefBy(modeType).fields.none { it.name == "Hidden" && AccessFlags.STATIC.isSet(it.accessFlags) }) {
        throw PatchException("Chat mode Hidden not found.")
    }

    val constructor = viewModel.methods.singleOrNull {
        it.name == "<init>" && it.parameterTypes.firstOrNull()?.toString() == modeType
    } ?: throw PatchException("Chat view model constructor not found.")

    val thisRegister = constructor.thisRegister
    if (constructor.writesRegister(thisRegister) || thisRegister + 1 > 15) {
        throw PatchException("Chat view model constructor uses unexpected registers.")
    }
    // The parameters after the mode are booleans, one register each.
    val parameterTypes = constructor.parameterTypes.map(CharSequence::toString)
    val booleanRegisters = parameterTypes.indices
        .filter { parameterTypes[it] == "Z" }
        .map { thisRegister + 1 + it }
    if (booleanRegisters.size != parameterTypes.size - 1) {
        throw PatchException("Chat view model constructor has unexpected parameters.")
    }

    // Fields set by the constructor, by the register they are set from.
    val stores = constructor.instructions.mapNotNull { instruction ->
        if (instruction.opcode != Opcode.IPUT_BOOLEAN && instruction.opcode != Opcode.IPUT_OBJECT) return@mapNotNull null
        val field = (instruction as ReferenceInstruction).reference as FieldReference
        if (field.definingClass != viewModel.type) return@mapNotNull null
        (instruction as TwoRegisterInstruction).registerA to field
    }
    val modeField = stores.singleOrNull { it.second.type == modeType }?.second
        ?: throw PatchException("Chat mode is not set in the chat view model constructor.")
    val combinedField = stores.singleOrNull { it.first !in booleanRegisters && it.second.type == "Z" }?.second
        ?: throw PatchException("Combined chat flag not found in the chat view model.")
    val testedRegisters = constructor.instructions
        .filter { it.opcode == Opcode.IF_EQZ || it.opcode == Opcode.IF_NEZ }
        .map { (it as OneRegisterInstruction).registerA }
        .filter { it in booleanRegisters }
        .toSet()
    val flagFields = testedRegisters.map { register ->
        stores.singleOrNull { it.first == register }?.second
            ?: throw PatchException("Chat flag in register v$register is not stored.")
    }
    if (flagFields.isEmpty()) throw PatchException("Chat flags not found in the chat view model.")

    val clearFlags = (flagFields + combinedField).joinToString("\n") {
        "iput-boolean p1, p0, ${viewModel.type}->${it.name}:Z"
    }
    val returnIndices = constructor.instructions.indices.filter {
        constructor.instructions[it].opcode == Opcode.RETURN_VOID
    }
    // p1 is free at the end: the constructor has stored all parameters.
    returnIndices.asReversed().forEach { index ->
        constructor.addInstructionsAtControlFlowLabel(
            index,
            """
                invoke-static { }, $EXTENSION_CLASS->isLandscapeChatHidden()Z
                move-result p1
                if-eqz p1, :keep
                sget-object p1, $modeType->Hidden:$modeType
                iput-object p1, p0, ${viewModel.type}->${modeField.name}:$modeType
                const/4 p1, 0x0
                $clearFlags
                :keep
                nop
            """,
        )
    }
}

/**
 * Tells the extension each time the player's bottom controls are rendered, right after they
 * set the chat mode button's visibility. The render method is called both through the base view
 * delegate's bridge method and directly, so the hook goes at its end.
 */
private fun BytecodePatchContext.hookBottomControlsRender() {
    val stateType = BottomControlsStateToStringFingerprint.classDef.type
    val renderFingerprint = Fingerprint(
        returnType = "V",
        parameters = listOf(stateType),
        custom = { _, classDef -> classDef.superclass == RX_VIEW_DELEGATE },
    )

    renderFingerprint.method.apply {
        // The hook passes p0, so the method must not reuse that register.
        if (writesRegister(thisRegister)) {
            throw PatchException("Render method of the bottom controls reuses the register of this.")
        }

        val returnIndices = instructions.indices.filter { instructions[it].opcode == Opcode.RETURN_VOID }
        if (returnIndices.isEmpty()) throw PatchException("Render method of the bottom controls has no return.")
        returnIndices.asReversed().forEach { index ->
            addInstructionsAtControlFlowLabel(
                index,
                "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onBottomControlsRendered(Ljava/lang/Object;)V",
            )
        }
    }
}

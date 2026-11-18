package app.saketh.patches.webnovel.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.saketh.patches.webnovel.controls.hookAt
import app.saketh.patches.webnovel.reader.invalidateCall
import app.saketh.patches.webnovel.reader.readerPaintFontsFingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val HOOKS = "Lapp/saketh/extension/theme/ThemeHooks;"
private const val PREFERENCES = "Lcom/qidian/QDReader/components/setting/QDReaderUserSetting;"

/** Persisted reader palette settings and the renderer role each one feeds. */
private val PALETTE_SETTINGS = mapOf(
    "SettingBackColor" to "readerBackground",
    "SettingFontColor" to "readerText",
    "SettingHeaderFontColor" to "readerMuted",
    "SettingFooterFontColor" to "readerMuted",
)

internal fun patchReaderColors() {
    val preferences = mutableClassDefBy(PREFERENCES)
    val nightSetting = ReaderNightSettingFingerprint.method
    // The reader-mode getter delegates to the persisted night setting.
    preferences.methods.single { method ->
        method.parameterTypes.isEmpty() && method.returnType == "I" && method.calls().any {
            it.definingClass == nightSetting.definingClass && it.name == nightSetting.name && it.parameterTypes.isEmpty()
        }
    }.mapReturns("recordReaderMode")

    val roles = preferences.paletteGetters()
    val paints = readerPaintFontsFingerprint().classDef
    val loader = paints.methods.single { method ->
        method.parameterTypes.isEmpty() && method.calls().any { it.definingClass == PREFERENCES && it.name in roles }
    }
    // The loader caches each palette getter in a renderer field; the renderer's setters overwrite those fields.
    val fieldRoles = mutableMapOf<String, String>()
    loader.apply {
        val instructions = implementation!!.instructions
        val calls = instructions.withIndex().filter {
            val call = (it.value as? ReferenceInstruction)?.reference as? MethodReference
            call?.definingClass == PREFERENCES && call.name in roles
        }
        val names = calls.map { ((it.value as ReferenceInstruction).reference as MethodReference).name }
        check(names.toSet() == roles.keys) { "Reader palette loader calls $names, expected ${roles.keys}" }
        calls.forEach { call ->
            val store = instructions[call.index + 2]
            check(instructions[call.index + 1].opcode == Opcode.MOVE_RESULT && store.opcode == Opcode.IPUT)
            fieldRoles[((store as ReferenceInstruction).reference as FieldReference).name] =
                roles.getValue(((call.value as ReferenceInstruction).reference as MethodReference).name)
        }
        // Transform renderer inputs, not preference getters: native preset-saving still sees original values.
        calls.reversed().forEach { call ->
            val name = ((call.value as ReferenceInstruction).reference as MethodReference).name
            mapResult(call.index, roles.getValue(name))
        }
    }
    val setters = paints.methods.mapNotNull { method ->
        if (method.parameterTypes != listOf("I") || method.returnType != "V") return@mapNotNull null
        val first = method.implementation?.instructions?.firstOrNull() ?: return@mapNotNull null
        val field = ((first as? ReferenceInstruction)?.reference as? FieldReference)?.name
        val parameter = method.implementation!!.registerCount - 1
        if (first.opcode != Opcode.IPUT || (first as OneRegisterInstruction).registerA != parameter) return@mapNotNull null
        field?.let(fieldRoles::get)?.let { method to it }
    }
    check(setters.size == 4) { "Expected four reader palette setters, found ${setters.map { it.first.name }}" }
    setters.forEach { (method, hook) ->
        method.addInstructions(0, """
            invoke-static/range { p1 .. p1 }, $HOOKS->$hook(I)I
            move-result p1
        """)
    }

    listOf(
        ReaderPageBackgroundFingerprint to "readerPageBackground(Landroid/widget/FrameLayout;)Z",
        ReaderChromeBackgroundFingerprint to "readerChromeBackground(Landroid/view/ViewGroup;Landroid/widget/ImageView;)Z",
    ).forEach { (fingerprint, hook) ->
        fingerprint.method.apply {
            val register = findFreeRegister(0)
            check(register < 256)
            val last = if (fingerprint == ReaderPageBackgroundFingerprint) "p1" else "p2"
            addInstructionsWithLabels(0, """
                invoke-static/range { p1 .. $last }, $HOOKS->$hook
                move-result v$register
                if-eqz v$register, :original
                return-void
            """, ExternalLabel("original", 0))
        }
    }

    ReaderHeaderColorsFingerprint.method.apply {
        // The reader tint helper is the class that colors the header's title text.
        val tint = calls().single { it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/widget/TextView;", "I") }.definingClass
        val calls = implementation!!.instructions.withIndex().filter {
            val call = (it.value as? ReferenceInstruction)?.reference as? MethodReference
            call?.definingClass == tint && call.returnType == "V" && call.parameterTypes.size == 2 &&
                call.parameterTypes[0].toString() in setOf("Landroid/widget/ImageView;", "Landroid/widget/TextView;")
        }
        check(calls.size == 2)
        calls.reversed().forEach { call ->
            val method = (call.value as ReferenceInstruction).reference as MethodReference
            val register = (call.value as FiveRegisterInstruction).registerC
            val hook = if (method.parameterTypes[0].toString() == "Landroid/widget/ImageView;") "readerIcon(Landroid/widget/ImageView;)V" else "readerLabel(Landroid/widget/TextView;)V"
            hookAt(call.index + 1, "invoke-static/range { v$register .. v$register }, $HOOKS->$hook")
        }
    }
    ReaderSpanMutedFingerprint.let { it.method.mapResult(it.instructionMatches.last().index, "readerMuted") }
    mutableClassDefBy("Lcom/qidian/Int/reader/read/menu/WReaderMenuBottomRowView;").methods.single {
        it.parameterTypes == listOf("Z") && it.returnType == "I"
    }.mapReturns("readerSelectionId")
    ReaderThemeMenuFingerprint.method.apply {
        // Each theme swatch border is drawn by the same static (View, width, color) helper.
        val calls = implementation!!.instructions.withIndex().filter {
            val call = (it.value as? ReferenceInstruction)?.reference as? MethodReference
            it.value.opcode == Opcode.INVOKE_STATIC && call?.returnType == "V" &&
                call.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/View;", "F", "I")
        }
        check(calls.size == 2)
        calls.reversed().forEach { call ->
            val register = (call.value as FiveRegisterInstruction).registerE
            hookAt(call.index, """
                invoke-static/range { v$register .. v$register }, $HOOKS->readerSelectionId(I)I
                move-result v$register
            """)
        }
    }

    val invalidate = paints.invalidateCall()
    val changes = mutableClassDefBy("Lapp/saketh/extension/controls/PatchControlsActivity;").methods.flatMap { method ->
        method.implementation?.instructions?.withIndex()?.filter {
            val call = (it.value as? ReferenceInstruction)?.reference as? MethodReference
            call?.name == "recreate" && call.parameterTypes.isEmpty()
        }?.map { method to it.index } ?: emptyList()
    }
    check(changes.size == 1)
    // Recreate is reached only after an appearance choice changes, never during early application setup.
    changes.forEach { (method, index) -> method.hookAt(index, invalidate) }
}

/** Reads the persisted reader night setting. */
private object ReaderNightSettingFingerprint : Fingerprint(
    isStatic = true,
    returnType = "I",
    parameters = listOf(),
    strings = listOf("SettingReadingIsNight"),
)

/** Paints the reader page background from the active theme, night color or saved palette. */
private object ReaderPageBackgroundFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/widget/FrameLayout;", "Ljava/lang/Integer;"),
    strings = listOf("reader targetView is null"),
)

/** Paints the reader header/footer background from the active theme or saved palette. */
private object ReaderChromeBackgroundFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/view/ViewGroup;", "Landroidx/appcompat/widget/AppCompatImageView;", "I", "F"),
    strings = listOf("read headerorfooter: themeId="),
)

/** Colors the reader header's back icon and title. */
private object ReaderHeaderColorsFingerprint : Fingerprint(
    definingClass = "Lcom/yuewen/webnovel/wengine/view/WQDHeaderView;",
    returnType = "V",
    parameters = listOf(),
    strings = listOf("bookmarkImage"),
)

/** Recolors highlighted reader spans with the medium text color. */
private object ReaderSpanMutedFingerprint : Fingerprint(
    definingClass = "Lcom/yuewen/webnovel/wengine/view/WTextView;",
    returnType = "Ljava/lang/CharSequence;",
    parameters = listOf("Landroid/text/SpannableString;"),
    filters = listOf(
        fieldAccess(name = "reader_color_text_medium"),
        methodCall(parameters = listOf("I"), returnType = "I", location = MatchAfterImmediately()),
    ),
)

/** Marks the selected reader theme swatch. */
private object ReaderThemeMenuFingerprint : Fingerprint(
    definingClass = "Lcom/qidian/QDReader/readerengine/view/menu/MenuThemeView;",
    returnType = "V",
    parameters = listOf("I"),
    strings = listOf("read_theme"),
)

private fun MutableMethod.calls(): List<MethodReference> =
    implementation?.instructions.orEmpty().mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }

/**
 * Maps each palette getter to its renderer role through the setting key it reads,
 * either directly or through the field a loader fills from that key.
 */
private fun MutableClass.paletteGetters(): Map<String, String> {
    val fieldKeys = mutableMapOf<String, String>()
    fun MutableMethod.lastKey(): String? {
        val strings = mutableMapOf<Int, String>()
        var key: String? = null
        implementation?.instructions.orEmpty().forEach { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            when {
                reference is StringReference -> strings[(instruction as OneRegisterInstruction).registerA] = reference.string
                reference is MethodReference && reference.name == "GetSetting" ->
                    key = (instruction as? FiveRegisterInstruction)?.registerD?.let(strings::get)
                instruction.opcode == Opcode.IPUT && reference is FieldReference && reference.definingClass == type -> {
                    key?.let { fieldKeys.putIfAbsent(reference.name, it) }
                    key = null
                }
                instruction.opcode.setsRegister() ->
                    (instruction as? OneRegisterInstruction)?.let { strings.remove(it.registerA) }
            }
        }
        return key
    }
    val directKeys = methods.associateWith { it.lastKey() }
    return methods.filter { it.parameterTypes.isEmpty() && it.returnType == "I" }.mapNotNull { getter ->
        val instructions = getter.implementation?.instructions.orEmpty()
        val key = if (instructions.size == 2 && instructions[0].opcode == Opcode.IGET) {
            fieldKeys[((instructions[0] as ReferenceInstruction).reference as FieldReference).name]
        } else {
            directKeys[getter]
        }
        key?.let(PALETTE_SETTINGS::get)?.let { getter.name to it }
    }.toMap()
}

private fun MutableMethod.mapReturns(hook: String) {
    implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN }
        .map { it.index to (it.value as OneRegisterInstruction).registerA }.reversed().forEach { (index, register) ->
            hookAt(index, """
                invoke-static/range { v$register .. v$register }, $HOOKS->$hook(I)I
                move-result v$register
            """)
        }
}

private fun MutableMethod.mapResult(call: Int, hook: String) {
    val result = implementation!!.instructions[call + 1]
    check(result.opcode == Opcode.MOVE_RESULT)
    val register = (result as OneRegisterInstruction).registerA
    hookAt(call + 2, """
        invoke-static/range { v$register .. v$register }, $HOOKS->$hook(I)I
        move-result v$register
    """)
}

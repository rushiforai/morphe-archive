package app.template.patches.samsungkeyboard.features

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.samsungkeyboard.controls.SAMSUNG_CONTROLS_PACKAGE
import app.template.patches.samsungkeyboard.controls.SamsungKeyboardControlsCategory
import app.template.patches.samsungkeyboard.controls.choiceFeatures
import app.template.patches.samsungkeyboard.controls.requireLocal
import app.template.patches.samsungkeyboard.controls.samsungKeyboardControls
import app.template.patches.shared.Constants.COMPATIBILITY_SAMSUNG_KEYBOARD
import app.template.patches.shared.addInstructionsAtControlFlowLabelChecked
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.addHevalValueHelper
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.hevalcontrols.filterThroughHevalHelper
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private val log = java.util.logging.Logger.getLogger("SamsungKeyboard")

private fun Instruction.field() = (this as? ReferenceInstruction)?.reference as? FieldReference
private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
private fun Instruction.register() = (this as OneRegisterInstruction).registerA

/** Whether the instruction names register [r] (or, for a wide operation, the register before it). Invoke arguments that are wide are caught only by name; stock has none here. */
private fun Instruction.touches(r: Int): Boolean {
    val used = buildList {
        if (this@touches is OneRegisterInstruction) add(registerA)
        if (this@touches is com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction) add(registerB)
        if (this@touches is com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction) add(registerC)
        if (this@touches is FiveRegisterInstruction) {
            val n = registerCount
            if (n > 0) add(registerC)
            if (n > 1) add(registerD)
            if (n > 2) add(registerE)
            if (n > 3) add(registerF)
            if (n > 4) add(registerG)
        }
        if (this@touches is RegisterRangeInstruction) addAll(startRegister until startRegister + registerCount)
    }
    val wide = opcode.name.contains("WIDE") || opcode.name.endsWith("_LONG") || opcode.name.endsWith("_DOUBLE")
    return used.any { it == r || (wide && it == r - 1) }
}

private fun MutableMethod.sig() = "$definingClass->$name"

private fun MutableMethod.code() = implementation?.instructions?.toList()
    ?: throw PatchException("${sig()} has no implementation")

private fun FieldReference.key() = "$definingClass->$name:$type"

private const val CHOICES = "${SAMSUNG_CONTROLS_PACKAGE}Choices;"

/** The ids of the number choices, one switch per value (the Java side is `Choices`). */
private const val CLIPBOARD_SIZE_PREFIX = "samsungkeyboard.clipboard_size_"
private const val CLIPBOARD_COLUMNS_PREFIX = "samsungkeyboard.clipboard_columns_"
private const val TOOLBAR_ITEMS_PREFIX = "samsungkeyboard.toolbar_items_"
private val CLIPBOARD_SIZES = listOf(100, 200, 500, 1000)
private val CLIPBOARD_COLUMNS = (1..6).toList()
private val TOOLBAR_ITEMS = (8..12).toList()

/**
 * The boolean stored by the `sput-boolean` at [sputIndex] reads true while the feature [id] is on: the stored register
 * goes through a `(Z)Z` helper first (stock value while off, true while on). Branches to the store land on the helper
 * call, so every path stores the helper's answer.
 */
private fun BytecodePatchContext.gateTrueStore(clinit: MutableMethod, sputIndex: Int, id: String, helperName: String, what: String) {
    val sput = clinit.code()[sputIndex]
    if (sput.opcode != Opcode.SPUT_BOOLEAN) throw PatchException("$what: instruction $sputIndex of ${clinit.sig()} is not a boolean store")
    val helper = mutableClassDefBy(clinit.definingClass).addHevalValueHelper(id, helperName, "Z") { v -> "const/4 $v, 0x1\nreturn $v" }
    clinit.filterThroughHevalHelper(sputIndex, sput.register(), helper)
}

/** The first boolean store within [window] instructions after the floating-feature key [key] in the features initializer. */
private fun MutableMethod.flagStoreAfter(key: String, window: Int, what: String): Int {
    val code = code()
    val keys = code.indices.filter { code[it].string() == key }
    if (keys.size != 1) throw PatchException("$what: expected one \"$key\" in ${sig()}, found ${keys.size}")
    val start = keys.single()
    return (start + 1..minOf(start + window, code.size - 1)).firstOrNull { code[it].opcode == Opcode.SPUT_BOOLEAN }
        ?: throw PatchException("$what: no boolean store within $window instructions after \"$key\" in ${sig()}")
}

private fun BytecodePatchContext.gateFloatingFlag(key: String, window: Int, id: String, helperName: String, what: String) {
    val clinit = FeaturesClinitFingerprint.method
    val index = clinit.flagStoreAfter(key, window, what)
    val field = clinit.code()[index].field()!!
    gateTrueStore(clinit, index, id, helperName, what)
    log.info("$what: ${field.key()} is true on every phone while $id is on")
}

/** A `(I)I` helper on [this] class: `Choices.clipboardCap(p0, extra)`, so the Java side learns the Manager's non-preset size. */
private fun MutableClass.addChoiceCapHelper(name: String, extra: Int): MethodReference {
    val reference = ImmutableMethodReference(this.type, name, listOf("I"), "I")
    if (methods.any { it.name == name }) return reference
    val helper = ImmutableMethod(
        this.type, name, listOf(ImmutableMethodParameter("I", null, null)), "I",
        AccessFlags.PRIVATE.value or AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value,
        null, null, MutableMethodImplementation(2),
    ).toMutable()
    helper.addInstructionsChecked(
        0,
        """
            const v0, $extra
            invoke-static {p0, v0}, $CHOICES->clipboardCap(II)I
            move-result v0
            return v0
        """,
    )
    methods.add(helper)
    return reference
}

private fun runtimeSwitch(id: String, name: String, description: String, category: String, restartRequired: Boolean = false) =
    HevalFeature(id = id, name = name, description = description, category = category, default = true, restartRequired = restartRequired)

@Suppress("unused")
val biggerClipboardHistoryPatch = bytecodePatch(
    name = "Bigger clipboard history",
    description = "Keeps more items in the clipboard history.",
) {
    compatibleWith(COMPATIBILITY_SAMSUNG_KEYBOARD)
    dependsOn(samsungKeyboardControls.patch)

    val size = intOption(
        key = "clipboardHistorySize",
        default = 200,
        values = mapOf("100" to 100, "200" to 200, "500" to 500, "1000" to 1000),
        title = "Clipboard history size",
        description = "How many items the clipboard history keeps.",
        required = true,
    ) { it != null && it >= 1 }

    execute {
        val what = "Bigger clipboard history"
        val limit = size.value ?: throw PatchException("$what: no size")
        if (limit < 1) throw PatchException("$what: the size must be at least 1")
        // A size the Manager option chose outside the presets still gets its own switch (id prefix + size, sorted in).
        val extra = if (limit in CLIPBOARD_SIZES) 0 else limit
        val sizes = (CLIPBOARD_SIZES + extra).filter { it > 0 }.sorted()

        val enforcer = ClipEnforcerFingerprint.method
        val code = enforcer.code()

        // 1. The cap is the first plain int static the enforcer reads from another class; where that class's
        //    initializer stores it (R8 gave stock one store, reached from a 200 and a 40 branch), the value goes through
        //    Choices.clipboardCap: the keyboard's own value while no size is chosen in Patch settings, the chosen size
        //    otherwise. The initializer runs once per process, so the choice needs a restart.
        val capField = code.firstNotNullOfOrNull { ins ->
            ins.field()?.takeIf { ins.opcode == Opcode.SGET && it.type == "I" && it.definingClass != enforcer.definingClass }
        } ?: throw PatchException("$what: no int static read from another class in ${enforcer.sig()}")
        val holder = mutableClassDefBy(capField.definingClass)
        val clinit = holder.methods.singleOrNull { it.name == "<clinit>" }
            ?: throw PatchException("$what: ${capField.definingClass} has no single <clinit>")
        val stores = clinit.code().withIndex().filter { (_, ins) ->
            ins.opcode == Opcode.SPUT && ins.field()?.key() == capField.key()
        }
        if (stores.size != 1) throw PatchException("$what: expected one store to ${capField.key()}, found ${stores.size}")
        val store = stores.single()
        // The helper lives in the cap's class and passes the Manager's extra size (0 when it is a preset) along.
        val capHelper = holder.addChoiceCapHelper("morpheHevalClipboardCap", extra)
        clinit.filterThroughHevalHelper(store.index, store.value.register(), capHelper)

        // 2. With a finite cap, if every clip is pinned the unpinned list is empty and ArrayList.get(0) throws: leave
        //    the enforcer when the list is empty. This guard only avoids that exception (the stock cap is finite too),
        //    so it is not behind a switch.
        val getIndex = code.indices.single { index ->
            val ref = (code[index] as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference
            ref != null && ref.definingClass == "Ljava/util/ArrayList;" && ref.name == "get" && ref.parameterTypes.map(CharSequence::toString) == listOf("I")
        }
        val get = code[getIndex]
        val index = (get as? FiveRegisterInstruction)?.registerD
        val list = (get as? FiveRegisterInstruction)?.registerC
            ?: (get as? RegisterRangeInstruction)?.startRegister
            ?: throw PatchException("$what: ArrayList.get in ${enforcer.sig()} is not an invoke")
        // A scratch register for the answer: a local that nothing after the call touches (stock: v1, last used by the
        // loop before it). Locals are the registers below the parameters.
        val locals = enforcer.implementation!!.registerCount - enforcer.parameterTypes.size -
            (if (com.android.tools.smali.dexlib2.AccessFlags.STATIC.isSet(enforcer.accessFlags)) 0 else 1)
        val result = (0 until minOf(locals, 16)).firstOrNull { r ->
            r != list && r != index && code.drop(getIndex).none { it.touches(r) }
        } ?: throw PatchException("$what: no free register in ${enforcer.sig()} ($locals locals)")
        val done = code.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        if (done < 0) throw PatchException("$what: ${enforcer.sig()} has no return-void")
        enforcer.addInstructionsAtControlFlowLabelChecked(
            getIndex,
            """
                invoke-virtual/range {v$list .. v$list}, Ljava/util/ArrayList;->isEmpty()Z
                move-result v$result
                if-nez v$result, :morphe_history_done
            """,
            ExternalLabel("morphe_history_done", enforcer.getInstruction(done)),
        )
        log.info("$what: ${capField.key()} goes through Choices.clipboardCap (default $limit), empty list guarded in ${enforcer.sig()}")

        // 3. One switch per size; the Manager option decides which one starts on.
        choiceFeatures(
            idPrefix = CLIPBOARD_SIZE_PREFIX, choice = "Clipboard history size", category = SamsungKeyboardControlsCategory.CLIPBOARD,
            values = sizes, selected = limit, restartRequired = true, icon = "list",
            name = { "$it items" }, description = { "Keeps up to $it items in the clipboard history." },
        ).forEach(samsungKeyboardControls::register)
    }
}

@Suppress("unused")
val clipboardColumnsPatch = bytecodePatch(
    name = "Clipboard columns",
    description = "Sets how many columns the clipboard panel has, and how many recent items its top row shows.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SAMSUNG_KEYBOARD)
    dependsOn(samsungKeyboardControls.patch)

    val columns = intOption(
        key = "clipboardColumns",
        default = 3,
        values = mapOf("1" to 1, "2" to 2, "3" to 3, "4" to 4, "5" to 5, "6" to 6),
        title = "Columns",
        description = "How many columns the clipboard panel has (1 to 6).",
        required = true,
    ) { it != null && it in 1..6 }

    execute {
        val count = columns.value ?: throw PatchException("Clipboard columns: no value")
        if (count !in CLIPBOARD_COLUMNS) throw PatchException("Clipboard columns: $count is not between 1 and 6")

        // The getter asks Choices.clipboardColumns first: -1 (no count chosen) goes on to the keyboard's own code.
        val getter = ClipboardColCountFingerprint.method
        getter.requireLocal()
        getter.addInstructionsWithLabelsChecked(
            0,
            """
                invoke-static {}, $CHOICES->clipboardColumns()I
                move-result v0
                if-ltz v0, :morphe_stock
                return v0
            """,
            ExternalLabel("morphe_stock", getter.getInstruction(0)),
        )

        choiceFeatures(
            idPrefix = CLIPBOARD_COLUMNS_PREFIX, choice = "Clipboard columns", category = SamsungKeyboardControlsCategory.CLIPBOARD,
            values = CLIPBOARD_COLUMNS, selected = count, restartRequired = false, icon = "list",
            name = { if (it == 1) "1 column" else "$it columns" },
            description = { "Shows the clipboard panel in $it ${if (it == 1) "column" else "columns"}." },
        ).forEach(samsungKeyboardControls::register)
    }
}

@Suppress("unused")
val swipeCursorControlPatch = samsungKeyboardControls.featurePatch(
    runtimeSwitch(
        "samsungkeyboard.swipe_cursor", "Swipe cursor control",
        "Offers moving the cursor by swiping on the space bar, for non-Samsung phones.",
        SamsungKeyboardControlsCategory.TYPING, restartRequired = true,
    ),
) {
    // The phone's feature flag is read once when the keyboard's feature table is built, so a change needs a restart.
    gateFloatingFlag(FLOATING_CURSOR_KEY, window = 8, id = "samsungkeyboard.swipe_cursor", helperName = "morpheHevalSwipeCursor", what = "Swipe cursor control")
}

@Suppress("unused")
val oneHandedKeyboardPatch = samsungKeyboardControls.featurePatch(
    runtimeSwitch(
        "samsungkeyboard.one_handed", "One-handed keyboard",
        "Offers the one-handed keyboard, for non-Samsung phones.",
        SamsungKeyboardControlsCategory.TYPING, restartRequired = true,
    ),
) {
    gateFloatingFlag(FLOATING_ONEHAND_KEY, window = 16, id = "samsungkeyboard.one_handed", helperName = "morpheHevalOneHanded", what = "One-handed keyboard")
}

@Suppress("unused")
val toolbarItemCountPatch = bytecodePatch(
    name = "Toolbar item count",
    description = "Lets you place more items in the toolbar's top row; rearrange them in the toolbar editor.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SAMSUNG_KEYBOARD)
    dependsOn(samsungKeyboardControls.patch)

    val items = intOption(
        key = "toolbarItems",
        default = 8,
        values = mapOf("8" to 8, "9" to 9, "10" to 10, "11" to 11, "12" to 12),
        title = "Items",
        description = "How many items the toolbar's top row holds (8 to 12).",
        required = true,
    ) { it != null && it in TOOLBAR_ITEMS }

    execute {
        val what = "Toolbar item count"
        val count = items.value ?: throw PatchException("$what: no value")
        if (count !in TOOLBAR_ITEMS) throw PatchException("$what: $count is not between 8 and 12")

        // 1. The cap method, cross-checked against the saved-toolbar loader: the loader holds the default-set object
        //    (a field typed as the cap's class) and asks it for the cap through an interface call of the same name.
        val cap = ToolbarCapFingerprint.method
        val loader = ToolbarUserSetLoaderFingerprint.method
        val loaderCode = loader.code()
        val setFields = loaderCode.mapNotNull { ins ->
            ins.field()?.takeIf { ins.opcode == Opcode.IGET_OBJECT && it.definingClass == loader.definingClass && it.type == cap.definingClass }
        }.map { it.key() }.distinct()
        if (setFields.size != 1) {
            throw PatchException("$what: ${loader.sig()} reads ${setFields.size} fields typed ${cap.definingClass}, expected one (cap ${cap.sig()})")
        }
        val capCalls = loaderCode.count { ins ->
            val ref = (ins as? ReferenceInstruction)?.reference as? MethodReference
            ins.opcode == Opcode.INVOKE_INTERFACE && ref != null && ref.name == cap.name && ref.parameterTypes.isEmpty() && ref.returnType == "I"
        }
        if (capCalls == 0) throw PatchException("$what: ${loader.sig()} never asks an interface for ${cap.name}()I, so ${cap.sig()} is not the toolbar cap")

        // 2. The cap's answer is 7 or 8 in the normal modes and 4 in the small ones (stock: several constants, checked
        //    here). Every int return goes through Choices.toolbarItems, which turns a 7 or 8 into the chosen count and
        //    leaves any other answer, the 4 included, alone; with no count chosen it hands back the keyboard's own.
        val code = cap.code()
        val constants = code.count { ins ->
            (ins.opcode == Opcode.CONST_4 || ins.opcode == Opcode.CONST_16 || ins.opcode == Opcode.CONST) &&
                (ins as NarrowLiteralInstruction).narrowLiteral.let { it == 7 || it == 8 }
        }
        if (constants < 5) throw PatchException("$what: only $constants cap constants found in ${cap.sig()}, expected at least 5")
        if (code.none { it is NarrowLiteralInstruction && it.narrowLiteral == 4 }) {
            throw PatchException("$what: the small-mode constant 4 is gone from ${cap.sig()}")
        }
        val returns = code.withIndex().filter { (_, ins) -> ins.opcode == Opcode.RETURN }
        if (returns.isEmpty()) throw PatchException("$what: ${cap.sig()} has no int return")
        val helper = ImmutableMethodReference(CHOICES, "toolbarItems", listOf("I"), "I")
        for ((index, ins) in returns.reversed()) cap.filterThroughHevalHelper(index, ins.register(), helper)
        log.info("$what: ${cap.sig()} answers the chosen count (default $count, $constants constants, ${returns.size} returns)")

        // 3. One switch per count; the Manager option decides which one starts on. The toolbar is built from the cap
        //    when the keyboard starts, so a change needs a restart.
        choiceFeatures(
            idPrefix = TOOLBAR_ITEMS_PREFIX, choice = "Toolbar items in the top row", category = SamsungKeyboardControlsCategory.TOOLBAR,
            values = TOOLBAR_ITEMS, selected = count, restartRequired = true, icon = "sliders",
            name = { "$it items" }, description = { "Lets the toolbar's top row hold $it items." },
        ).forEach(samsungKeyboardControls::register)
    }
}

@Suppress("unused")
val autofillInAnyFieldPatch = samsungKeyboardControls.featurePatch(
    runtimeSwitch(
        "samsungkeyboard.autofill_any_field", "Autofill in any field",
        "Shows password and autofill suggestions even when the field already has text.",
        SamsungKeyboardControlsCategory.TYPING,
    ),
    default = false,
) {
    val what = "Autofill in any field"
    val method = InlineSuggestionsResponseFingerprint.method
    val code = method.code()

    // The skip: text before the cursor has a length, and a positive length jumps to the "skipping" log. While the switch
    // is on the length reads zero, right after its move-result, in the register the branch tests; while it is off the
    // helper hands the length back unchanged.
    val length = code.indexOfFirst { ins ->
        val ref = (ins as? ReferenceInstruction)?.reference as? MethodReference
        ins.opcode == Opcode.INVOKE_INTERFACE && ref?.definingClass == "Ljava/lang/CharSequence;" && ref.name == "length" && ref.parameterTypes.isEmpty()
    }
    if (length < 0) throw PatchException("$what: no CharSequence.length() in ${method.sig()}")
    val result = code[length + 1]
    if (result.opcode != Opcode.MOVE_RESULT) throw PatchException("$what: length() in ${method.sig()} is not followed by move-result")
    val register = result.register()
    val branch = (length + 2 until code.size).firstOrNull { code[it].opcode == Opcode.IF_LEZ && code[it].register() == register }
        ?: throw PatchException("$what: no if-lez on v$register after length() in ${method.sig()}")
    if ((branch + 1..minOf(branch + 3, code.size - 1)).none { code[it].string() == SKIP_SUGGESTIONS_LOG }) {
        throw PatchException("$what: the skip log does not follow the length branch in ${method.sig()}")
    }
    val helper = mutableClassDefBy(method.definingClass)
        .addHevalValueHelper("samsungkeyboard.autofill_any_field", "morpheHevalAutofillLength", "I") { v -> "const/4 $v, 0x0\nreturn $v" }
    method.filterThroughHevalHelper(length + 2, register, helper)
    log.info("$what: the text length reads 0 in ${method.sig()} while the switch is on")
}

@Suppress("unused")
val restoreKeyVibrationPatch = samsungKeyboardControls.featurePatch(
    runtimeSwitch(
        "samsungkeyboard.key_vibration", "Restore key vibration",
        "Brings back the vibration on key taps, for non-Samsung phones.",
        SamsungKeyboardControlsCategory.TYPING, restartRequired = true,
    ),
) {
    val what = "Restore key vibration"
    val gate = KeyVibrationGateFingerprint.method
    val flag = gate.code().firstNotNullOfOrNull { ins -> ins.field()?.takeIf { ins.opcode == Opcode.SGET_BOOLEAN } }
        ?: throw PatchException("$what: no boolean flag read in ${gate.sig()}")
    val clinit = FeaturesClinitFingerprint.method
    if (flag.definingClass != clinit.definingClass) {
        throw PatchException("$what: the flag ${flag.key()} is not set by the features initializer ${clinit.definingClass}")
    }
    val stores = clinit.code().withIndex().filter { (_, ins) ->
        ins.opcode == Opcode.SPUT_BOOLEAN && ins.field()?.key() == flag.key()
    }
    if (stores.size != 1) throw PatchException("$what: expected one store to ${flag.key()}, found ${stores.size}")
    gateTrueStore(clinit, stores.single().index, "samsungkeyboard.key_vibration", "morpheHevalKeyVibration", what)
    log.info("$what: ${flag.key()} is true on every phone while the switch is on")
}

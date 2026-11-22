package app.morphe.patches.mapsautomotive

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.SparseSwitchPayload
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.util.logging.Logger

// The row of category icons under the search box: one view model per icon, built from a search category the server
// sends, with the icon's position in the row. Its constructor takes the label (the category's text), the icon (the
// category's icon key through Maps' icon lookup) and the tap (a search for the category). HomeWorkShortcuts changes
// all three for the third and fourth icons, unless that category is charging or a gas station: Maps' own Home and
// Work label and icon (keys 6 and 7 of the lookup), and a tap that sends Maps' own link google.navigation:place=home|work
// to MapsActivity. The label hook, the first of the three, also reads the category's icon key and decides; the icon and
// tap hooks take that decision.
// Required: the category class, one such constructor, one label store, one icon lookup with keys 6 and 7, one tap
// listener store, and a position parameter the constructor never writes.

private const val HOME_WORK_CLASS = "Lapp/morphe/extension/mapsautomotive/patches/HomeWorkShortcuts;"
private const val CATEGORY_TITLE = "SearchCategory(query="
private const val CLICK_LISTENER = "Landroid/view/View\$OnClickListener;"
private val homeWorkLogger = Logger.getLogger("app.morphe.patches.mapsautomotive.HomeWorkShortcutsPatch")

@Suppress("unused")
val homeWorkShortcutsPatch = bytecodePatch(
    name = "Home and Work shortcuts",
    description = "Turns the third and fourth icons under the search box into Home and Work, but keeps a charging or " +
        "gas station icon there. Tap Home or Work to start the route to the place saved in your Google account.",
    default = true,
) {
    compatibleWith(compatibility)
    dependsOn(automotiveMicroGPatch)

    execute {
        requireExtensionMethod(HOME_WORK_CLASS, "label", listOf("Ljava/lang/String;", "I", "I"), "Ljava/lang/String;")
        requireExtensionMethod(HOME_WORK_CLASS, "icon", listOf("I"), "I")
        requireExtensionMethod(HOME_WORK_CLASS, "click", listOf(CLICK_LISTENER), CLICK_LISTENER)
        hookCategoryIcons()
        IncludedFeatures.features += "home_work"
    }
}

private fun stringOf(i: Instruction) = ((i as? ReferenceInstruction)?.reference as? StringReference)?.string
private fun methodOf(i: Instruction) = (i as? ReferenceInstruction)?.reference as? MethodReference
private fun fieldOf(i: Instruction) = (i as? ReferenceInstruction)?.reference as? FieldReference
private fun registersOf(i: Instruction): List<Int> = when (i) {
    is FiveRegisterInstruction -> listOf(i.registerC, i.registerD, i.registerE, i.registerF, i.registerG).take(i.registerCount)
    is RegisterRangeInstruction -> (i.startRegister until i.startRegister + i.registerCount).toList()
    is ThreeRegisterInstruction -> listOf(i.registerA, i.registerB, i.registerC)
    is TwoRegisterInstruction -> listOf(i.registerA, i.registerB)
    is OneRegisterInstruction -> listOf(i.registerA)
    else -> emptyList()
}

private fun BytecodePatchContext.categoryClass(): ClassDef {
    val found = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
        if (classDef.methods.any { m -> m.implementation?.instructions?.any { stringOf(it)?.startsWith(CATEGORY_TITLE) == true } == true }) {
            found += classDef
        }
    }
    return found.singleOrNull()
        ?: throw PatchException("Expected one class with '$CATEGORY_TITLE', found ${found.joinToString { it.type }}")
}

// The register a parameter arrives in: parameters fill the last registers, after "this".
private fun parameterRegister(method: Method, parameter: Int): Int {
    val sizes = method.parameterTypes.map { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
    val first = method.implementation!!.registerCount - sizes.sum() - 1
    return first + 1 + sizes.take(parameter).sum()
}

// Index of the instruction a branch at [index] lands on.
private fun List<Instruction>.branchTarget(index: Int): Int {
    val offset = take(index).sumOf { it.codeUnits } + (this[index] as OffsetInstruction).codeOffset
    var position = 0
    forEachIndexed { i, instruction -> if (position == offset) return i; position += instruction.codeUnits }
    throw PatchException("Invalid branch target at $index")
}

private fun List<Instruction>.landsOn(index: Int) = indices.any { i ->
    this[i] is OffsetInstruction && this[i].opcode !in setOf(Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH, Opcode.FILL_ARRAY_DATA) &&
        branchTarget(i) == index
}

private fun BytecodePatchContext.hookCategoryIcons() {
    val category = categoryClass()
    // The icon view model's constructor: takes a category and stores a tap listener in its own class.
    val constructors = mutableListOf<Method>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
        classDef.methods.filter { m ->
            m.name == "<init>" && m.parameterTypes.any { it.toString() == category.type } &&
                m.implementation?.instructions?.any {
                    it.opcode == Opcode.IPUT_OBJECT && fieldOf(it)?.let { f -> f.definingClass == classDef.type && f.type == CLICK_LISTENER } == true
                } == true
        }.forEach { constructors += it }
    }
    val found = constructors.singleOrNull()
        ?: throw PatchException("Expected one category icon constructor, found ${constructors.joinToString()}")
    val owner = found.definingClass
    val code = found.implementation!!.instructions.toList()

    val position = found.parameterTypes.indices.singleOrNull { found.parameterTypes[it].toString() == "I" }
        ?: throw PatchException("Category icon constructor $found has no single int (position) parameter")
    val slot = parameterRegister(found, position)
    if (slot > 15) throw PatchException("Position register v$slot too high for the hook")
    if (code.any { it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.registerA.let { a -> a == slot || it.opcode.setsWideRegister() && a == slot - 1 } }) {
        throw PatchException("Category icon constructor $found writes its position register v$slot")
    }

    fun store(type: String): Int {
        val stores = code.indices.filter { code[it].opcode == Opcode.IPUT_OBJECT && fieldOf(code[it])?.let { f -> f.definingClass == owner && f.type == type } == true }
        return stores.singleOrNull() ?: throw PatchException("Expected one $type store in $found, found ${stores.size}")
    }
    val labelStore = store("Ljava/lang/String;")
    val clickStore = store(CLICK_LISTENER)
    val labelRegister = (code[labelStore] as TwoRegisterInstruction).registerA
    val clickRegister = (code[clickStore] as TwoRegisterInstruction).registerA

    // The icon: a static lookup (int key, default icon) -> icon, whose result is stored in this class. The key comes
    // from an int field of the category.
    val lookups = code.indices.filter { i ->
        code[i].opcode == Opcode.INVOKE_STATIC && methodOf(code[i])?.let { m ->
            m.parameterTypes.size == 2 && m.parameterTypes[0].toString() == "I" &&
                m.parameterTypes[1].toString() == m.returnType && m.returnType.startsWith("L")
        } == true && code.getOrNull(i + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT &&
            code.getOrNull(i + 2)?.let { it.opcode == Opcode.IPUT_OBJECT && fieldOf(it)?.definingClass == owner } == true
    }
    val lookupAt = lookups.singleOrNull() ?: throw PatchException("Expected one icon lookup in $found, found ${lookups.size}")
    val lookup = methodOf(code[lookupAt])!!
    val keyRegister = (code[lookupAt] as FiveRegisterInstruction).registerC
    val keyLoad = (lookupAt - 1 downTo 0).firstOrNull { i ->
        code[i].opcode.setsRegister() && (code[i] as? OneRegisterInstruction)?.registerA == keyRegister
    }
    if (keyLoad == null || code[keyLoad].opcode != Opcode.IGET || fieldOf(code[keyLoad])?.definingClass != category.type ||
        fieldOf(code[keyLoad])?.type != "I" || keyRegister > 15) {
        throw PatchException("The icon key in $found is not a category int field read")
    }
    val lookupCode = classDefBy(lookup.definingClass).methods.single {
        it.name == lookup.name && it.returnType == lookup.returnType && it.parameterTypes.map { p -> p.toString() } == lookup.parameterTypes.map { p -> p.toString() }
    }.implementation?.instructions?.toList() ?: throw PatchException("Icon lookup $lookup has no code")
    val keys = lookupCode.filterIsInstance<SparseSwitchPayload>().flatMap { payload -> payload.switchElements.map { it.key } }
    if (lookupCode.count { it is SparseSwitchPayload } != 1 || 6 !in keys || 7 !in keys) {
        throw PatchException("Icon lookup $lookup lacks the Home (6) and Work (7) keys")
    }

    listOf(labelStore, lookupAt, clickStore).forEach { at ->
        if (code.landsOn(at)) throw PatchException("A branch lands on the hook at $at in $found")
    }
    if (!(labelStore < lookupAt && lookupAt < clickStore)) throw PatchException("Unexpected order of the icon's parts in $found")
    if (labelRegister > 15 || clickRegister > 15) throw PatchException("Label or listener register too high in $found")
    // The label hook reads the icon key early, into the key register: the key read comes after the label store, nothing
    // in between names the key register or writes the category register, and the method has no try blocks.
    val keyField = fieldOf(code[keyLoad])!!
    val categoryRegister = (code[keyLoad] as TwoRegisterInstruction).registerB
    if (!(labelStore < keyLoad) || categoryRegister == keyRegister || categoryRegister > 15 ||
        found.implementation!!.tryBlocks.isNotEmpty() ||
        code.subList(labelStore, keyLoad).any { keyRegister in registersOf(it) ||
            it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.registerA == categoryRegister }) {
        throw PatchException("The icon key cannot be read at the label store in $found")
    }

    val method = mutableClassDefBy(owner).methods.single {
        it.name == found.name && it.parameterTypes.map { p -> p.toString() } == found.parameterTypes.map { p -> p.toString() } &&
            !AccessFlags.STATIC.isSet(it.accessFlags)
    }
    // From the last to the first, so the earlier indices stay valid.
    method.addInstructions(clickStore, """
        invoke-static { v$clickRegister }, $HOME_WORK_CLASS->click($CLICK_LISTENER)$CLICK_LISTENER
        move-result-object v$clickRegister
    """.trimIndent())
    method.addInstructions(lookupAt, """
        invoke-static { v$keyRegister }, $HOME_WORK_CLASS->icon(I)I
        move-result v$keyRegister
    """.trimIndent())
    method.addInstructions(labelStore, """
        iget v$keyRegister, v$categoryRegister, ${keyField.definingClass}->${keyField.name}:${keyField.type}
        invoke-static { v$labelRegister, v$keyRegister, v$slot }, $HOME_WORK_CLASS->label(Ljava/lang/String;II)Ljava/lang/String;
        move-result-object v$labelRegister
    """.trimIndent())
    homeWorkLogger.info(
        "Home and Work shortcuts: $found (position v$slot): label at $labelStore (v$labelRegister, icon key read early " +
            "from v$categoryRegister), icon key $keyField into $lookup at $lookupAt (v$keyRegister), tap listener at " +
            "$clickStore (v$clickRegister)",
    )
}

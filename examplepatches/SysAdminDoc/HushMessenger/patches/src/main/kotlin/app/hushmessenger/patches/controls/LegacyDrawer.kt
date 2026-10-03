package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

internal const val LEGACY_SECTION = "$SETTINGS->legacyDrawerSection(Landroid/content/Context;)Ljava/lang/Object;"
internal const val LEGACY_KEY_CACHE = "$SETTINGS->cachedLegacyDrawerKey(Ljava/lang/Object;)Ljava/lang/Object;"
internal const val LEGACY_DRAWER_ADD = "$SETTINGS->addLegacyDrawerEntry(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;"
internal const val DRAWER_KEY = "Lcom/facebook/messaging/navigation/home/drawer/model/DrawerFolderKey;"
internal const val SETTINGS_KEY = "Lcom/facebook/messaging/navigation/home/drawer/model/SettingsFolderKey;"
internal const val DRAWER_METADATA = "Lcom/facebook/xapp/messaging/map/HeterogeneousMap;"
internal const val SETTINGS_SECTION = "Lcom/facebook/messaging/navigation/plugins/drawerfoldersections/settingsfoldersection/SettingsDrawerFolderSectionImplementation;"
private const val CONTEXT = "Landroid/content/Context;"
private const val LIST = "Ljava/util/List;"
private const val INTEGER = "Ljava/lang/Integer;"
private const val STRING = "Ljava/lang/String;"
private const val OBJECT = "Ljava/lang/Object;"
private const val FRAGMENT = "Landroidx/fragment/app/Fragment;"

private fun drawerChanged(detail: String): Nothing = throw PatchException("Messenger controls: legacy drawer $detail")
private fun Method.drawerCode() = implementation?.instructions?.toList() ?: drawerChanged("$name has no code")
private fun MethodReference.drawerParams() = parameterTypes.map { it.toString() }
private fun Instruction.drawerRef() = (this as? ReferenceInstruction)?.reference
private fun Instruction.drawerArgs(): List<Int> = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    else -> emptyList()
}
private val OBJECT_MOVES = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)

/** Follow one register only within its straight-line path; an incoming branch makes its value ambiguous. */
private fun Method.drawerOrigin(before: Int, register: Int): Int {
    val code = drawerCode()
    val landings = jumpTargets()
    var wanted = register
    for (i in before - 1 downTo 0) {
        val instruction = code[i]
        if (instruction is OffsetInstruction || i + 1 in landings) drawerChanged("$name has ambiguous model values")
        if (!instruction.opcode.setsRegister() || (instruction as? OneRegisterInstruction)?.registerA != wanted) continue
        if (instruction.opcode in OBJECT_MOVES) wanted = (instruction as TwoRegisterInstruction).registerB else return i
    }
    drawerChanged("$name has an uninitialized model value")
}

internal data class LegacyDrawerRefresh(val insertion: Int, val fragment: Int, val sections: Int)
internal data class LegacyDrawerPlan(val refresh: LegacyDrawerRefresh, val factory: ImmutableMethod)

internal fun Method.validateLegacyDrawerRefresh(resolve: (String) -> ClassDef?): LegacyDrawerRefresh {
    val code = drawerCode()
    val registers = implementation!!.registerCount
    if (drawerParams().isNotEmpty() || returnType != "V" || AccessFlags.STATIC.isSet(accessFlags) || registers !in 1..16 ||
        code.count { (it.drawerRef() as? StringReference)?.string == DRAWER_REFRESH } != 1) drawerChanged("refresh signature changed")
    val receiver = registers - 1
    val candidates = code.indices.filter { i ->
        val field = code[i].drawerRef() as? FieldReference
        code[i].opcode == Opcode.IPUT_OBJECT && field?.definingClass == definingClass && field.name == "A0G" && field.type == LIST
    }
    val store = candidates.singleOrNull()?.takeIf { it >= 2 } ?: drawerChanged("refresh must store one section list")
    val put = code[store] as TwoRegisterInstruction
    val result = code[store - 1] as? OneRegisterInstruction
    val producer = code[store - 2].drawerRef() as? MethodReference ?: drawerChanged("refresh section producer changed")
    if (put.registerB != receiver || put.registerA == receiver || put.registerA !in 0 until registers ||
        code[store - 1].opcode != Opcode.MOVE_RESULT_OBJECT || result?.registerA != put.registerA ||
        code[store - 2].opcode != Opcode.INVOKE_INTERFACE || producer.returnType != "Ljava/util/ArrayList;" ||
        producer.drawerParams().isNotEmpty() || code[store - 2].drawerArgs().size != 1 ||
        code[store - 2].drawerArgs().single() !in 0 until registers ||
        setOf(store - 1, store).any { it in jumpTargets() }) drawerChanged("refresh list handoff changed")
    val owner = resolve(definingClass) ?: drawerChanged("refresh owner is missing")
    if (owner.fields.count { !AccessFlags.STATIC.isSet(it.accessFlags) && it.name == "A0G" && it.type == LIST } != 1)
        drawerChanged("refresh list field changed")
    val provider = resolve(producer.definingClass) ?: drawerChanged("section provider is missing")
    if (!AccessFlags.INTERFACE.isSet(provider.accessFlags) ||
        provider.methods.count { it.hookId() == producer.toString() && !AccessFlags.STATIC.isSet(it.accessFlags) } != 1)
        drawerChanged("section provider changed")
    var ancestor: ClassDef? = owner
    repeat(32) {
        if (ancestor?.type == FRAGMENT) {
            val context = ancestor.methods.singleOrNull {
                it.name == "getContext" && it.drawerParams().isEmpty() && it.returnType == CONTEXT &&
                    AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
            } ?: drawerChanged("fragment context getter changed")
            if (context.implementation == null) drawerChanged("fragment context getter has no code")
            return LegacyDrawerRefresh(store, receiver, put.registerA)
        }
        ancestor = ancestor?.superclass?.let(resolve)
    }
    drawerChanged("refresh owner is not a supported fragment")
}

private class DrawerModels(val resolve: (String) -> ClassDef?) {
    fun type(name: String): ClassDef = resolve(name)?.takeIf { AccessFlags.PUBLIC.isSet(it.accessFlags) }
        ?: drawerChanged("model $name is missing or inaccessible")

    fun allocatable(name: String): ClassDef = type(name).takeIf {
        !AccessFlags.ABSTRACT.isSet(it.accessFlags) && !AccessFlags.INTERFACE.isSet(it.accessFlags)
    } ?: drawerChanged("model $name cannot be allocated")

    /** All factory arguments checked here are nonnull. That path must return without doing any work. */
    private fun nullCheck(call: MethodReference) {
        val check = type(call.definingClass).methods.singleOrNull { it.hookId() == call.toString() }
            ?: drawerChanged("model null check is missing")
        val body = check.drawerCode()
        val registers = check.implementation!!.registerCount
        val branch = body.firstOrNull() as? OffsetInstruction
        val parameter = body.firstOrNull() as? OneRegisterInstruction
        if (!AccessFlags.PUBLIC.isSet(check.accessFlags) || !AccessFlags.STATIC.isSet(check.accessFlags) ||
            check.implementation!!.tryBlocks.isNotEmpty() || registers < 2 ||
            body.firstOrNull()?.opcode != Opcode.IF_NEZ || parameter?.registerA != registers - 2 || branch == null)
            drawerChanged("model null check changed")
        var address = 0
        val target = body.firstOrNull { instruction ->
            val here = address
            address += instruction.codeUnits
            here == branch.codeOffset
        }
        if (target?.opcode != Opcode.RETURN_VOID) drawerChanged("model null check has side effects on nonnull values")
    }

    fun field(reference: FieldReference, static: Boolean) {
        val field = type(reference.definingClass).fields.singleOrNull {
            it.name == reference.name && it.type == reference.type
        } ?: drawerChanged("model field $reference is missing")
        if (!AccessFlags.PUBLIC.isSet(field.accessFlags) || AccessFlags.STATIC.isSet(field.accessFlags) != static)
            drawerChanged("model field $reference changed access")
    }

    fun subtype(child: String, parent: String): Boolean {
        val pending = ArrayDeque<String>()
        val seen = mutableSetOf<String>()
        pending.add(child)
        while (pending.isNotEmpty() && seen.size < 32) {
            val name = pending.removeFirst()
            if (name == parent) return true
            if (!seen.add(name)) continue
            val model = resolve(name) ?: continue
            model.superclass?.let(pending::add)
            model.interfaces.forEach(pending::add)
        }
        return false
    }

    /** Constructors may only check allowed arguments, invoke Object's constructor and store their own parameters. */
    fun constructor(owner: String, params: List<String>, names: List<String>, checked: Set<Int>, public: Boolean = true,
                    allocated: Boolean = true): Method {
        val model = if (allocated) allocatable(owner) else type(owner)
        val method = model.methods.singleOrNull { it.name == "<init>" && it.drawerParams() == params }
            ?: drawerChanged("model constructor $owner changed")
        if (method.returnType != "V" || AccessFlags.STATIC.isSet(method.accessFlags) ||
            (public && !AccessFlags.PUBLIC.isSet(method.accessFlags)) || method.implementation?.tryBlocks?.isNotEmpty() == true)
            drawerChanged("model constructor $owner changed access")
        val code = method.drawerCode()
        val receiver = method.implementation!!.registerCount - params.size - 1
        if (receiver < 0 || code.lastOrNull()?.opcode != Opcode.RETURN_VOID ||
            code.count { it.opcode == Opcode.RETURN_VOID } != 1) drawerChanged("model constructor $owner changed exits")
        val declared = model.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }
        if (declared.map { it.name }.toSet() != names.toSet() || declared.size != names.size) drawerChanged("model fields $owner changed")
        val writes = mutableSetOf<Int>()
        var baseCalls = 0
        for (instruction in code) when (instruction.opcode) {
            Opcode.IPUT_OBJECT, Opcode.IPUT_BOOLEAN -> {
                val reference = instruction.drawerRef() as? FieldReference ?: drawerChanged("model store changed")
                val slot = names.indexOf(reference.name)
                val store = instruction as TwoRegisterInstruction
                if (slot < 0 || reference.definingClass != owner || reference.type != params[slot] ||
                    store.registerB != receiver || store.registerA != receiver + slot + 1 || !writes.add(slot) ||
                    (instruction.opcode == Opcode.IPUT_BOOLEAN) != (params[slot] == "Z")) drawerChanged("model parameter store changed")
                field(reference, false)
            }
            Opcode.INVOKE_DIRECT -> {
                if (instruction.drawerRef().toString() != "$OBJECT-><init>()V" || instruction.drawerArgs() != listOf(receiver))
                    drawerChanged("model constructor $owner has an unsupported call")
                baseCalls++
            }
            Opcode.INVOKE_STATIC -> {
                val call = instruction.drawerRef() as? MethodReference ?: drawerChanged("model check changed")
                val arguments = instruction.drawerArgs()
                if (call.returnType != "V" || call.drawerParams() != listOf(OBJECT, "I") || arguments.size != 2 ||
                    arguments[0] - receiver - 1 !in checked) drawerChanged("model constructor $owner checks unsupported parameters")
                nullCheck(call)
            }
            Opcode.CONST_4 -> if ((instruction as OneRegisterInstruction).registerA >= receiver)
                drawerChanged("model constructor $owner overwrites a parameter")
            Opcode.RETURN_VOID -> Unit
            else -> drawerChanged("model constructor $owner contains unsupported instructions")
        }
        if (writes.size != params.size || baseCalls != 1) drawerChanged("model constructor $owner is incomplete")
        return method
    }
}

private fun Method.validateLegacySectionStub() {
    val code = drawerCode()
    if (hookId() != LEGACY_SECTION || !AccessFlags.PUBLIC.isSet(accessFlags) || !AccessFlags.STATIC.isSet(accessFlags) ||
        implementation!!.tryBlocks.isNotEmpty() || code.size != 2 || code[0].opcode != Opcode.CONST_4 ||
        (code[0] as? NarrowLiteralInstruction)?.narrowLiteral != 0 || code[1].opcode != Opcode.RETURN_OBJECT ||
        (code[0] as OneRegisterInstruction).registerA != (code[1] as OneRegisterInstruction).registerA)
        drawerChanged("extension factory differs from this patch version")
}

/** All source inspection and smali assembly finish before any existing menu method is edited. */
internal fun prepareLegacyDrawer(
    refresh: Method, add: Method, extension: ClassDef, resolve: (String) -> ClassDef?,
): LegacyDrawerPlan {
    val handoff = refresh.validateLegacyDrawerRefresh(resolve)
    val models = DrawerModels(resolve)
    val stub = extension.methods.singleOrNull { it.hookId() == LEGACY_SECTION } ?: drawerChanged("extension factory is missing")
    stub.validateLegacySectionStub()
    for (id in listOf(LEGACY_KEY_CACHE, LEGACY_DRAWER_ADD)) {
        val helper = extension.methods.singleOrNull { it.hookId() == id } ?: drawerChanged("extension helper $id is missing")
        if (!AccessFlags.PUBLIC.isSet(helper.accessFlags) || !AccessFlags.STATIC.isSet(helper.accessFlags) ||
            helper.implementation == null || helper.drawerCode().none { it.opcode == Opcode.RETURN_OBJECT })
            drawerChanged("extension helper $id changed")
    }
    val row = add.menuFolderItemType()
    val rowCallAt = add.drawerCode().indices.singleOrNull { i ->
        val call = add.drawerCode()[i].drawerRef() as? MethodReference
        add.drawerCode()[i].opcode == Opcode.INVOKE_DIRECT_RANGE && call?.definingClass == row && call.name == "<init>"
    } ?: drawerChanged("settings row constructor call changed")
    val rowCall = add.drawerCode()[rowCallAt].drawerRef() as MethodReference
    val rowParams = rowCall.drawerParams()
    if (rowParams.size != 8 || rowParams[0] != CONTEXT || rowParams[3] != DRAWER_KEY || rowParams[4] != DRAWER_METADATA ||
        rowParams.drop(5) != listOf(INTEGER, STRING, LIST) || !rowParams[1].startsWith("L") || !rowParams[2].startsWith("L"))
        drawerChanged("settings row constructor signature changed")
    models.type(rowParams[1])
    models.type(rowParams[2])
    val rowCtor = models.constructor(row, rowParams, listOf("A00", "A01", "A02", "A03", "A04", "A05", "A06", "A07"), setOf(3, 6))
    val rowArgs = add.drawerCode()[rowCallAt].drawerArgs()
    if (rowArgs.size != 9 || rowArgs.any { it !in 0 until add.implementation!!.registerCount })
        drawerChanged("settings row constructor arguments changed")
    val rowAt = add.drawerOrigin(rowCallAt, rowArgs[0])
    if (add.drawerCode()[rowAt].opcode != Opcode.NEW_INSTANCE || add.drawerCode()[rowAt].drawerRef().toString() != row)
        drawerChanged("settings row receiver changed")
    val iconResult = add.drawerOrigin(rowCallAt, rowArgs[3])
    val addCode = add.drawerCode()
    val icon = addCode.getOrNull(iconResult - 1)?.drawerRef() as? MethodReference ?: drawerChanged("settings icon factory changed")
    if (addCode[iconResult].opcode != Opcode.MOVE_RESULT_OBJECT || addCode[iconResult - 1].opcode != Opcode.INVOKE_STATIC ||
        icon.drawerParams().size != 1 || !models.subtype(icon.returnType, rowParams[2])) drawerChanged("settings icon flow changed")
    val iconFactory = models.type(icon.definingClass).methods.singleOrNull { it.hookId() == icon.toString() }
        ?: drawerChanged("settings icon factory is missing")
    val glyphAt = add.drawerOrigin(iconResult - 1, addCode[iconResult - 1].drawerArgs().single())
    val glyph = addCode[glyphAt].drawerRef() as? FieldReference ?: drawerChanged("settings glyph changed")
    if (addCode[glyphAt].opcode != Opcode.SGET_OBJECT || glyph.type != icon.drawerParams().single() || glyph.name != "A68" ||
        !AccessFlags.PUBLIC.isSet(iconFactory.accessFlags) || !AccessFlags.STATIC.isSet(iconFactory.accessFlags) ||
        iconFactory.implementation?.tryBlocks?.isNotEmpty() == true) drawerChanged("settings icon contract changed")
    models.field(glyph, true)
    val iconCode = iconFactory.drawerCode()
    val iconBuild = iconCode.indices.singleOrNull { iconCode[it].opcode == Opcode.INVOKE_DIRECT }
        ?: drawerChanged("settings icon construction changed")
    val iconCtor = iconCode[iconBuild].drawerRef() as? MethodReference ?: drawerChanged("settings icon constructor changed")
    val iconArgs = iconCode[iconBuild].drawerArgs()
    if (icon.definingClass != icon.returnType || iconCtor.definingClass != icon.returnType || iconCtor.name != "<init>" ||
        iconCtor.drawerParams().size != 2 || iconCtor.drawerParams()[0] != glyph.type || iconArgs.size != 3 ||
        iconArgs[1] != iconFactory.implementation!!.registerCount - 1 ||
        iconCode.size != 4 || iconCode[0].opcode != Opcode.SGET_OBJECT || iconCode[1].opcode != Opcode.NEW_INSTANCE ||
        iconCode[1].drawerRef().toString() != icon.returnType || (iconCode[1] as OneRegisterInstruction).registerA != iconArgs[0] ||
        iconCode[3].opcode != Opcode.RETURN_OBJECT || (iconCode[3] as OneRegisterInstruction).registerA != iconArgs[0] ||
        (iconCode[0] as OneRegisterInstruction).registerA != iconArgs[2]) drawerChanged("settings icon is not freshly constructed")
    val color = iconCode[0].drawerRef() as? FieldReference ?: drawerChanged("settings icon color changed")
    if (!models.subtype(color.type, iconCtor.drawerParams()[1])) drawerChanged("settings icon color type changed")
    models.field(color, true)
    models.constructor(icon.returnType, iconCtor.drawerParams(), listOf("A00", "A01"), setOf(0, 1), public = false)
    val key = models.allocatable(SETTINGS_KEY)
    val keyCtor = key.methods.singleOrNull { it.name == "<init>" && it.drawerParams().isEmpty() } ?: drawerChanged("settings key constructor changed")
    val keyCode = keyCtor.drawerCode()
    if (key.superclass != DRAWER_KEY || "Landroid/os/Parcelable;" !in key.interfaces ||
        !AccessFlags.PUBLIC.isSet(keyCtor.accessFlags) || AccessFlags.STATIC.isSet(keyCtor.accessFlags) || keyCtor.returnType != "V" ||
        keyCtor.implementation!!.tryBlocks.isNotEmpty() ||
        keyCode.size != 3 || keyCode[0].opcode != Opcode.CONST_STRING ||
        (keyCode[0].drawerRef() as? StringReference)?.string != "Settings" || keyCode[1].opcode != Opcode.INVOKE_DIRECT ||
        keyCode[1].drawerRef().toString() != "$DRAWER_KEY-><init>($STRING)V" || keyCode[2].opcode != Opcode.RETURN_VOID ||
        keyCode[1].drawerArgs() != listOf(keyCtor.implementation!!.registerCount - 1, (keyCode[0] as OneRegisterInstruction).registerA) ||
        listOf(key, models.type(DRAWER_KEY)).any { c -> c.methods.any { it.name in setOf("equals", "hashCode") } })
        drawerChanged("settings key is not independently constructible")
    models.constructor(DRAWER_KEY, listOf(STRING), listOf("A00"), emptySet(), public = false, allocated = false)
    val metadataCtor = models.constructor(DRAWER_METADATA, listOf("Ljava/util/Map;"), listOf("A00"), emptySet())
    val sectionSource = models.type(SETTINGS_SECTION).methods.singleOrNull {
        it.drawerParams().isEmpty() && it.returnType.startsWith("LX/") && it.returnType != "V"
    } ?: drawerChanged("native settings section factory changed")
    if (AccessFlags.STATIC.isSet(sectionSource.accessFlags) || !AccessFlags.PUBLIC.isSet(sectionSource.accessFlags) ||
        sectionSource.implementation?.tryBlocks?.isNotEmpty() == true) drawerChanged("native section factory changed access")
    val section = sectionSource.returnType
    val sectionParams = listOf("Landroid/view/View\$OnClickListener;", INTEGER, INTEGER, STRING, STRING, STRING, LIST, "Z")
    val sectionCtor = models.constructor(section, sectionParams, listOf("A00", "A02", "A01", "A05", "A03", "A04", "A06", "A07"), setOf(6))
    val sectionCode = sectionSource.drawerCode()
    val sectionAt = sectionCode.indices.singleOrNull { sectionCode[it].drawerRef().toString() == sectionCtor.hookId() }
        ?: drawerChanged("native settings section constructor call changed")
    val sectionArgs = sectionCode[sectionAt].drawerArgs()
    if (sectionCode[sectionAt].opcode != Opcode.INVOKE_DIRECT_RANGE || sectionArgs.size != 9 ||
        sectionArgs.any { it !in 0 until sectionSource.implementation!!.registerCount }) drawerChanged("native section arguments changed")
    val allocation = sectionSource.drawerOrigin(sectionAt, sectionArgs[0])
    val returned = sectionCode.singleOrNull { it.opcode == Opcode.RETURN_OBJECT } as? OneRegisterInstruction
    if (sectionCode[allocation].opcode != Opcode.NEW_INSTANCE || sectionCode[allocation].drawerRef().toString() != section ||
        returned?.registerA != sectionArgs[0]) drawerChanged("native section return changed")
    val kindAt = sectionSource.drawerOrigin(sectionAt, sectionArgs[2])
    val stateAt = sectionSource.drawerOrigin(sectionAt, sectionArgs[3])
    val kind = sectionCode[kindAt].drawerRef() as? FieldReference ?: drawerChanged("native section kind changed")
    val state = sectionCode[stateAt].drawerRef() as? FieldReference ?: drawerChanged("native section state changed")
    if (sectionCode[kindAt].opcode != Opcode.SGET_OBJECT || sectionCode[stateAt].opcode != Opcode.SGET_OBJECT ||
        kind.name != "A1P" || state.name != "A01" || kind.type != INTEGER || state.type != INTEGER ||
        kind.definingClass != state.definingClass) drawerChanged("native section constants changed")
    models.field(kind, true); models.field(state, true)
    val generated = MutableMethod(ImmutableMethod(stub.definingClass, stub.name, stub.parameters, stub.returnType,
        stub.accessFlags, stub.annotations, stub.hiddenApiRestrictions, ImmutableMethodImplementation(11, emptyList(), null, null)))
    generated.addInstructions(0, """
        move-object v1, p0
        const/4 v2, 0x0
        sget-object v3, $glyph
        invoke-static {v3}, $icon
        move-result-object v3
        new-instance v4, $SETTINGS_KEY
        invoke-direct {v4}, ${keyCtor.hookId()}
        invoke-static {v4}, $LEGACY_KEY_CACHE
        move-result-object v4
        check-cast v4, $SETTINGS_KEY
        invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;
        move-result-object v5
        new-instance v9, $DRAWER_METADATA
        invoke-direct {v9, v5}, ${metadataCtor.hookId()}
        move-object v5, v9
        const/4 v6, 0x0
        const-string v7, "HushMessenger"
        const/4 v8, 0x0
        new-instance v0, $row
        invoke-direct/range {v0 .. v8}, ${rowCtor.hookId()}
        invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;
        move-result-object v7
        new-instance v0, $section
        const/4 v1, 0x0
        sget-object v2, $kind
        sget-object v3, $state
        const/4 v4, 0x0
        const/4 v5, 0x0
        const/4 v6, 0x0
        const/4 v8, 0x0
        invoke-direct/range {v0 .. v8}, ${sectionCtor.hookId()}
        return-object v0
    """.trimIndent())
    return LegacyDrawerPlan(handoff, ImmutableMethod(stub.definingClass, stub.name, stub.parameters, stub.returnType,
        stub.accessFlags, stub.annotations, stub.hiddenApiRestrictions,
        ImmutableMethodImplementation(11, generated.drawerCode(), null, null)))
}

internal fun MutableMethod.injectLegacyDrawer(refresh: LegacyDrawerRefresh) {
    addInstructions(refresh.insertion, """
        invoke-static {v${refresh.fragment}, v${refresh.sections}}, $LEGACY_DRAWER_ADD
        move-result-object v${refresh.sections}
    """.trimIndent())
}

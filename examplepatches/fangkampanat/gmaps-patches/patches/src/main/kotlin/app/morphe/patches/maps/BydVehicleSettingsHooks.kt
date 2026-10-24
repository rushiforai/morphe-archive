package app.morphe.patches.maps

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*

private const val VEHICLE_SETTINGS = "Lapp/morphe/extension/maps/patches/BydVehicleSettings;"
private const val PREFERENCE = "Landroidx/preference/Preference;"
private const val GROUP = "Landroidx/preference/PreferenceGroup;"
private const val SCREEN = "Landroidx/preference/PreferenceScreen;"
private fun Instruction.settingsCall() = getReference<MethodReference>()
private fun Instruction.settingsField() = getReference<FieldReference>()
private fun settingsGuard(ok: Boolean, why: String, at: Any) {
    if (!ok) throw PatchException("Unrecognized BYD vehicle settings layout: $why in $at")
}
private fun Method.settingsCode() = implementation?.instructions?.toList()
    ?: throw PatchException("Missing BYD vehicle settings body: $this")
private fun Method.settingsPublic() = AccessFlags.PUBLIC.isSet(accessFlags) && !AccessFlags.STATIC.isSet(accessFlags)

/** Proof-only lookups must not normalize every method in an unrelated mutable class. */
private fun BytecodePatchContext.readOnlySettingsHook(fingerprint: Fingerprint, label: String): Method {
    var found: Method? = null
    classDefForEach { cls ->
        if (!cls.type.startsWith("Lapp/morphe/extension/")) cls.methods.forEach { method ->
            fingerprint.clearMatch()
            if (fingerprint.matchOrNull(method, cls) != null) {
                if (found != null) throw PatchException("Ambiguous $label: $found and $method")
                if (method.implementation == null) throw PatchException("Missing implementation for $label: $method")
                found = method
            }
        }
    }
    fingerprint.clearMatch()
    return found ?: throw PatchException("Failed to match $label")
}

internal data class VehicleSettingsEntry(val method: MutableMethod, val schema: String, val size: Int,
    val registers: Int, val receiver: Int, val exits: List<Int>)

/** One real row in either server-selected main Settings screen; the selector is untouched. */
internal class VehicleSettingsPlan(private val entries: List<VehicleSettingsEntry>) {
    val methods = entries.map { it.method }
    val schemas = entries.map { it.schema }
    val method get() = methods.first()
    val schema get() = schemas.joinToString(";")

    fun inject() {
        entries.forEach { entry ->
            val code = entry.method.settingsCode()
            settingsGuard(code.size == entry.size && code.indices.filter { code[it].opcode == Opcode.RETURN_VOID } == entry.exits,
                "unchanged main settings before insertion", entry.method)
            // The terminal void return has no live locals. Retain its label on the receiver move,
            // so even an original branch directly to that return executes the attachment once.
            // In particular, the working v0 alias may have become a Preference before this exit.
            entry.exits.sortedDescending().forEach { exit ->
                checkedNativeInsert(entry.method, exit + 1, """
                    const-string v1, "${entry.schema}"
                    invoke-static { v0, v1 }, $VEHICLE_SETTINGS->attach(Ljava/lang/Object;Ljava/lang/String;)V
                    return-void
                """.trimIndent(), listOf(Opcode.CONST_STRING, Opcode.INVOKE_STATIC, Opcode.RETURN_VOID))
                entry.method.replaceInstruction(exit, "move-object/from16 v0, v${entry.receiver}")
                val changed = entry.method.settingsCode()
                settingsGuard(changed[exit].opcode == Opcode.MOVE_OBJECT_FROM16 &&
                    (changed[exit] as TwoRegisterInstruction).let { it.registerA == 0 && it.registerB == entry.receiver },
                    "terminal label reloads original fragment receiver", entry.method)
            }
            settingsGuard(entry.method.implementation!!.registerCount == entry.registers &&
                entry.method.settingsCode().size == entry.size + entry.exits.size * 3 &&
                entry.method.settingsCode().count { it.opcode == Opcode.RETURN_VOID } == entry.exits.size &&
                entry.method.settingsCode().last().opcode == Opcode.RETURN_VOID,
                "existing locals and return retained", entry.method)
        }
    }
}

/** Resolve obfuscated members from framework types, root keys and their actual value flows. */
internal fun BytecodePatchContext.resolveVehicleSettings(): VehicleSettingsPlan {
    val legacy = readOnlySettingsHook(Fingerprint(returnType = "V", parameters = listOf("Landroid/os/Bundle;", "Ljava/lang/String;"),
        strings = listOf("accountIdAtCreation"), custom = { method, _ ->
            val code = method.implementation?.instructions?.toList().orEmpty()
            code.none { it.opcode == Opcode.NEW_INSTANCE && it.getReference<TypeReference>()?.type ==
                "Lcom/google/android/apps/gmm/settings/CustomSettingsPreference;" } &&
                code.indices.count { index -> code[index].settingsCall()?.let { ref ->
                    ref.parameterTypes == listOf("I") && ref.returnType == "V" &&
                        code[index].invokeRegisters()?.firstOrNull() == 0 &&
                        (code.getOrNull(index - 1) as? NarrowLiteralInstruction)?.narrowLiteral?.ushr(24) == 0x7f
                } == true } == 1
        }), "XML main settings preferences")
    val revamped = readOnlySettingsHook(Fingerprint(returnType = "V", parameters = listOf("Landroid/os/Bundle;", "Ljava/lang/String;"),
        strings = listOf("accountIdAtCreation"), custom = { method, _ ->
            method.implementation?.instructions?.count { it.opcode == Opcode.NEW_INSTANCE &&
                it.getReference<TypeReference>()?.type == "Lcom/google/android/apps/gmm/settings/CustomSettingsPreference;" }?.let { it > 0 } == true
        }), "programmatic main settings preferences")
    val roots = setOf(legacy.definingClass, revamped.definingClass)
    settingsGuard(roots.size == 2, "distinct legacy/revamped roots", roots)
    val selector = readOnlySettingsHook(Fingerprint(returnType = "V", parameters = emptyList(), custom = { method, _ ->
        method.implementation?.instructions?.filter { it.opcode == Opcode.NEW_INSTANCE }
            ?.mapNotNull { it.getReference<TypeReference>()?.type }?.toSet() == roots
    }), "main settings variant selector")
    val choose = selector.settingsCode()
    settingsGuard(choose.size == 13 && selector.implementation!!.registerCount == 2 &&
        selector.implementation!!.tryBlocks.isEmpty() && choose.map { it.opcode } == listOf(
            Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.IGET_OBJECT, Opcode.IF_EQZ,
            Opcode.NEW_INSTANCE, Opcode.INVOKE_DIRECT, Opcode.INVOKE_STATIC, Opcode.RETURN_VOID,
            Opcode.NEW_INSTANCE, Opcode.INVOKE_DIRECT, Opcode.INVOKE_STATIC, Opcode.RETURN_VOID) &&
        choose[5].getReference<TypeReference>()?.type == revamped.definingClass &&
        choose[9].getReference<TypeReference>()?.type == legacy.definingClass &&
        choose[7].settingsCall()?.toString() == choose[11].settingsCall()?.toString() &&
        choose[7].invokeRegisters() == listOf(1, 0) && choose[11].invokeRegisters() == listOf(1, 0) &&
        choose.take(4).sumOf { it.codeUnits } + (choose[4] as OffsetInstruction).codeOffset == choose.take(9).sumOf { it.codeUnits },
        "both roots selected by original flag and same navigator", selector)
    return VehicleSettingsPlan(listOf(resolveVehicleSettingsEntry(legacy, false), resolveVehicleSettingsEntry(revamped, true)))
}

private fun BytecodePatchContext.resolveVehicleSettingsEntry(root: Method, revamped: Boolean): VehicleSettingsEntry {
    val code = root.settingsCode()
    val receiver = code.firstOrNull() as? TwoRegisterInstruction
    val size = code.size
    val registers = root.implementation!!.registerCount
    val originalReceiver = registers - 3 // instance method with Bundle and String, neither wide
    val exits = code.indices.filter { code[it].opcode == Opcode.RETURN_VOID }
    settingsGuard(root.settingsPublic() && originalReceiver > 1 &&
        root.implementation!!.tryBlocks.isEmpty() && code.first().opcode == Opcode.MOVE_OBJECT_FROM16 &&
        receiver != null && receiver.registerA == 0 && receiver.registerB == originalReceiver &&
        exits.isNotEmpty() && code.last().opcode == Opcode.RETURN_VOID &&
        code.none { instruction -> instruction.opcode.setsRegister() && (instruction as? OneRegisterInstruction)?.let {
            it.registerA == originalReceiver || instruction.opcode.setsWideRegister() && it.registerA + 1 == originalReceiver
        } == true } &&
        code.none { it.opcode in setOf(Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH, Opcode.FILL_ARRAY_DATA) },
        "original parameter receiver survives to every terminal void return", root)
    val flow = SettingsFlow(code, root)
    settingsGuard(exits.all { it in flow.reachable() }, "every normal return reachable", root)

    val keyTypes = code.mapNotNull { if (it.opcode == Opcode.SGET_OBJECT) it.settingsField()?.definingClass else null }.toSet()
    val keyClass = keyTypes.map { classDefBy(it) }.singleOrNull { cls ->
        cls.methods.any { method -> method.name == "<clinit>" &&
            method.implementation?.instructions?.mapNotNull { it.getReference<StringReference>()?.string }?.toSet()
                ?.containsAll(listOf("about", "navigation_settings", "vehicle_settings", "ev_profile")) == true }
    } ?: throw PatchException("Missing unique Maps main-settings key table")
    val keyInit = keyClass.methods.single { it.name == "<clinit>" }.settingsCode()
    val rootKeys = code.mapNotNull { if (it.opcode == Opcode.SGET_OBJECT) it.settingsField()?.toString() else null }.toSet()
    for (key in listOf("about", "navigation_settings", "vehicle_settings", "ev_profile")) {
        val index = keyInit.indices.single { keyInit[it].getReference<StringReference>()?.string == key }
        val part = keyInit.subList(index, index + 4)
        settingsGuard(part.map { it.opcode } == listOf(Opcode.CONST_STRING, Opcode.INVOKE_STATIC,
            Opcode.MOVE_RESULT_OBJECT, Opcode.SPUT_OBJECT) &&
            part.last().settingsField()?.toString() in rootKeys,
            "main root references canonical $key entry", root)
    }

    var screenSetup = -1
    val fragmentType = if (!revamped) {
        val inflateIndex = code.indices.singleOrNull { index -> code[index].settingsCall()?.let {
            it.parameterTypes == listOf("I") && it.returnType == "V" &&
                code[index].invokeRegisters()?.firstOrNull() == 0 &&
                (code.getOrNull(index - 1) as? NarrowLiteralInstruction)?.narrowLiteral?.ushr(24) == 0x7f
        } == true } ?: throw PatchException("Missing inspected main-settings XML inflation")
        val literal = code[inflateIndex - 1] as? OneRegisterInstruction
        settingsGuard(code[inflateIndex].opcode == Opcode.INVOKE_VIRTUAL && literal != null &&
            code[inflateIndex].invokeRegisters() == listOf(0, literal.registerA),
            "main-settings XML register flow", root)
        screenSetup = inflateIndex
        code[inflateIndex].settingsCall()!!.definingClass
    } else {
        val createIndex = code.indices.singleOrNull { index -> code[index].settingsCall()?.let {
            it.parameterTypes == listOf("Landroid/content/Context;") && it.returnType == SCREEN
        } == true } ?: throw PatchException("Missing unique main PreferenceScreen creation")
        val create = code[createIndex].settingsCall()!!
        val result = code.getOrNull(createIndex + 1) as? OneRegisterInstruction
        val install = code.getOrNull(createIndex + 2)?.settingsCall()
        val getter = code.getOrNull(createIndex + 3)?.settingsCall()
        settingsGuard(code[createIndex].opcode == Opcode.INVOKE_VIRTUAL &&
            code.getOrNull(createIndex + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT && result != null &&
            code.getOrNull(createIndex + 2)?.opcode == Opcode.INVOKE_VIRTUAL && install != null &&
            install.parameterTypes == listOf(SCREEN) && install.returnType == "V" &&
            code[createIndex + 2].invokeRegisters() == listOf(0, result.registerA) &&
            code.getOrNull(createIndex + 3)?.opcode == Opcode.INVOKE_VIRTUAL && getter != null &&
            getter.parameterTypes.isEmpty() && getter.returnType == SCREEN &&
            getter.definingClass == install.definingClass && code[createIndex + 3].invokeRegisters() == listOf(0),
            "programmatic screen is created, installed and read on the same root", root)
        val factory = classDefBy(create.definingClass).methods.single { it.toString() == create.toString() }
        val factoryCode = factory.settingsCode()
        settingsGuard(factoryCode.count { it.opcode == Opcode.NEW_INSTANCE && it.getReference<TypeReference>()?.type == SCREEN } == 1 &&
            factoryCode.any { it.settingsCall()?.let { call -> call.definingClass == SCREEN && call.name == "<init>" &&
                call.parameterTypes == listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;") } == true },
            "original programmatic factory constructs framework PreferenceScreen", factory)
        screenSetup = createIndex + 2
        getter!!.definingClass
    }
    settingsGuard(exits.none { it in flow.reachable(blocked = screenSetup) },
        "PreferenceScreen setup dominates every normal exit", root)
    // The alias used by all root-to-screen operations must still be this until setup.
    settingsGuard(code.subList(1, screenSetup + 1).none { it.opcode.setsRegister() &&
        (it as? OneRegisterInstruction)?.registerA == 0 }, "live root alias at screen setup", root)
    val fragment = classDefBy(fragmentType)
    val screenGetter = fragment.methods.single { it.settingsPublic() && it.parameterTypes.isEmpty() && it.returnType == SCREEN }
    val sc = screenGetter.settingsCode()
    settingsGuard(sc.size == 6 && sc.first().opcode == Opcode.IGET_OBJECT && sc[4].opcode == Opcode.IGET_OBJECT &&
        sc[4].settingsField()?.type == SCREEN && sc.last().opcode == Opcode.RETURN_OBJECT,
        "public root PreferenceScreen getter", screenGetter)
    settingsGuard(code.any { it.settingsCall()?.toString() == screenGetter.toString() }, "root uses same screen", root)

    val screenField = sc[4].settingsField()!!
    val install = fragment.methods.single { it.settingsPublic() && it.parameterTypes == listOf(SCREEN) && it.returnType == "V" }
    settingsGuard(install.settingsCode().any { it.opcode == Opcode.IPUT_OBJECT &&
        it.settingsField()?.toString() == screenField.toString() }, "screen installer writes getter's field", install)
    if (!revamped) {
        val inflater = fragment.methods.single { it.toString() == code[screenSetup].settingsCall().toString() }
        val body = inflater.settingsCode()
        val inflate = body.indices.singleOrNull { index -> body[index].settingsCall()?.let { ref ->
            ref.parameterTypes == listOf("Landroid/content/Context;", "I", SCREEN) && ref.returnType == SCREEN
        } == true } ?: throw PatchException("Missing Preference XML inflater API")
        val call = body[inflate].settingsCall()!!
        val api = classDefBy(call.definingClass).methods.single { it.toString() == call.toString() }
        val args = body[inflate].invokeRegisters()
        val result = body.getOrNull(inflate + 1) as? OneRegisterInstruction
        settingsGuard(body.any { it.settingsCall()?.toString() == screenGetter.toString() } &&
            args?.size == 4 && args[2] == inflater.implementation!!.registerCount - 1 &&
            body.getOrNull(inflate + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT && result != null &&
            body.getOrNull(inflate + 2)?.settingsCall()?.toString() == install.toString() &&
            body[inflate + 2].invokeRegisters() == listOf(inflater.implementation!!.registerCount - 2, result.registerA) &&
            api.settingsCode().any { it.settingsCall()?.toString() == "Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;" },
            "literal selects actual XML inflater and its screen is installed on same root", inflater)
    }

    fun activitySubtype(type: String): Boolean {
        if (!type.startsWith("L")) return false
        var current: String? = type
        val seen = mutableSetOf<String>()
        while (current != null && current != "Ljava/lang/Object;" && seen.add(current)) {
            if (current == "Landroid/app/Activity;") return true
            current = classDefBy(current).superclass
        }
        return false
    }
    val rootClass = classDefBy(root.definingClass)
    val host = readOnlySettingsHook(Fingerprint(parameters = emptyList(), strings = listOf(" not attached to an activity.")),
        "attached Settings activity")
    settingsGuard(AccessFlags.PUBLIC.isSet(rootClass.accessFlags) && AccessFlags.PUBLIC.isSet(fragment.accessFlags) &&
        AccessFlags.PUBLIC.isSet(classDefBy(host.definingClass).accessFlags) && host.settingsPublic() &&
        activitySubtype(host.returnType) && rootClass.methods.any { method ->
        method.implementation?.instructions?.any { it.settingsCall()?.toString() == host.toString() } == true },
        "required attached Activity getter", host)

    val preference = classDefBy(PREFERENCE)
    val group = classDefBy(GROUP)
    settingsGuard(AccessFlags.PUBLIC.isSet(preference.accessFlags) && AccessFlags.PUBLIC.isSet(group.accessFlags) &&
        preference.methods.any { it.name == "<init>" && it.parameterTypes == listOf("Landroid/content/Context;") &&
            AccessFlags.PUBLIC.isSet(it.accessFlags) }, "public Preference constructor", preference)
    val contextField = preference.fields.single { it.type == "Landroid/content/Context;" }
    settingsGuard(AccessFlags.PUBLIC.isSet(contextField.accessFlags) && AccessFlags.FINAL.isSet(contextField.accessFlags),
        "public final preference context", contextField)
    val keyGetter = preference.methods.single { it.settingsPublic() && it.parameterTypes.isEmpty() &&
        it.returnType == "Ljava/lang/String;" && it.settingsCode().let { c -> c.size == 2 &&
            c.first().opcode == Opcode.IGET_OBJECT && c.first().settingsField()?.type == "Ljava/lang/String;" &&
            c.last().opcode == Opcode.RETURN_OBJECT } }
    val keyField = keyGetter.settingsCode().first().settingsField()!!
    val keySetter = preference.methods.single { it.settingsPublic() && it.parameterTypes == listOf("Ljava/lang/String;") &&
        it.returnType == "V" && it.settingsCode().firstOrNull()?.let { ins -> ins.opcode == Opcode.IPUT_OBJECT &&
            ins.settingsField()?.toString() == keyField.toString() && (ins as? TwoRegisterInstruction)?.let { r ->
                r.registerA == 1 && r.registerB == 0 } == true } == true }

    val summary = preference.methods.single { it.settingsPublic() && it.parameterTypes == listOf("Ljava/lang/CharSequence;") &&
        it.returnType == "V" && it.settingsCode().any { ins ->
            ins.getReference<StringReference>()?.string == "Preference already has a SummaryProvider set." } }
    val title = preference.methods.single { it.settingsPublic() && it.parameterTypes == listOf("Ljava/lang/CharSequence;") &&
        it.returnType == "V" && it.toString() != summary.toString() && it.settingsCode().let { c ->
            c.size == 7 && c.first().opcode == Opcode.IGET_OBJECT && c[4].opcode == Opcode.IPUT_OBJECT &&
                c.first().settingsField()?.toString() == c[4].settingsField()?.toString() &&
                c[1].settingsCall()?.toString() == "Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z" } }
    val clickSetters = preference.methods.mapNotNull { method ->
        if (!method.settingsPublic() || method.parameterTypes.size != 1 || method.returnType != "V" ||
            method.parameterTypes[0].toString().startsWith("Landroid") || method.parameterTypes[0].toString().length < 3) return@mapNotNull null
        val body = method.implementation?.instructions?.toList() ?: return@mapNotNull null
        if (body.size != 2 || body.first().opcode != Opcode.IPUT_OBJECT || body.last().opcode != Opcode.RETURN_VOID) return@mapNotNull null
        val field = body.first().settingsField() ?: return@mapNotNull null
        if (field.type != method.parameterTypes[0].toString()) return@mapNotNull null
        val type = classDefBy(field.type)
        val callback = type.methods.singleOrNull { it.parameterTypes == listOf(PREFERENCE) && it.returnType == "Z" &&
            AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.ABSTRACT.isSet(it.accessFlags) } ?: return@mapNotNull null
        if (!AccessFlags.PUBLIC.isSet(type.accessFlags) || !AccessFlags.INTERFACE.isSet(type.accessFlags)) return@mapNotNull null
        Triple(method, type.type, callback.name)
    }
    val click = clickSetters.single()
    val listenerField = click.first.settingsCode().first().settingsField()!!
    val dispatch = preference.methods.single { method -> method.implementation?.instructions?.any {
        it.settingsCall()?.let { ref -> ref.definingClass == click.second && ref.name == click.third &&
            ref.parameterTypes == listOf(PREFERENCE) && ref.returnType == "Z" } == true } == true }
    val dc = dispatch.settingsCode()
    val callbackIndex = dc.indices.single { dc[it].settingsCall()?.let { ref -> ref.definingClass == click.second &&
        ref.name == click.third && ref.parameterTypes == listOf(PREFERENCE) && ref.returnType == "Z" } == true }
    val branch = dc.getOrNull(callbackIndex + 2) as? OffsetInstruction
    val clickLoad = dc.getOrNull(callbackIndex - 2) as? TwoRegisterInstruction
    val nullGuard = dc.getOrNull(callbackIndex - 1) as? OffsetInstruction
    val clickResult = dc.getOrNull(callbackIndex + 1) as? OneRegisterInstruction
    val dispatchReceiver = dispatch.implementation!!.registerCount - 1
    settingsGuard(dispatch.settingsPublic() && dispatch.parameterTypes.isEmpty() && dispatch.returnType == "V" &&
        callbackIndex >= 2 && dc[callbackIndex - 2].opcode == Opcode.IGET_OBJECT && clickLoad != null &&
        dc[callbackIndex - 2].settingsField()?.toString() == listenerField.toString() &&
        clickLoad.registerB == dispatchReceiver &&
        dc[callbackIndex - 1].opcode == Opcode.IF_EQZ && nullGuard != null &&
        (dc[callbackIndex - 1] as? OneRegisterInstruction)?.registerA == clickLoad.registerA &&
        dc.take(callbackIndex - 1).sumOf { it.codeUnits } + nullGuard.codeOffset ==
            dc.take(callbackIndex + 3).sumOf { it.codeUnits } &&
        dc[callbackIndex].invokeRegisters() == listOf(clickLoad.registerA, dispatchReceiver) &&
        dc[callbackIndex + 1].opcode == Opcode.MOVE_RESULT &&
        clickResult != null && dc[callbackIndex + 2].opcode == Opcode.IF_NEZ && branch != null &&
        (dc[callbackIndex + 2] as? OneRegisterInstruction)?.registerA == clickResult.registerA &&
        dc.take(callbackIndex + 2).sumOf { it.codeUnits } + branch.codeOffset == dc.dropLast(1).sumOf { it.codeUnits } &&
        dc.drop(callbackIndex + 3).any { it.settingsCall()?.let { ref -> ref.definingClass != click.second &&
            ref.parameterTypes == listOf(PREFERENCE) && ref.returnType == "Z" } == true } &&
        dc.last().opcode == Opcode.RETURN_VOID,
        "owned click is consumed before original fragment routing", dispatch)
    val add = group.methods.single { it.settingsPublic() && it.parameterTypes == listOf(PREFERENCE) && it.returnType == "V" &&
        it.settingsCode().any { ins -> ins.settingsCall()?.toString() == "Ljava/util/List;->add(ILjava/lang/Object;)V" } }
    val find = group.methods.single { it.settingsPublic() && it.parameterTypes == listOf("Ljava/lang/CharSequence;") && it.returnType == PREFERENCE }
    settingsGuard(add.settingsCode().any { it.settingsCall()?.toString() == find.toString() } &&
        add.settingsCode().any { it.settingsCall()?.toString() == keyGetter.toString() },
        "add/find preference identity flow", add)
    if (revamped) {
        val rows = code.count { it.opcode == Opcode.NEW_INSTANCE &&
            it.getReference<TypeReference>()?.type == "Lcom/google/android/apps/gmm/settings/CustomSettingsPreference;" }
        val adds = code.indices.filter { code[it].settingsCall()?.toString() == add.toString() }
        settingsGuard(rows > 0 && adds.size == rows &&
            classDefBy("Lcom/google/android/apps/gmm/settings/CustomSettingsPreference;").superclass == PREFERENCE,
            "programmatic main root populates same PreferenceScreen with its custom rows", root)
        fun lastWrite(register: Int, before: Int) = (0 until before).lastOrNull { index ->
            val instruction = code[index]
            instruction.opcode.setsRegister() && (instruction as? OneRegisterInstruction)?.let {
                it.registerA == register || instruction.opcode.setsWideRegister() && it.registerA + 1 == register
            } == true
        }
        fun objectOrigin(register: Int, before: Int): Int {
            val write = lastWrite(register, before) ?: throw PatchException("Missing main Settings row value")
            if (code[write].opcode in setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16))
                return objectOrigin((code[write] as TwoRegisterInstruction).registerB, write)
            return write
        }
        adds.forEach { index ->
            val args = code[index].invokeRegisters()
                ?: throw PatchException("Missing main Settings row operands in $root")
            settingsGuard(args.size == 2 && args[0] != args[1], "screen and row have distinct operands", root)
            val screen = lastWrite(args[0], index) ?: throw PatchException("Missing main Settings screen value")
            val row = objectOrigin(args[1], index)
            val allocated = (code[row] as? OneRegisterInstruction)?.registerA
            val constructors = (row + 1 until index).filter { constructor -> code[constructor].settingsCall()?.let {
                it.name == "<init>" && it.definingClass == "Lcom/google/android/apps/gmm/settings/CustomSettingsPreference;" &&
                    code[constructor].invokeRegisters()?.firstOrNull() == allocated
            } == true }
            settingsGuard(code[screen].opcode == Opcode.MOVE_RESULT_OBJECT && screen > 0 &&
                code[screen - 1].settingsCall()?.toString() == screenGetter.toString() &&
                code[screen - 1].invokeRegisters() == listOf(0) &&
                code.subList(1, screen).none { it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.registerA == 0 } &&
                code[row].opcode == Opcode.NEW_INSTANCE && code[row].getReference<TypeReference>()?.type ==
                    "Lcom/google/android/apps/gmm/settings/CustomSettingsPreference;" &&
                allocated != null && constructors.size == 1 && lastWrite(allocated, constructors.single()) == row &&
                listOf(screen, row, constructors.single()).all { required -> index !in flow.reachable(blocked = required) },
                "each constructed custom row is added to this root's live installed screen", root)
        }
    }

    fun className(type: String) = type.removePrefix("L").removeSuffix(";").replace('/', '.')
    val schema = listOf(className(root.definingClass), screenGetter.name, host.name, contextField.name,
        keySetter.name, title.name, summary.name, click.first.name, className(click.second), click.third,
        add.name, find.name).joinToString("|")
    settingsGuard(schema.none { it == '"' || it == '\n' || it == '\r' }, "safe member schema", schema)
    val mutable = mutableClassDefBy(root.definingClass).methods.single { it.toString() == root.toString() }
    return VehicleSettingsEntry(mutable, schema, size, registers, originalReceiver, exits)
}

/** Small, conservative CFG for the inspected Settings bodies; no switch/exception guesses. */
private class SettingsFlow(private val code: List<Instruction>, private val owner: Any) {
    private val addresses = IntArray(code.size)
    private val indices: Map<Int, Int>
    init {
        var address = 0
        code.forEachIndexed { index, instruction -> addresses[index] = address; address += instruction.codeUnits }
        indices = addresses.withIndex().associate { it.value to it.index }
    }
    fun reachable(blocked: Int = -1): Set<Int> {
        val seen = mutableSetOf<Int>()
        val pending = ArrayDeque<Int>()
        pending.add(0)
        while (pending.isNotEmpty()) {
            val index = pending.removeFirst()
            if (index == blocked || !seen.add(index)) continue
            settingsGuard(index in code.indices, "control flow stays in method", owner)
            val instruction = code[index]
            if (instruction.opcode == Opcode.RETURN_VOID || instruction.opcode == Opcode.THROW) continue
            if (instruction is OffsetInstruction) {
                val target = indices[addresses[index] + instruction.codeOffset]
                    ?: throw PatchException("Non-instruction Settings branch target in $owner")
                pending.add(target)
                if (instruction.opcode in setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)) continue
                settingsGuard(instruction.opcode in setOf(Opcode.IF_EQ, Opcode.IF_NE, Opcode.IF_LT, Opcode.IF_GE,
                    Opcode.IF_GT, Opcode.IF_LE, Opcode.IF_EQZ, Opcode.IF_NEZ, Opcode.IF_LTZ, Opcode.IF_GEZ,
                    Opcode.IF_GTZ, Opcode.IF_LEZ), "known conditional Settings edge", owner)
            }
            pending.add(index + 1)
        }
        return seen
    }
}

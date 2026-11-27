/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-26.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.shared.misc.fix.proto.parseByteArrayMethodRef
import app.morphe.util.Utils.printInfo
import app.morphe.util.Utils.printWarn
import app.morphe.util.cloneMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val PLAYER_ACTIONS = "Lapp/morphe/extension/music/patches/downloads/OfflinePlayerActions;"
private const val REGISTRY = "Lcom/google/protobuf/ExtensionRegistryLite;"
private const val STRING = "Ljava/lang/String;"
private const val OBJECT = "Ljava/lang/Object;"
private const val VIEW = "Landroid/view/View;"
private const val OPTIONAL = "Lj\$/util/Optional;"
private const val OPTIONAL_GET = "$OPTIONAL->get()$OBJECT"
private const val OPTIONAL_PRESENT = "$OPTIONAL->isPresent()Z"
private const val PLAYER_MENU_MARKER = "rvxOfflinePlayerMenu"

private data class PlayerMenuAbi(
    val clickOwners: List<String>,
    val facade: String,
    val item: String,
    val menuGetter: String,
    val titleGetter: String,
    val idOwner: String,
    val idGetter: String,
    val merger: String,
    val mergeName: String,
    val presenter: String,
    val mergesOccurrence: Boolean,
)

/** The full player listeners only; queue/item, Library and Elements presenters are not hooked. */
private fun playerMenuAbi(version: String?) = when (version) {
    "9.45.51" -> PlayerMenuAbi(listOf("Lhut;", "Lhtn;"), "Lahzu;", "Lhwj;", "c", "h", "Labmf;", "t",
        "Lch;", "L", "Lixp;", true)
    "9.40.51" -> PlayerMenuAbi(listOf("Lhvs;", "Lhuo;"), "Lawzr;", "Lhxg;", "c", "h", "Labgf;", "t",
        "Lhed;", "v", "Lixv;", true)
    "9.15.51" -> PlayerMenuAbi(listOf("Lrnw;"), "Lnop;", "Lnog;", "c", "h", "Lazcf;", "t",
        "Lnne;", "a", "Lqfg;", true)
    "8.30.54" -> PlayerMenuAbi(listOf("Lqzg;"), "Lnam;", "Lnah;", "c", "h", "Lavvx;", "s",
        "Lmzi;", "a", "Lppq;", false)
    "8.28.54" -> PlayerMenuAbi(listOf("Lqxy;"), "Lmzc;", "Lmyx;", "c", "h", "Lavnm;", "s",
        "Lmxy;", "a", "Lpoi;", false)
    "8.12.54" -> PlayerMenuAbi(listOf("Lqpq;"), "Lmsr;", "Lmsm;", "b", "g", "Latlm;", "r",
        "Lmrl;", "a", "Lpfe;", false)
    else -> error("no stock player menu ABI for this version")
}

private data class MenuCall(val index: Int, val receiver: Int)
private data class PlayerMenuClick(
    val method: MutableMethod,
    val current: MenuCall,
    val currentGetter: MethodReference,
    val getters: List<MenuCall>,
    val merge: MenuCall,
    val route: MethodReference,
)

internal fun BytecodePatchContext.installOfflinePlayerActions(commandType: String) {
    val version = packageMetadata.versionName
    try {
        prepareOfflinePlayerActions(playerMenuAbi(version), commandType).invoke()
        printInfo("OfflinePlayerActions: installed native player menu for Music $version")
    } catch (failure: Exception) {
        printWarn("Offline player actions unavailable on Music $version: ${failure.message}")
    }
}

private fun BytecodePatchContext.prepareOfflinePlayerActions(abi: PlayerMenuAbi, commandType: String): () -> Unit {
    val getter = classDefBy(abi.item).methods.single { it.name == abi.menuGetter && it.parameterTypes.isEmpty() }
    val menuType = getter.returnType
    val title = classDefBy(abi.item).methods.single {
        it.name == abi.titleGetter && it.parameterTypes.isEmpty() && it.returnType == STRING
    }
    val videoId = classDefBy(abi.idOwner).methods.single {
        it.name == abi.idGetter && it.parameterTypes.isEmpty() && it.returnType == STRING
    }
    val menuClass = mutableClassDefBy(menuType)
    val default = menuClass.fields.single { it.type == menuType && AccessFlags.STATIC.isSet(it.accessFlags) }
    val mergeClass = mutableClassDefBy(abi.merger)
    val stockMerge = mergeClass.methods.single {
        it.name == abi.mergeName && it.returnType == menuType &&
                it.parameterTypes == listOf(if (abi.mergesOccurrence) abi.item else menuType)
    }
    val clicks = abi.clickOwners.map { resolvePlayerMenuClick(it, abi, getter, stockMerge) }
    val facade = mutableClassDefBy(abi.facade)
    val currentGetter = clicks.map { it.currentGetter }.distinctBy(MethodReference::toString).single()
    val storageField = resolvePlayerStorage(abi, facade.methods, currentGetter.name)
    check(facade.fields.any { it == storageField && AccessFlags.FINAL.isSet(it.accessFlags) }) {
        "stock current-item storage is not final"
    }
    val storageAccessor = "${abi.facade}->rvxOfflineQueueStorage()$OBJECT"
    val route = clicks.map(PlayerMenuClick::route).distinctBy(MethodReference::toString).single()
    val sheetSelector = mutableClassDefBy(route.definingClass).methods.single { it.toString() == route.toString() }
    check(sheetSelector.implementation!!.registerCount in 3..16 &&
            !AccessFlags.STATIC.isSet(sheetSelector.accessFlags)) {
        "unsafe native sheet selector registers"
    }

    val parserOwner = checkNotNull(parseByteArrayMethodRef.get()).definingClass
    val parser = mutableClassDefBy(parserOwner).methods.single {
        it.name == "parseFrom" && it.parameterTypes == listOf(parserOwner, "[B", REGISTRY)
    }
    check(isPlayerMenuProto(menuType, parserOwner) && isPlayerMenuProto(commandType, parserOwner)) {
        "player menu and command must share the generated protobuf parser"
    }

    val probe = "$menuType->rvxOfflinePlayerMenuProbe(${abi.item})$menuType"
    val build = "$menuType->rvxOfflinePlayerMenu(${abi.item}${abi.facade})$menuType"
    val marker = ImmutableField(
        menuType, PLAYER_MENU_MARKER, "Z", AccessFlags.PUBLIC.value, null, emptySet(), emptySet(),
    )
    val localMerge = stockMerge.clonePlayerMenuMerge(abi, getter, build, marker)

    val readVideoId = """
        instance-of v0, p0, ${abi.idOwner}
        if-eqz v0, :stock
        move-object v0, p0
        check-cast v0, ${abi.idOwner}
        invoke-interface {v0}, $videoId
        move-result-object v0
        invoke-static {v0}, $PLAYER_ACTIONS->copyForMenu($STRING)$STRING
        move-result-object v1
        if-eqz v1, :stock
    """
    val stockGetter = """
        :stock
        invoke-interface {p0}, $getter
        move-result-object v0
        return-object v0
    """
    val probeMethod = playerMenuBridge(menuType, "rvxOfflinePlayerMenuProbe", listOf(abi.item), 3, """
        $readVideoId
        sget-object v0, $default
        return-object v0
        $stockGetter
    """)
    val buildMethod = playerMenuBridge(menuType, "rvxOfflinePlayerMenu", listOf(abi.item, abi.facade), 6, """
        $readVideoId
        invoke-interface {p0}, $title
        move-result-object v2
        invoke-virtual {p1}, $storageAccessor
        move-result-object v3
        invoke-static {v3, p0, v0, v2, v1}, $PLAYER_ACTIONS->menu($OBJECT$OBJECT$STRING$STRING$STRING)[B
        move-result-object v0
        if-eqz v0, :stock
        sget-object v1, $default
        invoke-static {}, $REGISTRY->getGeneratedRegistry()$REGISTRY
        move-result-object v2
        invoke-static {v1, v0, v2}, $parser
        move-result-object v0
        check-cast v0, $menuType
        const/4 v1, 0x1
        iput-boolean v1, v0, $marker
        return-object v0
        $stockGetter
    """)

    return {
        facade.addDownloadsBridge("rvxOfflineQueueStorage", emptyList(), OBJECT, 2, """
            iget-object v0, p0, $storageField
            return-object v0
        """)
        menuClass.instanceFields.add(marker.toMutable())
        menuClass.methods.add(probeMethod)
        menuClass.methods.add(buildMethod)
        mergeClass.methods.add(localMerge)
        // Keep the existing ordinary bottom sheet for a synthesized menu even if an Elements experiment is enabled.
        // The stock ordinary presenter supplies the exact occurrence tag when its command is dispatched.
        sheetSelector.addInstructionsWithLabels(0, """
            if-eqz p1, :rvx_stock_sheet
            iget-boolean v0, p1, $marker
            if-eqz v0, :rvx_stock_sheet
            const/4 v0, 0x0
            return v0
            :rvx_stock_sheet
            nop
        """)
        clicks.forEach { click -> installPlayerMenuClick(click, abi, probe, build, localMerge) }
    }
}

/** Both stock mergers append their own player providers; only the player listeners use these copies. */
private fun MutableMethod.clonePlayerMenuMerge(
    abi: PlayerMenuAbi,
    getter: MethodReference,
    build: String,
    marker: ImmutableField,
): MutableMethod {
    if (!abi.mergesOccurrence) {
        return cloneMutable(name = "rvxOfflinePlayerMerge", clearImplementation = true, registerCount = 4).apply {
            addInstructionsWithLabels(0, """
                invoke-virtual {p0, p1}, ${this@clonePlayerMenuMerge}
                move-result-object v0
                if-eqz p1, :done
                if-eqz v0, :done
                iget-boolean v1, p1, $marker
                iput-boolean v1, v0, $marker
                :done
                return-object v0
            """)
        }
    }

    val code = implementation!!.instructions.toList()
    val getterIndex = code.indices.single { code[it].refersTo(getter) }
    val call = code.menuCall(getterIndex, Opcode.INVOKE_INTERFACE, 1)
    check(call.receiver == implementation!!.registerCount - 1) { "merge reads a different item" }

    // This is the occurrence menu also wrapped by Optional.ofNullable for the player-level providers.
    val input = (code[getterIndex + 1] as OneRegisterInstruction).registerA
    val optionalIndex = code.indices.single { index ->
        val ref = code[index].getReference<MethodReference>()
        ref?.definingClass == "Lj\$/util/Optional;" && ref.name == "ofNullable"
    }
    val optionalCall = code.menuCall(optionalIndex, Opcode.INVOKE_STATIC, 1)
    val exit = code.indices.single { code[it].opcode == Opcode.RETURN_OBJECT }
    val output = (code[exit] as OneRegisterInstruction).registerA
    check(input == optionalCall.receiver && optionalIndex < exit &&
            input in 1..15 && output in 1..15 && input != output &&
            code.subList(optionalIndex + 1, exit).none { it.opcode.setsRegister() &&
                    (it as? OneRegisterInstruction)?.registerA == input }) { "merge menu register does not survive" }

    val registers = implementation!!.registerCount
    check(registers < 16) { "no encodable player merge storage register" }
    return cloneMutable(
        name = "rvxOfflinePlayerMerge", registerCount = registers + 1,
        parameters = parameters + ImmutableMethodParameter(abi.facade, null, null),
    ).apply {
        replaceInstruction(call.index, "invoke-static {v${call.receiver}, p2}, $build")
        addInstructionsWithLabels(exit, """
            if-eqz v$input, :rvx_merge_done
            iget-boolean v0, v$input, $marker
            iput-boolean v0, v$output, $marker
            :rvx_merge_done
            nop
        """)
    }
}

/** Read the exact final storage reference used by the stock getter, including when Jam wraps its result. */
private fun resolvePlayerStorage(
    abi: PlayerMenuAbi,
    methods: Iterable<MutableMethod>,
    getter: String,
): FieldReference {
    val body = methods.filter { it.name in setOf(getter, "patch_jamLocalItem") && it.returnType == OPTIONAL &&
            it.parameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(it.accessFlags) }
        .mapNotNull { it.implementation }
        .single { implementation -> implementation.instructions.any { it.isPlayerStorageLookup(abi.idOwner) } }
    val code = body.instructions.toList()
    val index = code.indices.single { code[it].isPlayerStorageLookup(abi.idOwner) }
    val lookup = code[index]
    val storageType = lookup.getReference<MethodReference>()!!.definingClass
    val register = (lookup as FiveRegisterInstruction).registerC
    val access = (index - 1 downTo 0).asSequence().map { code[it] }.firstOrNull { instruction ->
        instruction.opcode.setsRegister() && instruction.opcode != Opcode.CHECK_CAST &&
                (instruction as? OneRegisterInstruction)?.registerA == register
    }
    val field = access?.getReference<FieldReference>()
    check(access?.opcode == Opcode.IGET_OBJECT && field != null && field.definingClass == abi.facade &&
            (access as TwoRegisterInstruction).registerB == body.registerCount - 1 &&
            (field.type == storageType || field.type == OBJECT)) { "unexpected storage receiver in ${abi.facade}" }
    return field
}

private fun Instruction.isPlayerStorageLookup(item: String): Boolean {
    val ref = getReference<MethodReference>()
    return this is FiveRegisterInstruction && opcode == Opcode.INVOKE_VIRTUAL && registerCount == 2 &&
            ref?.returnType == item && ref.parameterTypes == listOf("Z")
}

private fun BytecodePatchContext.installPlayerMenuClick(
    click: PlayerMenuClick,
    abi: PlayerMenuAbi,
    probe: String,
    build: String,
    merge: MethodReference,
) {
    val stock = click.method
    val facadeRegister = stock.implementation!!.registerCount
    // The clone remaps this/View to their original registers, leaving the new register free across the stock branch.
    val replacement = stock.cloneMutable(additionalRegisters = 1)
    val prologue = 2
    for ((ordinal, call) in click.getters.withIndex()) {
        val invoke = if (ordinal == 0) "invoke-static {v${call.receiver}}, $probe"
        else "invoke-static {v${call.receiver}, v$facadeRegister}, $build"
        replacement.replaceInstruction(call.index + prologue, invoke)
    }

    val call = click.merge
    val stockArgs = stock.implementation!!.instructions[call.index] as FiveRegisterInstruction
    val args = "v${call.receiver}, v${stockArgs.registerD}" + if (abi.mergesOccurrence) ", v$facadeRegister" else ""
    replacement.replaceInstruction(call.index + prologue, "invoke-virtual {$args}, $merge")
    replacement.addInstructions(click.current.index + prologue,
        "move-object v$facadeRegister, v${click.current.receiver}")

    val owner = mutableClassDefBy(stock.definingClass)
    // Jam can rename the stock method in place, so its current signature no longer hashes to its set entry.
    check(owner.methods.removeAll { it === stock }) { "could not remove stock player listener $stock" }
    check(owner.methods.add(replacement)) { "could not publish player listener $replacement" }
}

private fun BytecodePatchContext.isPlayerMenuProto(type: String, base: String): Boolean {
    var current = type
    while (current != base) current = classDefByOrNull(current)?.superclass ?: return false
    return true
}

private fun BytecodePatchContext.resolvePlayerMenuClick(
    owner: String,
    abi: PlayerMenuAbi,
    getter: MethodReference,
    merge: MethodReference,
): PlayerMenuClick {
    val menu = getter.returnType
    val click = mutableClassDefBy(owner).methods.single { method ->
        method.name in setOf("onClick", "patch_jamLocalClick") && method.parameterTypes == listOf(VIEW) &&
                method.returnType == "V" && method.implementation?.instructions?.any { it.refersTo(getter) } == true
    }
    val code = click.implementation!!.instructions.toList()
    check(click.implementation!!.registerCount < 16 && !AccessFlags.STATIC.isSet(click.accessFlags)) {
        "$owner: no encodable player storage register"
    }
    val popup = code.indices.single { index ->
        code[index].getReference<MethodReference>()?.let { ref ->
            ref.definingClass == abi.presenter && ref.name == "k" && ref.returnType == "V" &&
                    ref.parameterTypes.size == 4 && ref.parameterTypes.take(3) == listOf(menu, VIEW, OBJECT)
        } == true
    }
    val mergeIndex = code.indices.single { code[it].refersTo(merge) }
    val getterCalls = code.indices.filter { code[it].refersTo(getter) }
    check(getterCalls.size == if (abi.mergesOccurrence) 1 else 2) { "$owner: wrong player menu accessor count" }
    check(getterCalls.all { it in 3 until mergeIndex } && mergeIndex < popup) { "$owner: wrong overflow path order" }

    val currentIndex = (0 until getterCalls.first()).single { index ->
        val ref = code[index].getReference<MethodReference>()
        ref?.definingClass == abi.facade && ref.returnType == OPTIONAL && ref.parameterTypes.isEmpty() &&
                code.getOrNull(index + 2)?.getReference<MethodReference>()?.toString() == OPTIONAL_PRESENT
    }
    val current = code.menuCall(currentIndex, Opcode.INVOKE_VIRTUAL, 1)
    val optionalResult = (code[currentIndex + 1] as OneRegisterInstruction).registerA
    check(getterCalls.all { index ->
        (code[index - 3] as? FiveRegisterInstruction)?.registerC == optionalResult
    }) { "$owner: incompatible stock current occurrence result" }

    val getters = getterCalls.map { index ->
        val call = code.menuCall(index, Opcode.INVOKE_INTERFACE, 1)
        val cast = code[index - 1]
        check(cast.opcode == Opcode.CHECK_CAST && cast.getReference<TypeReference>()?.type == abi.item &&
                (cast as OneRegisterInstruction).registerA == call.receiver &&
                code[index - 2].opcode == Opcode.MOVE_RESULT_OBJECT &&
                (code[index - 2] as OneRegisterInstruction).registerA == call.receiver &&
                code[index - 3].getReference<MethodReference>()?.toString() == OPTIONAL_GET) {
            "$owner: caller does not get the menu from the current Optional occurrence"
        }
        call
    }
    val probeResult = (code[getters.first().index + 1] as OneRegisterInstruction).registerA
    val probeBranch = code[getters.first().index + 2]
    check(probeBranch.opcode == Opcode.IF_EQZ && (probeBranch as OneRegisterInstruction).registerA == probeResult) {
        "$owner: stock presence test not found"
    }
    val mergeCall = code.menuCall(mergeIndex, Opcode.INVOKE_VIRTUAL, 2)
    val route = code.subList(mergeIndex + 1, popup).mapNotNull { it.getReference<MethodReference>() }.single {
        it.parameterTypes == listOf(menu) && it.returnType == "Z"
    }
    return PlayerMenuClick(click, current, code[currentIndex].getReference<MethodReference>()!!, getters,
        mergeCall, route)
}

private fun Instruction.refersTo(method: MethodReference) =
    getReference<MethodReference>()?.toString() == method.toString()

private fun List<Instruction>.menuCall(index: Int, opcode: Opcode, size: Int): MenuCall {
    val call = this[index]
    check(call is FiveRegisterInstruction && call.opcode == opcode && call.registerCount == size &&
            getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT) { "unsafe menu call registers at $index" }
    return MenuCall(index, call.registerC)
}

private fun playerMenuBridge(menu: String, name: String, types: List<String>, registers: Int, code: String) =
    ImmutableMethod(
        menu, name, types.map { ImmutableMethodParameter(it, null, null) }, menu,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, MutableMethodImplementation(registers),
    ).toMutable().apply { addInstructionsWithLabels(0, code) }

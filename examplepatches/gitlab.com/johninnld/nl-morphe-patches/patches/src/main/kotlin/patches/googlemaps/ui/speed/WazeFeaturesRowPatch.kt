package org.ungoogled.patches.maps.ui.speed

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.ungoogled.patches.maps.ui.customization.customizationScreenPatch
import org.ungoogled.patches.maps.ui.sharedExtensionPatch

/** The account sheet row's listener: opens Waze & external data source with the sheet left open behind it. */
private const val OPEN_WAZE = "Lorg/ungoogled/ui/CustomizationActivity\$OpenWaze;"
/** drawable/gs_directions_car_vd_theme_24 in this build: a car, tinted like the sheet's other icons. */
private const val CAR_ICON = 0x7f080536

/**
 * A "Waze & external data source" row on the account sheet -- the speeding chime and speed cameras -- under
 * Power Saving Options and above Local saved. It opens a page of the Customization screen.
 * Shared, so either patch brings it.
 */
internal val wazeFeaturesRowPatch = bytecodePatch(
    description = "Adds the Waze & external data source row to the account sheet.",
) {
    dependsOn(sharedExtensionPatch, customizationScreenPatch)

    // In finalize, after every patch has run, so the sheet's other rows of ours are in place.
    finalize {
        if (packageMetadata.versionName == "26.44.06.1006895251") {
            buildWazeRow2644()
            return@finalize
        }
        if (packageMetadata.versionName == "26.47.00.1022347503") {
            buildWazeRow2647()
            return@finalize
        }
        val rowHolder = mutableClassDefBy("Lolm;")
        val template = rowHolder.methods.single { it.name == "a" && it.returnType == "Lbqxa;" && it.parameterTypes.isEmpty() }
        val templateRefs = template.implementation!!.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        listOf(
            "Lolm;->a:Lnwm;", "Lgej;->aF(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;",
            "Lbqxa;->a()Lbqwy;", "Lbqwy;->c(I)V", "Lbqwy;->d(Ljava/lang/String;)V", "Lbqwy;->f(I)V",
            "Lbqwy;->e(Landroid/view/View\$OnClickListener;)V", "Lbqwx;->d:Lbqwx;", "Lbqwy;->a()Lbqxa;",
        ).forEach { if (it !in templateRefs) throw PatchException("account sheet row builder no longer uses $it") }
        // Built like the Customization and Power Saving Options rows.
        rowHolder.methods.add(
            ImmutableMethod(
                rowHolder.type, "uaWazeRow", emptyList(), "Lbqxa;",
                AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null, MutableMethodImplementation(6),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        iget-object v0, p0, Lolm;->a:Lnwm;
                        const v1, $CAR_ICON
                        invoke-static { v0, v1 }, Lgej;->aF(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
                        move-result-object v1
                        invoke-static { }, Lbqxa;->a()Lbqwy;
                        move-result-object v3
                        invoke-static { }, Landroid/view/View;->generateViewId()I
                        move-result v4
                        invoke-virtual { v3, v4 }, Lbqwy;->c(I)V
                        iput-object v1, v3, Lbqwy;->a:Landroid/graphics/drawable/Drawable;
                        const-string v4, "Waze & external data source"
                        invoke-virtual { v3, v4 }, Lbqwy;->d(Ljava/lang/String;)V
                        const v4, 0x161a8
                        invoke-virtual { v3, v4 }, Lbqwy;->f(I)V
                        new-instance v2, $OPEN_WAZE
                        invoke-direct { v2, v0 }, $OPEN_WAZE-><init>(Landroid/content/Context;)V
                        invoke-virtual { v3, v2 }, Lbqwy;->e(Landroid/view/View${'$'}OnClickListener;)V
                        sget-object v4, Lbqwx;->d:Lbqwx;
                        iput-object v4, v3, Lbqwy;->d:Lbqwx;
                        invoke-virtual { v3 }, Lbqwy;->a()Lbqxa;
                        move-result-object v0
                        return-object v0
                    """,
                )
            },
        )

        fun calls(insn: Instruction, name: String) =
            ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let { r ->
                r.definingClass == "Lolm;" && r.name == name
            } == true

        // Both sheet builders: after Power Saving Options' row when it is there, else right after
        // Customization's. Power Saving Options always goes right after Customization, so whichever
        // finalize runs first the order is Customization, Power Saving Options, Waze & external data source, then
        // Local saved (added during execute, right after Customization).
        fun addUnderPowerSaving(returnType: String, parameters: List<String>) {
            val found = mutableListOf<Pair<String, String>>()
            classDefForEach { c ->
                for (m in c.methods) {
                    if (m.returnType != returnType || m.parameterTypes.map { it.toString() } != parameters) continue
                    if (m.implementation?.instructions?.any { calls(it, "uaCustomizationRow") } == true) found += c.type to m.name
                }
            }
            val (owner, name) = found.singleOrNull()
                ?: throw PatchException("account sheet builder $returnType(${parameters.joinToString()}) with the Customization row: found ${found.size}")
            val method = mutableClassDefBy(owner).methods.single {
                it.name == name && it.returnType == returnType && it.parameterTypes.map { t -> t.toString() } == parameters
            }
            val ins = method.implementation!!.instructions
            val call = ins.indexOfFirst { calls(it, "uaCustomizationRow") }
            val result = ins[call + 1]
            val add = ins[call + 2]
            if (result.opcode != Opcode.MOVE_RESULT_OBJECT || add.opcode != Opcode.INVOKE_VIRTUAL ||
                ((add as ReferenceInstruction).reference as MethodReference).let { it.definingClass != "Lbwix;" || it.name != "i" }
            ) throw PatchException("Customization row add changed shape")
            // The row's result register is dead after its add, so it carries ours.
            val scratch = (result as OneRegisterInstruction).registerA
            val list = (add as Instruction35c).registerC
            val holder = (ins[call] as Instruction35c).registerC
            // Modern builder: the holder is cast from a wider register just before; do the same.
            val cast = ins.getOrNull(call - 1)?.takeIf {
                it.opcode == Opcode.CHECK_CAST && ((it as ReferenceInstruction).reference as TypeReference).type == "Lolm;"
            }
            val source = cast?.let { (ins[call - 2] as TwoRegisterInstruction).registerB }
            val power = (call + 3 until minOf(ins.size, call + 10)).firstOrNull { calls(ins[it], "uaPowerRow") }
            val at = if (power == null) call + 3 else {
                val powerAdd = (power + 1 until minOf(ins.size, power + 4)).firstOrNull {
                    ins[it].opcode == Opcode.INVOKE_VIRTUAL &&
                        ((ins[it] as ReferenceInstruction).reference as MethodReference).let { r -> r.definingClass == "Lbwix;" && r.name == "i" }
                } ?: throw PatchException("Power Saving Options row add not found")
                powerAdd + 1
            }
            method.addInstructions(
                at,
                if (source != null) """
                    move-object v$scratch, v$source
                    check-cast v$scratch, Lolm;
                    invoke-virtual { v$scratch }, Lolm;->uaWazeRow()Lbqxa;
                    move-result-object v$scratch
                    invoke-virtual { v$list, v$scratch }, Lbwix;->i(Ljava/lang/Object;)V
                """ else """
                    invoke-virtual { v$holder }, Lolm;->uaWazeRow()Lbqxa;
                    move-result-object v$scratch
                    invoke-virtual { v$list, v$scratch }, Lbwix;->i(Ljava/lang/Object;)V
                """,
            )
        }
        addUnderPowerSaving("Lbqrr;", listOf("Lafyh;"))
        addUnderPowerSaving("Lbqpl;", listOf("Z"))
    }
}


/** 26.44's account-sheet row holder and builder, after Customization and Power Saving rows. */
context(context: BytecodePatchContext)
private fun buildWazeRow2644() {
    val rowHolder = context.mutableClassDefBy("Lomf;")
    val template = rowHolder.methods.single {
        it.name == "a" && it.returnType == "Lbrdm;" && it.parameterTypes.isEmpty()
    }
    val templateRefs = template.implementation!!.instructions.mapNotNull {
        (it as? ReferenceInstruction)?.reference?.toString()
    }
    listOf(
        "Lomf;->a:Lnxh;",
        "Lgez;->aC(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;",
        "Lbrdm;->a()Lbrdk;",
        "Lbrdk;->c(I)V", "Lbrdk;->d(Ljava/lang/String;)V", "Lbrdk;->f(I)V",
        "Lbrdk;->e(Landroid/view/View${'$'}OnClickListener;)V", "Lbrdk;->a()Lbrdm;",
    ).forEach { if (it !in templateRefs) throw PatchException("account sheet row builder no longer uses $it") }
    rowHolder.methods.add(
        ImmutableMethod(
            rowHolder.type, "uaWazeRow", emptyList(), "Lbrdm;",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null, MutableMethodImplementation(6),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                    iget-object v0, p0, Lomf;->a:Lnxh;
                    const v1, 0x7f080536
                    invoke-static { v0, v1 }, Lgez;->aC(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
                    move-result-object v1
                    invoke-static { }, Lbrdm;->a()Lbrdk;
                    move-result-object v3
                    invoke-static { }, Landroid/view/View;->generateViewId()I
                    move-result v4
                    invoke-virtual { v3, v4 }, Lbrdk;->c(I)V
                    iput-object v1, v3, Lbrdk;->a:Landroid/graphics/drawable/Drawable;
                    const-string v4, "Waze & external data source"
                    invoke-virtual { v3, v4 }, Lbrdk;->d(Ljava/lang/String;)V
                    const v4, 0x161a8
                    invoke-virtual { v3, v4 }, Lbrdk;->f(I)V
                    new-instance v2, $OPEN_WAZE
                    invoke-direct { v2, v0 }, $OPEN_WAZE-><init>(Landroid/content/Context;)V
                    invoke-virtual { v3, v2 }, Lbrdk;->e(Landroid/view/View${'$'}OnClickListener;)V
                    sget-object v4, Lbrdj;->b:Lbrdj;
                    iput-object v4, v3, Lbrdk;->d:Lbrdj;
                    invoke-virtual { v3 }, Lbrdk;->a()Lbrdm;
                    move-result-object v0
                    return-object v0
                """,
            )
        },
    )

    // Insert the row into both account-sheet builders: the legacy builder used
    // by older layouts and the modern builder that current 26.44 builds show.
    listOf("Lbqvz;" to listOf("Z"), "Lbqye;" to listOf("Lagdp;")).forEach { (returnType, parameters) ->
        val found = mutableListOf<Pair<String, String>>()
        context.classDefForEach { c ->
            for (m in c.methods) {
                if (m.returnType != returnType || m.parameterTypes.map { it.toString() } != parameters) continue
                val usesCustomization = m.implementation?.instructions?.any { insn ->
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let { r ->
                        r.definingClass == "Lomf;" && r.name == "uaCustomizationRow"
                    } == true
                } == true
                if (usesCustomization) found += c.type to m.name
            }
        }
        val (owner, name) = found.singleOrNull()
            ?: throw PatchException("account sheet builder $returnType(${parameters.joinToString()}) with the Customization row: found ${found.size}")
        val method = context.mutableClassDefBy(owner).methods.single {
            it.name == name && it.returnType == returnType && it.parameterTypes.map { t -> t.toString() } == parameters
        }
        val ins = method.implementation!!.instructions
        fun calls(insn: Instruction, target: String) =
            ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let { r ->
                r.definingClass == "Lomf;" && r.name == target
            } == true
        val call = ins.indexOfFirst { calls(it, "uaCustomizationRow") }
        if (call < 0) throw PatchException("Customization row call not found in $owner")
        val result = ins[call + 1] as OneRegisterInstruction
        val add = ins[call + 2] as Instruction35c
        val list = add.registerC
        val scratch = result.registerA
        val holder = (ins[call] as Instruction35c).registerC
        val cast = ins.getOrNull(call - 1)?.takeIf {
            it.opcode == Opcode.CHECK_CAST && ((it as ReferenceInstruction).reference as TypeReference).type == "Lomf;"
        }
        val source = cast?.let { (ins[call - 2] as TwoRegisterInstruction).registerB }
        val power = (call + 3 until minOf(ins.size, call + 10)).firstOrNull { calls(ins[it], "uaPowerRow") }
        val at = if (power == null) call + 3 else {
            val powerAdd = (power + 1 until minOf(ins.size, power + 4)).firstOrNull {
                ins[it].opcode == Opcode.INVOKE_VIRTUAL &&
                    ((ins[it] as ReferenceInstruction).reference as MethodReference).let { r ->
                        r.definingClass == "Lbwpw;" && r.name == "i"
                    }
            } ?: throw PatchException("Power Saving Options row add not found")
            powerAdd + 1
        }
        method.addInstructions(
            at,
            if (source != null) """
                move-object v$scratch, v$source
                check-cast v$scratch, Lomf;
                invoke-virtual { v$scratch }, Lomf;->uaWazeRow()Lbrdm;
                move-result-object v$scratch
                invoke-virtual { v$list, v$scratch }, Lbwpw;->i(Ljava/lang/Object;)V
            """ else """
                invoke-virtual { v$holder }, Lomf;->uaWazeRow()Lbrdm;
                move-result-object v$scratch
                invoke-virtual { v$list, v$scratch }, Lbwpw;->i(Ljava/lang/Object;)V
            """,
        )
    }
}

/** 26.47 variant: row holder ool, row brlr, builder brlp, list bwzs. */
context(context: BytecodePatchContext)
private fun buildWazeRow2647() {
    val rowHolder = context.mutableClassDefBy("Lool;")
    val template = rowHolder.methods.single {
        it.name == "a" && it.returnType == "Lbrlr;" && it.parameterTypes.isEmpty()
    }
    val templateRefs = template.implementation!!.instructions.mapNotNull {
        (it as? ReferenceInstruction)?.reference?.toString()
    }
    listOf(
        "Lool;->a:Ljava/lang/Object;",
        "Lfzc;->aP(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;",
        "Lbrlr;->a()Lbrlp;",
        "Lbrlp;->c(I)V", "Lbrlp;->d(Ljava/lang/String;)V", "Lbrlp;->f(I)V",
        "Lbrlp;->e(Landroid/view/View${'$'}OnClickListener;)V", "Lbrlp;->a()Lbrlr;",
    ).forEach { if (it !in templateRefs) throw PatchException("account sheet row builder no longer uses $it") }
    rowHolder.methods.add(
        ImmutableMethod(
            rowHolder.type, "uaWazeRow", emptyList(), "Lbrlr;",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null, MutableMethodImplementation(6),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                    iget-object v0, p0, Lool;->a:Ljava/lang/Object;
                    check-cast v0, Landroid/content/Context;
                    const v1, 0x7f080514
                    invoke-static { v0, v1 }, Lfzc;->aP(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
                    move-result-object v1
                    invoke-static { }, Lbrlr;->a()Lbrlp;
                    move-result-object v3
                    invoke-static { }, Landroid/view/View;->generateViewId()I
                    move-result v4
                    invoke-virtual { v3, v4 }, Lbrlp;->c(I)V
                    iput-object v1, v3, Lbrlp;->a:Landroid/graphics/drawable/Drawable;
                    const-string v4, "Waze & external data source"
                    invoke-virtual { v3, v4 }, Lbrlp;->d(Ljava/lang/String;)V
                    const v4, 0x161a8
                    invoke-virtual { v3, v4 }, Lbrlp;->f(I)V
                    new-instance v2, $OPEN_WAZE
                    invoke-direct { v2, v0 }, $OPEN_WAZE-><init>(Landroid/content/Context;)V
                    invoke-virtual { v3, v2 }, Lbrlp;->e(Landroid/view/View${'$'}OnClickListener;)V
                    sget-object v4, Lbrlo;->b:Lbrlo;
                    iput-object v4, v3, Lbrlp;->d:Lbrlo;
                    invoke-virtual { v3 }, Lbrlp;->a()Lbrlr;
                    move-result-object v0
                    return-object v0
                """,
            )
        },
    )

    // Insert the row into both account-sheet builders: the legacy builder used
    // by older layouts and the modern builder that current 26.44 builds show.
    listOf("Lbrel;" to listOf("Z"), "Lbrgh;" to listOf("Lagnt;")).forEach { (returnType, parameters) ->
        val found = mutableListOf<Pair<String, String>>()
        context.classDefForEach { c ->
            for (m in c.methods) {
                if (m.returnType != returnType || m.parameterTypes.map { it.toString() } != parameters) continue
                val usesCustomization = m.implementation?.instructions?.any { insn ->
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let { r ->
                        r.definingClass == "Lool;" && r.name == "uaCustomizationRow"
                    } == true
                } == true
                if (usesCustomization) found += c.type to m.name
            }
        }
        val (owner, name) = found.singleOrNull()
            ?: throw PatchException("account sheet builder $returnType(${parameters.joinToString()}) with the Customization row: found ${found.size}")
        val method = context.mutableClassDefBy(owner).methods.single {
            it.name == name && it.returnType == returnType && it.parameterTypes.map { t -> t.toString() } == parameters
        }
        val ins = method.implementation!!.instructions
        fun calls(insn: Instruction, target: String) =
            ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let { r ->
                r.definingClass == "Lool;" && r.name == target
            } == true
        val call = ins.indexOfFirst { calls(it, "uaCustomizationRow") }
        if (call < 0) throw PatchException("Customization row call not found in $owner")
        val result = ins[call + 1] as OneRegisterInstruction
        val add = ins[call + 2] as Instruction35c
        val list = add.registerC
        val scratch = result.registerA
        val holder = (ins[call] as Instruction35c).registerC
        val cast = ins.getOrNull(call - 1)?.takeIf {
            it.opcode == Opcode.CHECK_CAST && ((it as ReferenceInstruction).reference as TypeReference).type == "Lool;"
        }
        val source = cast?.let { (ins[call - 2] as TwoRegisterInstruction).registerB }
        val power = (call + 3 until minOf(ins.size, call + 10)).firstOrNull { calls(ins[it], "uaPowerRow") }
        val at = if (power == null) call + 3 else {
            val powerAdd = (power + 1 until minOf(ins.size, power + 4)).firstOrNull {
                ins[it].opcode == Opcode.INVOKE_VIRTUAL &&
                    ((ins[it] as ReferenceInstruction).reference as MethodReference).let { r ->
                        r.definingClass == "Lbwzs;" && r.name == "i"
                    }
            } ?: throw PatchException("Power Saving Options row add not found")
            powerAdd + 1
        }
        method.addInstructions(
            at,
            if (source != null) """
                move-object v$scratch, v$source
                check-cast v$scratch, Lool;
                invoke-virtual { v$scratch }, Lool;->uaWazeRow()Lbrlr;
                move-result-object v$scratch
                invoke-virtual { v$list, v$scratch }, Lbwzs;->i(Ljava/lang/Object;)V
            """ else """
                invoke-virtual { v$holder }, Lool;->uaWazeRow()Lbrlr;
                move-result-object v$scratch
                invoke-virtual { v$list, v$scratch }, Lbwzs;->i(Ljava/lang/Object;)V
            """,
        )
    }
}

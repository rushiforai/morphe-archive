package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.addFieldGetter
import app.afterglow.patches.shared.smali
import app.afterglow.patches.video.addPublicMethod
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.string
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** Mask presentation without replacing Lolx.Z, the native requested state used by pause-on-overlay. */
internal fun BytecodePatchContext.installOverlayModes(host: MutableClass, rootSetup: MutableMethod,
                                                     root: FieldReference) {
    val modes = "$EXTENSION_PACKAGE/playback/OverlayModes;"
    val controller = "$EXTENSION_PACKAGE/playback/OverlayModeController;"
    val visibility = Fingerprint(definingClass = host.type, parameters = listOf("Z"), returnType = "V",
        filters = listOf(literal(0x02baf759), methodCall(name = "<init>", parameters = listOf("Z", "Z")))).method
    val code = visibility.implementation!!.instructions.toList()
    val writes = code.filter { it.opcode == Opcode.IPUT }.map {
        (it as ReferenceInstruction).reference as FieldReference
    }
    require(writes.size == 2 && writes.map { it.smali }.distinct().size == 1 && writes[0].type == "I")
    val visible = writes[0]
    val show = Fingerprint(definingClass = host.type, name = "Q", parameters = listOf("Z"), returnType = "V",
        filters = listOf(fieldAccess(smali = visible.smali), methodCall(smali = visibility.smali))).method
    host.interfaces.add(controller)
    host.addFieldGetter("afterglow_modeRoot", "Landroid/view/View;", root)
    host.addPublicMethod("afterglow_modeVisible", emptyList(), "Z", 2, """
        iget v0, p0, ${visible.smali}
        return v0
    """)
    host.addPublicMethod("afterglow_refreshMode", listOf("Z"), "V", 3, """
        const/4 v0, 0x0
        if-eqz p1, :refresh
        invoke-virtual { p0, v0 }, ${show.smali}
        :refresh
        invoke-virtual { p0, v0 }, ${visibility.smali}
        return-void
    """)
    visibility.addInstructionsAtControlFlowLabel(code.withIndex().single { it.value.opcode == Opcode.RETURN_VOID }.index,
        "invoke-static/range { p0 .. p0 }, $modes->standardChanged($controller)V")
    rootSetup.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
        .map { it.index }.reversed().forEach { index ->
            rootSetup.addInstructionsAtControlFlowLabel(index,
                "invoke-static/range { p0 .. p0 }, $modes->bindStandard($controller)V")
        }

    // This context's first boolean is explicitly named visible by its native toString.
    val context = Fingerprint(name = "toString", returnType = "Ljava/lang/String;", filters = listOf(
        string("ControlsVisibilityContext{visible="), string(", animated="))).classDef
    val create = context.methods.single { it.name == "<init>" && it.parameterTypes == listOf("Z", "Z") }
    create.addInstructions(0, """
        invoke-static/range { p1 .. p1 }, $modes->standardVisible(Z)Z
        move-result p1
    """)

    // Both immediate and delayed animation completions publish through this same
    // native enum emitter. Mask there so an old animation cannot reveal controls.
    val stateEnum = Fingerprint(name = "<clinit>", filters = listOf(
        string("CONTROLS_VISIBILITY_HIDDEN"), string("CONTROLS_VISIBILITY_SHOWING"),
        string("CONTROLS_VISIBILITY_ANIMATE_SHOW"))).classDef
    val enumCode = stateEnum.methods.single { it.name == "<clinit>" }.implementation!!.instructions.toList()
    val hiddenIndex = enumCode.indexOfFirst {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "CONTROLS_VISIBILITY_HIDDEN"
    }
    require(hiddenIndex >= 0)
    val hidden = (enumCode.drop(hiddenIndex).first { it.opcode == Opcode.SPUT_OBJECT } as ReferenceInstruction)
        .reference as FieldReference
    val emitReference = code.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        .filter { it.parameterTypes.map { p -> p.toString() } == listOf(stateEnum.type) && it.returnType == "V" }
        .distinctBy { it.smali }.single()
    val emitter = mutableClassDefBy(emitReference.definingClass)
    val emit = emitter.methods.single { it.name == emitReference.name && it.parameterTypes == listOf(stateEnum.type) }
    require(emit.implementation!!.instructions.any {
        ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { call ->
            call.name == "sU" && call.parameterTypes == listOf("Ljava/lang/Object;")
        } == true
    })
    emitter.addPublicMethod("afterglow_modeVisibility", listOf(stateEnum.type), stateEnum.type, 3, """
        invoke-static { }, $modes->suppressStock()Z
        move-result v0
        if-eqz v0, :original
        sget-object p1, ${hidden.smali}
        :original
        return-object p1
    """)
    emit.addInstructions(0, """
        invoke-virtual/range { p0 .. p1 }, ${emitter.type}->afterglow_modeVisibility(${stateEnum.type})${stateEnum.type}
        move-result-object p1
    """)

    // Native seekbar and controls view also have direct visibility commands.
    for ((name, parameters) in listOf("ag" to listOf("Z"), "ab" to listOf("Z", "Z"))) {
        val method = Fingerprint(definingClass = host.type, name = name, parameters = parameters, returnType = "V",
            filters = listOf(methodCall(smali = "Lafro;->s(Landroid/view/View;Z)V"))).method
        val maskIndex = if (name == "ag") {
            // A requested show first creates the native controls in E(). Masking
            // its argument at entry skips that initializer, leaving the native
            // pause/play controller unavailable until stock controls show once.
            val instructions = method.implementation!!.instructions.toList()
            val load = instructions.withIndex().single { (_, instruction) ->
                instruction.opcode == Opcode.IGET_OBJECT &&
                    ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.let { field ->
                        field.definingClass == host.type && field.type == "Landroid/view/View;"
                    } == true
            }
            require(instructions.take(load.index).any { instruction ->
                ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let { call ->
                    call.definingClass == host.type && call.name == "E" &&
                        call.parameterTypes.isEmpty() && call.returnType == "V"
                } == true
            }) { "Native controls initializer must precede the presentation mask" }
            load.index
        } else 0
        method.addInstructionsAtControlFlowLabel(maskIndex, """
            invoke-static/range { p1 .. p1 }, $modes->standardVisible(Z)Z
            move-result p1
        """)
    }
    println("Afterglow eye modes: native=${visibility.smali}; show=${show.smali}; context=${context.type}; animation=${emit.smali}")
}

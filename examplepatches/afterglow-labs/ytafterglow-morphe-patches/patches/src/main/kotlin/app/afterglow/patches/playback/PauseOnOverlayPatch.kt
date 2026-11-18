package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.addFieldGetter
import app.afterglow.patches.shared.addMethod
import app.afterglow.patches.shared.smali
import app.afterglow.patches.video.ControlsStateToStringFingerprint
import app.afterglow.patches.video.ControlsVideoStateEnumFingerprint
import app.afterglow.patches.video.addPublicMethod
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * 21.43.523: Lolx.X(Z) publishes final visibility in Z, then returns through one
 * shared label. Its parameter is animation, not visibility. The native button
 * uses Lokb.k (Larrt): PLAYING calls a() to pause, PAUSED calls b() to play.
 * Resolve that ownership and those branches before adding a typed bridge.
 */
internal fun BytecodePatchContext.installPauseOnOverlay(binder: MutableMethod) {
    val host = mutableClassDefBy(binder.definingClass)
    val binding = binder.implementation!!.instructions.toList()
    val root = binding.filter { it.opcode == Opcode.IGET_OBJECT }.mapNotNull {
        (it as? ReferenceInstruction)?.reference as? FieldReference
    }.filter { it.definingClass == host.type && it.type == "Landroid/widget/FrameLayout;" }
        .distinctBy { it.smali }.single()
    val buttonConstructor = binding.mapNotNull {
        (it as? ReferenceInstruction)?.reference as? MethodReference
    }.single { it.name == "<init>" && it.parameterTypes.size == 11
        && it.parameterTypes[6].toString() == "Landroid/widget/ImageView;" }
    val button = mutableClassDefBy(buttonConstructor.definingClass)
    val buttonField = host.fields.single { it.type == button.type }
    val commandType = buttonConstructor.parameterTypes[5].toString()
    val commandField = button.fields.single { it.type == commandType }
    val stateType = ControlsStateToStringFingerprint.originalClassDef.type
    val enumType = ControlsVideoStateEnumFingerprint.originalClassDef.type
    val stateField = button.fields.single { it.type == stateType }
    val videoState = classDefBy(stateType).fields.single { it.type == enumType }

    val constructor = button.methods.single { it.name == "<init>" && it.parameterTypes.size == 11 }
    val constructorCode = constructor.implementation!!.instructions.toList()
    val listenerIndex = constructorCode.indexOfFirst {
        ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { method ->
            method.name == "setOnClickListener" && method.definingClass == "Landroid/widget/ImageView;"
        } == true
    }
    require(listenerIndex >= 0) { "Native play/pause listener missing" }
    val listenerType = constructorCode.take(listenerIndex).mapNotNull {
        (it as? ReferenceInstruction)?.reference as? MethodReference
    }.last { it.name == "<init>" }.definingClass
    val click = classDefBy(listenerType).methods.single { it.name == "onClick" }
        .implementation!!.instructions.toList()
    val enumCode = ControlsVideoStateEnumFingerprint.method.implementation!!.instructions.toList()
    fun enumValue(name: String): FieldReference {
        val index = enumCode.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == name
        }
        require(index >= 0) { "Missing native playback state $name" }
        return (enumCode.drop(index).first { it.opcode == Opcode.SPUT_OBJECT } as ReferenceInstruction)
            .reference as FieldReference
    }
    val playing = enumValue("PLAYING")
    val paused = enumValue("PAUSED")
    fun action(state: FieldReference): MethodReference {
        val index = click.indexOfFirst { it.opcode == Opcode.SGET_OBJECT
            && ((it as? ReferenceInstruction)?.reference as? FieldReference)?.smali == state.smali }
        require(index >= 0) { "Native click has no ${state.smali} branch" }
        val branch = click.drop(index + 1).takeWhile { it.opcode != Opcode.RETURN_VOID }
        require(branch.any { it.opcode == Opcode.IGET_OBJECT
            && ((it as? ReferenceInstruction)?.reference as? FieldReference)?.smali == commandField.smali })
        return branch.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .single { it.definingClass == commandType && it.parameterTypes.isEmpty() && it.returnType == "V" }
    }
    val pause = action(playing)
    val play = action(paused)
    require(pause.smali != play.smali) { "Native pause and play actions must differ" }
    fun gate(method: MethodReference): FieldReference {
        val native = classDefBy(commandType).methods.single { it.name == method.name && it.parameterTypes.isEmpty() }
        return native.implementation!!.instructions.filter { it.opcode == Opcode.IGET_BOOLEAN }
            .map { (it as ReferenceInstruction).reference as FieldReference }.single()
    }
    val ready = gate(pause)
    require(ready.smali == gate(play).smali && ready.definingClass == commandType)
    for (field in listOf(buttonField, commandField, stateField, videoState, ready)) {
        val definition = classDefBy(field.definingClass).fields.single { it.name == field.name }
        require(AccessFlags.PUBLIC.isSet(definition.accessFlags)) { "Native bridge field is not public: ${field.smali}" }
    }

    val visibility = Fingerprint(definingClass = host.type, parameters = listOf("Z"), returnType = "V",
        filters = listOf(literal(0x02baf759), methodCall(name = "<init>", parameters = listOf("Z", "Z")))).method
    val code = visibility.implementation!!.instructions.toList()
    val writes = code.filter { it.opcode == Opcode.IPUT }.map {
        (it as ReferenceInstruction).reference as FieldReference
    }
    require(writes.size == 2 && writes.map { it.smali }.distinct().size == 1
        && writes[0].definingClass == host.type && writes[0].type == "I") { "Native final visibility changed" }
    val visible = writes[0]
    val returnIndex = code.withIndex().single { it.value.opcode == Opcode.RETURN_VOID }.index

    val extension = "$EXTENSION_PACKAGE/playback/PauseOnOverlay;"
    val bridge = "$EXTENSION_PACKAGE/playback/PauseOnOverlay\$Controller;"
    host.interfaces.add(bridge)
    host.addFieldGetter("afterglow_overlayRoot", "Landroid/view/View;", root)
    host.addMethod("afterglow_overlayVisible", "Z", 2, """
        iget v0, p0, ${visible.smali}
        return v0
    """)
    host.addPublicMethod("afterglow_overlaySetPlaying", listOf("Z"), "Z", 6, """
        iget-object v0, p0, ${buttonField.smali}
        if-eqz v0, :unavailable
        iget-object v1, v0, ${commandField.smali}
        if-eqz v1, :unavailable
        iget-boolean v2, v1, ${ready.smali}
        if-eqz v2, :unavailable
        iget-object v0, v0, ${stateField.smali}
        if-eqz v0, :unavailable
        iget-object v0, v0, ${videoState.smali}
        sget-object v2, ${playing.smali}
        sget-object v3, ${paused.smali}
        if-eq v0, v2, :playing
        if-ne v0, v3, :unavailable
        if-eqz p1, :accepted
        invoke-virtual { v1 }, ${play.smali}
        goto :accepted
        :playing
        if-nez p1, :accepted
        invoke-virtual { v1 }, ${pause.smali}
        :accepted
        const/4 v0, 0x1
        return v0
        :unavailable
        const/4 v0, 0x0
        return v0
    """)
    visibility.addInstructionsAtControlFlowLabel(returnIndex,
        "invoke-static/range { p0 .. p0 }, $extension->visibilityChanged($bridge)V")
    println("Afterglow pause on overlay: ${visibility.smali}; root=${root.smali}; state=${visible.smali}; pause=${pause.smali}; play=${play.smali}")
}

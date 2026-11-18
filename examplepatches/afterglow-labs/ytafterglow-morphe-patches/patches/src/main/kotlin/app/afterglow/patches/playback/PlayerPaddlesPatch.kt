package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.addMethod
import app.afterglow.patches.shared.smali
import app.afterglow.patches.video.addPublicMethod
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField

/**
 * Stock Loin renders Loih/Loim into Loir's four native transport buttons. Override
 * only its local next/previous and sticky-seek decisions. The source model,
 * accessibility preference, native click listeners and configured interval survive.
 */
internal fun BytecodePatchContext.installPlayerPaddles() {
    val extension = "$EXTENSION_PACKAGE/playback/PlayerPaddles;"
    val policy = "$EXTENSION_PACKAGE/playback/PaddlePolicy;"
    val bridge = "$EXTENSION_PACKAGE/playback/PlayerPaddles\$Controller;"
    val model = Fingerprint(name = "toString", definingClass = "Loim;", filters = listOf(
        string("MidUiModel{isControlsOverlayVisible="), string(", isStickyControlsEnabled="),
        string(", playlistEntryPointPreviousNextButtonsEnabled="))).classDef
    val descriptor = Fingerprint(name = "toString", definingClass = "Lasbs;", filters = listOf(
        methodCall(smali = "Lasbs;->y()Ljava/util/List;"),
        methodCall(smali = "Lasbs;->x()Ljava/lang/String;"),
        methodCall(smali = "Lasbs;->v()Ljava/lang/String;"),
        string("PlaybackStartDescriptor:\n  VideoId:%s\n  PlaylistId:%s\n  Index:%d\n  VideoIds:%s"))).classDef
    require(model.type == "Loim;" && descriptor.type == "Lasbs;")
    val render = Fingerprint(definingClass = "Loin;", name = "a", parameters = listOf("Ljava/lang/Object;"),
        returnType = "V", filters = listOf(fieldAccess(smali = "Loih;->a:Loim;"),
            fieldAccess(smali = "Larrq;->E:Z"), fieldAccess(smali = "Larrq;->C:Z"),
            fieldAccess(smali = "Loim;->k:Z"), methodCall(smali = "Larxp;->b()Lj$/time/Duration;"))).method
    Fingerprint(definingClass = "Laske;", name = "g", parameters = listOf(), returnType = "Lasbs;",
        filters = listOf(fieldAccess(smali = "Lasdu;->k:Lasbs;"))).method
    Fingerprint(definingClass = "Loir;", name = "b", parameters = listOf("Z"), returnType = "V",
        filters = listOf(methodCall(smali = "Larxp;->b()Lj$/time/Duration;"),
            methodCall(smali = "Lassj;->g(J)V"))).method
    val enumCode = Fingerprint(definingClass = "Larrr;", name = "<clinit>", filters = listOf(
        string("NEW"), string("PLAYING"), string("PAUSED"))).method.implementation!!.instructions.toList()
    require(enumCode.filter { it.opcode == Opcode.SPUT_OBJECT }.map {
        ((it as ReferenceInstruction).reference as FieldReference).name
    }.take(3) == listOf("a", "b", "c"))

    val subscriber = mutableClassDefBy(render.definingClass)
    val controller = mutableClassDefBy("Loir;")
    // The facade is private to the native transport owner; expose a typed read there.
    val facade = controller.fields.single { it.name == "K" && it.type == "Laske;" }
    controller.addMethod("afterglow_paddleDescriptor", descriptor.type, 2, """
        iget-object v0, p0, ${facade.smali}
        invoke-virtual { v0 }, Laske;->g()Lasbs;
        move-result-object v0
        return-object v0
    """)
    fun field(name: String, type: String): String {
        subscriber.fields.add(ImmutableField(subscriber.type, name, type, AccessFlags.PRIVATE.value,
            null, null, null).toMutable())
        return "${subscriber.type}->$name:$type"
    }
    val saved = field("afterglow_paddleState", "Loih;")
    val mode = field("afterglow_paddleMode", "I")
    subscriber.interfaces.add(bridge)
    subscriber.addPublicMethod("afterglow_rememberPaddles", listOf("Ljava/lang/Object;"), "V", 2, """
        check-cast p1, Loih;
        iput-object p1, p0, $saved
        return-void
    """)
    subscriber.addMethod("afterglow_paddleRoot", "Landroid/view/View;", 2, """
        iget-object v0, p0, Loin;->a:Loir;
        iget-object v0, v0, Loir;->g:Lolx;
        if-eqz v0, :absent
        iget-object v0, v0, Lolx;->u:Landroid/widget/FrameLayout;
        return-object v0
        :absent
        const/4 v0, 0x0
        return-object v0
    """)
    subscriber.addMethod("afterglow_refreshPaddles", "V", 4, """
        iget-object v0, p0, $saved
        if-eqz v0, :done
        iget-object v0, v0, Loih;->a:Loim;
        new-instance v1, Loih;
        const/4 v2, 0x0
        invoke-direct { v1, v0, v2 }, Loih;-><init>(Loim;Z)V
        invoke-virtual { p0, v1 }, Loin;->a(Ljava/lang/Object;)V
        :done
        return-void
    """)
    subscriber.addMethod("afterglow_singletonVod", "Z", 6, """
        iget-object v0, p0, $saved
        if-eqz v0, :no
        iget-object v0, v0, Loih;->a:Loim;
        iget-boolean v1, v0, Loim;->o:Z
        if-nez v1, :no
        iget-boolean v1, v0, Loim;->p:Z
        if-nez v1, :no
        iget-boolean v1, v0, Loim;->m:Z
        if-nez v1, :no
        iget-object v1, v0, Loim;->b:Larrr;
        sget-object v2, Larrr;->b:Larrr;
        if-eq v1, v2, :ready
        sget-object v2, Larrr;->c:Larrr;
        if-ne v1, v2, :no
        :ready
        iget-object v1, v0, Loim;->n:Larrq;
        invoke-virtual { v1 }, Larrq;->toString()Ljava/lang/String;
        move-result-object v1
        iget-object v0, p0, Loin;->a:Loir;
        invoke-virtual { v0 }, Loir;->afterglow_paddleDescriptor()Lasbs;
        move-result-object v0
        if-eqz v0, :no
        invoke-virtual { v0 }, Lasbs;->x()Ljava/lang/String;
        move-result-object v2
        invoke-virtual { v0 }, Lasbs;->v()Ljava/lang/String;
        move-result-object v3
        invoke-virtual { v0 }, Lasbs;->y()Ljava/util/List;
        move-result-object v4
        invoke-static { v1, v2, v3, v4 }, $policy->singletonVod(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Z
        move-result v0
        return v0
        :no
        const/4 v0, 0x0
        return v0
    """)

    val code = render.implementation!!.instructions.toList()
    require(render.implementation!!.registerCount == 18)
    val decisions = code.withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.IGET_BOOLEAN &&
            ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.smali in
                listOf("Larrq;->E:Z", "Loim;->k:Z")
    }
    require(decisions.size == 4 && decisions.count {
        ((it.value as ReferenceInstruction).reference as FieldReference).smali == "Loim;->k:Z"
    } == 3) { "Native transport decision sites changed" }
    // v15 is unused until native accessibility-label setup, after all four decisions.
    require(code.take(decisions.last().index + 1).none { instruction ->
        (instruction is OneRegisterInstruction && instruction.registerA == 15)
            || (instruction is TwoRegisterInstruction && instruction.registerB == 15)
            || (instruction is ThreeRegisterInstruction && instruction.registerC == 15)
    }) { "Native transport scratch register is live" }
    for ((index, instruction) in decisions.reversed()) {
        val register = (instruction as OneRegisterInstruction).registerA
        val name = if (((instruction as ReferenceInstruction).reference as FieldReference).definingClass == "Larrq;")
            "nextPaddles" else "seekPaddles"
        render.addInstructions(index + 1, """
            move-object/from16 v15, p0
            iget v15, v15, $mode
            invoke-static { v$register, v15 }, $policy->$name(ZI)Z
            move-result v$register
        """)
    }
    render.addInstructions(0, """
        invoke-static/range { p0 .. p1 }, $extension->observe(${bridge}Ljava/lang/Object;)I
        move-result v0
        move-object/from16 v1, p0
        iput v0, v1, $mode
    """)
    println("Afterglow transport paddles: ${render.smali}; descriptor=${descriptor.type}; native interval and seek retained")
}

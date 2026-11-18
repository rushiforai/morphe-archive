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
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField

/** The same information boundary used by YouTube's separate metapanel, before Lrea.o splits it. */
internal fun BytecodePatchContext.installWatchNextSections() {
    val extension = "$EXTENSION_PACKAGE/playback/WatchNextSections;"
    val bridge = "$EXTENSION_PACKAGE/playback/WatchNextSections\$Controller;"
    Fingerprint(definingClass = "Lrgp;", name = "c", returnType = "Z", parameters = listOf("Lblvh;"),
        filters = listOf(string("comments-entry-point"))).method
    Fingerprint(definingClass = "Lrgp;", name = "a", returnType = "I", parameters = listOf("Ljava/util/List;"),
        filters = listOf(methodCall(smali = "Lrgp;->f(Ljava/util/List;Lbwbf;)Ljava/lang/Integer;"))).method
    Fingerprint(definingClass = "Lrea;", name = "o", returnType = "Lalce;", parameters = listOf("Lalce;", "Lqrl;"),
        filters = listOf(methodCall(smali = "Lqrl;->s()Z"), methodCall(smali = "Lrgp;->a(Ljava/util/List;)I"),
            methodCall(smali = "Lbsdh;->aN(Ljava/lang/Iterable;I)Ljava/util/List;"))).method
    Fingerprint(definingClass = "Lqrj;", name = "p", returnType = "Lblva;", parameters = listOf("Lalck;"),
        filters = listOf(methodCall(smali = "Lrgp;->a(Ljava/util/List;)I"),
            methodCall(smali = "Lbsdh;->aU(Ljava/lang/Iterable;I)Ljava/util/List;"))).method
    val renders = listOf(
        Fingerprint(definingClass = "Lrea;", name = "r", returnType = "V", parameters = listOf("Lalck;"),
            filters = listOf(fieldAccess(smali = "Lalck;->g:Lalce;"),
                methodCall(smali = "Lrea;->o(Lalce;Lqrl;)Lalce;"), methodCall(smali = "Lauor;->aF(Lalce;)V"))).method,
        Fingerprint(definingClass = "Lrea;", name = "s", returnType = "V",
            parameters = listOf("Landroid/os/Bundle;", "Lalck;", "Lanhy;"),
            filters = listOf(fieldAccess(smali = "Lalck;->g:Lalce;"),
                methodCall(smali = "Lrea;->o(Lalce;Lqrl;)Lalce;"),
                methodCall(smali = "Lauor;->au(Lalce;Lanhy;Landroid/os/Bundle;Z)V"))).method,
    )
    val clear = Fingerprint(definingClass = "Lrea;", name = "j", returnType = "V", parameters = listOf("Lasbs;"),
        filters = listOf(fieldAccess(smali = "Lrea;->ak:Lrgo;"), methodCall(smali = "Lrgo;->j()V"))).method
    val owner = mutableClassDefBy("Lrea;")
    require(owner.fields.any { it.name == "an" && it.type == "Lkvc;" })
    require(owner.fields.any { it.name == "ag" && it.type == "Landroid/support/v7/widget/RecyclerView;" })
    require(owner.fields.any { it.name == "V" && it.type == "Lbvwr;" })
    val saved = "${owner.type}->afterglow_watchNextModel:Lalce;"
    owner.fields.add(ImmutableField(owner.type, "afterglow_watchNextModel", "Lalce;", AccessFlags.PRIVATE.value,
        null, null, null).toMutable())
    owner.interfaces.add(bridge)
    owner.addPublicMethod("afterglow_rememberWatchNext", listOf("Ljava/lang/Object;"), "V", 2, """
        check-cast p1, Lalce;
        iput-object p1, p0, $saved
        return-void
    """)
    owner.addMethod("afterglow_watchNextRoot", "Landroid/view/View;", 2, """
        iget-object v0, p0, Lrea;->ag:Landroid/support/v7/widget/RecyclerView;
        return-object v0
    """)
    // Copy the protobuf rather than editing the response consumed by metadata, comments,
    // playlist and playback owners. Unknown information boundaries leave native content intact.
    owner.addPublicMethod("afterglow_watchInfoOnly", listOf("Ljava/lang/Object;"), "Ljava/lang/Object;", 6, """
        check-cast p1, Lalce;
        iget-object v0, p1, Lalce;->a:Lblva;
        iget-object v1, v0, Lblva;->g:Lbbko;
        sget-object v2, Lrgp;->a:Lrgp;
        invoke-virtual { v2, v1 }, Lrgp;->a(Ljava/util/List;)I
        move-result v2
        if-lez v2, :native
        invoke-interface { v1 }, Ljava/util/List;->size()I
        move-result v3
        if-gt v2, v3, :native
        invoke-static { v1, v2 }, Lbsdh;->aU(Ljava/lang/Iterable;I)Ljava/util/List;
        move-result-object v1
        invoke-virtual { v0 }, Lbbjw;->toBuilder()Lbbjo;
        move-result-object v0
        check-cast v0, Lsbd;
        invoke-static { v0 }, Laxgy;->bn(Lsbd;)V
        invoke-virtual { v0, v1 }, Lsbd;->e(Ljava/lang/Iterable;)V
        invoke-virtual { v0 }, Lbbjo;->copyOnWrite()V
        iget-object v2, v0, Lsbd;->instance:Lbbjw;
        check-cast v2, Lblva;
        invoke-static { }, Lbbjw;->emptyProtobufList()Lbbko;
        move-result-object v3
        iput-object v3, v2, Lblva;->h:Lbbko;
        invoke-static { v0 }, Laxgy;->bm(Lsbd;)Lblva;
        move-result-object v0
        new-instance v1, Lalce;
        invoke-direct { v1, v0 }, Lalce;-><init>(Lblva;)V
        return-object v1
        :native
        return-object p1
    """)
    owner.addMethod("afterglow_refreshWatchNext", "V", 4, """
        iget-object v0, p0, $saved
        if-eqz v0, :done
        iget-object v2, p0, Lrea;->an:Lkvc;
        if-eqz v2, :done
        invoke-static { p0, v0 }, $extension->filter(${bridge}Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object v0
        check-cast v0, Lalce;
        iget-object v1, p0, Lrea;->V:Lbvwr;
        invoke-interface { v1 }, Lbvwr;->pc()Ljava/lang/Object;
        move-result-object v1
        check-cast v1, Lqrl;
        invoke-static { v0, v1 }, Lrea;->o(Lalce;Lqrl;)Lalce;
        move-result-object v0
        invoke-virtual { v2, v0 }, Lauor;->aF(Lalce;)V
        :done
        return-void
    """)
    for (render in renders) {
        require(render.implementation!!.registerCount <= 16)
        val load = render.implementation!!.instructions.withIndex().single { (_, insn) ->
            insn.opcode == Opcode.IGET_OBJECT &&
                ((insn as? ReferenceInstruction)?.reference as? FieldReference)?.smali == "Lalck;->g:Lalce;"
        }
        val model = (load.value as OneRegisterInstruction).registerA
        render.addInstructions(load.index + 1, """
            invoke-static { p0, v$model }, $extension->filter(${bridge}Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$model
            check-cast v$model, Lalce;
        """)
    }
    require(clear.implementation!!.registerCount == 5)
    clear.addInstructions(0, """
        const/4 v0, 0x0
        iput-object v0, p0, $saved
    """)
    println("Afterglow watch sections: Lrea.r/s; native information boundary retained, copied list without continuations")
}

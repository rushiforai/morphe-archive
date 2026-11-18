package app.afterglow.patches.menus

import app.afterglow.patches.litho.disableRenderNextPatch
import app.afterglow.patches.litho.lithoConversionContextPatch
import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.addMethod
import app.afterglow.patches.shared.smali
import app.afterglow.patches.shared.writtenRegisters
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getFreeRegisterProvider
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val ACTIONS="$EXTENSION_PACKAGE/menus/AvatarPhotoActions;"
private const val CONTEXT="$EXTENSION_PACKAGE/litho/LithoContext;"
private const val TARGET="Lwsu;"
private const val VIEW="Landroid/view/View;"

/** Direct Elements image target/URI binding; selection is limited to the verified avatar leaf. */
internal val avatarPhotoHookPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(lithoConversionContextPatch, disableRenderNextPatch, longPressCaptureResourcesPatch)
    execute {
        val constructor=Fingerprint(definingClass=TARGET,name="<init>",returnType="V",filters=listOf(
            methodCall(smali="Lhar;-><init>(Landroid/widget/ImageView;)V"),
            fieldAccess(smali="$TARGET->h:Lwev;",opcode=Opcode.IPUT_OBJECT),
            fieldAccess(smali="$TARGET->q:Lwuw;",opcode=Opcode.IPUT_OBJECT),
        )).method
        require(constructor.parameterTypes.size==20 && constructor.parameterTypes[1]=="Landroid/widget/ImageView;"
            && constructor.parameterTypes[6]=="Lwev;" && constructor.parameterTypes[17]=="Lwuw;") {
            "Native avatar target/view/source/context constructor changed"
        }
        val ready=Fingerprint(definingClass=TARGET,name="b",parameters=listOf("Ljava/lang/Object;","Lhbd;"),returnType="V",
            filters=listOf(fieldAccess(smali="Lhaw;->a:$VIEW"),
                methodCall(smali="Lhar;->b(Ljava/lang/Object;Lhbd;)V"))).match()
        val unmount=Fingerprint(definingClass="Lwsp;",name="as",parameters=listOf("Lhfs;","Ljava/lang/Object;"),returnType="V",
            filters=listOf(methodCall(smali="Lgot;->j(Landroid/view/View;)V"),
                methodCall(smali="Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V"))).method
        Fingerprint(definingClass="Lwsp;",name="L",parameters=listOf("Lhfs;","Ljava/lang/Object;","Lhhw;"),returnType="V",
            strings=listOf("Failed to find a valid source for the image. Please make sure image source array is not empty and each image source has proper remote url / client resource name / serialized image data."),
            filters=listOf(fieldAccess(smali="Lwsy;->b:Lwev;"),methodCall(smali=constructor.smali))).method
        // Validate the URL's native source-presence predicate and getter in the original
        // image telemetry path; a resource name/byte-buffer source must not be requested.
        Fingerprint(definingClass=TARGET,name="q",parameters=emptyList(),returnType="V",
            filters=listOf(methodCall(smali="Lwev;->q()Z"))).method
        val imageComponent=mutableClassDefBy("Lwsp;")
        require(imageComponent.methods.any { method -> method.implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.smali=="Lwev;->k()Ljava/lang/String;"
        }==true }) { "Native remote image URL getter disappeared" }
        require(mutableClassDefBy("Lwuw;").fields.single { it.name=="b" }.type=="Ljava/lang/ref/WeakReference;")
        val target=mutableClassDefBy(TARGET)
        require(target.superclass=="Lhar;" && target.methods.none { it.name.startsWith("afterglow_avatar") })
        target.addMethod("afterglow_avatarBind","V",6,"""
            iget-object v0, p0, Lhaw;->a:$VIEW
            iget-object v1, p0, $TARGET->q:Lwuw;
            const/4 v2, 0x0
            const/4 v3, 0x0
            iget-object v4, p0, $TARGET->h:Lwev;
            if-eqz v4, :root
            invoke-interface { v4 }, Lwev;->q()Z
            move-result v2
            if-eqz v2, :empty
            invoke-interface { v4 }, Lwev;->k()Ljava/lang/String;
            move-result-object v2
            goto :root
            :empty
            const/4 v2, 0x0
            :root
            if-eqz v1, :bind
            iget-object v3, v1, Lwuw;->b:Ljava/lang/ref/WeakReference;
            :bind
            invoke-static { v0, p0, v1, v2, v3 }, $ACTIONS->bind(${VIEW}Ljava/lang/Object;${CONTEXT}Ljava/lang/String;Ljava/lang/Object;)V
            return-void
        """)
        target.addMethod("afterglow_avatarLoaded","V",2,"""
            iget-object v0, p0, Lhaw;->a:$VIEW
            invoke-static { v0, p0 }, $ACTIONS->loaded(${VIEW}Ljava/lang/Object;)V
            return-void
        """)
        val constructorThis=constructor.implementation!!.registerCount-21
        require(constructor.implementation!!.instructions.none {constructorThis in it.writtenRegisters}) {
            "Native avatar target constructor reuses its receiver"
        }
        val returns=constructor.implementation!!.instructions.withIndex().filter {it.value.opcode==Opcode.RETURN_VOID}
        require(returns.size==1) { "Native avatar constructor return flow changed" }
        constructor.addInstruction(returns.single().index,"invoke-virtual/range { p0 .. p0 }, $TARGET->afterglow_avatarBind()V")
        val nativeReady=ready.instructionMatches.last()
        require(nativeReady.instruction.opcode==Opcode.INVOKE_SUPER)
        val readyThis=ready.method.implementation!!.registerCount-3
        require(ready.method.implementation!!.instructions.toList().take(nativeReady.index+1).none {readyThis in it.writtenRegisters})
        ready.method.addInstruction(nativeReady.index+1,"invoke-virtual/range { p0 .. p0 }, $TARGET->afterglow_avatarLoaded()V")
        unmount.addInstruction(0,"invoke-static/range { p2 .. p2 }, $ACTIONS->unbind(Ljava/lang/Object;)V")
        val touch=Fingerprint(definingClass="Lcom/facebook/litho/ComponentHost;",name="dispatchTouchEvent",
            parameters=listOf("Landroid/view/MotionEvent;"),returnType="Z").method
        val free=touch.getFreeRegisterProvider(0,1).getFreeRegister4Bit()
        touch.addInstructionsWithLabels(0,"""
            invoke-static/range { p0 .. p1 }, $ACTIONS->onTouch(${VIEW}Landroid/view/MotionEvent;)Z
            move-result v$free
            if-eqz v$free, :native
            return v$free
            :native
            nop
        """)
        println("Afterglow profile photos: native target constructor, resource-ready callback, unmount and exact avatar leaf")
    }
}

package app.afterglow.patches.menus

import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.addMethod
import app.afterglow.patches.shared.smali
import app.afterglow.patches.shared.writtenRegisters
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import app.morphe.patcher.resourceLiteral
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val CONTENT = "$EXTENSION_PACKAGE/menus/DescriptionHeaderContent;"
private const val HOST = "$EXTENSION_PACKAGE/menus/DescriptionHeaderHost;"
private const val CAPTURE = "$EXTENSION_PACKAGE/menus/LongPressCaptureTools;"
private const val LOADING = "Lcom/google/android/libraries/youtube/rendering/ui/widget/loadingframe/LoadingFrameLayout;"

/** The title belongs to the native panel's returned LoadingFrameLayout; Z is its footer. */
internal val descriptionContentHookPatch = bytecodePatch {
    dependsOn(longPressCaptureHookPatch, longPressMountedTextHookPatch, descriptionHeaderResourcePatch)
    execute {
        val panel = mutableClassDefBy("Lakhj;")
        require(HOST !in panel.interfaces && panel.superclass == "Lakhh;")
        require(classDefBy(LOADING).superclass == "Landroid/widget/FrameLayout;")
        require(resourceId(ResourceType.ID, "footer") == 0x7f0b085fL
                && resourceId(ResourceType.ID, "panel_content") == 0x7f0b0e5eL
                && resourceId(ResourceType.LAYOUT, "constraint_default_engagement_panel") == 0x7f0e0197L) {
            "Native engagement panel resource mapping changed"
        }
        val inflate = Fingerprint(definingClass = "Lakhj;", name = "aB", parameters = emptyList(), returnType = "V",
            filters = listOf(fieldAccess(smali = "Lakhj;->d:$LOADING", opcode = Opcode.IPUT_OBJECT),
                resourceLiteral(ResourceType.LAYOUT, "constraint_default_engagement_panel"),
                methodCall(smali = "Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;"))).match()
        val insertion = inflate.instructionMatches.first().index + 1
        val receiver = inflate.method.implementation!!.registerCount - 1
        require(inflate.method.implementation!!.instructions.take(insertion).none { receiver in it.writtenRegisters })
        Fingerprint(definingClass = "Lakhj;", name = "nx", parameters = emptyList(), returnType = "Landroid/view/View;",
            filters = listOf(methodCall(smali = "Lakhj;->aB()V"), fieldAccess(smali = "Lakhj;->d:$LOADING"))).method
        val update = Fingerprint(definingClass = "Lakhj;", name = "l", parameters = listOf("Lbfgs;", "Lbhmm;", "Lautw;"), returnType = "V",
            filters = listOf(methodCall(smali = "Lakhh;->l(Lbfgs;Lbhmm;Lautw;)V", opcode = Opcode.INVOKE_SUPER_RANGE))).match()
        val updateIndex = update.instructionMatches.single().index
        require(update.method.implementation!!.instructions.take(updateIndex + 1)
            .none { update.method.implementation!!.registerCount - 4 in it.writtenRegisters })
        Fingerprint(definingClass = "Lakhh;", name = "l", parameters = listOf("Lbfgs;", "Lbhmm;", "Lautw;"), returnType = "V",
            filters = listOf(fieldAccess(smali = "Lakhh;->p:Lbfgs;", opcode = Opcode.IPUT_OBJECT))).method
        Fingerprint(definingClass = "Lakhh;", name = "M", parameters = emptyList(), returnType = "Ljava/lang/String;",
            filters = listOf(fieldAccess(smali = "Lakhh;->p:Lbfgs;"), methodCall(smali = "Lajoz;->bJ(Lbfgs;)Ljava/lang/String;"))).method
        panel.interfaces.add(HOST)
        panel.addMethod("afterglow_descriptionRoot", "Landroid/view/View;", 2, """
            iget-object v0, p0, Lakhj;->d:$LOADING
            return-object v0
        """)
        panel.addMethod("afterglow_descriptionPanel", "Ljava/lang/Object;", 2, """
            iget-object v0, p0, Lakhh;->p:Lbfgs;
            return-object v0
        """)
        panel.addMethod("afterglow_descriptionPanelId", "Ljava/lang/String;", 2, """
            invoke-virtual { p0 }, Lakhh;->M()Ljava/lang/String;
            move-result-object v0
            return-object v0
        """)
        inflate.method.addInstructions(insertion, "invoke-static/range { p0 .. p0 }, $CONTENT->bindPanel($HOST)V")
        update.method.addInstructions(updateIndex + 1, "invoke-static/range { p0 .. p0 }, $CONTENT->bindPanel($HOST)V")

        val bind = longPressCaptureRootFingerprint().method
        val store = bind.implementation!!.instructions.withIndex().single { (_, instruction) ->
            instruction.opcode == Opcode.IPUT_OBJECT && (instruction as ReferenceInstruction).reference.toString() == "Lwuv;->A:Ljava/lang/ref/WeakReference;"
        }
        val token = (store.value as OneRegisterInstruction).registerA
        require(bind.implementation!!.registerCount == 3 && token == 0)
        bind.addInstructions(store.index + 1, "invoke-static { p1, v0 }, $CONTENT->bindRoot(Landroid/view/View;Ljava/lang/Object;)V")

        // This generated observer is called by both the original cached hook and the verified fresh branch.
        val observer = mutableClassDefBy(CAPTURE).methods.single { it.name == "afterglow_onLithoCapture" }
        require(observer.parameterTypes == listOf("Lapp/morphe/extension/shared/patches/components/ContextInterface;", "Ljava/lang/CharSequence;")
                && observer.returnType == "Ljava/lang/CharSequence;"
                && observer.implementation!!.instructions.any {
                    ((it as? ReferenceInstruction)?.reference as? MethodReference)?.smali == "$CAPTURE->onText(Ljava/lang/Object;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;"
                })
        observer.addInstructions(0, "invoke-static/range { p0 .. p0 }, $CONTENT->onText(Ljava/lang/Object;)V")

        // The currently active renderer omits ConversionContext.root. Its exact native
        // bind/unbind callbacks provide the actual drawing host and mount-item identity.
        for ((name, parameters, call) in listOf(
            Triple("afterglow_onMounted", listOf("Landroid/view/View;", "Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
                "invoke-static/range { p0 .. p2 }, $CONTENT->onNativeMounted(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;)V"),
            Triple("afterglow_onUnmounted", listOf("Landroid/view/View;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
                "invoke-static/range { p0 .. p2 }, $CONTENT->onNativeUnmounted(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;)V")
        )) {
            val callback = mutableClassDefBy(CAPTURE).methods.single { it.name == name }
            require(AccessFlags.STATIC.isSet(callback.accessFlags) && callback.parameterTypes == parameters && callback.returnType == "V")
            callback.addInstructions(0, call)
        }
        println("Afterglow Description content: exact panel model, title template, native mount/unmount generation")
    }
}

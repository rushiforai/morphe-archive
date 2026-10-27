package app.morphe.patches.chmate

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions

/** Direct links and native image thumbnails both open the GIF player. */
internal val gifViewerRoutingPatch = bytecodePatch {
    dependsOn(haiagaruPatch)
    execute {
        val owner = mutableClassDefBy("Ljp/syoboi/a2chMate/activity/ImagesViewer2Activity;")
        // Capture the source Activity at its native thumbnail factory, before a new
        // viewer takes focus. A wrapper keeps every native argument and instruction.
        val factoryOwner = when(packageMetadata.versionName) {
            "0.8.10.191 dev" -> owner
            "0.8.10.226 dev" -> mutableClassDefBy("Ljp/syoboi/a2chMate/activity/ImagesViewer2Activity\$read;")
            else -> mutableClassDefBy("Ljp/syoboi/a2chMate/activity/ImagesViewer2Activity\$RemoteActionCompatParcelizer;")
        }
        val factory=factoryOwner.methods.single {
            it.returnType=="Landroid/content/Intent;" && it.parameterTypes.size==(if(packageMetadata.versionName=="0.8.10.242 dev")4 else 3)
                && it.parameterTypes[0]=="Landroid/content/Context;"
                && it.parameterTypes[1] in setOf("Ljava/util/List;","Ljava/util/ArrayList;")
                && it.parameterTypes[2]=="I"
        }
        val nativeFactory=MutableMethod(ImmutableMethod(factoryOwner.type,"haiagaruNativeMediaIntent",factory.parameters,
            factory.returnType,factory.accessFlags,factory.annotations,factory.hiddenApiRestrictions,factory.implementation))
        factoryOwner.methods.remove(factory);factoryOwner.methods.add(nativeFactory)
        val staticFactory=(factory.accessFlags and 0x8)!=0
        val words=factory.parameterTypes.size+(if(staticFactory)0 else 1)
        val invoke=if(staticFactory)"invoke-static/range" else if((factory.accessFlags and 0x2)!=0)"invoke-direct/range" else "invoke-virtual/range"
        val context=if(staticFactory)"p0" else "p1"
        factoryOwner.methods.add(MutableMethod(ImmutableMethod(factoryOwner.type,factory.name,factory.parameters,
            factory.returnType,factory.accessFlags,factory.annotations,factory.hiddenApiRestrictions,
            ImmutableMethodImplementation(words+2,emptyList(),emptyList(),emptyList()))).apply {
            addInstructions(0,"""
                $invoke {p0 .. p${words-1}}, $nativeFactory
                move-result-object v0
                invoke-static {v0, $context}, Lapp/morphe/extension/chmate/MediaViewerNavigation;->prepareNativeIntent(Landroid/content/Intent;Landroid/content/Context;)V
                return-object v0
            """.trimIndent())
        })
        val originalTouch=owner.methods.singleOrNull { it.name == "dispatchTouchEvent" && it.parameterTypes == listOf("Landroid/view/MotionEvent;") }
        val fallback=if(originalTouch!=null){
            val delegate=MutableMethod(ImmutableMethod(owner.type,"haiagaruNativeMediaTouch",originalTouch.parameters,
                originalTouch.returnType,originalTouch.accessFlags,originalTouch.annotations,originalTouch.hiddenApiRestrictions,originalTouch.implementation))
            owner.methods.remove(originalTouch);owner.methods.add(delegate)
            "invoke-virtual {p0, p1}, $delegate"
        }else{
            "invoke-super {p0, p1}, ${owner.superclass}->dispatchTouchEvent(Landroid/view/MotionEvent;)Z"
        }
        owner.methods.add(MutableMethod(ImmutableMethod(owner.type,"dispatchTouchEvent",
            listOf(ImmutableMethodParameter("Landroid/view/MotionEvent;",emptySet(),null)),"Z",1,emptySet(),emptySet(),
            ImmutableMethodImplementation(3,emptyList(),emptyList(),emptyList()))).apply {
            addInstructions(0,"""
                invoke-static {p0, p1}, Lapp/morphe/extension/chmate/MediaViewerNavigation;->onNativeTouch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z
                move-result v0
                if-eqz v0, :native_touch
                const/4 v0, 0x1
                return v0
                :native_touch
                $fallback
                move-result v0
                return v0
            """.trimIndent())
        })
        val method = owner.methods.single {
            it.name == "onCreate" && it.parameterTypes == listOf("Landroid/os/Bundle;") && it.returnType == "V"
        }
        val instructions = method.implementation!!.instructions.toList()
        val superIndex = instructions.indexOfFirst {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            (it.opcode == Opcode.INVOKE_SUPER || it.opcode == Opcode.INVOKE_SUPER_RANGE) && ref?.name == "onCreate"
        }
        check(superIndex >= 0 && method.implementation!!.registerCount > 2) { "Native image viewer entry changed" }
        // The supported native methods do not read the incoming Bundle after super.onCreate.
        // Reuse that dead argument and preserve every native local, including 226's v0 receiver.
        method.addInstructionsWithLabels(superIndex + 1, """
            invoke-static/range {p0 .. p0}, Lapp/morphe/extension/chmate/GifViewerActivity;->redirectNative(Landroid/app/Activity;)Z
            move-result p1
            if-eqz p1, :native_images
            return-void
        """.trimIndent(), ExternalLabel("native_images", instructions[superIndex + 1]))
    }
}

package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

/** Expand at the native viewer selector, before its single/multiple/first-page decisions. */
internal fun BytecodePatchContext.patchContinuousThreadMedia(version:String) {
    val modern=version=="0.8.10.242 dev"
    val (type,name)=when(version){
        "0.8.10.191 dev"->"Lo/lo;" to "b"
        "0.8.10.226 dev"->"Ljp/syoboi/a2chMate/RoidonApp\$RemoteActionCompatParcelizer;" to "e"
        "0.8.10.242 dev"->"Lo/TTRewardVideoActivity1;" to "e"
        else->return
    }
    val signature=if(modern)listOf("Landroid/app/Activity;","I","Landroid/view/View;","Ljava/util/ArrayList;","I","Ljava/util/ArrayList;")
        else listOf("Landroid/app/Activity;","Landroid/view/View;","Ljava/util/ArrayList;","I")
    val owner=mutableClassDefBy(type)
    val original=owner.methods.single{it.name==name&&it.parameterTypes==signature&&it.returnType=="V"}
    check(original.accessFlags and 8!=0){"Native media selector became non-static: $version"}
    val native=MutableMethod(ImmutableMethod(type,"haiagaruNativeViewerSelection",original.parameters,"V",original.accessFlags,
        original.annotations,original.hiddenApiRestrictions,original.implementation))
    owner.methods.remove(original);owner.methods.add(native)
    val list=if(modern)3 else 2;val index=list+1;val view=if(modern)2 else 1
    val selection="Lapp/morphe/extension/chmate/MediaViewerNavigation\$NativeSelection;"
    owner.methods.add(MutableMethod(ImmutableMethod(type,name,original.parameters,"V",original.accessFlags,
        original.annotations,original.hiddenApiRestrictions,ImmutableMethodImplementation(signature.size+1,emptyList(),emptyList(),emptyList()))).apply{
        addInstructions(0,"""
            if-eqz p$view, :native
            invoke-static {p0, p$list, p$index}, Lapp/morphe/extension/chmate/MediaViewerNavigation;->wholeThreadSelection(Landroid/app/Activity;Ljava/util/ArrayList;I)$selection
            move-result-object v0
            if-eqz v0, :native
            iget-object p$list, v0, $selection->links:Ljava/util/ArrayList;
            iget p$index, v0, $selection->index:I
            ${if(modern)"const/4 p5, 0x0" else ""}
            :native
            invoke-static/range {p0 .. p${signature.size-1}}, $native
            return-void
        """.trimIndent())
    })
    println("Native continuous thread media: $version -> $type; native viewer/first-page policy retained")
}

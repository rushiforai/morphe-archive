package app.morphe.patches.chmate

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val IMAGE_PAGING="Lapp/morphe/extension/chmate/NativeImagePaging;"

internal fun BytecodePatchContext.patchNativeImagePaging(version:String){
    if(version !in setOf("0.8.10.191 dev","0.8.10.226 dev","0.8.10.242 dev"))return
    val modern=version=="0.8.10.242 dev"
    val type=if(modern)"Lo/MaxAdViewAdapter;" else "Ljp/syoboi/a2chMate/activity/ImagesViewer2Activity;"
    if(modern){
        val fragment=mutableClassDefBy("Lo/VN10;")
        val bind=fragment.methods.single{it.name=="onViewCreated"&&it.parameterTypes==listOf("Landroid/view/View;","Landroid/os/Bundle;")}
        // onCreateView already installed the native binding before this method runs.
        bind.addInstructions(0,"invoke-static/range {p0 .. p0}, $IMAGE_PAGING->registerContainer(Ljava/lang/Object;)V")
    }
    val owner=mutableClassDefBy(type)
    val original=owner.methods.singleOrNull { it.name=="dispatchTouchEvent"&&it.parameterTypes==listOf("Landroid/view/MotionEvent;") }
    val fallback=if(original!=null){
        val delegate=MutableMethod(ImmutableMethod(type,"haiagaruOriginalImagePagingTouch",original.parameters,
            original.returnType,original.accessFlags,original.annotations,original.hiddenApiRestrictions,original.implementation))
        owner.methods.remove(original);owner.methods.add(delegate)
        "invoke-virtual {p0, p1}, $delegate"
    }else "invoke-super {p0, p1}, ${owner.superclass}->dispatchTouchEvent(Landroid/view/MotionEvent;)Z"
    val call=if(modern)"onContainerTouch(Landroid/view/View;" else "onActivityTouch(Landroid/app/Activity;"
    owner.methods.add(MutableMethod(ImmutableMethod(type,"dispatchTouchEvent",
        listOf(ImmutableMethodParameter("Landroid/view/MotionEvent;",emptySet(),null)),"Z",1,emptySet(),emptySet(),
        ImmutableMethodImplementation(3,emptyList(),emptyList(),emptyList()))).apply{
        addInstructions(0,"""
            invoke-static {p0, p1}, $IMAGE_PAGING->${call}Landroid/view/MotionEvent;)Z
            move-result v0
            if-eqz v0, :native
            const/4 v0, 0x1
            return v0
            :native
            $fallback
            move-result v0
            return v0
        """.trimIndent())
    })
}

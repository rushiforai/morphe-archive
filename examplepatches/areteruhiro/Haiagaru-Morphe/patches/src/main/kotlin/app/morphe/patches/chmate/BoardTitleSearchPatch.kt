package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

/** 226 title menus omit Search. Keep native per-page toolbar visibility and dispatch. */
internal fun BytecodePatchContext.patchBoardTitleSearch(version: String) {
    if (version != "0.8.10.226 dev") return
    val types = listOf("Lo/Yhp5;", "Ljp/syoboi/a2chMate/fragment/HomeFragment;",
        "Ljp/syoboi/a2chMate/ui/reslist/ResListFragment;")
    types.forEach { type ->
    val owner = mutableClassDefBy(type)
    val original = owner.methods.single {
        it.name == "b" && it.parameterTypes == listOf("Landroid/view/Menu;", "Landroid/view/MenuInflater;") && it.returnType == "V"
    }
    owner.methods.remove(original)
    val retained = MutableMethod(ImmutableMethod(type, "haiagaruTitleSearchMenu", original.parameters,
        original.returnType, original.accessFlags, original.annotations, original.hiddenApiRestrictions, original.implementation))
    owner.methods.add(retained)
    owner.methods.add(MutableMethod(ImmutableMethod(type, original.name, original.parameters, "V",
        original.accessFlags, original.annotations, original.hiddenApiRestrictions,
        ImmutableMethodImplementation(7, emptyList(), emptyList(), emptyList()))).apply {
        addInstructions(0, """
            invoke-virtual {p0, p1, p2}, $retained
            const v1, 0x7f090100
            invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;
            move-result-object v0
            if-nez v0, :done
            const/4 v0, 0x0
            const v2, 0x7f1001ae
            invoke-interface {p1, v0, v1, v0, v2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;
            move-result-object v0
            const v3, 0x7f0800f3
            invoke-interface {v0, v3}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;
            :done
            return-void
        """.trimIndent())
    })
    }
    println("226 board/HOME/thread title menus: native Search action; per-page toolbar visibility/dispatch retained")
}

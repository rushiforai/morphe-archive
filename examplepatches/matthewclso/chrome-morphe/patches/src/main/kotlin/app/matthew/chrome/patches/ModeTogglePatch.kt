package app.matthew.chrome.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

internal const val ACTIVITY = "Lorg/chromium/chrome/browser/ChromeTabbedActivity;"
internal const val EXTENSION = "Lapp/matthew/chrome/extension/ChromePatch;"
internal const val BRIDGE = "Lapp/matthew/chrome/extension/NativeBridge;"
private const val TAB_MODEL = "Lorg/chromium/chrome/browser/tabmodel/TabModel;"

internal fun Method.hasString(value: String) = implementation?.instructions?.any {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == value
} == true

val modeTogglePatch = bytecodePatch(
    description = "Adds a dedicated button to switch between regular and Incognito tabs.",
    default = false,
) {
    compatibleWith(chromeCompatibility)
    extendWith("extensions/chrome.mpe")
    execute {
        requireTarget(packageMetadata)
        val activity = classDefBy(ACTIVITY)
        val menu = activity.methods.single { it.hasString("MobileMenuNewIncognitoTab") }
        check(menu.parameterTypes.take(3) == listOf("I", "Z", "Landroid/os/Bundle;") && menu.returnType == "Z")
        val refs = activity.methods.flatMap { method ->
            method.implementation?.instructions?.mapNotNull {
                (it as? ReferenceInstruction)?.reference as? MethodReference
            }?.toList() ?: emptyList()
        }.distinctBy { it.toString() }
        val current = refs.single { it.name == "I2" && it.parameterTypes.isEmpty() && it.returnType == TAB_MODEL }
        val selector = refs.single { it.name == "L2" && it.parameterTypes.isEmpty() && it.definingClass == current.definingClass }
        val selectorClass = classDefBy(selector.returnType)
        val getModel = selectorClass.methods.single { it.parameterTypes == listOf("Z") && it.returnType == TAB_MODEL }
        val select = selectorClass.methods.single { it.name == "F" && it.parameterTypes == listOf("Z") && it.returnType == "V" }
        val ready = selectorClass.methods.single { it.name == "v" && it.parameterTypes.isEmpty() && it.returnType == "Z" }
        check(ready.implementation!!.instructions.map { it.opcode } == listOf(Opcode.IGET_BOOLEAN, Opcode.RETURN))
        check((ready.implementation!!.instructions.first() as ReferenceInstruction).reference.toString() == "Lr5r;->m:Z")
        val bridgeClass = mutableClassDefBy(BRIDGE)
        fun bridge(name: String, body: String) {
            val old = bridgeClass.methods.single { it.name == name }
            val replacement = MutableMethod(ImmutableMethod(old.definingClass, old.name, old.parameters,
                old.returnType, old.accessFlags, old.annotations, old.hiddenApiRestrictions,
                ImmutableMethodImplementation(8, emptyList(), emptyList(), emptyList())))
            replacement.addInstructions(0, body.trimIndent())
            bridgeClass.methods.remove(old)
            bridgeClass.methods.add(replacement)
        }
        bridge("isIncognito", """
            check-cast p0, $ACTIVITY
            invoke-virtual {p0}, $current
            move-result-object v0
            invoke-interface {v0}, $TAB_MODEL->isIncognito()Z
            move-result v0
            return v0
        """)
        bridge("tabsReady", """
            check-cast p0, $ACTIVITY
            invoke-virtual {p0}, $selector
            move-result-object v0
            if-eqz v0, :not_ready
            invoke-virtual {v0}, $ready
            move-result v0
            return v0
            :not_ready
            const/4 v0, 0x0
            return v0
        """)
        check(activity.fields.any { it.name == "g3" && it.type == "Lcn4;" })
        check(activity.fields.any { it.name == "h3" && it.type == "Ladc;" })
        val hubAccess = classDefBy("Ltr4;").methods.single { it.name == "run" }
        for (ref in listOf("Lmcc;->e:Lyzi;", "Lyzi;->a:Ln7i;", "Lvzi;->S:B")) {
            check(hubAccess.implementation!!.instructions.any {
                (it as? ReferenceInstruction)?.reference.toString() == ref
            })
        }
        bridge("hubPane", """
            check-cast p0, $ACTIVITY
            iget-object v0, p0, $ACTIVITY->g3:Lcn4;
            if-eqz v0, :no_hub
            invoke-virtual {v0}, Lcn4;->get()Ljava/lang/Object;
            move-result-object v0
            check-cast v0, Ljava/lang/Integer;
            invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I
            move-result v0
            const/4 v1, 0x1
            if-ne v0, v1, :no_hub
            iget-object v0, p0, $ACTIVITY->h3:Ladc;
            if-eqz v0, :no_hub
            iget-object v0, v0, Ladc;->a:Lxie;
            invoke-virtual {v0}, Lyie;->b()Ljava/lang/Object;
            move-result-object v0
            check-cast v0, Lmcc;
            if-eqz v0, :no_hub
            iget-object v0, v0, Lmcc;->e:Lyzi;
            iget-object v0, v0, Lyzi;->a:Ln7i;
            iget-object v0, v0, Ln7i;->U:Ljava/lang/Object;
            check-cast v0, Lvzi;
            if-eqz v0, :no_hub
            iget-byte v0, v0, Lvzi;->S:B
            return v0
            :no_hub
            const/4 v0, -0x1
            return v0
        """)
        bridge("tabCount", """
            check-cast p0, $ACTIVITY
            invoke-virtual {p0}, $selector
            move-result-object v0
            invoke-virtual {v0, p1}, $getModel
            move-result-object v0
            invoke-interface {v0}, $TAB_MODEL->getCount()I
            move-result v0
            return v0
        """)
        bridge("selectModel", """
            check-cast p0, $ACTIVITY
            invoke-virtual {p0}, $selector
            move-result-object v0
            invoke-virtual {v0, p1}, $select
            return-void
        """)
        bridge("newTab", """
            check-cast p0, $ACTIVITY
            const/4 v0, 0x0
            const/4 v1, 0x0
            const/4 v2, 0x0
            invoke-virtual {p0, p1, v0, v1, v2}, $menu
            move-result v0
            return v0
        """)
        check(menu.implementation!!.instructions.any {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.toString() == "LJ/N;->ZO(ILjava/lang/Object;)Z"
        }) { "Incognito policy check changed" }
        bridge("incognitoAllowed", """
            check-cast p0, $ACTIVITY
            invoke-virtual {p0}, $selector
            move-result-object v0
            const/4 v1, 0x0
            invoke-virtual {v0, v1}, $getModel
            move-result-object v0
            invoke-interface {v0}, $TAB_MODEL->f()Lorg/chromium/chrome/browser/profiles/Profile;
            move-result-object v0
            const/16 v1, 0x21
            invoke-static {v1, v0}, LJ/N;->ZO(ILjava/lang/Object;)Z
            move-result v0
            return v0
        """)
        val toolbar = mutableClassDefBy("Lorg/chromium/chrome/browser/toolbar/top/ToolbarPhone;")
        val inflate = toolbar.methods.single { it.name == "onFinishInflate" && it.hasString("ToolbarPhone.onFinishInflate") }
        val superInflate = inflate.implementation!!.instructions.withIndex().single { (_, ins) ->
            ins.opcode == Opcode.INVOKE_SUPER && ((ins as? ReferenceInstruction)?.reference as? MethodReference)?.name == "onFinishInflate"
        }
        // p0 is reused for a child View later, and TraceEvent's null branch jumps straight to return.
        inflate.addInstructions(superInflate.index + 1, "invoke-static/range {p0 .. p0}, $EXTENSION->installToolbar(Landroid/view/View;)V")
        println("Toolbar switch: native menu $menu; selector $selector; model selection $select")
    }
}

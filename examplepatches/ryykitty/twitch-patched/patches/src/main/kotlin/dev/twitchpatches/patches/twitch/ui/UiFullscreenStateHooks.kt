package dev.twitchpatches.patches.twitch.ui

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import dev.twitchpatches.patches.twitch.reload.nativeReloadMethod
import dev.twitchpatches.patches.twitch.shared.*

private const val HOST = "Ltv/twitch/android/feature/discovery/feed/rn/theatre/ActivityImmersiveModeHost;"
private const val ACTIVITY = "Landroid/app/Activity;"
private const val BASE_VIEW = "Ltv/twitch/android/core/mvp/viewdelegate/BaseViewDelegate;"

internal fun BytecodePatchContext.injectUiFullscreenState() {
    val host = classDefBy(HOST)
    val set = host.methods.filter { it.name == "setImmersive" && it.isInstance(listOf("Z"), "V") }
        .uniqueHook("modern fullscreen state")
    val activity = host.methods.single { it.name == "isInPictureInPictureMode" }.references().filterIsInstance<FieldReference>()
        .uniqueHook("modern fullscreen activity")
    val controllerCalls = set.references().filterIsInstance<MethodReference>().filter {
        it.definingClass != HOST && it.parameterTypes.isEmpty() && it.returnType == "V"
    }.distinctBy { it.toString() }
    require(controllerCalls.size == 2 && controllerCalls.map { it.definingClass }.distinct().size == 1) {
        "UI settings: immersive controller dispatch changed."
    }
    val controller = classDefBy(controllerCalls.first().definingClass)
    val controllerActivity = controller.fields.filter { it.type == ACTIVITY }.uniqueHook("immersive controller activity")
    for ((operation, hidden) in listOf("hide" to true, "show" to false)) {
        val method = controller.methods.filter { candidate -> controllerCalls.any { it.toString() == candidate.reference } &&
            candidate.references().filterIsInstance<MethodReference>().any { call ->
                fun MethodReference.matches() = definingClass == "Landroid/view/WindowInsetsController;" &&
                    name == operation && parameterTypes.map(CharSequence::toString) == listOf("I")
                call.matches() || (call.parameterTypes.firstOrNull() == "Landroid/view/WindowInsetsController;" &&
                    classDefBy(call.definingClass).methods.single { it.reference == call.toString() }
                        .references().filterIsInstance<MethodReference>().any { it.matches() })
            }
        }.uniqueHook("host system bar $operation")
        val owner = mutableClassDefBy(method.definingClass)
        val mutable = owner.methods.single { it.reference == method.reference }
        owner.methods.remove(mutable)
        val wrapper = wrapSystemBarOperation(mutable, controllerActivity, hidden)
        owner.methods.add(mutable)
        owner.methods.add(wrapper)
    }
    val owner = mutableClassDefBy(HOST)
    val report = nativeReloadMethod(HOST, "twitchPatchesFullscreen", listOf("Z"), "V", 3, """
        iget-object v0, p0, $activity
        invoke-static {v0, p1}, $UI_SETTINGS->modernPlayerLayout(${ACTIVITY}Z)V
        return-void
    """)
    owner.methods.add(report)
    owner.methods.single { it.reference == set.reference }.insertBeforeWithLabels(0,
        "invoke-virtual/range {p0 .. p1}, ${report.reference}")
    injectNativeFullscreenState()
    injectUiBarRequests()
}

internal fun wrapSystemBarOperation(original: MutableMethod, activity: FieldReference, hidden: Boolean): MutableMethod {
    val name = original.name
    original.name = if (hidden) "twitchPatchesHideBarsOriginal" else "twitchPatchesShowBarsOriginal"
    val invoke = if (AccessFlags.PRIVATE.isSet(original.accessFlags)) "invoke-direct" else "invoke-virtual"
    // R8 can reuse p0 in the host method; report from a wrapper that retains its receiver.
    return nativeReloadMethod(original.definingClass, name, emptyList(), "V", 3, """
        $invoke {p0}, ${original.reference}
        iget-object v0, p0, $activity
        const/4 v1, ${if (hidden) "0x1" else "0x0"}
        invoke-static {v0, v1}, $UI_SETTINGS->hostSystemBars(${ACTIVITY}Z)V
        return-void
    """).also { it.accessFlags = original.accessFlags }
}

private fun BytecodePatchContext.injectNativeFullscreenState() {
    val all = mutableListOf<Method>()
    classDefForEach { all.addAll(it.methods) }
    val model = all.filter { it.name == "toString" && it.hasStrings("TheatreViewState(isPortrait=", ", playerMode=") }
        .uniqueHook("native theatre layout state")
    val portrait = fieldAfterLabel(model, "TheatreViewState(isPortrait=", "Z")
    val mode = fieldAfterLabel(model, ", playerMode=", null)
    val modeType = classDefBy(mode.type)
    require(modeType.superclass == "Ljava/lang/Enum;" &&
        modeType.fields.map { it.name }.containsAll(listOf("VIDEO_AND_CHAT", "MINIMIZED", "PICTURE_IN_PICTURE"))) {
        "UI settings: native theatre player modes changed."
    }
    val dispatch = all.filter { it.isInstance(listOf("Ltv/twitch/android/core/mvp/viewdelegate/ViewDelegateState;"), "V") &&
        AccessFlags.BRIDGE.isSet(it.accessFlags) && it.references().filterIsInstance<MethodReference>().any { call ->
            call.definingClass == it.definingClass && call.parameterTypes.map(CharSequence::toString) == listOf(model.definingClass)
        }
    }.uniqueHook("native theatre layout dispatcher")
    val target = dispatch.references().filterIsInstance<MethodReference>().single { it.definingClass == dispatch.definingClass }
    val root = classDefBy(BASE_VIEW).fields.filter { it.type == "Landroid/view/View;" && !AccessFlags.STATIC.isSet(it.accessFlags) }
        .uniqueHook("native theatre root view")
    require(AccessFlags.PUBLIC.isSet(root.accessFlags)) { "UI settings: native root is not public." }
    val owner = mutableClassDefBy(target.definingClass)
    val report = nativeReloadMethod(owner.type, "twitchPatchesNativeFullscreen", listOf(model.definingClass), "V", 5, """
        iget-object v0, p0, $root
        iget-boolean v1, p1, $portrait
        iget-object v2, p1, $mode
        invoke-static {v0, v1, v2}, $UI_SETTINGS->nativePlayerLayout(Landroid/view/View;ZLjava/lang/Enum;)V
        return-void
    """)
    owner.methods.add(report)
    owner.methods.single { it.reference == target.toString() }.insertBeforeWithLabels(0,
        "invoke-virtual/range {p0 .. p1}, ${report.reference}")
}

internal fun fieldAfterLabel(method: Method, label: String, type: String?): FieldReference {
    val code = method.code()
    val at = code.indices.filter { ((code[it] as? ReferenceInstruction)?.reference as? StringReference)?.string == label }
        .uniqueHook("model field label $label")
    val field = code.drop(at + 1).take(4).filter {
        it.opcode in setOf(Opcode.IGET, Opcode.IGET_OBJECT, Opcode.IGET_BOOLEAN)
    }
        .mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference }.firstOrNull()
    require(field != null && field.definingClass == method.definingClass && (type == null || field.type == type)) {
        "UI settings: model field after $label changed."
    }
    return field
}

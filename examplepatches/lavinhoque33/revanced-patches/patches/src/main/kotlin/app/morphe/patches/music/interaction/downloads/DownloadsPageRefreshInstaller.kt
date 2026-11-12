/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.util.Utils.printWarn
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PAGE_HOOKS = "Lapp/morphe/extension/music/patches/downloads/DownloadsPage;"
private const val PAGE_HOST = $$"Lapp/morphe/extension/music/patches/downloads/DownloadsPage$PageHost;"

/**
 * The controller of a Downloads page: the class that puts itself in a field of the page service when it is made, is
 * given the page fragment when the fragment starts (the one method that takes the fragment and stores it first), is
 * told when the fragment stops (the one method that ends with a call of a method of the service that takes
 * nothing), and whose fragment has the method a pull to refresh runs (no parameter, it calls its own method that
 * takes a boolean with true).
 */
private class PageController(
    val type: String,
    val hostField: FieldReference,
    val attach: Method,
    val stop: Method,
    val refreshOwner: String,
    val refreshName: String,
)

/**
 * Lets the extension refresh the Downloads page that is on screen, as a pull to refresh does, when the stream copies
 * changed: right away when the page is shown, or when the page starts again after another page was on top of it.
 * Found by shape in every version (9.40.51: the service `Lhtd`, its controller `Lgmn` with `c(Lgoa;)` and `d()`, the
 * fragment `Lgoa` whose base class has `v()`; 9.15.51 `Lnck`, `Ljnm` `f(Ljqt;)` `g()`, `Ljma.w()`; 8.30.54 `Lmpe`,
 * `Ljew` `f(Ljid;)` `g()`, `Ljde.o()`). Optional: where the shape is not found the page keeps the copies it was
 * given until it is opened again.
 *
 * @return the patch step to run, or null when the shape was not found.
 */
internal fun BytecodePatchContext.prepareDownloadsPageRefresh(serviceType: String): (() -> Unit)? {
    try {
        val controller = findPageController(serviceType)
        return {
            val host = mutableClassDefBy(controller.hostField.type)
            host.interfaces.add(PAGE_HOST)
            host.addDownloadsBridge("rvxRefreshPage", emptyList(), "V", 1, """
                invoke-virtual {p0}, ${controller.refreshOwner}->${controller.refreshName}()V
                return-void
            """)

            val type = mutableClassDefBy(controller.type)
            val attach = type.methods.single { it.name == controller.attach.name &&
                it.parameterTypes == controller.attach.parameterTypes }
            attach.addInstructions(0, """
                invoke-static {p0, p1}, $PAGE_HOOKS->onPageStarted(Ljava/lang/Object;Ljava/lang/Object;)V
            """)
            val stop = type.methods.single { it.name == controller.stop.name && it.parameterTypes.isEmpty() }
            stop.addInstructions(0, "invoke-static {p0}, $PAGE_HOOKS->onPageStopped(Ljava/lang/Object;)V")
        }
    } catch (ex: Exception) {
        printWarn("OfflineReplay: the Downloads page cannot be refreshed, it keeps its copies: ${ex.message}")
        return null
    }
}

private fun BytecodePatchContext.findPageController(serviceType: String): PageController {
    val found = mutableListOf<PageController>()
    classDefForEach { cls ->
        if (!storesItselfIn(cls, serviceType)) return@classDefForEach

        val (attach, hostField) = attachOf(cls) ?: return@classDefForEach
        val stop = stopOf(cls, serviceType) ?: return@classDefForEach
        val refresh = refreshOf(hostField.type) ?: return@classDefForEach
        found.add(PageController(cls.type, hostField, attach, stop, refresh.first, refresh.second))
    }
    check(found.size == 1) { "page refresh: found ${found.map { it.type }} controllers" }
    return found.single()
}

/** The method that tells the service the page stopped: no parameter, it ends with a no parameter call of it. */
private fun stopOf(cls: ClassDef, serviceType: String): Method? = cls.methods.singleOrNull { method ->
    val steps = method.implementation?.instructions?.toList().orEmpty()
    val call = steps.getOrNull(steps.size - 2)?.getReference<MethodReference>()
    method.returnType == "V" && method.parameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(method.accessFlags) &&
        steps.lastOrNull()?.opcode == Opcode.RETURN_VOID && call != null && call.definingClass == serviceType &&
        call.parameterTypes.isEmpty() && call.returnType == "V"
}

/** The register of `this` in a method that is not static. */
private fun Method.thisRegister() = implementation!!.registerCount - parameterTypes.size - 1

/** Whether the class stores itself in a field of the service (in any of its methods). */
private fun storesItselfIn(cls: ClassDef, serviceType: String): Boolean {
    for (method in cls.methods) {
        val steps = method.implementation?.instructions ?: continue
        if (AccessFlags.STATIC.isSet(method.accessFlags)) continue

        for (step in steps) {
            if (step.opcode != Opcode.IPUT_OBJECT || step !is TwoRegisterInstruction) continue

            val field = step.getReference<FieldReference>() ?: continue
            val isItself = field.type == cls.type || field.type == cls.superclass || field.type in cls.interfaces
            if (field.definingClass == serviceType && step.registerA == method.thisRegister() && isItself) return true
        }
    }
    return false
}

/** The method that takes the fragment and stores it first, with the field it stores it in, or null. */
private fun attachOf(cls: ClassDef): Pair<Method, FieldReference>? {
    val attaches = cls.methods.mapNotNull { method ->
        val first = method.implementation?.instructions?.firstOrNull() ?: return@mapNotNull null
        if (method.returnType != "V" || method.parameterTypes.size != 1) return@mapNotNull null
        if (AccessFlags.STATIC.isSet(method.accessFlags)) return@mapNotNull null
        if (first.opcode != Opcode.IPUT_OBJECT || first !is TwoRegisterInstruction) return@mapNotNull null

        val field = first.getReference<FieldReference>() ?: return@mapNotNull null
        val stores = first.registerA == method.thisRegister() + 1 && first.registerB == method.thisRegister()
        if (stores && field.definingClass == cls.type && field.type == method.parameterTypes[0].toString()) {
            method to field
        } else {
            null
        }
    }
    return attaches.singleOrNull()
}

/** The owner and name of the method a pull to refresh runs, in the fragment class or its bases. */
private fun BytecodePatchContext.refreshOf(hostType: String): Pair<String, String>? {
    val found = mutableListOf<Pair<String, String>>()
    var type: String? = hostType
    while (type != null) {
        val cls = classDefByOrNull(type) ?: break
        cls.methods.filter { it.isRefreshAction() }.forEach { found.add(cls.type to it.name) }
        type = cls.superclass
    }
    return found.singleOrNull()
}

/** `const/4 v, 0x1; invoke-virtual {this, v}, <own method that takes a boolean>; return-void`. */
private fun Method.isRefreshAction(): Boolean {
    if (returnType != "V" || parameterTypes.isNotEmpty() || AccessFlags.STATIC.isSet(accessFlags)) return false

    val steps = implementation?.instructions?.toList() ?: return false
    if (steps.size != 3 || steps[2].opcode != Opcode.RETURN_VOID) return false

    val constant = steps[0] as? NarrowLiteralInstruction
    val flag = steps[0] as? OneRegisterInstruction
    val call = steps[1] as? FiveRegisterInstruction
    if (steps[0].opcode != Opcode.CONST_4 || constant?.narrowLiteral != 1 || flag == null || call == null) return false

    val target = steps[1].getReference<MethodReference>() ?: return false
    return steps[1].opcode == Opcode.INVOKE_VIRTUAL && call.registerCount == 2 &&
        call.registerC == thisRegister() && call.registerD == flag.registerA &&
        target.parameterTypes.map(CharSequence::toString) == listOf("Z") && target.returnType == "V"
}

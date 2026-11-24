package fr.josselinonduty.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.Document
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import org.w3c.dom.Element
import org.w3c.dom.Node

// App-agnostic helpers shared by the patches of every app.

/** Prepends smali using v0; fails at patch time (not at launch) if v0 is not a free local. */
fun MutableMethod.prepend(smali: String) {
    val argRegisters = parameterTypes.sumOf { if (it.toString() in listOf("J", "D")) 2 else 1 as Int } +
        if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    check(implementation!!.registerCount > argRegisters) { "No free local register in $this" }
    addInstructions(0, smali)
}

fun MutableMethod.returnFalse() = prepend("const/4 v0, 0x0\nreturn v0")

fun MutableMethod.returnNull() = prepend("const/4 v0, 0x0\nreturn-object v0")

private fun Node.androidName() = attributes?.getNamedItem("android:name")?.nodeValue

fun Document.removeUsesPermissions(names: Set<String>) {
    val nodes = getElementsByTagName("uses-permission")
    for (i in nodes.length - 1 downTo 0) {
        nodes.item(i).takeIf { it.androidName() in names }?.let { it.parentNode.removeChild(it) }
    }
}

fun Document.disableComponents(names: Set<String>) {
    for (tag in listOf("service", "receiver")) {
        val nodes = getElementsByTagName(tag)
        for (i in 0 until nodes.length) {
            (nodes.item(i) as Element).takeIf { it.androidName() in names }?.setAttribute("android:enabled", "false")
        }
    }
}

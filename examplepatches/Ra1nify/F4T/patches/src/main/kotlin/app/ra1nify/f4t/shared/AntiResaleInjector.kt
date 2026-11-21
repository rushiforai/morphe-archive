package app.ra1nify.f4t.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

private const val APPLICATION = "Landroid/app/Application;"
private const val ENTRY_CLASS = "Lapp/ra1nify/f4t/extension/AntiResaleAlert;"
private const val ENTRY_METHOD = "onAppCreate"
private const val ENTRY_SIGNATURE = "(Landroid/app/Application;)V"

internal fun BytecodePatchContext.installAntiResaleAlert() {
    // Walk every class' superclass chain once, then keep the classes that reach Application.
    val superclasses = LinkedHashMap<String, String?>()
    classDefForEach { classDef -> superclasses[classDef.type] = classDef.superclass }

    fun reachesApplication(type: String): Boolean {
        var current: String? = type
        var hops = 0
        while (current != null && hops++ < 64) {
            if (current == APPLICATION) return true
            current = superclasses[current]
        }
        return false
    }

    val applicationClasses = superclasses.keys.filter(::reachesApplication)
    if (applicationClasses.isEmpty()) {
        throw PatchException(
            "no class extends $APPLICATION; cannot install the anti-resale notice"
        )
    }

    val leaves = applicationClasses.filter { leaf ->
        applicationClasses.none { other -> other != leaf && superclasses[other] == leaf }
    }

    val packagePath = packageMetadata.packageName.replace('.', '/')

    // The Application class does not have to live in the host package itself (a `.lite` build
    // usually declares it in the parent package), so either package being a prefix matches.
    fun hostPackageOf(type: String): String = type.removePrefix("L").substringBeforeLast('/')

    fun matchesHost(type: String): Boolean {
        val leafPackage = hostPackageOf(type)
        return leafPackage == packagePath ||
            packagePath.startsWith("$leafPackage/") ||
            leafPackage.startsWith("$packagePath/")
    }

    val hostLeaves = leaves.filter(::matchesHost)
    val chosenLeaf = when {
        hostLeaves.size == 1 -> hostLeaves.single()
        hostLeaves.size > 1 -> throw PatchException(
            "ambiguous Application class for $packagePath: $hostLeaves (all leaves: $leaves)"
        )
        leaves.size == 1 -> leaves.single()
        else -> throw PatchException(
            "cannot pick the Application class: no leaf matches $packagePath and leaves are " +
                leaves.joinToString { "$it (package ${hostPackageOf(it)})" }
        )
    }

    // The manifest class often inherits onCreate from a base class; inject into the declarer.
    var current: String? = chosenLeaf
    var targetClass: String? = null
    var targetMethod: MutableMethod? = null
    while (current != null && current != APPLICATION) {
        val classDef = mutableClassDefByOrNull(current)
        val onCreate = classDef?.methods
            ?.filterIsInstance<MutableMethod>()
            ?.firstOrNull {
                it.name == "onCreate" && it.parameterTypes.isEmpty() && it.returnType == "V"
            }
        if (onCreate != null) {
            targetClass = current
            targetMethod = onCreate
            break
        }
        current = superclasses[current]
    }

    if (targetMethod == null || targetClass == null) {
        throw PatchException(
            "no onCreate()V found in the Application chain of $chosenLeaf; cannot install the notice"
        )
    }

    targetMethod.addInstructions(
        0,
        "invoke-static {p0}, $ENTRY_CLASS->$ENTRY_METHOD$ENTRY_SIGNATURE",
    )
    println("[f4t] anti-resale notice installed into $targetClass->onCreate() (Application: $chosenLeaf)")
}

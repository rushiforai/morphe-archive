package app.ahmedyarub.patches.harness

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import java.io.File
import java.lang.reflect.Modifier
import java.util.jar.JarFile

/** The patches bundle the build just produced, loaded the way Morphe loads it. */
internal object Bundle {
    val file: File by lazy {
        File(System.getProperty("morphe.bundle") ?: error("morphe.bundle is not set")).also {
            require(it.isFile) { "The patches bundle does not exist: $it" }
        }
    }

    /**
     * The patches a user can see and select: the named ones. Taken from [declaredPatches] rather than
     * from [loadPatchesFromJar], whose separate class loader would give them a different identity
     * from the dependencies [declaredPatches] reaches.
     */
    val patches: Set<Patch<*>> by lazy { declaredPatches.values.filter { it.name != null }.toSet() }

    /** The names of the patches Morphe itself loads from the bundle. */
    val loadedPatchNames: Set<String> by lazy { loadPatchesFromJar(setOf(file)).mapNotNull { it.name }.toSet() }

    /**
     * Every patch declared in the bundle, named or not, found the same way the loader finds them:
     * public static fields and public static no-argument methods of a patch type.
     */
    val declaredPatches: Map<String, Patch<*>> by lazy {
        val loader = javaClass.classLoader
        JarFile(file).use { jar ->
            jar.entries().toList()
                .map { it.name }
                .filter { it.endsWith(".class") && !it.startsWith("META-INF/") }
                .map { it.removeSuffix(".class").replace('/', '.') }
        }.flatMap { className ->
            val type = runCatching { Class.forName(className, false, loader) }.getOrNull()
                ?: return@flatMap emptyList()
            val fields = type.fields
                .filter { Patch::class.java.isAssignableFrom(it.type) && Modifier.isStatic(it.modifiers) }
                .map { "${type.name}.${it.name}" to (it.get(null) as Patch<*>) }
            val methods = type.methods
                .filter {
                    Patch::class.java.isAssignableFrom(it.returnType) &&
                        it.parameterCount == 0 &&
                        Modifier.isStatic(it.modifiers)
                }
                .map { "${type.name}.${it.name}()" to (it.invoke(null) as Patch<*>) }
            fields + methods
        }.toMap()
    }

    /** The patches for [packageName], as a user would see them offered for that app. */
    fun patchesFor(packageName: String) =
        patches.filter { patch -> patch.compatibility?.any { it.packageName == packageName } == true }.toSet()
}

/** [this] patch and everything it depends on, directly or not. */
internal fun Patch<*>.withDependencies(): Set<Patch<*>> {
    val all = mutableSetOf<Patch<*>>()
    fun visit(patch: Patch<*>) {
        if (all.add(patch)) patch.dependencies.forEach(::visit)
    }
    visit(this)
    return all
}

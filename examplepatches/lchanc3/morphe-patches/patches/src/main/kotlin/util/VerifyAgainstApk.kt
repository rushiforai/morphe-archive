package util

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.loadPatchesFromJar
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import kotlinx.coroutines.runBlocking
import java.io.File
import java.security.MessageDigest
import kotlin.system.exitProcess

/**
 * Applies the built bundle to a JPTT APK the way Morphe Manager would, so a
 * patch whose fingerprint stopped matching fails here rather than on your phone.
 * Run it with `./gradlew verifyAgainstApk`.
 *
 * Nothing is signed or installed: this stops at the patched dex files, which are
 * left in the output directory to disassemble.
 *
 *     args[0] = APK to patch, empty when none was found
 *     args[1] = directory for the patched dex files
 */

/** `base.apk` of JPTT 3.8.4, the version these patches were written against. */
private const val KNOWN_APK_SHA256 =
    "7b65298d00d8219d49b8d4dfac739f2bf63b6187a00f7697e3c67861fcf2d605"

private val MISSING_APK = """
    No APK to verify against. Pass one with -Papk=<path>, point ${'$'}JPTT_APK at one,
    or leave one in the project root. It is deliberately not in the repository.

    On a phone that still has JPTT 3.8.4 installed, its base.apk is byte for byte
    the APK these patches were written against:

        adb pull "${'$'}(adb shell pm path com.joshua.jptt | grep base.apk | sed 's/package://' | tr -d '\r')" JPTT_3.8.4.apk
""".trimIndent()

fun main(args: Array<String>) {
    val apk = args[0].takeIf { it.isNotEmpty() }?.let(::File)
    if (apk == null || !apk.isFile) {
        println(MISSING_APK)
        exitProcess(1)
    }

    // Several builds can leave several bundles behind, and verifying a stale one
    // silently proves nothing, so take the newest and say which it was.
    val bundles = File("build/libs/")
        .listFiles { file ->
            file.name.endsWith(".mpp") &&
                !file.name.contains("javadoc") &&
                !file.name.contains("sources")
        }
        ?.sortedByDescending { it.lastModified() }
        .orEmpty()
    val bundle = bundles.firstOrNull()
        ?: error("No bundle in patches/build/libs. Run `./gradlew buildAndroid` first.")

    val outputDirectory = File(args[1]).apply { mkdirs() }
    val temporaryFiles = File(outputDirectory, "tmp").apply { mkdirs() }

    println("bundle: ${bundle.name}")
    if (bundles.size > 1) {
        println("        (newest of ${bundles.size}: ${bundles.drop(1).joinToString { it.name }} ignored)")
    }
    println("apk:    ${apk.absolutePath}")

    val digest = apk.sha256()
    if (digest != KNOWN_APK_SHA256) {
        println("note:   not the 3.8.4 APK these patches were written against ($digest)")
    }

    var failed = 0

    Patcher(PatcherConfig(apkFile = apk, temporaryFilesPath = temporaryFiles)).use { patcher ->
        patcher += loadPatchesFromJar(setOf(bundle)).toSet()

        runBlocking {
            patcher().collect { result ->
                val name = result.patch.name ?: result.patch.toString()
                val exception = result.exception
                if (exception == null) {
                    println("  ok      $name")
                } else {
                    failed++
                    println("  FAILED  $name: $exception")
                    exception.printStackTrace()
                }
            }
        }

        // Compiling the dex is part of the check: it is where the smali the
        // patches assembled has to survive being written back out.
        patcher.get().dexFiles.forEach { dexFile ->
            File(outputDirectory, dexFile.name).outputStream().use { dexFile.stream.copyTo(it) }
        }
    }

    if (failed != 0) {
        println("$failed patch(es) failed")
        exitProcess(1)
    }

    val unresolved = unresolvedExtensionCalls(outputDirectory)
    if (unresolved.isNotEmpty()) {
        println()
        println("${unresolved.size} call(s) to a method the patched app does not have:")
        unresolved.forEach { println("  $it") }
        println()
        println(
            """
            These compile and patch cleanly and fail when the code first runs. The
            usual cause is an extension compiled against a whole library while the
            app carries only what R8 left of it.
            """.trimIndent(),
        )
        exitProcess(1)
    }

    println("all patches applied, dex written to $outputDirectory")
}

/** Types whose methods are the platform's to define, not the APK's. */
private val PLATFORM_PREFIXES = listOf(
    "Ljava/", "Ljavax/", "Landroid/", "Ldalvik/", "Llibcore/",
    "Lorg/w3c/", "Lorg/xml/", "Lorg/json/", "Lorg/apache/http/", "Lsun/",
)

private const val EXTENSION_PREFIX = "Lapp/lchanc3/"

private const val OBJECT = "Ljava/lang/Object;"

private val OBJECT_METHODS = setOf(
    "<init>", "equals", "getClass", "hashCode", "toString",
    "clone", "finalize", "notify", "notifyAll", "wait",
)

/**
 * Every call the extension makes into the app, and every call the patches point
 * at the extension, checked against what the patched dex actually defines.
 *
 * The patcher only reports whether a patch applied, so a call to a method that is
 * not there -- an extension built against a full library that the app ships a
 * shrunk copy of, or a typo in injected smali -- gets through it and fails at
 * runtime instead.
 */
private fun unresolvedExtensionCalls(outputDirectory: File): List<String> {
    val opcodes = Opcodes.getDefault()
    val classes = outputDirectory.listFiles { file -> file.extension == "dex" }
        .orEmpty()
        .flatMap { DexFileFactory.loadDexFile(it, opcodes).classes }
        .associateBy { it.type }

    val unresolved = sortedSetOf<String>()

    classes.values.forEach { classDef ->
        val fromExtension = classDef.type.startsWith(EXTENSION_PREFIX)
        classDef.methods.forEach { method ->
            method.implementation?.instructions?.forEach { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@forEach
                val toExtension = reference.definingClass.startsWith(EXTENSION_PREFIX)
                if (!fromExtension && !toExtension) return@forEach
                if (PLATFORM_PREFIXES.any { reference.definingClass.startsWith(it) }) return@forEach

                if (!classes.defines(reference)) {
                    unresolved += "${classDef.type}->${method.name}() calls " +
                        "${reference.definingClass}->${reference.name}" +
                        "(${reference.parameterTypes.joinToString("")})${reference.returnType}"
                }
            }
        }
    }

    return unresolved.toList()
}

/**
 * Whether [reference] resolves, following the class it names up through its
 * superclasses. Interfaces are deliberately not followed: a call to an interface
 * method names that interface directly, while walking into the ones a class
 * happens to implement only finds platform types like Comparable, which are
 * opaque and would wave everything through.
 */
private fun Map<String, ClassDef>.defines(reference: MethodReference): Boolean {
    var type: String? = reference.definingClass

    while (type != null) {
        // Every chain ends at Object, so treating it as opaque would answer yes
        // to everything. It defines a known, short list and nothing else. This is
        // checked before the platform prefixes, which Object also matches.
        if (type == OBJECT) return reference.name in OBJECT_METHODS

        // Anything else the platform provides cannot be looked inside, so a method
        // found nowhere below it is taken to be its.
        if (PLATFORM_PREFIXES.any { type!!.startsWith(it) }) return true

        // A class the APK ships should be in the dex. One that is not is exactly
        // the symptom being looked for.
        val classDef = this[type] ?: return false

        if (classDef.methods.any {
                it.name == reference.name &&
                    it.returnType == reference.returnType &&
                    it.parameterTypes.map(CharSequence::toString) ==
                    reference.parameterTypes.map(CharSequence::toString)
            }
        ) {
            return true
        }

        type = classDef.superclass
    }

    return false
}

private fun File.sha256(): String =
    MessageDigest.getInstance("SHA-256")
        .digest(readBytes())
        .joinToString("") { "%02x".format(it) }

package app.ahmedyarub.patches.harness

import app.ahmedyarub.patches.shared.stringPoolsPatch
import app.crimera.patches.instagram.entity.decoder.decoderEntity
import app.morphe.library.instagram.patches.instagramExtensionPatch
import app.morphe.patches.all.misc.resources.resourceMappingPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.bytecodePatch
import kotlinx.coroutines.runBlocking
import java.io.File
import java.lang.reflect.Modifier
import java.util.jar.JarFile
import java.util.logging.Level
import java.util.logging.Logger
import kotlin.system.exitProcess

/**
 * Resolves every fingerprint this bundle declares against an unpatched app and records how many
 * methods each one matches.
 *
 * A fingerprint that matches more than one method is resolved to whichever the patcher meets
 * first, which is an accident of class order: it can hand a patch the serializer instead of the
 * parser, and the patch applies, reports success, and changes nothing a user sees. One that
 * matches nothing only fails when a patch reaches it.
 *
 * Runs in its own JVM (see [ApkPatching]). Arguments: the APK and the result file, which gets one
 * line per fingerprint: `<id>\t<match count>\t<matched methods>` or `<id>\tERROR\t<message>`.
 */
internal object FingerprintAudit {
    /**
     * Where this bundle keeps each app's fingerprints. The libraries' fingerprints are theirs to
     * audit, and one app's fingerprints mean nothing against another app.
     */
    private val FINGERPRINT_PACKAGES =
        mapOf(
            "com.instagram.android" to listOf("app/ahmedyarub/patches/instagram/", "app/crimera/patches/instagram/"),
            "com.reddit.frontpage" to listOf("app/ahmedyarub/patches/reddit/"),
        )

    @JvmStatic
    fun main(args: Array<String>) {
        val (apk, resultFile) = args
        Logger.getLogger("").apply { level = Level.WARNING; handlers.forEach { it.level = Level.WARNING } }

        val lines = mutableListOf<String>()
        Patcher(PatcherConfig(File(apk), temporaryFilesPath = ApkPatching.workDirectory("audit"))).use { patcher ->
            val packageName = patcher.context.packageMetadata.packageName

            val audit = bytecodePatch(description = "Fingerprint audit") {
                // Fingerprints on extension classes resolve only once the extension is merged,
                // resource literals need the resource ids, and some fingerprints compare against
                // classes the decoder resolves. None of these change the app's own code.
                if (packageName == "com.instagram.android") dependsOn(instagramExtensionPatch, resourceMappingPatch, decoderEntity, stringPoolsPatch)

                execute {
                    declaredFingerprints(FINGERPRINT_PACKAGES[packageName].orEmpty()).forEach { (id, declared) ->
                        lines +=
                            runCatching {
                                val matches = declared.getOrThrow().matchAllOrNull().orEmpty()
                                val methods = matches.map { "${it.originalClassDef.type}->${it.originalMethod.name}" }
                                "$id\t${matches.size}\t${methods.joinToString(" ")}"
                            }.getOrElse { "$id\tERROR\t${it.toString().replace('\n', ' ')}" }
                    }
                }
            }

            patcher += setOf(audit)
            runBlocking {
                patcher().collect { result ->
                    result.exception?.let { lines += "PATCH\tERROR\t${it.toString().replace('\n', ' ')}" }
                }
            }
        }

        File(resultFile).writeText(lines.joinToString("\n"))
        exitProcess(0)
    }

    /** Fingerprints held by Kotlin objects and by top-level properties, keyed by where they are declared. */
    private fun declaredFingerprints(packages: List<String>): List<Pair<String, Result<Fingerprint>>> {
        val loader = javaClass.classLoader
        val classNames =
            JarFile(Bundle.file).use { jar ->
                jar.entries().toList()
                    .map { it.name }
                    .filter { name -> name.endsWith(".class") && packages.any(name::startsWith) }
                    .map { it.removeSuffix(".class").replace('/', '.') }
            }

        return classNames.flatMap { className ->
            val type = runCatching { Class.forName(className, false, loader) }.getOrNull() ?: return@flatMap emptyList()
            type.declaredFields
                .filter { Modifier.isStatic(it.modifiers) && Fingerprint::class.java.isAssignableFrom(it.type) }
                .map { field ->
                    field.isAccessible = true
                    // A fingerprint whose initialiser throws is reported, not skipped.
                    val fingerprint = runCatching { field.get(null) as Fingerprint }
                    val id = if (field.name == "INSTANCE") type.name else "${type.name}.${field.name}"
                    id to fingerprint
                }
        }.distinctBy { (id, fingerprint) -> fingerprint.getOrNull() ?: id }
    }
}

package validation

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.apk.ApkUtils.applyTo
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import kotlinx.coroutines.runBlocking
import java.io.File
import java.nio.file.Files
import kotlin.system.exitProcess

/**
 * Official patches that put `PlayerControlsVisibilityHookPatch` into the same entity-model
 * constructor. Located by scanning the official bundle for the class that carries the hook's smali
 * string (`PlayerControlsOverlayVisibilityPatchKt`), then resolved through the patcher's own declared
 * dependencies: `Hide player overlay buttons` owns it and `GmsCore support` is the only patch that
 * pulls it into the default set. Leaving both out is the closest constructible approximation of a
 * composition without the official hook; the delivered bundle still reaches it through a shared
 * internal dependency, which the audit reports instead of hiding.
 */
private val OFFICIAL_HOOK_PATCHES = setOf(
    "Hide player overlay buttons",
    "GmsCore support",
)

/**
 * N27r production-injection regression for the AI controls-avoidance observer.
 *
 * <p>Runs the real patcher on the real YouTube input with the same MPPs the delivery uses, serialises
 * the result, and only then re-reads the written APK with [FinalDexBranchAudit]. The N27 failure could
 * not be reproduced by any in-memory replay, so nothing here inspects a builder instruction list: the
 * check runs on bytes that were already written to disk.</p>
 *
 * <p>Four constructions are covered:</p>
 * <ul>
 *   <li>`official-first`: the official default set (including the patch that installs the official
 *       player-controls hook) is applied before the AI root — the delivered ordering.</li>
 *   <li>`ai-first`: the AI root is applied before the official set, so the widths in front of the
 *       injected block differ.</li>
 *   <li>`no-official-hook`: the official defaults without the two patches that give the official
 *       player-controls hook its only named route into the set, so the AI observer is exercised with a
 *       different official prefix. (The hook is still reachable through the official bundle's shared
 *       internal dependency; the audit reports the real `official_hook_count` rather than assuming.)</li>
 *   <li>`no-ai`: no AI root at all, which must leave the host constructor without our callback.</li>
 *   <li>`minimal-official`: construction probe with the narrowest official set the AI root can accept;
 *       kept so the documented boundary is reproducible.</li>
 *   <li>`list`: diagnostic only — prints the official patch set with the patcher's own dependency
 *       lists and writes no APK.</li>
 * </ul>
 */
fun main(args: Array<String>) {
    val values = args.toList().chunked(2).associate { it[0].removePrefix("--") to it[1] }
    fun file(key: String) = File(values.getValue(key)).canonicalFile
    fun load(key: String) = loadPatchesFromJar(setOf(file(key))).byPatchesFile.getValue(file(key))
    val official = load("official")
    val addon = load("addon")
    val order = values.getValue("order")
    val aiRoot = addon.single { it.name == "AI caption translator" }
    val nativeRoot = addon.singleOrNull { it.name == "Remember caption selection" }
        ?: throw IllegalStateException("Native-only addon is missing from the addon bundle")
    val output = file("output")
    check(!output.exists()) { "Use a new output directory: ${output.absolutePath}" }
    output.mkdirs()
    val scratch = Files.createTempDirectory(output.toPath(), "session-").toFile()
    val requireAi = order != "no-ai"
    println("INJECTION_ORDER_RUN order=$order output=${output.absolutePath} require_ai=$requireAi")
    var diagnostic = false

    Patcher(
        PatcherConfig(
            apkFile = file("input"),
            temporaryFilesPath = scratch.resolve("patcher"),
            fileWorkspacePath = scratch.resolve("workspace"),
        )
    ).use { patcher ->
        val compatibleOfficials = official.filter { patch ->
            patch.default && (patch.compatibility?.any { pkg ->
                pkg.packageName == null ||
                    pkg.packageName == patcher.context.packageMetadata.packageName &&
                    pkg.targets.any { target ->
                        !target.isExperimental &&
                            (target.version == null || target.version == patcher.context.packageMetadata.versionName)
                    }
            } ?: true)
        }
        if (compatibleOfficials.none { it.name == "Captions" }) {
            throw IllegalStateException("Official Captions patch is unavailable in this bundle")
        }
        val selected: List<Patch<*>> = when (order) {
            "official-first" -> compatibleOfficials + aiRoot
            "ai-first" -> listOf(aiRoot) + compatibleOfficials
            "no-official-hook" -> compatibleOfficials.filterNot { it.name in OFFICIAL_HOOK_PATCHES } + aiRoot
            // The narrowest official set that still gives the AI root the YouTube extension it needs
            // in its finalize step. Used to check whether the official hook is reachable at all.
            "minimal-official" -> compatibleOfficials.filter { it.name == "Hide player flyout menu components" } + aiRoot
            "no-ai" -> compatibleOfficials + nativeRoot
            "list" -> {
                // Diagnostic only: print the official set and each patch's declared dependencies so a
                // composition that genuinely lacks the official hook can be selected by name.
                println("OFFICIAL_COMPATIBLE ${compatibleOfficials.size}")
                for (patch in compatibleOfficials.sortedBy { it.name }) {
                    val dependencies = patch.dependencies.map { it.name ?: "<internal>" }.sorted()
                    println("OFFICIAL_PATCH name=${patch.name} dependencies=$dependencies")
                }
                for (patch in addon.sortedBy { it.name }) {
                    val dependencies = patch.dependencies.map { it.name ?: "<internal>" }.sorted()
                    println("ADDON_PATCH name=${patch.name} dependencies=$dependencies")
                }
                diagnostic = true
                emptyList()
            }
            else -> throw IllegalArgumentException("Unknown order: $order")
        }
        patcher += selected.toCollection(linkedSetOf())
        if (diagnostic) {
            println("INJECTION_ORDER_LIST_DONE")
            return@use
        }
        runBlocking {
            patcher().collect { result ->
                if (result.exception != null) {
                    throw IllegalStateException("Patch failed: ${result.patch.name}", result.exception)
                }
            }
        }
        println("INJECTION_ORDER_PATCHED order=$order patches=${selected.size}")
        val result = patcher.get()
        val apk = output.resolve("patched-unsigned.apk")
        Files.copy(file("input").toPath(), apk.toPath())
        result.applyTo(apk)
        println("INJECTION_ORDER_APK order=$order path=${apk.absolutePath} bytes=${apk.length()}")
    }

    val apk = output.resolve("patched-unsigned.apk")
    if (diagnostic || !apk.isFile) {
        println("INJECTION_ORDER_LIST_ONLY order=$order")
        return
    }
    val report = values["report"]?.let { File(it).canonicalFile }
    val ok = FinalDexBranchAudit.audit(
        input = apk,
        requireAi = requireAi,
        report = report,
        label = values["label"] ?: "injection-$order",
    )
    if (!ok) {
        println("INJECTION_ORDER_FAIL order=$order")
        exitProcess(1)
    }
    println("INJECTION_ORDER_PASS order=$order")
}

package app.template.patches.opera.startup

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.string
import app.template.patches.opera.OPERA_BETA_COMPATIBILITY
import app.template.patches.opera.OPERA_COMPATIBILITY
import app.template.patches.opera.OPERA_DIRECT_COMPATIBILITY
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Opera's browser engine ships INSIDE the (Play) base APK: an 84 MB
 * 32-bit `lib/armeabi-v7a/libopera.so` (plus a decoy 32-bit ELF in
 * `lib/arm64-v8a/` that forces every install onto the 32-bit ABI), so a
 * patched build loads it from its own APK exactly like a store build - the
 * patcher keeps the entry byte-identical, uncompressed and page-aligned.
 * Engine load/start is still coordinated by the MainLibraryBoot state machine
 * (class `Le7d;` in Opera Beta 104 / `Ly0d;` in Opera stable 103, found by its
 * stable `"MainLibraryBoot: "` log tag), and the welcome screen waits for
 * that boot to finish. If the boot fails for any reason (a library that
 * cannot load on the device, a Chromium start error, an x86 device hitting
 * the ARM-only build), the coordinator announces a failure reason
 * (LIB_LOAD / CHROMIUM_START / EMULATED_ARM) to every waiting component,
 * and the welcome flow's Compose observer responds by calling the
 * "broken installation" dialog builder - which the *Hide broken installation
 * dialog* patch turns into a no-op. The result of a boot failure on a patched
 * build used to be an eternal welcome splash (and a black screen on relaunch),
 * because nothing else in the failure path advances the UI.
 *
 * This patch rewrites the coordinator's failure announcements into success
 * notifications: every `invoke-interface {client, reason}, <callback>-><name>
 * (I)V` call inside the MainLibraryBoot coordinator (the flush loop of
 * `b(I, Throwable)` and the late-subscriber announcement in `a`) is replaced
 * with `invoke-interface {client}, <callback>->onSuccess()V`. All waiting
 * components therefore treat a failed boot as a completed one and startup
 * continues normally. The announcements are located structurally - the
 * coordinator is found via its stable `"MainLibraryBoot: "` log tag and the
 * callback interface via the announcement call's defining class, both of
 * which survive Opera's per-release obfuscation (class and method names
 * differ between stable 103 and beta 104, e.g. `Le7d;->c(I)V` vs
 * `Ly0d;->e(I)V`, which is why nothing here is matched by name).
 *
 * With *Spoof app signature* applied, the in-app signature reads that could
 * make Opera's own startup code take a failure path answer with the vendor
 * certificate; this patch is the safety net that keeps the UI reachable even
 * if the boot still fails (for example after an unrelated one-time crash or
 * on x86 hardware without ARM translation).
 */
private object MainLibraryBootFailureAnnouncerFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("I", "Ljava/lang/Throwable;"),
    filters = listOf(
        string("MainLibraryBoot: "),
    ),
)

private fun isAppInterfaceCall(reference: MethodReference): Boolean {
    if (reference.returnType != "V") return false
    if (reference.parameterTypes.size != 1 || reference.parameterTypes[0] != "I") return false
    if (reference.name == "onSuccess") return false
    val defining = reference.definingClass
    // the announce interface is an obfuscated app interface: Lxxx; at the
    // dex root, not a framework / library type
    if (!defining.matches(Regex("^L[a-z0-9]{1,4};$"))) return false
    return true
}

@Suppress("unused")
val operaIgnoreBootFailuresPatch = bytecodePatch(
    name = "Ignore browser boot failures",
    description = "Stops a failed engine boot (MainLibraryBoot) from " +
        "deadlocking the welcome screen. The Chromium engine ships inside the " +
        "APK; if its load or start still fails (device without ARM support, a " +
        "start error), Opera announces the failure to the welcome flow, which " +
        "used to call the now-hidden \"broken installation\" dialog and then wait " +
        "forever. The announcements are converted into success notifications " +
        "so startup always continues. Pair with \"Spoof app signature\", which " +
        "keeps Opera's in-app signature reads on their vendor-build behavior.",
    default = true,
) {
    compatibleWith(OPERA_COMPATIBILITY, OPERA_DIRECT_COMPATIBILITY, OPERA_BETA_COMPATIBILITY)

    execute {
        val coordinator = MainLibraryBootFailureAnnouncerFingerprint.originalClassDef
        val mutableClass = mutableClassDefBy(coordinator)

        // The subscriber-registration method has the shape
        // (Landroid/content/Context; <callback interface>)V - its second
        // parameter type is the announce callback interface.
        val callbackInterface = coordinator.methods
            .firstOrNull { method ->
                method.parameterTypes.size == 2 &&
                    method.parameterTypes[0] == "Landroid/content/Context;" &&
                    (method.parameterTypes[1] as String).matches(Regex("^L[a-z0-9]{1,4};$"))
            }
            ?.parameterTypes?.get(1) as? String
            ?: throw PatchException("Subscriber registration method not found in the MainLibraryBoot coordinator")

        var rewritten = 0
        val seenCallSites = mutableListOf<String>()

        for (mutableMethod in mutableClass.methods) {
            val implementation = mutableMethod.implementation ?: continue
            val instructions = implementation.instructions.toList()
            instructions.forEachIndexed { index, ins ->
                if (ins !is ReferenceInstruction) return@forEachIndexed
                val reference = ins.reference as? MethodReference ?: return@forEachIndexed
                if (reference.definingClass != callbackInterface) return@forEachIndexed
                if (!isAppInterfaceCall(reference)) return@forEachIndexed

                // invoke-interface {receiver, reason}, <iface>-><name>(I)V
                //   -> invoke-interface {receiver}, <iface>->onSuccess()V
                val format = ins as? Instruction35c
                    ?: throw PatchException(
                        "Unexpected announce call format at ${mutableMethod.name}#$index",
                    )
                val receiver = format.registerC
                mutableMethod.replaceInstruction(
                    index,
                    "invoke-interface {v$receiver}, $callbackInterface->onSuccess()V",
                )
                rewritten++
                seenCallSites += mutableMethod.name
            }
        }

        if (rewritten != 2) {
            throw PatchException(
                "Expected exactly 2 boot failure announce calls (failure flush loop + " +
                    "late subscriber) in the MainLibraryBoot coordinator, found $rewritten: $seenCallSites",
            )
        }

        println(
            "Opera boot failures: rewrote $rewritten failure announce call(s) on " +
                "$callbackInterface to success notifications ($seenCallSites)",
        )
    }
}

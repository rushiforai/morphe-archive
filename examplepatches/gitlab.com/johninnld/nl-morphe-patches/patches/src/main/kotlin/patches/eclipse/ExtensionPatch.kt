package patches.eclipse

import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import java.util.logging.Logger

private val log = Logger.getLogger("patches.eclipse")

/** The dex of the extension, isolated and relocated once; both Android Auto patches merge this same copy. */
internal val eclipseExtensionBundle by lazy { eclipseExtension() }

/**
 * The part both Android Auto patches share: it merges the extension, proves every reference the
 * extension makes to the app against the app's own dex, and hooks the queue mutators so the
 * extension hears about queue changes. A user may select either patch or both; Morphe applies this
 * once. It has no name, so it is never offered on its own.
 *
 * When only the browse upgrade is selected, the extension's car screens still ship (the class files
 * are one unit), but nothing in the manifest points at them: they stay dormant, and the only code
 * that runs is the browse tree and the queue signal. Resources and the manifest belong to the
 * templated patch alone.
 */
internal val eclipseAutoExtension = bytecodePatch {
    // The extension itself adds Car App Library classes, so the guard has to run before it is merged.
    val guard = bytecodePatch {
        dependsOn(eclipseBase)
        execute {
            check(classDefByOrNull { it.type.startsWith("Landroidx/car/app/") || it.type.startsWith(EXTENSION_NAMESPACE) } == null) {
                "Eclipse Music already contains a Car App Library; refuse to replace existing classes"
            }
        }
    }
    dependsOn(eclipseBase, guard)
    extendWith(java.util.function.Supplier { eclipseExtensionBundle.bytes.inputStream() })
    execute {
        // Every reference the extension makes to the app is resolved against the app's own dex.
        val ours = eclipseExtensionBundle.types.toSet()
        val report = linkCheck(
            DexBackedDexFile.fromInputStream(null, eclipseExtensionBundle.bytes.inputStream()).classes,
            { type -> if (type in ours) null else classDefByOrNull(type) },
            shapes = STUB_SHAPES,
        )
        check(report.misses.isEmpty()) { linkFailure("Eclipse Music", report) }
        log.info("Eclipse Music extension link check: ${report.referencesChecked} app references resolved, " +
            "0 misses, ${report.unverified.size} inherited from the platform, ${STUB_SHAPES.size} stub shapes confirmed")
        report.unverified.forEach { log.info("Eclipse Music link check could not verify (platform-inherited): $it") }
        // The queue mutators call the extension's Signals, so it must be there before they are hooked.
        check("Lnl/johninnl/eclipse/auto/app/Signals;" in ours) { "The extension has no Signals class" }
        val hooked = injectQueueSignals()
        log.info("Eclipse Music queue signals: ${hooked.size} of ${QUEUE_HOOKS.size} mutators hooked, " +
            "each matched exactly once")
        hooked.forEach { log.info("Eclipse Music queue signal hooked $it") }
    }
}

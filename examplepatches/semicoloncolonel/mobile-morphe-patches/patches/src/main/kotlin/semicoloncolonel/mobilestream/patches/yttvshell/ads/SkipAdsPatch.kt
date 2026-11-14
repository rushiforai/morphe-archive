package semicoloncolonel.mobilestream.patches.yttvshell.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import semicoloncolonel.mobilestream.patches.yttvshell.misc.brandingPatch
import semicoloncolonel.mobilestream.patches.yttvshell.misc.changeStartUrlPatch
import semicoloncolonel.mobilestream.patches.yttvshell.misc.renamePatch
import semicoloncolonel.mobilestream.patches.yttvshell.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Skip ads (and block tracking) — YouTube TV on Android TV, via the Chromium-Cobalt shell.
//
// The YouTube TV web app (youtube.com/tv/upg, reached through the changeStartUrl dependency) runs
// in Cobalt, a Chromium engine that exposes WebContents.evaluateJavaScript. This hooks Cobalt's
// StartupGuardNavigationObserver (the main page's navigation observer, whose class keeps its real
// name) to keep observing after the first navigation and to run the extension's script bundle
// (yttvshell/TvScripts → src/main/js: ads.js, tracking.js) on every page load. The scripts strip
// YouTube's server-inserted ads from the InnerTube responses and drop ad and analytics beacons.
//
// The injection design is ported from jair1c/farotv-patches (GPLv3), after ysamjo/morphe-patches
// (GPLv3) and DylanDuff/utv-runtime (MIT). See the NOTICE file. Commercials inside a live
// broadcast are part of the broadcast and still play.
// ─────────────────────────────────────────────────────────────────────────────

private const val EXTENSION_CLASS = "Lsemicoloncolonel/mobilestream/extension/yttvshell/TvScripts;"
private const val OBSERVER_CLASS = "Ldev/cobalt/shell/StartupGuardNavigationObserver;"
private const val WEB_CONTENTS = "Lcobalt/org/chromium/content_public/browser/WebContents;"
private const val NAVIGATION_HANDLE = "Lcobalt/org/chromium/content_public/browser/NavigationHandle;"

internal object StartupGuardObserverConstructorFingerprint : Fingerprint(
    definingClass = OBSERVER_CLASS,
    name = "<init>",
    parameters = listOf(WEB_CONTENTS),
)

internal object StartupGuardFinishNavigationFingerprint : Fingerprint(
    definingClass = OBSERVER_CLASS,
    name = "didFinishNavigationInPrimaryMainFrame",
    returnType = "V",
    parameters = listOf(NAVIGATION_HANDLE),
)

internal object StartupGuardRedirectNavigationFingerprint : Fingerprint(
    definingClass = OBSERVER_CLASS,
    name = "didRedirectNavigation",
    returnType = "V",
    parameters = listOf(NAVIGATION_HANDLE),
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip injected ads",
    description = "Turns YouTube for Android TV into the standalone ad-free YouTube TV app " +
        "\"YT TV+\" (see this app's description), and removes the ads YouTube injects into " +
        "YouTube TV on-demand videos and DVR recordings, plus ad and analytics tracking. It does " +
        "not patch regular YouTube. Live broadcast commercials are part of the broadcast and " +
        "still play. Sign in with an activation code at tv.youtube.com/start.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(changeStartUrlPatch, renamePatch, brandingPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // Remember the page's WebContents.
        StartupGuardObserverConstructorFingerprint.method.addInstruction(
            0,
            "invoke-static { p1 }, $EXTENSION_CLASS->setWebContents(Ljava/lang/Object;)V",
        )

        // Keep observing after the first navigation (drop the "observe(null)" calls).
        listOf(StartupGuardFinishNavigationFingerprint, StartupGuardRedirectNavigationFingerprint).forEach {
            it.method.apply {
                val indices = instructions.withIndex().filter { (_, instruction) ->
                    instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                        ((instruction as ReferenceInstruction).reference as MethodReference).let { ref ->
                            ref.name == "observe" && ref.parameterTypes.singleOrNull()?.toString() == WEB_CONTENTS
                        }
                }.map { it.index }
                if (indices.isEmpty()) throw IllegalStateException("observe(null) not found in $name")
                indices.reversed().forEach { index -> removeInstruction(index) }
            }
        }

        StartupGuardFinishNavigationFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "didFinishNavigation"
                invoke-static { v0 }, $EXTENSION_CLASS->onPageEvent(Ljava/lang/String;)V
            """,
        )

        // New overrides on the observer: inject earlier (document element available) and relay the
        // scripts' title-based log messages.
        val observer = StartupGuardFinishNavigationFingerprint.classDef
        fun addOverride(name: String, parameters: List<String>, body: String) {
            observer.methods.add(
                ImmutableMethod(
                    observer.type,
                    name,
                    parameters.map { ImmutableMethodParameter(it, null, null) },
                    "V",
                    AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                    null,
                    null,
                    MutableMethodImplementation(1 + 1 + parameters.size),
                ).toMutable().apply { addInstructions(0, body) },
            )
        }

        addOverride(
            "primaryMainDocumentElementAvailable",
            emptyList(),
            """
                const-string v0, "documentElementAvailable"
                invoke-static { v0 }, $EXTENSION_CLASS->onPageEvent(Ljava/lang/String;)V
                return-void
            """,
        )
        addOverride(
            "titleWasSet",
            listOf("Ljava/lang/String;"),
            """
                invoke-static { p1 }, $EXTENSION_CLASS->onTitle(Ljava/lang/String;)V
                return-void
            """,
        )
    }
}

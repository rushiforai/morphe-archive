package app.tvpatches.patches.youtubetv.misc.scripts

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.tvpatches.patches.youtubetv.misc.gms.youtubeTvExtensionPatch
import app.tvpatches.patches.youtubetv.shared.Constants.COMPATIBILITY_YOUTUBE_TV
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val EXTENSION_CLASS = "Lapp/tvpatches/extension/youtubetv/TvScripts;"
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

/**
 * Runs the YouTV scripts (extensions/extension/src/main/js) in the youtube.com/tv web app and adds
 * a "YouTV" section to YouTube's own Settings screen with a switch for each feature.
 *
 * Cobalt's StartupGuardNavigationObserver is the only navigation observer on the main page and its
 * class keeps its real name. Normally it stops observing after the first navigation; this patch
 * keeps it attached and makes it run the scripts on every page load. The script bundle itself is
 * injected through the native WebContentsImpl.evaluateJavaScript (see TvScripts.java).
 */
@Suppress("unused")
val youTvScriptsPatch = bytecodePatch(
    name = "FaroTV settings and scripts",
    description = "Adds a \"FaroTV\" section to YouTube's Settings with switches to hide Shorts, " +
        "hide the topic tabs and block video ads.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_TV)
    dependsOn(youtubeTvExtensionPatch)

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

        // New overrides on the observer.
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

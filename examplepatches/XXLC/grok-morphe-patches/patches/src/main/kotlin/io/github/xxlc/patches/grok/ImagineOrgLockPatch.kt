package io.github.xxlc.patches.grok

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private object ImagineOrgLockFingerprint : Fingerprint(
    definingClass = GrokNames.IMAGINE_ORG_LOCK,
    name = GrokNames.IMAGINE_ORG_LOCK_METHOD,
    isStatic = false,
    returnType = "Z",
    parameters = emptyList(),
)

@Suppress("unused")
val ignoreImagineOrgLockPatch = bytecodePatch(
    name = "Ignore Team/Org Imagine lock",
    description = "Make the app treat Imagine as allowed even when a Team/Org setting disables it, so the Imagine tab and entry points stay available. Only the app UI is changed: the server may still refuse Imagine requests, and the setting overridden is one an organization admin chose. Use only on accounts you control. Off by default; not tested on a device.",
    default = false,
) {
    compatibleWith(grokCompatibility)
    val enabled by enabledOption(default = true)

    execute {
        if (enabled != true) return@execute
        ImagineOrgLockFingerprint.method.apply {
            // .locals 4, p0 = v4; true means Imagine is locked (team disabled enableImagine or admin enabled disableImagine).
            requireRegisterCount(5)
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """,
            )
        }
    }
}

package app.tadikwa.patches.googleclock

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val MORPHE_YTM_PACKAGE_FULL =
    "app.morphe.android.apps.youtube.music"

private val YTM_FULL_COMPATIBILITY = Compatibility(
    name = "YT Music Morphe",
    packageName = MORPHE_YTM_PACKAGE_FULL,
    appIconColor = 0xFF0000,
    targets = listOf(
        AppTarget(
            version = "9.15.51",
            isExperimental = true,
            description = "Google Clock full MediaBrowser bridge for Morphe-patched YT Music 9.15.51."
        )
    )
)

/*
 * Lkzf.c(Llkh;) is the onLoadChildren processing path.
 * Force the account-capability and client browse allow-list call-site results
 * to true so DeskClock reaches the normal media-tree supplier.
 */
private object MediaBrowserLoadChildrenFullFingerprint : Fingerprint(
    definingClass = "Lkzf;",
    name = "c",
    returnType = "V",
    parameters = listOf("Llkh;"),
)

/*
 * Llgv.e(Llkh;) is the browse-result/cache dispatcher.
 *
 * Exact static inspection of the installed failing APK showed this fast path:
 *
 *   Map.containsKey(client)
 *     -> Llkh.b(emptyList)
 *     -> cached Lbunw error
 *     -> Handler.post(Llgt)
 *     -> Lkxu.f(errorCode, explicitMessage)
 *     -> Llin.f(...)
 *     -> PlaybackState ERROR(7)
 *
 * v2.3/v2.4 instrumented Llin.e() and Lkzf.f(), so they correctly produced
 * no stack: this direct Lkxu.f() path bypasses both of them.
 *
 * Force this single Map.containsKey() result false. This skips the cached
 * failure shortcut and lets YT Music continue into the real browse-tree /
 * remote-content path instead of immediately returning empty children plus
 * the cached Music Premium PlaybackState error.
 */
private object MediaBrowserCachedErrorFingerprint : Fingerprint(
    definingClass = "Llgv;",
    name = "e",
    returnType = "Z",
    parameters = listOf("Llkh;"),
)

private fun findBooleanCallResult(
    instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
    definingClass: String,
    name: String,
    parameters: List<String>,
): Pair<Int, Int> {
    val callIndexes = instructions.withIndex().mapNotNull { (index, instruction) ->
        val reference =
            (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ?: return@mapNotNull null

        val matches =
            reference.definingClass == definingClass &&
                reference.name == name &&
                reference.returnType == "Z" &&
                reference.parameterTypes == parameters

        if (matches) index else null
    }

    if (callIndexes.size != 1) {
        throw PatchException(
            "Expected exactly 1 $definingClass->$name call, found ${callIndexes.size}"
        )
    }

    val callIndex = callIndexes.single()
    val resultIndex = callIndex + 1

    val resultInstruction =
        instructions.getOrNull(resultIndex)
            ?: throw PatchException(
                "Boolean call $definingClass->$name has no result instruction"
            )

    if (resultInstruction !is OneRegisterInstruction) {
        throw PatchException(
            "Unexpected result instruction after $definingClass->$name"
        )
    }

    return resultIndex to resultInstruction.registerA
}

@Suppress("unused")
val youtubeMusicFullMediaBrowserPatch = bytecodePatch(
    name = "Google Clock MediaBrowser full bridge",
    description = "Full Google Clock/YT Music MediaBrowser bridge: root/entitlement/consent compatibility, package identity/certificate fixes, loadChildren capability/allow-list bypasses, and cached Premium browse-error bypass.",
    default = true,
) {
    compatibleWith(YTM_FULL_COMPATIBILITY)

    dependsOn(
        youtubeMusicClockBridgePatch,
        youtubeMusicUpstreamMediaBrowserPatch,
    )

    execute {
        MediaBrowserLoadChildrenFullFingerprint.method.apply {
            val (capabilityResultIndex, capabilityRegister) =
                findBooleanCallResult(
                    instructions,
                    definingClass = "Lavtj;",
                    name = "v",
                    parameters = emptyList(),
                )

            replaceInstruction(
                capabilityResultIndex,
                "const/4 v$capabilityRegister, 0x1",
            )

            val (allowListResultIndex, allowListRegister) =
                findBooleanCallResult(
                    instructions,
                    definingClass = "Lkxo;",
                    name = "h",
                    parameters = listOf("Laves;"),
                )

            replaceInstruction(
                allowListResultIndex,
                "const/4 v$allowListRegister, 0x1",
            )
        }

        MediaBrowserCachedErrorFingerprint.method.apply {
            val (cachedErrorResultIndex, cachedErrorRegister) =
                findBooleanCallResult(
                    instructions,
                    definingClass = "Ljava/util/Map;",
                    name = "containsKey",
                    parameters = listOf("Ljava/lang/Object;"),
                )

            replaceInstruction(
                cachedErrorResultIndex,
                "const/4 v$cachedErrorRegister, 0x0",
            )
        }
    }
}

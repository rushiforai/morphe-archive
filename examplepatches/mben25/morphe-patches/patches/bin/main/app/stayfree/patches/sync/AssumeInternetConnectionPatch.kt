package app.stayfree.patches.sync

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.stayfree.patches.shared.Constants.COMPATIBILITY_STAYFREE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val DATA_FETCHERS_KT = "Lcom/sensortower/network/glidesupport/glide/DataFetchersKt;"

@Suppress("unused")
val assumeInternetConnectionPatch = bytecodePatch(
    name = "Assume device is online",
    description = "Fixes \"Something went wrong, please try again…\" when pairing with the browser " +
        "extension. StayFree gates all sync behind a precheck that must reach Google and that " +
        "also refuses to sync while usage-data collection is opted out; local pairing is served " +
        "from the phone itself and needs neither, so report the device as free to sync.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STAYFREE)

    execute {
        // Every sync entry point starts with the same gate:
        //
        //     NETWORK_CONNECTION_LOST == statusFlow.value -> return
        //
        // and that status is written from NetworkUtils.hasInternetConnection(), which GETs
        // https://clients3.google.com/generate_204 (falling back to the Qualcomm mirror) and
        // demands an exact HTTP 204. When neither answers 204, the flow holds
        // NETWORK_CONNECTION_LOST and the QR pairing coroutine returns on its first instruction —
        // before any Retrofit client is built — so the UI only ever shows the generic failure.
        //
        // Patch the check rather than the three read sites: it is a self-contained public `()Z`
        // in a library R8 leaves unobfuscated, while the gates live in merged lambdas whose
        // shape moves between versions. Its only other callers are the Glide icon fetchers,
        // which use it to decide whether to attempt a download — an attempt that simply fails
        // the way it would without the pre-check.
        //
        // This is the right answer even on a device that *is* online: pairing is served by the
        // local sync server on 127.0.0.1, which needs no internet access at all.
        val method = HasInternetConnectionFingerprint.methodOrNull
            ?: throw PatchException("NetworkUtils.hasInternetConnection not found")

        method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // Forcing the captive-portal check true is necessary but not sufficient: the precheck
        // every sync entry point awaits ANDs that result with two consent flags, and the last one
        // is fatal here.
        //
        //     canSync = hasInternetConnection() && hasMadeConsentChoice() && !isOptedOut()
        //
        // "Disable All Telemetry" pins isOptedOut() to true so that no uploader ever transmits —
        // which is the whole point of it, and it stays exactly as it is. But this precheck reuses
        // that same flag as permission to sync at all, so with telemetry disabled the last term is
        // always false and the precheck always returns false.
        //
        // The failure that causes is invisible by design. The pairing coroutine passes its status
        // gate, sets LOADING, awaits this precheck, gets false, and returns null before
        // constructing the Retrofit client — so no request is ever issued, the local sync server
        // logs nothing at all, and the caller maps the null to the generic "Something went
        // wrong, please try again…". Instant, silent, and indistinguishable from a network error.
        //
        // Return true from the precheck as a whole rather than unpinning isOptedOut(): the opt-out
        // must keep reading true everywhere else or telemetry resumes. Its three conditions are
        // all moot for this build anyway — sync is served by the local server on 127.0.0.1, which
        // needs no internet, and consent to upload to a vendor server that is no longer contacted
        // is not a question worth asking. Every other sync path (device-group config, categorizing
        // worker, the remaining ~30 callers) is unblocked by the same instruction.
        val precondition = SyncPreconditionFingerprint.methodOrNull
            ?: throw PatchException("Sync precondition not found")

        precondition.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                return-object v0
            """,
        )

        // Forcing hasInternetConnection() true has a side effect on the Glide icon fetchers
        // (icon URL, website favicon, uninstalled-app icon). Each one is shaped like
        //
        //     if (!hasInternetConnection()) { callback.onDataReady(null); return; }
        //     try { bitmap = download(...) } catch (e) { bitmap = getDefaultAppIcon(...) }
        //     callback.onDataReady(bitmap)
        //
        // A null result is a failed load: nothing is cached, the composable's failure slot draws
        // the default icon, and the next display retries. The placeholder bitmap, though, is a
        // *successful* load — Glide writes it to its disk cache under the icon's key and never
        // asks again. With the check pinned true, every download attempted while the phone is
        // offline (or that fails once) now takes the catch path, so brand icons on In-App
        // Blocking, Usage Stats, etc. get stuck on the generic robot / globe until the app's
        // cache is cleared.
        //
        // Hand Glide null instead of the placeholder in all three fetchers: the result looks the
        // same on screen (the failure slot draws that same default icon), but it is not cached,
        // so the real icon appears as soon as a download succeeds.
        listOf(
            IconUrlDataFetcherFingerprint,
            WebsiteIconDataFetcherFingerprint,
            AppIconDataFetcherFingerprint,
        ).forEach { fingerprint ->
            val method = fingerprint.methodOrNull
                ?: throw PatchException("${fingerprint.javaClass.simpleName} not found")
            val instructions = method.implementation!!.instructions.toList()
            val placeholders = instructions.indices.filter { index ->
                instructions[index].opcode == Opcode.INVOKE_STATIC &&
                    ((instructions[index] as ReferenceInstruction).reference as MethodReference).let {
                        it.definingClass == DATA_FETCHERS_KT && it.name.startsWith("getDefault")
                    }
            }
            if (placeholders.isEmpty()) throw PatchException("Icon placeholder not found in ${method.definingClass}")
            placeholders.forEach { index ->
                val result = instructions[index + 1]
                if (result.opcode != Opcode.MOVE_RESULT_OBJECT) throw PatchException("Unexpected icon placeholder shape")
                // Same instruction count, so the indices found above stay valid.
                method.replaceInstruction(index, "nop")
                method.replaceInstruction(index + 1, "const/16 v${(result as OneRegisterInstruction).registerA}, 0x0")
            }
        }
    }
}

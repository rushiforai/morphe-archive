package patches.kijkatv

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import patches.atv.exact

private const val ACTIVITY = "Ltv/mauna/app/MainActivity;"
private const val HELPER = "Lpatches/atv/KijkWebClient;"

private val webRuntime = bytecodePatch {
    dependsOn(originalInput)
    extendWith("extensions/atv.mpe")
    execute {
        val method = exact(ACTIVITY, "t0()V", 5, 32)
        val calls = method.instructions.withIndex().filter {
            (it.value as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                ?.reference?.toString() == "Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V"
        }
        check(calls.size == 1)
        val call = calls.single()
        val registers = call.value as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
        check(registers.registerC == 0 && registers.registerD == 2)
        // v2 is dead after this call in the pinned t0; v1 remains the original debugging flag.
        method.addInstructions(call.index, """
            invoke-static {v2}, $HELPER->wrap(Landroid/webkit/WebViewClient;)Landroid/webkit/WebViewClient;
            move-result-object v2
        """.trimIndent())
    }
}

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Disables KIJK TV's client VAST/VMAP schedules, FreeWheel decisions and pause-ad display. Preserves content playback; broadcast or server-stitched ads require separate evidence.",
) {
    compatibleWith(kijkTv)
    dependsOn(webRuntime)
    execute {
        // The shared runtime has inserted two instructions into the original method.
        val method = app.morphe.patcher.Fingerprint(definingClass = ACTIVITY, name = "t0", returnType = "V", parameters = emptyList())
            .matchAll(1..1).single().method
        check(method.implementation!!.registerCount == 5 && method.instructions.size in setOf(34, 36))
        method.addInstructions(0, """
            const/4 v0, 0x1
            sput-boolean v0, $HELPER->ads:Z
        """.trimIndent())
    }
}

@Suppress("unused")
val disableTrackingPatch = bytecodePatch(
    name = "Disable tracking",
    description = "Limits the native advertising-ID bridge, disables hosted ID5/Conviva/GA/Sentry configuration and omits identified Tealium and measurement requests. Retains real consent, account and media services.",
) {
    compatibleWith(kijkTv)
    dependsOn(webRuntime)
    execute {
        // Ads can already have enabled its independent two-instruction flag.
        val method = app.morphe.patcher.Fingerprint(definingClass = ACTIVITY, name = "t0", returnType = "V", parameters = emptyList())
            .matchAll(1..1).single().method
        check(method.implementation!!.registerCount == 5 && method.instructions.size in setOf(34, 36))
        method.addInstructions(0, """
            const/4 v0, 0x1
            sput-boolean v0, $HELPER->tracking:Z
        """.trimIndent())
        exact("Ltv/mauna/app/MainActivity\$d;", "getAdvertisingId()Ljava/lang/String;", 3, 13)
            .addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        exact("Ltv/mauna/app/MainActivity\$d;", "shouldLimitAdTracking()Z", 4, 11)
            .addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}

@Suppress("unused")
val webViewDebugPatch = bytecodePatch(
    name = "Enable WebView debugging",
    description = "Diagnostic only: permits local inspection of KIJK's hosted frontend. Disabled by default; use for test builds.",
    default = false,
) {
    compatibleWith(kijkTv)
    dependsOn(webRuntime)
    execute {
        val method = app.morphe.patcher.Fingerprint(definingClass = ACTIVITY, name = "t0", returnType = "V", parameters = emptyList())
            .matchAll(1..1).single().method
        val calls = method.instructions.withIndex().filter {
            (it.value as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                ?.reference?.toString() == "Landroid/webkit/WebView;->setWebContentsDebuggingEnabled(Z)V"
        }
        check(calls.size == 1)
        val call = calls.single()
        check((call.value as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction).registerC == 1)
        // The original pinned setup already holds true in v3 and false in v1.
        method.replaceInstruction(call.index, "invoke-static {v3}, Landroid/webkit/WebView;->setWebContentsDebuggingEnabled(Z)V")
    }
}

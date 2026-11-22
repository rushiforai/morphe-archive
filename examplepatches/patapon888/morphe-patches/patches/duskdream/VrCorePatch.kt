package duskdream

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.PatchException

private const val NOTIFICATION_MANAGER = "Landroid/app/NotificationManager;"
private const val BRIDGE = "Lcom/google/vr/vrcore/controller/api/ControllerServiceBridge;"
private const val NATIVE_CALLBACKS = "Lcom/google/vr/vrcore/controller/api/NativeCallbacks;"
private const val PAIRING = "Lcom/google/vr/vrcore/daydream/PairingActivity;"
private const val HEAD_TRACKING = "Lcom/google/vr/vrcore/tracking/HeadTrackingService;"

private val vrCoreNativePatch = resourcePatch {
    execute {
        fixShaders(
            "assets/lullaby/shaders/color_aa.fplshader",
            "assets/lullaby/sysui/shaders/color_aa.fplshader",
            "assets/lullaby/sysui/shaders/2d_display_aa.fplshader",
        )
        patchLibrary(
            "lib/arm64-v8a/libvrcore_native.so",
            listOf(
                ByteEdit(0x6fa234, "f37bbfa9e9f8ff97", "00008052c0035fd6"),
                ByteEdit(0x6fa25c, "f37bbfa9dff8ff97", "60008052c0035fd6"),
                ByteEdit(0x72542c, "780a04b9", "1f2003d5"),
                ByteEdit(0x728e16, "0032", "1f2a"),
                ByteEdit(0x728ef8, "e9e30139", "1f2003d5"),
                // platform_info: report FEATURE_VR_MODE_HIGH_PERFORMANCE. Without it async reprojection is refused,
                // and the O menu, which only draws through it, stays black.
                ByteEdit(0x7e6320, "09000012", "e9030032"),
                ByteEdit(0x746c30, "c002", "1600"),
                ByteEdit(0x746c33, "b4", "14"),
                ByteEdit(0x746c62, "0032", "1f2a"),
                ByteEdit(0x77e7b0, "a0001837", "1f2003d5"),
                ByteEdit(0x828e14, "bd31ff97", "e8031f2a"),
                ByteEdit(0x828ef8, "d6ec7736", "1f2003d5"),
                ByteEdit(0x846c30, "f37b0ba9", "16000014"),
                ByteEdit(0x846c60, "1f000071", "e8031f2a"),
                ByteEdit(0x86dc94, "60ce1939", "1f2003d5"),
                ByteEdit(0x86de40, "7bce1939", "1f2003d5"),
                ByteEdit(0x87e7b0, "00000000", "1f2003d5"),
            )
        )
        // 6DoF: SixDof runs ARCore in vrcore's process, and ARCore reads these from the app's manifest.
        val manifest = get("AndroidManifest.xml")
        val text = manifest.readText()
        val close = text.lastIndexOf("</application>")
        if (close < 0) throw PatchException("AndroidManifest.xml has no application tag")
        manifest.writeText(
            text.substring(0, close) +
                "<meta-data android:name=\"com.google.ar.core\" android:value=\"optional\"/>" +
                "<meta-data android:name=\"com.google.ar.core.min_apk_version\" android:value=\"242040000\"/>" +
                text.substring(close)
        )
    }
}

@Suppress("unused")
val vrCorePatch = bytecodePatch(
    name = "Daydream Everywhere (VR Services)",
    description = "Runs Google VR Services on any arm64 phone without root."
) {
    compatibleWith(VRCORE)
    dependsOn(vrCoreNativePatch, microGManifestPatch("com.google.vr.vrcore", "28391bf2d8cf1c39d0133d7f8a989e7a17c62c11"))
    extendWith(EXTENSION)

    execute {
        useMicroG()
        // Signatures: the apps are re-signed. The debug check also compares signatures.
        method("Lcom/google/vr/vrcore/base/api/SignatureUtils;", "verifySignature",
            listOf("Landroid/content/pm/PackageInfo;", "[Landroid/content/pm/Signature;")).returnConstant(true)
        method("Ldaj;", "a", listOf("Landroid/content/pm/PackageInfo;", "[Landroid/content/pm/Signature;")).returnConstant(true)
        method("Lcom/google/vr/vrcore/base/api/BuildUtils;", "isDebugBuild", listOf("Landroid/content/Context;")).returnConstant(false)
        method("Lcom/google/vr/vrcore/base/api/BuildUtils;", "computeIsDebugBuild", listOf("Landroid/content/Context;")).returnConstant(false)

        queueFrames()

        // Device: no NFC needed, any headset, the O menu's dashboard.
        method("Lety;", "e", listOf("Landroid/content/Context;")).returnConstant(true)
        // Setup needs a Google account, which Play services refuses to re-signed apps. Nothing else
        // depends on it: pairing and viewer checks still run when entering VR.
        method("Lezc;", "d", emptyList()).returnConstant(true)
        method("Lezt;", "d", emptyList()).returnConstant(true)
        // Android no longer has a VR listener setting to grant, the emulator stands in for it.
        hookReplace(method("Leyd;", "a", listOf("Landroid/content/Context;", "I")), "VrCore;->specialPermission", "Z")
        hookReplace(method("Lcom/google/vr/ndk/base/DaydreamUtils;", "isDaydreamViewer",
            listOf("Lcom/google/vr/sdk/proto/CardboardDevice\$DeviceParams;")), "VrCore;->isDaydreamViewer", "Z")
        method("Ldeh;", "h").returnConstant(false)
        method("Leyh;", "f").returnConstant(true)
        // 6DoF: vrcore's shared head tracker (HeadTrackingService), so apps take the pose vrcore gives.
        // Its own sensor tracker tilts portrait-native phones 90 degrees, so SixDof feeds the fake tracker.
        method("Leyh;", "c").returnConstant(true)
        hookAfter(method(HEAD_TRACKING, "e"), "SixDof;->afterTrackerSetup")
        hookAfter(method(HEAD_TRACKING, "a", listOf("Z")), "SixDof;->afterPaused")
        hookBefore(method(HEAD_TRACKING, "onDestroy"), "SixDof;->beforeDestroy")
        method("Lefk;", "b").returnConstant(true)
        method("Lcom/google/vr/cardboard/AndroidPCompat;", "getDisplayCutout", listOf("Landroid/view/Display;")).returnNull()

        // VrModeEmulator manages a narrower Do Not Disturb rule than vrcore's own.
        method("Ldkh;", "a", listOf(NOTIFICATION_MANAGER)).returnNull()
        method("Ldkh;", "a", listOf(NOTIFICATION_MANAGER, "Landroid/app/AutomaticZenRule;")).returnConstant(false)

        // Recentering and controller service.
        method("Lckk;", "c", listOf("Ljava/lang/String;")).addInstructionsWithLabels(
            0,
            """
                if-nez p1, :ok
                const-string p1, ""
                :ok
                nop
            """.trimIndent()
        )
        hookReplace(method("Ldri;", "run"), "VrCore;->driRun", "V")
        hookAfter(method("Lcom/google/vr/vrcore/controller/ControllerService;", "onCreate"), "VrCore;->afterControllerService")
        hookAfter(method("Lcom/google/vr/vrcore/controller/ControllerService;", "onBind", listOf("Landroid/content/Intent;")), "VrCore;->afterControllerService")
        methods("Ldpj;", "d").forEach { it.returnNothing() }
        hookReplace(method("Ldff;", "b"), "VrCore;->vrActivity", "Landroid/content/ComponentName;")
        hookReplace(method("Lebx;", "e"), "VrCore;->homeOnTop", "Z")
        hookAfter(method("Ldqo;", "a"), "VrCore;->afterReconcile")

        controllerClientHooks(BRIDGE, NATIVE_CALLBACKS)

        // Pairing.
        hookReplace(method(PAIRING, "onPause"), "VrCore;->pairingOnPause", "V")
        hookBefore(method("Ldmw;", "a"), "VrCore;->helperStop")
        hookBefore(method(PAIRING, "q"), "VrCore;->pairingForget")
        hookAfter(method(PAIRING, "onResume"), "VrCore;->afterPairingResume")
        hookAfter(method("Lfa;", "onStop"), "VrCore;->afterActivityStop")
        hookBefore(method("Ldnb;", "run"), "VrCore;->bondTimeout")

        hookApplication("Lcom/google/vr/vrcore/application/VrCoreApplication;")

        // Library: OpenXR apps next to Daydream apps, launched with their own category.
        hookResult(method("Leuz;", "h"), "OpenXrApps;->afterVrIntent")
        hookOverride(
            method("Lcom/google/vr/vrcore/modules/sysui/vrapplauncher/AppIconLoader;", "b",
                listOf("I", "Landroid/content/res/Resources;", "Ljava/lang/String;")),
            "OpenXrApps;->iconBitmap"
        )

        val counts = redirectCalls(
            FEATURE_REDIRECTS + OPENXR_APP_REDIRECTS + listOf(
                Redirect(
                    setOf("Landroid/view/WindowManager;", "Landroid/view/ViewManager;"), "addView",
                    listOf("Landroid/view/View;", "Landroid/view/ViewGroup\$LayoutParams;"),
                    "addView", "Landroid/view/ViewManager;"
                ),
                Redirect(null, "matchesInterruptionFilter", emptyList(), "matchesInterruptionFilter",
                    "Landroid/service/notification/NotificationListenerService\$Ranking;"),
            )
        )
        println("DuskDream: vrcore call sites $counts")
    }
}

/** Shared by the two apps that talk to the controller service. */
internal fun app.morphe.patcher.patch.BytecodePatchContext.controllerClientHooks(bridge: String, nativeCallbacks: String) {
    listOf("onServiceFailed", "onServiceUnavailable", "onServiceDisconnected").forEach {
        method(nativeCallbacks, it).returnNothing()
    }
    method(nativeCallbacks, "onServiceInitFailed", listOf("I")).returnNothing()
    hookBefore(method(nativeCallbacks, "onServiceConnected", listOf("I")), "Controller;->onServiceConnected")
    hookBefore(method(nativeCallbacks, "onControllerStateChanged", listOf("I", "I")), "Controller;->onControllerStateChanged")
    hookAfter(
        method(bridge, "onServiceConnected", listOf("Landroid/content/ComponentName;", "Landroid/os/IBinder;")),
        "Controller;->afterBridgeConnected"
    )
}

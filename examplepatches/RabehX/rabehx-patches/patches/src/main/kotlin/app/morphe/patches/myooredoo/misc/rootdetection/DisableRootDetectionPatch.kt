/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.myooredoo.misc.rootdetection

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourceXml
import app.morphe.patches.myooredoo.shared.Constants
import app.morphe.patches.myooredoo.shared.IS_MAGISK_PRESENT_NATIVE
import app.morphe.patches.myooredoo.shared.neutraliseNativeProbes
import app.morphe.patches.myooredoo.shared.presentOoredooArchitectures
import app.morphe.patches.shared.bytecode.applyNeutralisations
import app.morphe.patches.shared.bytecode.indexOf
import app.morphe.patches.shared.bytecode.planNeutralisations
import app.morphe.patches.shared.removeElements
import app.morphe.patches.shared.replyFlutterBool
import app.morphe.patches.shared.returnEarlyAll
import app.morphe.patches.shared.returnEarlyVoidAll

private val VDOMAIN_HOOK_PACKAGES = listOf(
    "com.alephzain.framaroot", "com.allinone.free", "com.amphoras.hidemyroot",
    "com.amphoras.hidemyrootadfree", "com.android.camera.update",
    "com.android.wp.net.log", "com.baseappfull.fwd", "com.blackmartalpha",
    "com.charles.lpoqasert", "com.chelpus.lackypatch", "com.chelpus.luckypatcher",
    "com.devadvance.rootcloak", "com.devadvance.rootcloakplus",
    "com.dimonvideo.luckypatcher", "com.dv.marketmod.installer",
    "com.formyhm.hideroot", "com.kingo.root", "com.kingroot.kinguser",
    "com.koushikdutta.rommanager", "com.koushikdutta.rommanager.license",
    "com.koushikdutta.superuser", "com.noshufou.android.su",
    "com.noshufou.android.su.elite", "com.ramdroid.appquarantine",
    "com.ramdroid.appquarantinepro", "com.repodroid.app", "com.saurik.substrate",
    "com.smedialink.oneclickroot", "com.solohsu.android.edxp.manager",
    "com.thirdparty.superuser", "com.topjohnwu.magisk", "com.xmodgame",
    "com.yellowes.su", "com.zachspong.temprootremovejb", "com.zhiqupk.root.global",
    "com.zmapp", "de.robv.android.xposed.installer", "eu.chainfire.supersu",
    "org.blackmart.market", "org.creeplays.hack", "org.meowcat.edxposed.manager",
    "org.mobilism.android",
)

private val VDOMAIN_X86_ABSENT = setOf(
    "com.kingo.root", "com.xmodgame", "com.yellowes.su", "com.zmapp",
)

private val RJSNIFTER_SU_PATHS = listOf(
    "/system/sd/xbin/su", "/system/bin/su", "/data/local/xbin/su",
    "/data/local/bin/su", "/sbin/su", "/system/xbin/su", "/data/su",
    "/cache/su", "/data/local/su", "/system/bin/failsafe/su",
    "/system/usr/we-need-root/su", "/dev/su", "/su/bin/su",
    "magisk", "core/img", "core/mirror",
)

private val DART_ROOT_LITERALS = listOf(
    "/sbin/magisk", "/system/xbin/magisk", "/system/bin/magisk",
    "/sbin/magiskhide", "/system/app/Superuser.apk",
    "/system/priv-app/Superuser.apk", "/data/adb/magisk.db",
    "/system/xbin/su", "/system/bin/su", "/sbin/su", "/su/bin/su",
    "/system/su", "/system/xbin/busybox", "/system/bin/busybox", "MAGISK",
)

private val DART_EMULATOR_LITERALS = listOf("goldfish", "ranchu", "vbox86p", "qemu")

/** Classes where every concrete boolean method is a root/emulator/hook/mock-location detector. */
private val BOOLEAN_DETECTOR_CLASSES = listOf(
    "Lcom/android/sec/utils/Rttx;",
    "Lcom/example/ooredoo_selfcare_algeria/BinaryProtections;",
    "Lcom/scottyab/rootbeer/RootBeer;",
    "Lcom/scottyab/rootbeer/RootBeerNative;",
    "Lcom/xamdesign/safe_device/Rooted/RootedCheck;",
    "Lcom/xamdesign/safe_device/ExternalStorage/ExternalStorageCheck;",
    "Lcom/xamdesign/safe_device/Emulator/EmulatorCheck;",
    "Lcom/xamdesign/safe_device/LocationAssistantListener;",
    "Lcom/emrys/rjsniffer/rjsniffer/Emulate;",
)

private const val SNIFFER_SERVICE = "com.emrys.rjsniffer.rjsniffer.Sniffer"

@Suppress("unused")
val disableRootDetectionPatch = patch(
    name = "Disable root & emulator detection",
    description = "Forces every root, jailbreak, emulator, hook and mock-location check to " +
            "report a clean device across Java/Kotlin, Dart AOT, RootBeer, SafeDevice, " +
            "VdoCipher and rjsniffer native probes, and removes the isolated Magisk sniffer service.",
    default = true,
) {
    category("Security")
    compatibleWith(Constants.COMPATIBILITY_MYOOREDOO)

    execute {
        // 1. Java/Kotlin detectors: neutralize every concrete boolean detector method.
        BOOLEAN_DETECTOR_CLASSES.forEach { mutableClassDefByOrNull(it)?.returnEarlyAll(false) }

        // Stop mock-location assistant from waking GPS & return empty map for rootDetectionDetails.
        mutableClassDefByOrNull("Lcom/xamdesign/safe_device/MockLocation/LocationAssistant;")
            ?.returnEarlyVoidAll {
                it.name in setOf("checkLocationSettings", "getLastKnownLocation", "startLocationUpdates")
            }

        mutableClassDefByOrNull("Lcom/xamdesign/safe_device/Rooted/RootedCheck;")
            ?.methods?.firstOrNull { it.name == "getRootDetectionDetails" }
            ?.addInstructions(
                0,
                """
                    new-instance v0, Ljava/util/HashMap;
                    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V
                    return-object v0
                """,
            )

        // Intercept Flutter plugin channels directly.
        mutableClassDefByOrNull("Lcom/xamdesign/safe_device/SafeDevicePlugin;")
            ?.methods?.firstOrNull { it.name == "onMethodCall" }
            ?.addInstructions(
                0,
                """
                    iget-object v0, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;
                    const-string v1, "isRealDevice"
                    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v1
                    if-eqz v1, :cond_not_real
                    const/4 v0, 0x1
                    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                    move-result-object v0
                    invoke-interface {p2, v0}, Lio/flutter/plugin/common/MethodChannel${'$'}Result;->success(Ljava/lang/Object;)V
                    return-void
                    :cond_not_real
                    const-string v1, "rootDetectionDetails"
                    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v1
                    if-eqz v1, :cond_not_details
                    new-instance v0, Ljava/util/HashMap;
                    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V
                    invoke-interface {p2, v0}, Lio/flutter/plugin/common/MethodChannel${'$'}Result;->success(Ljava/lang/Object;)V
                    return-void
                    :cond_not_details
                    const/4 v0, 0x0
                    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                    move-result-object v0
                    invoke-interface {p2, v0}, Lio/flutter/plugin/common/MethodChannel${'$'}Result;->success(Ljava/lang/Object;)V
                    return-void
                """,
            )

        listOf(
            "Lcom/example/root_checker_plus/RootCheckerPlusPlugin;",
            "Lcom/emrys/rjsniffer/rjsniffer/RjsnifferPlugin;",
        ).forEach { cls ->
            mutableClassDefByOrNull(cls)?.methods?.firstOrNull { it.name == "onMethodCall" }?.replyFlutterBool(false)
        }

        // 2. Native shared libraries (only for ABIs actually present in this APK/split).
        val problems = mutableListOf<String>()
        val presentAbis = presentOoredooArchitectures()

        fun rewrite(
            arch: String,
            library: String,
            required: List<String>,
            optional: List<String> = emptyList(),
            expectedAbsent: Set<String> = emptySet(),
        ) {
            val file = resourceFile("lib/$arch/$library")
            if (!file.isFile) {
                problems += "$arch/$library: library missing"
                return
            }

            val data = file.readBytes()
            val plan = data.planNeutralisations(required + optional)
            val missing = required.filter { it in plan.absent && it !in expectedAbsent }
                .filter { lit -> data.indexOf("Z".repeat(lit.length).toByteArray(Charsets.US_ASCII)) == null }

            if (missing.isNotEmpty()) {
                problems += "$arch/$library: not found -> ${missing.joinToString()}"
                return
            }
            file.writeBytes(data.applyNeutralisations(plan))
        }

        presentAbis.forEach { arch ->
            rewrite(
                arch,
                "libvdomain.so",
                VDOMAIN_HOOK_PACKAGES + "which su",
                expectedAbsent = VDOMAIN_X86_ABSENT.takeIf { arch == "x86_64" }.orEmpty(),
            )
            rewrite(arch, "librjsniffer-lib.so", RJSNIFTER_SU_PATHS)
            rewrite(arch, "libapp.so", DART_ROOT_LITERALS, DART_EMULATOR_LITERALS)
        }

        problems += neutraliseNativeProbes(IS_MAGISK_PRESENT_NATIVE, "isMagiskPresentNative")
        if (presentAbis.isEmpty() && problems.isEmpty()) problems += "No supported ABI found under lib/"

        // 3. Manifest: remove isolated Magisk sniffer service & zygote preload.
        resourceXml("AndroidManifest.xml").use { manifest ->
            manifest.removeElements(listOf("service")) { it.attribute("android:name") == SNIFFER_SERVICE }
            manifest.elements("application").firstOrNull()?.let { app ->
                app.removeAttribute("android:zygotePreloadName")
                app.removeAttribute("zygotePreloadName")
            }
        }

        check(problems.isEmpty()) {
            "Disable root & emulator detection failed:\n" + problems.joinToString("\n") { "  - $it" }
        }
    }
}

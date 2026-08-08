package app.logm1lo.patches.cubesolver.premium

import app.logm1lo.patches.shared.COMPATIBILITY_CUBESOLVER
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.methodCall
import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Base: disable crash-prone / consent / telemetry providers so the app can
 * start without the PairIP VM (WorkManager NPE, consent crash).
 */
@Suppress("unused")
val cubesolverBaseProvidersPatch = resourcePatch(
    default = true
) {
    compatibleWith(COMPATIBILITY_CUBESOLVER)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val providers = doc.getElementsByTagName("provider")
            val toDisable = listOf(
                "androidx.startup.InitializationProvider",
                "io.sfbx.appconsent.core.diinjektor.InjektorInitializerContentProvider",
                "com.google.firebase.provider.FirebaseInitProvider",
            )
            for (i in 0 until providers.length) {
                val provider = providers.item(i)
                val name = provider.attributes.getNamedItem("android:name")?.nodeValue ?: ""
                if (toDisable.any { name == it || name.contains(it) }) {
                    provider.attributes.getNamedItem("android:enabled")
                        ?.let { it.nodeValue = "false" }
                        ?: run {
                            val attr = doc.createAttribute("android:enabled")
                            attr.value = "false"
                            provider.attributes.setNamedItem(attr)
                        }
                }
            }
        }
    }
}

/**
 * Remove Ads: disable ad SDK providers + AppLovin init + reward-instant.
 */
@Suppress("unused")
val cubesolverRemoveAdsPatch = resourcePatch(
    default = true
) {
    compatibleWith(COMPATIBILITY_CUBESOLVER)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val providers = doc.getElementsByTagName("provider")
            val toDisable = listOf(
                "com.google.android.gms.ads.MobileAdsInitProvider",
                "com.applovin.sdk.AppLovinInitProvider",
            )
            for (i in 0 until providers.length) {
                val provider = providers.item(i)
                val name = provider.attributes.getNamedItem("android:name")?.nodeValue ?: ""
                if (toDisable.any { name == it || name.contains(it) }) {
                    provider.attributes.getNamedItem("android:enabled")
                        ?.let { it.nodeValue = "false" }
                        ?: run {
                            val attr = doc.createAttribute("android:enabled")
                            attr.value = "false"
                            provider.attributes.setNamedItem(attr)
                        }
                }
            }
        }
    }
}

/**
 * Puzzles Unlock: force the web app JS to treat the user as paid.
 * Patches assets/www/build/bundle.js gates:
 * - isPaidUser() → true
 * - _0x59b6b0()  → true (kilominx gate)
 */
@Suppress("unused")
val cubesolverForceUnlockJsPatch = rawResourcePatch(
    default = true
) {
    compatibleWith(COMPATIBILITY_CUBESOLVER)

    execute {
        val bundle = get("assets/www/build/bundle.js") ?: return@execute
        val bytes = bundle.readBytes()

        val isPaidUser = "function isPaidUser(){return window[\"localStorage\"][\"getItem\"](IAP_PAID_KEY)===\"ok\"}".toByteArray()
        val isPaidUserNew = "function isPaidUser(){return!![]}".toByteArray()

        val gateOld = "function _0x59b6b0(){const _0xaf3abd=_0x41eb;return window[_0xaf3abd(202)+\"ge\"][\"getItem\"](IAP_PAID_KEY)===\"ok\"||window[\"localStorage\"][\"getItem\"](KILOMINX_UNLOCK_KEY)===\"ok\"}".toByteArray()
        val gateNew = "function _0x59b6b0(){return!![]}".toByteArray()

        // Customize-design gate (_0x472fec): reads localStorage.getItem(IAP_PAID_KEY)==="ok" DIRECTLY
        // (not via isPaidUser). getItem never returns "x", so `!=="x"` is always true → all designs unlock.
        val customOld = "===\"ok\"?(".toByteArray()
        val customNew = "!==\"x\"?(".toByteArray()

        var patched = 0
        val findReplace = listOf(
            isPaidUser to isPaidUserNew,
            gateOld to gateNew,
            customOld to customNew,
        )

        var result = bytes
        for ((old, new) in findReplace) {
            val idx = indexOf(result, old)
            if (idx >= 0) {
                result = result.copyOf()
                val padded = ByteArray(old.size) { ' '.code.toByte() }
                new.copyInto(padded, 0)
                padded.copyInto(result, idx)
                patched++
            }
        }

        if (patched == findReplace.size) {
            bundle.writeBytes(result)
            println("CubeSolver JS unlock: patched $patched/${findReplace.size} gate functions in bundle.js")
        } else {
            println("CubeSolver JS unlock: only $patched/${findReplace.size} matched — bundle.js may differ")
        }
    }
}

private fun indexOf(haystack: ByteArray, needle: ByteArray): Int {
    if (needle.isEmpty() || needle.size > haystack.size) return -1
    outer@ for (i in 0..haystack.size - needle.size) {
        for (j in needle.indices) {
            if (haystack[i + j] != needle[j]) continue@outer
        }
        return i
    }
    return -1
}

/**
 * Base: neutralize PairIP + reconstruct MainActivity so the app runs.
 * Internal (no name) — required by both Remove Ads and Puzzles Unlock.
 */
@Suppress("unused")
val cubesolverBasePatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_CUBESOLVER)
    dependsOn(cubesolverBaseProvidersPatch)

    execute {
        // Prevent libpairipcore.so from loading (native re-sign SIGSEGV)
        VMRunnerClinitFingerprint.let { fp ->
            val m = fp.matchOrNull() ?: return@let
            m.method.addInstructions(0, "return-void")
        }
        // Skip the virtual startup program
        StartupLauncherFingerprint.let { fp ->
            val m = fp.matchOrNull() ?: return@let
            m.method.addInstructions(0, "return-void")
        }
        // Neutralize the Java-side signature check
        SignatureVerifyFingerprint.let { fp ->
            val m = fp.matchOrNull() ?: return@let
            m.method.addInstructions(0, "return-void")
        }
        // Neutralize Play licensing (launches LicenseActivity → System.exit)
        LicenseCheckFingerprint.let { fp ->
            val m = fp.matchOrNull() ?: return@let
            m.method.addInstructions(0, "return-void")
        }
        LicenseCloseAppFingerprint.let { fp ->
            val m = fp.matchOrNull() ?: return@let
            m.method.addInstructions(0, "return-void")
        }
        // App.onCreate() is virtualized → NPE
        AppOnCreateFingerprint.let { fp ->
            val m = fp.matchOrNull() ?: return@let
            m.method.addInstructions(0, "return-void")
        }
        // RECONSTRUCT MainActivity.onCreate — replace the virtualized body
        MainActivityOnCreateFingerprint.let { fp ->
            val m = fp.matchOrNull() ?: return@let
            val impl = m.method.implementation ?: return@let
            val count = impl.instructions.size
            if (count > 0) m.method.removeInstructions(0, count)
            m.method.addInstructions(0, """
                invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

                const v0, 0x7f0b001c
                invoke-virtual {p0, v0}, Landroid/app/Activity;->setContentView(I)V

                const v0, 0x7f08022b
                invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
                move-result-object v0
                check-cast v0, Landroid/webkit/WebView;
                iput-object v0, p0, Lcom/jeffprod/cubesolver/MainActivity;->b:Landroid/webkit/WebView;

                invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;
                move-result-object v1
                const/4 v2, 0x1
                invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V
                invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

                new-instance v2, Lk93;
                invoke-direct {v2, p0}, Lk93;-><init>(Lcom/jeffprod/cubesolver/MainActivity;)V
                const-string v3, "Android"
                invoke-virtual {v0, v2, v3}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

                const-string v3, "file:///android_asset/www/index.html"
                invoke-virtual {v0, v3}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

                invoke-virtual {p0}, Lcom/jeffprod/cubesolver/MainActivity;->k()V

                # Hide the splash frame (idsplashframe). i(false) → GONE.
                const/4 v3, 0x0
                invoke-virtual {p0, v3}, Lcom/jeffprod/cubesolver/MainActivity;->i(Z)V
                return-void
            """)
        }
        // Replace virtualized lifecycle methods with super calls
        MainActivityOnResumeFingerprint.let { fp ->
            val m = fp.matchOrNull() ?: return@let
            val impl = m.method.implementation ?: return@let
            val count = impl.instructions.size
            if (count > 0) m.method.removeInstructions(0, count)
            m.method.addInstructions(0, """
                invoke-super {p0}, Landroid/app/Activity;->onResume()V
                return-void
            """)
        }
        MainActivityOnPauseFingerprint.let { fp ->
            val m = fp.matchOrNull() ?: return@let
            val impl = m.method.implementation ?: return@let
            val count = impl.instructions.size
            if (count > 0) m.method.removeInstructions(0, count)
            m.method.addInstructions(0, """
                invoke-super {p0}, Landroid/app/Activity;->onPause()V
                return-void
            """)
        }
        MainActivityOnDestroyFingerprint.let { fp ->
            val m = fp.matchOrNull() ?: return@let
            val impl = m.method.implementation ?: return@let
            val count = impl.instructions.size
            if (count > 0) m.method.removeInstructions(0, count)
            m.method.addInstructions(0, """
                invoke-super {p0}, Landroid/app/Activity;->onDestroy()V
                return-void
            """)
        }
    }
}

/**
 * Remove Ads: neutralizes the AppLovin init and rewards instantly.
 */
@Suppress("unused")
val cubesolverRemoveAdsBytecodePatch = bytecodePatch(
    name = "Remove Ads",
    description = "Removes ads.",
    default = true
) {
    compatibleWith(COMPATIBILITY_CUBESOLVER)
    dependsOn(cubesolverBasePatch, cubesolverRemoveAdsPatch)

    execute {
        // AppLovin init → no-op
        AppLovinInitFingerprint.let { fp ->
            val m = fp.matchOrNull() ?: return@let
            m.method.addInstructions(0, "return-void")
        }
        // Rewarded-ad bridge: grant immediately, no ad shown
        RewardedAdBridgeFingerprint.let { fp ->
            val m = fp.matchOrNull() ?: return@let
            m.method.addInstructions(0, """
                iget-object v0, p0, Lk93;->a:Ljava/lang/ref/WeakReference;
                invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
                move-result-object v0
                if-eqz v0, :cond_skip
                check-cast v0, Lcom/jeffprod/cubesolver/MainActivity;
                invoke-virtual {v0}, Lcom/jeffprod/cubesolver/MainActivity;->k()V
                :cond_skip
                return-void
            """)
        }
        // Telemetry registrars → empty
        CrashlyticsRegistrarFingerprint.let { fp ->
            fp.matchOrNull()?.method?.addInstructions(0, """
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object v0
                return-object v0
            """)
        }
        AnalyticsRegistrarFingerprint.let { fp ->
            fp.matchOrNull()?.method?.addInstructions(0, """
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object v0
                return-object v0
            """)
        }
        PerfRegistrarFingerprint.let { fp ->
            fp.matchOrNull()?.method?.addInstructions(0, """
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object v0
                return-object v0
            """)
        }
        SessionsRegistrarFingerprint.let { fp ->
            fp.matchOrNull()?.method?.addInstructions(0, """
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object v0
                return-object v0
            """)
        }
    }
}

/**
 * Puzzles Unlock: force ulcsall="ok" and JS paid gates.
 */
@Suppress("unused")
val cubesolverPuzzlesUnlockPatch = bytecodePatch(
    name = "Puzzles Unlock",
    description = "Unlocks all puzzles.",
    default = true
) {
    compatibleWith(COMPATIBILITY_CUBESOLVER)
    dependsOn(cubesolverBasePatch, cubesolverForceUnlockJsPatch)

    execute {
        // Master puzzle unlock: MainActivity.k() always writes "ok" to ulcsall
        PuzzleUnlockFingerprint.let { fp ->
            val m = fp.matchOrNull() ?: return@let
            m.method.addInstructions(0, """
                const-string v0, "ok"
                const-string v1, "ulcsall"
                invoke-virtual {p0, v1, v0}, Lcom/jeffprod/cubesolver/MainActivity;->j(Ljava/lang/String;Ljava/lang/String;)V
                return-void
            """)
        }
    }
}

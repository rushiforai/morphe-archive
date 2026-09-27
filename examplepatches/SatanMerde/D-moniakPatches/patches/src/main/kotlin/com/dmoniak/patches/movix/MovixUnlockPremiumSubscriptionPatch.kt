package com.dmoniak.patches.movix

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MOVIX
import java.util.logging.Logger

@Suppress("unused")
val movixUnlockPremiumSubscriptionPatch = bytecodePatch(
    name = "Unlock Premium Subscription - Movix",
    description = "Bypasses Movix VIP/Premium subscription checks to unlock all premium and exclusive content, series, and movie libraries without an active paid subscription.",
) {
    compatibleWith(COMPATIBILITY_MOVIX)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMovixUnlockPremiumLogic(logger)
    }
}

fun BytecodePatchContext.executeMovixUnlockPremiumLogic(logger: Logger) {
    logger.info("Executing Unlock Premium Subscription patch for Movix...")
    var hookedPoints = 0

    val vipScript = "javascript:(function(){ try { " +
        "if (typeof Storage !== 'undefined') { try { " +
        "var g = Storage.prototype.getItem; " +
        "Storage.prototype.getItem = function(k) { " +
        "if (k === 'is_vip') return 'true'; " +
        "if (k === 'access_code') return 'VIP_LIFETIME_BYPASS'; " +
        "if (k === 'access_code_expires') return '2099-12-31T23:59:59.999Z'; " +
        "return g.apply(this, arguments); " +
        "}; " +
        "var s = Storage.prototype.setItem; " +
        "Storage.prototype.setItem = function(k, v) { " +
        "if (k === 'is_vip' && v === 'false') return s.call(this, k, 'true'); " +
        "return s.apply(this, arguments); " +
        "}; " +
        "var r = Storage.prototype.removeItem; " +
        "Storage.prototype.removeItem = function(k) { " +
        "if (k === 'is_vip' || k === 'access_code' || k === 'access_code_expires') return; " +
        "return r.apply(this, arguments); " +
        "}; " +
        "} catch(e) {} } " +
        "try { " +
        "localStorage.setItem('is_vip', 'true'); " +
        "localStorage.setItem('access_code', 'VIP_LIFETIME_BYPASS'); " +
        "localStorage.setItem('access_code_expires', '2099-12-31T23:59:59.999Z'); " +
        "} catch(e) {} " +
        "try { " +
        "if (typeof window !== 'undefined' && typeof window.fetch === 'function' && !window._movixFetchHooked) { " +
        "window._movixFetchHooked = true; " +
        "var origFetch = window.fetch; " +
        "window.fetch = function(url, opts) { " +
        "var u = String(url || ''); " +
        "if (u.indexOf('check-vip') !== -1) { " +
        "return Promise.resolve(new Response(JSON.stringify({ vip: true, expiresAt: '2099-12-31T23:59:59.999Z' }), { status: 200, headers: { 'Content-Type': 'application/json' } })); " +
        "} " +
        "return origFetch.apply(this, arguments); " +
        "}; " +
        "} } catch(e) {} " +
        "if (typeof window !== 'undefined') { " +
        "window.isVip = true; window.hasVipAccess = true; " +
        "try { " +
        "window.dispatchEvent(new Event('storage')); " +
        "window.dispatchEvent(new CustomEvent('vipStatusChanged', { detail: { vip: true } })); " +
        "} catch(e) {} " +
        "} " +
        "} catch(err) {} })();"

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // Inject VIP / Premium status into WebView storage and window globals
        if (classDef.type.contains("RNCWebViewClient")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                if (method.name == "onPageFinished" && method.returnType == "V" && method.parameterTypes.size == 2) {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            const-string v0, "$vipScript"
                            invoke-virtual {p1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[Movix Premium] Injected VIP storage tokens in: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[Movix Premium] Failed to hook onPageFinished: ${e.message}")
                    }
                }
            }
        }

        if (classDef.type.contains("RNCWebView") && !classDef.type.contains("Manager") && !classDef.type.contains("Client")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                if (method.name == "callInjectedJavaScript" && method.returnType == "V" && method.parameterTypes.isEmpty()) {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            const-string v0, "$vipScript"
                            invoke-virtual {p0, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[Movix Premium] Injected VIP script in callInjectedJavaScript: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[Movix Premium] Failed to hook callInjectedJavaScript: ${e.message}")
                    }
                }
            }
        }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            if (!isStatic && (
                mName == "ispremiumsubscriber" ||
                mName == "isvipuser" ||
                mName == "haspremiumaccess" ||
                mName == "canwatchpremiumcontent" ||
                mName == "issubscriptionactive" ||
                mName == "haspaidsubscription"
            ) && retType == "Z") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x1
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Movix Premium] Unlocked subscription in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Movix Premium] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Movix Unlock Premium] Total hooks applied: $hookedPoints")
}

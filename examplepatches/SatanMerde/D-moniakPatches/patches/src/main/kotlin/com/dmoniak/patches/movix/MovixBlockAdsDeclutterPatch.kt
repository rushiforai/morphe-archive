package com.dmoniak.patches.movix

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MOVIX
import java.util.logging.Logger

@Suppress("unused")
val movixBlockAdsDeclutterPatch = bytecodePatch(
    name = "Block Video Ads & Interstitials - Movix",
    description = "Strips video pre-roll and mid-roll ads, banner ads, and redirect popups across Movix movie and series player screens.",
) {
    compatibleWith(COMPATIBILITY_MOVIX)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMovixBlockAdsDeclutterLogic(logger)
    }
}

fun BytecodePatchContext.executeMovixBlockAdsDeclutterLogic(logger: Logger) {
    logger.info("Executing Block Video Ads & Interstitials patch for Movix...")
    var hookedPoints = 0

    // Master anti-ad & VIP unlock script:
    // Uses evaluateJavascript (raw JS, no 'javascript:' URL prefix, no URL fragment issues).
    val cleanAntiAdScript = "(function() { try { " +
        "if (typeof Storage !== 'undefined') { try { " +
        "var _g = Storage.prototype.getItem; " +
        "Storage.prototype.getItem = function(k) { " +
        "if (k === 'is_vip') return 'true'; " +
        "if (k === 'settings_ad_popup_mode') return 'auto'; " +
        "if (k === 'access_code') return 'VIP_LIFETIME_BYPASS'; " +
        "if (k === 'access_code_expires') return 'never'; " +
        "if (k === 'guest_uuid') return 'vip_lifetime_guest'; " +
        "return _g.apply(this, arguments); " +
        "}; " +
        "var _s = Storage.prototype.setItem; " +
        "Storage.prototype.setItem = function(k, v) { " +
        "if (k === 'is_vip' && v === 'false') return _s.call(this, k, 'true'); " +
        "if (k === 'settings_ad_popup_mode' && v !== 'auto') return _s.call(this, k, 'auto'); " +
        "return _s.apply(this, arguments); " +
        "}; " +
        "var _r = Storage.prototype.removeItem; " +
        "Storage.prototype.removeItem = function(k) { " +
        "if (k === 'is_vip' || k === 'settings_ad_popup_mode' || k === 'access_code' || k === 'access_code_expires' || k === 'guest_uuid') return; " +
        "return _r.apply(this, arguments); " +
        "}; " +
        "} catch(e) {} } " +
        "try { " +
        "localStorage.setItem('is_vip', 'true'); " +
        "localStorage.setItem('settings_ad_popup_mode', 'auto'); " +
        "localStorage.setItem('access_code', 'VIP_LIFETIME_BYPASS'); " +
        "localStorage.setItem('access_code_expires', 'never'); " +
        "localStorage.setItem('guest_uuid', 'vip_lifetime_guest'); " +
        "} catch(e) {} " +
        "try { " +
        "if (typeof window !== 'undefined' && typeof window.fetch === 'function' && !window._movixFetchHooked) { " +
        "window._movixFetchHooked = true; " +
        "var _origFetch = window.fetch; " +
        "window.fetch = function(url, opts) { " +
        "var u = String(url || ''); " +
        "if (u.indexOf('check-vip') !== -1) { " +
        "return Promise.resolve(new Response(JSON.stringify({ vip: true, expiresAt: 'never' }), { status: 200, headers: { 'Content-Type': 'application/json' } })); " +
        "} " +
        "return _origFetch.apply(this, arguments); " +
        "}; " +
        "} } catch(e) {} " +
        "if (typeof window !== 'undefined') { " +
        "window.isVip = true; window.hasVipAccess = true; " +
        "window.open = function() { return null; }; window.alert = function() {}; " +
        "} " +
        "var fireEvts = function() { try { " +
        "if (typeof window !== 'undefined') { " +
        "window.dispatchEvent(new Event('storage')); " +
        "window.dispatchEvent(new CustomEvent('vipStatusChanged', { detail: { vip: true } })); " +
        "window.dispatchEvent(new CustomEvent('ad_popup_accepted', { detail: { timestamp: Date.now() } })); " +
        "window.dispatchEvent(new CustomEvent('ad_popup_mode_changed', { detail: { mode: 'auto' } })); " +
        "} } catch(e) {} }; " +
        "fireEvts(); " +
        "var killModal = function() { try { " +
        "if (typeof document === 'undefined') return; " +
        "var btns = document.querySelectorAll('[data-ad-view-button]'); " +
        "for (var b = 0; b < btns.length; b++) { try { btns[b].click(); } catch(e) {} } " +
        "var allButtons = document.querySelectorAll('button'); " +
        "for (var i = 0; i < allButtons.length; i++) { " +
        "var btn = allButtons[i]; var txt = (btn.textContent || '').trim().toLowerCase(); " +
        "if (txt.indexOf('voir une publici') !== -1 || txt === 'lecture') { " +
        "try { btn.click(); } catch(e) {} fireEvts(); " +
        "} } " +
        "var targets = ['Une pub et c', 'Voir une publici', 'Passe VIP', 'garde Movix', 'Marre des pubs']; " +
        "var dialogs = document.querySelectorAll('[role=dialog], [data-radix-portal], .fixed.inset-0.z-50, div[style*=\\\"rgba(59,130,246\\\"], div[style*=\\\"rgba(59, 130, 246\\\"]'); " +
        "for (var d = 0; d < dialogs.length; d++) { " +
        "var el = dialogs[d]; var elText = el.textContent || ''; " +
        "for (var t = 0; t < targets.length; t++) { " +
        "if (elText.indexOf(targets[t]) !== -1) { " +
        "var actionBtn = el.querySelector('button'); " +
        "if (actionBtn) { try { actionBtn.click(); } catch(e) {} } " +
        "fireEvts(); try { el.remove(); } catch(e) {} break; " +
        "} } } " +
        "} catch(e) {} }; " +
        "killModal(); " +
        "if (typeof window !== 'undefined' && !window._movixKillInterval) { " +
        "window._movixKillInterval = setInterval(killModal, 80); " +
        "} " +
        "try { " +
        "if (typeof document !== 'undefined' && !document.getElementById('movix-ad-shield-style')) { " +
        "var styleEl = document.createElement('style'); styleEl.id = 'movix-ad-shield-style'; " +
        "styleEl.innerHTML = 'div[style*=\\\"rgba(59,130,246\\\"], div[style*=\\\"rgba(59, 130, 246\\\"], .ad-banner, .banner-ad, [class*=\\\"ad-\\\"], [id*=\\\"ad-\\\"], [class*=\\\"sponsor\\\"], [class*=\\\"popup\\\"], iframe[src*=\\\"ad\\\"], [id*=\\\"pop\\\"], .popunder, [id=\\\"popunder\\\"] { display: none !important; opacity: 0 !important; pointer-events: none !important; visibility: hidden !important; width: 0 !important; height: 0 !important; }'; " +
        "(document.head || document.documentElement).appendChild(styleEl); " +
        "} } catch(e) {} " +
        "} catch(err) {} })();"

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // 1. Hook RNCWebChromeClient:
        // - onCreateWindow: return false to prevent ANY popup/popunder window creation
        // - onProgressChanged: inject anti-ad script via native evaluateJavascript on every progress tick
        if (classDef.type.contains("RNCWebChromeClient")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                if (method.name == "onCreateWindow" && method.returnType == "Z") {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            const/4 v0, 0x0
                            return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[Movix Ads] Blocked popup window creation in: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[Movix Ads] Failed to hook onCreateWindow: ${e.message}")
                    }
                }
                if (method.name == "onProgressChanged" && method.returnType == "V" && method.parameterTypes.size == 2) {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            const-string v0, "$cleanAntiAdScript"
                            const/4 v1, 0x0
                            invoke-virtual {p1, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[Movix Ads] Injected evaluateJavascript onProgressChanged in: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[Movix Ads] Failed to hook onProgressChanged: ${e.message}")
                    }
                }
            }
        }

        // 2. Hook RNCWebView (Core React Native WebView class):
        // - callInjectedJavaScript: evaluate script via evaluateJavascriptWithFallback
        // - callInjectedJavaScriptBeforeContentLoaded: evaluate early before page content
        if (classDef.type.contains("RNCWebView") && !classDef.type.contains("Manager") && !classDef.type.contains("Client")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                if ((method.name == "callInjectedJavaScript" || method.name == "callInjectedJavaScriptBeforeContentLoaded") && method.returnType == "V" && method.parameterTypes.isEmpty()) {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            const-string v0, "$cleanAntiAdScript"
                            invoke-virtual {p0, v0}, Lcom/reactnativecommunity/webview/RNCWebView;->evaluateJavascriptWithFallback(Ljava/lang/String;)V
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[Movix Ads] Injected evaluateJavascript in ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[Movix Ads] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }

        // 3. Hook RNCWebViewManager / RNCWebViewManagerImpl:
        // - setInjectedJavaScriptBeforeContentLoaded: prepend our master script directly to the injectedJSBeforeContentLoaded prop
        // - disable popup windows at WebSettings level
        if (classDef.type.contains("RNCWebViewManager")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name
                if (mName == "setInjectedJavaScriptBeforeContentLoaded" && method.parameterTypes.size == 2 && method.returnType == "V") {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            const-string v0, "$cleanAntiAdScript;\n"
                            if-nez p2, :cond_skip_prepend
                            invoke-virtual {v0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
                            move-result-object p2
                            goto :cond_done_prepend
                            :cond_skip_prepend
                            move-object p2, v0
                            :cond_done_prepend
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[Movix Ads] Prepended anti-ad script in ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[Movix Ads] Failed to hook setInjectedJavaScriptBeforeContentLoaded: ${e.message}")
                    }
                }
                if ((mName == "setJavaScriptCanOpenWindowsAutomatically" || mName == "setSetSupportMultipleWindows") && method.returnType == "V") {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            return-void
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[Movix Ads] Disabled window opening capability in: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[Movix Ads] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }

        // 4. Auxiliary ad/redirect flags across any other classes
        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            if (!isStatic && (
                mName == "shouldplayvideoad" ||
                mName == "isadvisible" ||
                mName == "shouldopenadredirect" ||
                mName == "isinterstitialadloaded" ||
                mName == "hasprerollad"
            ) && retType == "Z") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x0
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Movix Ads] Blocked ad/redirect flag in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Movix Ads] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Movix Block Ads] Total hooks applied: $hookedPoints")
}

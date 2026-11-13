package com.dmoniak.patches.movix

import app.morphe.patcher.patch.BytecodePatchContext
import com.dmoniak.patches.hungryshark.util.replaceMethod
import java.util.logging.Logger

object MovixScriptHelper {
    var isVipEnabled = false
    var isAdBlockEnabled = false

    fun buildUnifiedScript(): String {
        val parts = mutableListOf<String>()

        // 1. VIP / Premium Lifetime Unlock
        if (isVipEnabled) {
            parts.add(
                "try { " +
                "if (typeof Storage !== 'undefined') { " +
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
                "} " +
                "try { " +
                "localStorage.setItem('is_vip', 'true'); " +
                "localStorage.setItem('access_code', 'VIP_LIFETIME_BYPASS'); " +
                "localStorage.setItem('access_code_expires', '2099-12-31T23:59:59.999Z'); " +
                "} catch(e) {} " +
                "if (typeof window !== 'undefined') { " +
                "window.isVip = true; window.hasVipAccess = true; " +
                "} } catch(e) {}"
            )
        }

        // 2. Block Ads & Declutter (targeted nested iframe ad-shield)
        if (isAdBlockEnabled) {
            parts.add(
                "try { " +
                "if (typeof document !== 'undefined') { " +
                "var injectAdBlock = function() { " +
                "if (!document.getElementById('movix-ad-shield-style')) { " +
                "var adSt = document.createElement('style'); adSt.id = 'movix-ad-shield-style'; " +
                "adSt.innerHTML = '.ad-banner, .banner-ad, [class*=ad-], [id*=ad-], [class*=sponsor], [class*=popup], iframe[src*=ad], [id*=pop], .popunder { display: none !important; opacity: 0 !important; pointer-events: none !important; visibility: hidden !important; width: 0 !important; height: 0 !important; }'; " +
                "(document.head || document.documentElement).appendChild(adSt); " +
                "} }; " +
                "if (document.head || document.documentElement) injectAdBlock(); " +
                "else document.addEventListener('DOMContentLoaded', injectAdBlock); " +
                "} } catch(e) {}"
            )
        }

        if (parts.isEmpty()) return ""
        val combined = parts.joinToString(";\n")
        return "(function(){ try { $combined } catch(err) {} })();"
    }

    fun apply(context: BytecodePatchContext, logger: Logger) {
        val fullScript = buildUnifiedScript()
        if (fullScript.isEmpty()) return
        val escapedScript = fullScript.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", " ")

        context.classDefForEach { classDef ->
            val type = classDef.type
            if (type.contains("RNCWebViewManager")) {
                for (method in classDef.methods.toList()) {
                    if (method.name == "setInjectedJavaScriptBeforeContentLoaded" &&
                        method.parameterTypes.size == 2 &&
                        method.returnType == "V"
                    ) {
                        try {
                            // Total registers = 5:
                            // p0 = v2 (this), p1 = v3 (RNCWebViewWrapper), p2 = v4 (String)
                            // v0, v1 = dedicated local scratch registers
                            context.replaceMethod(
                                method = method,
                                registerCount = 5,
                                smaliCode = """
                                const-string v0, "$escapedScript;\n"
                                if-nez p2, :cond_skip_prepend
                                invoke-virtual {v0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
                                move-result-object p2
                                goto :cond_done_prepend
                                :cond_skip_prepend
                                move-object p2, v0
                                :cond_done_prepend
                                invoke-virtual {p1}, Lcom/reactnativecommunity/webview/RNCWebViewWrapper;->getWebView()Lcom/reactnativecommunity/webview/RNCWebView;
                                move-result-object v0
                                iput-object p2, v0, Lcom/reactnativecommunity/webview/RNCWebView;->injectedJSBeforeContentLoaded:Ljava/lang/String;
                                return-void
                                """.trimIndent()
                            )
                            logger.info("[Movix Unified] Safely hooked setInjectedJavaScriptBeforeContentLoaded on $type (registerCount=5)")
                        } catch (e: Exception) {
                            logger.warning("[Movix Unified] Failed to hook setInjectedJavaScriptBeforeContentLoaded on $type: ${e.message}")
                        }
                    }
                }
            }
        }
    }
}

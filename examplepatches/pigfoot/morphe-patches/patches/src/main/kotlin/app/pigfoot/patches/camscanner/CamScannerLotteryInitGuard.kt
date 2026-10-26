package app.pigfoot.patches.camscanner

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

internal const val LOTTERY_WEB_CLIENT = "Lcom/intsig/webview/WebViewFragment\$IsWebViewClient;"
internal const val LOTTERY_WEB_CLIENT_PIN = "424a01b5ab60296ce8794c67b559992f6c76545b0a19fe0e19d2061e94341fcb"

internal fun requireLotteryInitMethod(method: Method) {
    require(method.definingClass == LOTTERY_WEB_CLIENT && method.name == "onPageFinished" &&
        method.parameterTypes.map { it.toString() } == listOf("Landroid/webkit/WebView;", "Ljava/lang/String;") &&
        method.returnType == "V" && !AccessFlags.STATIC.isSet(method.accessFlags) && method.implementation?.registerCount == 11) {
        "Unsupported lottery initialization page-finished method"
    }
}


internal fun installLotteryInitGuard(method: MutableMethod) {
    requireLotteryInitMethod(method)
    method.addInstructions(0, lotteryInitPrefix())
}

/** Shared qualified initialization mitigation; no query, draw or reward synthesis. */
internal val lotteryInitGuardFactory = """
async function(importer, report, render, settled) {
    var diagnostic = !!report;
    report = report || {}; render = render || function() {}; settled = settled || function() {};
    var url = "https://static-cdn.camscanner.com/camscanner-mo/static/config-DAocHWAW.js";
    report.INIT_GUARD = "NOT_LOADED";
    if (!performance.getEntriesByType("resource").some(function(e) { return e.name === url; })) return;
    try {
      var mod = await importer(url), tracking = mod.L, bridge = mod.C;
      var page = tracking && Object.getOwnPropertyDescriptor(tracking,"page");
      var preload = bridge && Object.getOwnPropertyDescriptor(bridge,"watchad_lottery");
      var expectedPage = "function Vt(e,t){N=e||Nt||\"/\",t?t.device_fingerprint=localStorage.getItem(\"visitorId\")?localStorage.getItem(\"visitorId\"):\"\":t={device_fingerprint:localStorage.getItem(\"visitorId\")?localStorage.getItem(\"visitorId\"):\"\"},t.from||(t.from=he),t.from_part||(t.from_part=Xe),de?y.event_tracking({data:{type:\"page\",page_id:e,data:t},close_web:\"0\"}):Se({d:t?JSON.stringify(t):\"\",pi:N})}";
      var expectedPreload = "(u,p)=>{u=u||{};const g=Ct();p&&(p.actionId=i,ge[g]=p);const l=u.data||{};l.animation===1||l.animation===\"1\"||l.animation===!0?l.animation=\"1\":l.animation=\"0\";const I=u.close_web===1||u.close_web===\"1\"||u.close_web===!0?\"1\":\"0\",P={id:g,action:i,data:l,close_web:I};se(\"create--\".concat(i)),[\"save_img\",\"choose_single_image\"].includes(i)?U(\"api data::\"+JSON.stringify({id:P.id,action:P.action,close_web:P.close_web})):U(\"api data::\"+JSON.stringify(P)),r&&r(P)}";
      if (!page || !preload || !page.writable || !preload.writable ||
          typeof page.value !== "function" || typeof preload.value !== "function" ||
          Function.prototype.toString.call(page.value) !== expectedPage ||
          Function.prototype.toString.call(preload.value) !== expectedPreload || window.jsapi_ready !== true) {
        report.INIT_GUARD = "UNQUALIFIED_NO_CHANGE"; return;
      }
      var active = true, deadline;
      report.INIT_GUARD = diagnostic ? (document.getElementById("app") && document.getElementById("app")._vnode ? "INSTALLED_WITH_ROOT" : "INSTALLED_EARLY") : "INSTALLED";
      report.INIT_PAGE = "NOT_SEEN"; report.INIT_PRELOAD = "NOT_SEEN";
      function inRoute() { return location.pathname === "/lottery/relottery"; }
      function errorKind(e) {
        try { return ["TypeError","SecurityError","ReferenceError","RangeError","Error"].includes(e && e.name) ? e.name : "OTHER"; }
        catch (_) { return "OTHER"; }
      }
      function cleanup(expired) {
        if (!active) return;
        active = false; clearTimeout(deadline);
        function restoreOwned(owner,key,wrapper,original) {
          try {
            var descriptor = Object.getOwnPropertyDescriptor(owner,key);
            if (!descriptor || descriptor.value !== wrapper) return true;
            if (!descriptor.writable) return false;
            owner[key] = original; return true;
          } catch (_) { return false; }
        }
        var pageRestored = restoreOwned(tracking,"page",pageCall,page.value);
        var preloadRestored = restoreOwned(bridge,"watchad_lottery",preloadCall,preload.value);
        report.INIT_GUARD = (expired ? "DEADLINE_" : "OBSERVED_") +
          (pageRestored && preloadRestored ? "RESTORED" : "RELEASED_NOT_RESTORED");
        settled();
      }
      function pageCall() {
        if (!active || !inRoute() || arguments[0] !== "CSPlaytable") return Reflect.apply(page.value,this,arguments);
        report.INIT_PAGE = "ENTERED";
        try { var result = Reflect.apply(page.value,this,arguments); report.INIT_PAGE = "RETURNED"; return result; }
        catch (e) { report.INIT_PAGE = "ISOLATED_" + errorKind(e); return undefined; }
        finally { render(); }
      }
      function preloadCall() {
        var args = arguments, options = args[0];
        if (!active || !inRoute() || args.length !== 1 || !options || typeof options !== "object") return Reflect.apply(preload.value,this,args);
        var data = Object.getOwnPropertyDescriptor(options,"data");
        var close = Object.getOwnPropertyDescriptor(options,"close_web");
        var strain = data && data.value && Object.getOwnPropertyDescriptor(data.value,"prestrain");
        if (!data || !close || !strain || strain.value !== 1 || close.value !== 0) return Reflect.apply(preload.value,this,args);
        report.INIT_PRELOAD = "ENTERED";
        try { var result = Reflect.apply(preload.value,this,args); report.INIT_PRELOAD = "RETURNED"; return result; }
        catch (e) { report.INIT_PRELOAD = "ISOLATED_" + errorKind(e); return undefined; }
        finally { cleanup(false); }
      }
      tracking.page = pageCall; bridge.watchad_lottery = preloadCall;
      deadline = setTimeout(function() { cleanup(true); },30000);
    } catch (_) { report.INIT_GUARD = "UNAVAILABLE_NO_CHANGE"; }
  }
""".trimIndent()

/** Silent normal-skip entry: no DOM inspection/mutation, observer or quota request. */
internal val lotteryInitOnlyScript = """
(function(importer) {
  "use strict";
  if ((location.hostname !== "mo.camscanner.com" && location.hostname !== "www.camscanner.com") ||
      location.pathname !== "/lottery/relottery" || window.__csLotteryInitGuard) return;
  window.__csLotteryInitGuard = true;
  ($lotteryInitGuardFactory)(importer);
})(function(url) { return import(url); });
""".trimIndent()

internal fun lotteryInitPrefix(): String {
    val literal = lotteryInitOnlyScript.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n")
    return """
        if-eqz p1, :lottery_init_original
        if-eqz p2, :lottery_init_original
        const-string v0, "https://mo.camscanner.com/"
        invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
        move-result v0
        if-nez v0, :lottery_init_host
        const-string v0, "https://www.camscanner.com/"
        invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
        move-result v0
        if-eqz v0, :lottery_init_original
        :lottery_init_host
        const-string v0, "$literal"
        const/4 v1, 0x0
        invoke-virtual {p1, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
        :lottery_init_original
        nop
    """.trimIndent()
}

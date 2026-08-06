package dev.alastorkaneki.morphe.extension.chromeuserscripts;

import java.util.List;

/** Builds self-contained page-context userscript and userstyle payloads. */
public final class ScriptInjector {
    private ScriptInjector() { }

    public static String buildPayload(Userscript script, String url, boolean force) {
        String key = script.id + "@" + script.updatedAt;
        StringBuilder js = new StringBuilder("(function(){");
        js.append("const K=").append(q(key)).append(";")
          .append("window.__MonkeyScriptLoaded=window.__MonkeyScriptLoaded||{};");
        if (force) js.append("delete window.__MonkeyScriptLoaded[K];");
        js.append("if(window.__MonkeyScriptLoaded[K])return;window.__MonkeyScriptLoaded[K]=Date.now();");
        if (script.noFrames) js.append("if(top!==self)return;");
        js.append("const run=()=>{").append(api(script));
        if (Userscript.KIND_CSS.equals(script.kind)) {
            js.append("let s=document.getElementById('monkey-style-'+K);if(!s){s=document.createElement('style');")
              .append("s.id='monkey-style-'+K;(document.head||document.documentElement).appendChild(s)}s.textContent=")
              .append(q(script.source)).append(";");
        } else {
            for (String require : script.requireSources) {
                js.append("try{").append(require).append("}catch(e){console.error('[MonkeyScript @require]',e)};");
            }
            js.append("try{").append(script.source).append("}catch(e){console.error('[MonkeyScript] ',e)};");
        }
        js.append("};").append(schedule(script.runAt)).append("})();");
        return js.toString();
    }

    public static String commandMenuPayload() {
        return "(function(){const x=document.getElementById('monkey-cmds');if(x){x.remove();return;}"
                + "const a=[];Object.values(window.__MonkeyCommands||{}).forEach(v=>v.forEach(c=>a.push(c)));"
                + "const d=document.createElement('div');d.id='monkey-cmds';d.style='position:fixed;right:14px;bottom:90px;"
                + "z-index:2147483647;background:#111318;color:white;border:1px solid #7c5cff;border-radius:16px;"
                + "padding:12px;max-width:320px;font:14px system-ui;box-shadow:0 10px 30px #0008';"
                + "d.innerHTML='<b>MonkeyScript commands</b><br>';if(!a.length)d.innerHTML+='<p>No commands registered.</p>';"
                + "a.forEach(c=>{const b=document.createElement('button');b.textContent=c.n;b.style='display:block;width:100%;"
                + "margin:7px 0;padding:10px;background:#292d3a;color:white;border:0;border-radius:10px';"
                + "b.onclick=()=>{try{c.f()}finally{d.remove()}};d.appendChild(b)});document.documentElement.appendChild(d)})();";
    }

    private static String api(Userscript s) {
        StringBuilder x = new StringBuilder();
        x.append("const __id=").append(q(s.id)).append(",unsafeWindow=window;")
         .append("const GM_info={script:{name:").append(q(s.name)).append(",namespace:").append(q(s.namespace))
         .append(",version:").append(q(s.version)).append(",description:").append(q(s.description))
         .append(",matches:").append(array(s.matches)).append(",includes:").append(array(s.includes))
         .append(",grant:").append(array(s.grants)).append("},scriptHandler:'MonkeyScript',version:'1.5.0'};")
         .append("const P='__monkey:'+__id+':';const get=(k,d)=>{try{const v=localStorage.getItem(P+k);return v===null?d:JSON.parse(v)}catch(e){return d}};")
         .append("const set=(k,v)=>{try{localStorage.setItem(P+k,JSON.stringify(v))}catch(e){}return v};")
         .append("function GM_getValue(k,d){return get(k,d)}function GM_setValue(k,v){return set(k,v)}")
         .append("function GM_deleteValue(k){try{localStorage.removeItem(P+k)}catch(e){}}")
         .append("function GM_listValues(){const r=[];try{for(let i=0;i<localStorage.length;i++){const k=localStorage.key(i);if(k&&k.startsWith(P))r.push(k.slice(P.length))}}catch(e){}return r}")
         .append("function GM_addStyle(c){const s=document.createElement('style');s.textContent=c;(document.head||document.documentElement).appendChild(s);return s}")
         .append("function GM_log(){console.log('[MonkeyScript "+escapeJs(s.name)+"]',...arguments)}")
         .append("function GM_openInTab(u){return open(u,'_blank')}function GM_setClipboard(t){return navigator.clipboard?.writeText(String(t))}")
         .append("function GM_notification(o){o=typeof o==='string'?{text:o}:o||{};if('Notification'in window)Notification.requestPermission().then(p=>p==='granted'&&new Notification(o.title||")
         .append(q(s.name)).append(",{body:o.text||o.body||''}))}")
         .append("function GM_download(o,n){o=typeof o==='string'?{url:o,name:n}:o||{};const a=document.createElement('a');a.href=o.url;a.download=o.name||'';a.click()}")
         .append("function GM_registerMenuCommand(n,f){window.__MonkeyCommands=window.__MonkeyCommands||{};(window.__MonkeyCommands[__id]=window.__MonkeyCommands[__id]||[]).push({n:String(n),f});return window.__MonkeyCommands[__id].length-1}")
         .append("function GM_xmlhttpRequest(o){o=o||{};fetch(o.url,{method:o.method||'GET',headers:o.headers,body:o.data,credentials:o.anonymous?'omit':'include'}).then(async r=>{const t=await r.text();o.onload&&o.onload({status:r.status,statusText:r.statusText,responseText:t,response:t,finalUrl:r.url,responseHeaders:[...r.headers].map(v=>v.join(': ')).join('\\n')})}).catch(e=>o.onerror&&o.onerror(e));return{abort(){}}}")
         .append("const GM={info:GM_info,getValue:(k,d)=>Promise.resolve(GM_getValue(k,d)),setValue:(k,v)=>Promise.resolve(GM_setValue(k,v)),deleteValue:k=>Promise.resolve(GM_deleteValue(k)),listValues:()=>Promise.resolve(GM_listValues()),addStyle:GM_addStyle,log:GM_log,openInTab:GM_openInTab,setClipboard:GM_setClipboard,notification:GM_notification,download:GM_download,registerMenuCommand:GM_registerMenuCommand,xmlHttpRequest:GM_xmlhttpRequest};");
        return x.toString();
    }

    private static String schedule(String runAt) {
        if ("document-start".equals(runAt)) return "run();";
        if ("document-body".equals(runAt)) return "document.body?run():new MutationObserver((m,o)=>{if(document.body){o.disconnect();run()}}).observe(document.documentElement,{childList:true,subtree:true});";
        if ("document-idle".equals(runAt)) return "(document.readyState==='complete'?setTimeout(run,1):addEventListener('load',()=>setTimeout(run,1),{once:true}));";
        return "(document.readyState==='loading'?addEventListener('DOMContentLoaded',run,{once:true}):run());";
    }

    private static String array(List<String> values) {
        StringBuilder b = new StringBuilder("[");
        for (int i = 0; i < values.size(); i++) { if (i > 0) b.append(','); b.append(q(values.get(i))); }
        return b.append(']').toString();
    }

    private static String q(String value) { return '"' + escapeJs(value == null ? "" : value) + '"'; }
    private static String escapeJs(String value) {
        return value.replace("\\", "\\\\").replace("\"", "\\\"").replace("\r", "\\r")
                .replace("\n", "\\n").replace("</", "<\\/").replace("\u2028", "\\u2028").replace("\u2029", "\\u2029");
    }
}

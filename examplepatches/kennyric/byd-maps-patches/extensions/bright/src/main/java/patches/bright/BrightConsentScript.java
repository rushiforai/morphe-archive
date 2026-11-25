package patches.bright;

/** Page-local backstop for an already-loaded CMP, manual recall and same-document navigation. */
final class BrightConsentScript {
    private BrightConsentScript() {
    }

    static final String SOURCE = "(function(){"
            + "if(window.__brightConsentGuard){window.__brightConsentGuard();return;}"
            + "var hidden=[],watched=new WeakSet();"
            + "function article(){return location.protocol==='https:'&&location.hostname==='www.bright.nl'"
            + "&&(!location.port||location.port==='443')"
            + "&&/^\\/[a-z0-9-]+\\/[0-9]{3,}\\/[a-z0-9-]+\\.html$/i.test(location.pathname);}"
            + "function mark(name,on){var root=document.documentElement,value=on?'1':'0';"
            + "if(root.getAttribute(name)!==value){root.setAttribute(name,value);}}"
            + "function conceal(el){if(!el){return;}var saved=hidden.some(function(x){return x.el===el;});"
            + "if(!saved){hidden.push({el:el,value:el.style.getPropertyValue('display'),priority:el.style.getPropertyPriority('display')});}"
            + "if(el.style.getPropertyValue('display')!=='none'||el.style.getPropertyPriority('display')!=='important'){el.style.setProperty('display','none','important');}}"
            + "function restore(){hidden.forEach(function(x){if(x.el.style.getPropertyValue('display')==='none'"
            + "&&x.el.style.getPropertyPriority('display')==='important'){x.el.style.setProperty('display',x.value,x.priority);}});hidden=[];}"
            + "function check(){if(!document.documentElement){return;}var active=article();"
            + "mark('data-bright-consent-article',active);"
            + "if(!document.getElementById('bright-consent-guard-style')){"
            + "var style=document.createElement('style');style.id='bright-consent-guard-style';"
            + "style.textContent='html[data-bright-consent-scroll=\"1\"],html[data-bright-consent-scroll=\"1\"] body{overflow:auto!important;}';"
            + "document.documentElement.appendChild(style);}"
            + "var host=document.getElementById('cmpwrapper'),shadow=host&&host.shadowRoot;"
            + "var wall=shadow&&shadow.querySelector('#cmpbox[role=\"dialog\"]');"
            + "if(shadow&&!watched.has(shadow)){watched.add(shadow);new MutationObserver(check).observe(shadow,"
            + "{childList:true,subtree:true,attributes:true,attributeFilter:['style','class']});}"
            + "if(active&&wall){conceal(wall);conceal(shadow.querySelector('#cmpbox2'));}else{restore();}"
            + "var other=Array.prototype.some.call(document.querySelectorAll('[role=\"dialog\"],dialog[open]'),function(el){"
            + "return el!==host&&(!host||!host.contains(el))&&el.getClientRects().length>0&&getComputedStyle(el).visibility!=='hidden';});"
            + "mark('data-bright-consent-scroll',active&&!!wall&&!other);"
            + "}window.__brightConsentGuard=check;check();"
            + "new MutationObserver(check).observe(document.documentElement,{childList:true,subtree:true,attributes:true,attributeFilter:['style','class']});"
            + "addEventListener('popstate',check);addEventListener('hashchange',check);setInterval(check,500);"
            + "})();";
}

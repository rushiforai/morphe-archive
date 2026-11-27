package dev.rikunode.futatabi.bridge;

/** Hide only the unsupported official Google sign-in button; never alter OAuth. */
final class MebukiGoogleButton {
    static final String SCRIPT = "(function(){"+
            "if(location.origin!=='https://mebuki.moe'||location.pathname!=='/')return false;"+
            "if(window.__futatabiGoogleButtonObserver)return true;"+
            "const hide=()=>{if(location.origin!=='https://mebuki.moe'||location.pathname!=='/')return;"+
            "document.querySelectorAll('button[aria-label=\"Google \\u3067\\u30ed\\u30b0\\u30a4\\u30f3\"]').forEach(b=>{"+
            "if(b.querySelector('img[src=\"/social/google.svg\"]'))b.style.setProperty('display','none','important');});};"+
            "hide();const observer=new MutationObserver(hide);"+
            "observer.observe(document.documentElement,{childList:true,subtree:true,attributes:true,attributeFilter:['aria-label','src']});"+
            "window.__futatabiGoogleButtonObserver=observer;return true;})()";
    private MebukiGoogleButton() {}
}

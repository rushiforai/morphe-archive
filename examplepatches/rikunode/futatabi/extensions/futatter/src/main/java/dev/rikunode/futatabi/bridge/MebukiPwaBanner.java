package dev.rikunode.futatabi.bridge;

/** The official PWA component's own dismissal preference, restricted to its origin. */
final class MebukiPwaBanner {
    static final String SCRIPT="(function(){if(location.origin!=='https://mebuki.moe')return false;"+
            "try{if(localStorage.getItem('pwa-install-dismissed')==='true')return true;"+
            "localStorage.setItem('pwa-install-dismissed','true');"+
            "window.dispatchEvent(new CustomEvent('local-storage-change',{detail:{key:'pwa-install-dismissed',value:true}}));"+
            "return true;}catch(e){return false;}})()";
    private MebukiPwaBanner(){}
}

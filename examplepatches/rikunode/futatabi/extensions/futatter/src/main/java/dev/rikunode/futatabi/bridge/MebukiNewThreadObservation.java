package dev.rikunode.futatabi.bridge;

/** Read-only form observations. No field values, challenge data or request payloads leave the page. */
final class MebukiNewThreadObservation {
    static final String SCRIPT="(function(){"+MebukiNewThreadDraft.GUARD+
            "const t=document.querySelector('input[name=name]'),b=document.querySelector('textarea[name=content]'),f=b&&b.closest('form');"+
            "if(!f||!t)return null;"+
            "const s=Array.from(f.querySelectorAll('button[type=submit]')).find(e=>e.textContent.trim()==='スレッドを作成する');"+
            "const tags=Array.from(f.querySelectorAll('input[name]')).filter(e=>/^tags\\[\\d+\\]\\.name$/.test(e.name));"+
            "return {buttonFound:!!s,disabled:!!s&&s.matches(':disabled'),"+
            "tagMissing:!tags.some(e=>e.value.trim()),invalid:!!f.querySelector('[aria-invalid=true]')};})()";
    static boolean isCreatePost(String method,String scheme,String host,int port,String path) {
        return "POST".equals(method)&&"https".equals(scheme)&&"mebuki.moe".equals(host)&&
                (port==-1||port==443)&&("/app/new.data".equals(path)||"/app/new".equals(path));
    }
    private MebukiNewThreadObservation(){}
}

package dev.rikunode.futatabi.bridge;

import org.json.JSONObject;

/** In-memory handoff to the site's own new-thread form. No challenge or session data. */
final class MebukiNewThreadDraft {
    static final String URL = "https://mebuki.moe/app/new";
    static final String GUARD = "if(location.origin!=='https://mebuki.moe'||location.pathname!=='/app/new'||location.search)return false;";
    final String title, body, mime;
    final byte[] image;

    MebukiNewThreadDraft(StockReplyRequest request) {
        title = request.get("sub").trim();
        body = request.get("com").replace("\r\n","\n").replace('\r','\n');
        if (!request.get("name").isEmpty() || !request.get("email").isEmpty())
            throw new IllegalArgumentException("めぶきの名前・メール欄は空欄にしてください。");
        if (title.codePointCount(0,title.length()) > 100 || body.trim().isEmpty() ||
                body.codePointCount(0,body.length()) > 5000 || body.split("\n",-1).length > 100)
            throw new IllegalArgumentException("めぶきの題名・本文の長さを確認してください。");
        if (request.image == null || request.image.length == 0 || request.image.length > 8_000_000)
            throw new IllegalArgumentException("めぶきのスレ画は1枚（8MB以下）必要です。");
        if (request.mime == null || !request.mime.matches("image/(jpeg|png|gif|webp)"))
            throw new IllegalArgumentException("めぶきの画像形式を確認してください。");
        mime = request.mime;
        image = request.image;
    }

    private static String q(String value) {
        return JSONObject.quote(value).replace("\u2028","\\u2028").replace("\u2029","\\u2029");
    }
    static String readyScript() {
        return "(function(){"+GUARD+
                "const t=document.querySelector('input[name=name]'),b=document.querySelector('textarea[name=content]');"+
                "return !!(t&&b&&b.closest('section')&&t.closest('form')===b.closest('form')&&t.closest('form')&&document.querySelector('input[name=attachments]'));})()";
    }
    String beginScript(String key) {
        return "(function(){"+GUARD+
                "const t=document.querySelector('input[name=name]'),b=document.querySelector('textarea[name=content]');"+
                "if(!t||!b||!b.closest('section')||!t.closest('form')||t.closest('form')!==b.closest('form')||!document.querySelector('input[name=attachments]'))return false;"+
                "function fill(el,proto,val){Object.getOwnPropertyDescriptor(proto,'value').set.call(el,val);el.dispatchEvent(new Event('input',{bubbles:true}));el.dispatchEvent(new Event('change',{bubbles:true}));}"+
                "fill(t,HTMLInputElement.prototype,"+q(title)+");fill(b,HTMLTextAreaElement.prototype,"+q(body)+");"+
                "window["+q(key)+"]=[];return true;})()";
    }
    static String chunkScript(String key,String chunk) {
        return "(function(){"+GUARD+"const a=window["+q(key)+"];if(!Array.isArray(a))return false;a.push("+q(chunk)+");return true;})()";
    }
    String finishScript(String key) {
        String filename = "attachment."+("image/jpeg".equals(mime)?"jpg":mime.substring(6));
        return "(function(){"+GUARD+
                "const a=window["+q(key)+"],b=document.querySelector('textarea[name=content]'),s=b&&b.closest('section');"+
                "if(!Array.isArray(a)||!s)return false;delete window["+q(key)+"];"+
                "const chunks=a.map(x=>Uint8Array.from(atob(x),c=>c.charCodeAt(0)));"+
                "const dt=new DataTransfer();dt.items.add(new File(chunks,"+q(filename)+",{type:"+q(mime)+"}));"+
                "s.dispatchEvent(new DragEvent('drop',{bubbles:true,cancelable:true,dataTransfer:dt}));return true;})()";
    }
}

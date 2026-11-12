package app.morphe.extension.chmate;

import java.io.IOException;
import java.util.regex.*;
import org.jsoup.nodes.*;

/** A bounded source error code, rather than arbitrary upstream HTML. */
final class BakusaiAccessError extends IOException {
    final String sourceCode;
    BakusaiAccessError(String code){
        super(message(code));sourceCode=code;
    }
    private static String message(String code){
        if(!code.matches("thr_res:[0-9]{3}"))throw new IllegalArgumentException("Invalid Bakusai error code");
        return "爆サイ接続エラー：BKS-"+code.substring(code.lastIndexOf(':')+1)+"。しばらくしてアクセスし直してください。";
    }
    String displayCode(){return "BKS-"+sourceCode.substring(sourceCode.lastIndexOf(':')+1);}
    static String code(Document doc){
        if(!doc.title().trim().matches("(?:アクセス)?エラー[｜|]爆サイ\\.com"))return null;
        Element error=doc.selectFirst(".error_code_text");
        Matcher code=Pattern.compile("\\[ERROR_CODE:(thr_res:[0-9]{3})\\]").matcher(error==null?"":error.text());
        return code.find()?code.group(1):null;
    }
}

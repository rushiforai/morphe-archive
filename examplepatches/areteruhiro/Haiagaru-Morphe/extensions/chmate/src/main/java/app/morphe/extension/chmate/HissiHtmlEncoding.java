package app.morphe.extension.chmate;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.charset.CodingErrorAction;
import java.util.regex.*;

/** Hissi serves legacy SJIS HTML with an incorrect UTF-8 HTTP header. */
final class HissiHtmlEncoding {
    private static final Pattern META=Pattern.compile("(?is)<meta\\b[^>]*charset\\s*=\\s*[\\\"']?\\s*([a-zA-Z0-9_-]+)");
    static String encoding(byte[] bytes,int length) {
        if(length>=3&&(bytes[0]&255)==239&&(bytes[1]&255)==187&&(bytes[2]&255)==191)return "UTF-8";
        // The current Hissi server advertises UTF-8 while retaining obsolete
        // Shift_JIS meta tags. Trust a strictly valid UTF-8 payload first.
        try {
            StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT)
                    .onUnmappableCharacter(CodingErrorAction.REPORT).decode(java.nio.ByteBuffer.wrap(bytes,0,length));
            return "UTF-8";
        }catch(Exception ignored){}
        Matcher meta=META.matcher(new String(bytes,0,Math.min(length,16384),StandardCharsets.ISO_8859_1));
        if(meta.find()){
            String name=meta.group(1);
            if(name.equalsIgnoreCase("UTF-8"))return "UTF-8";
            if(name.equalsIgnoreCase("EUC-JP"))return "EUC-JP";
            if(name.equalsIgnoreCase("Shift_JIS")||name.equalsIgnoreCase("SJIS")||name.equalsIgnoreCase("windows-31j"))return "Shift_JIS";
        }
        return "Shift_JIS";
    }
    static String decode(byte[] bytes){return new String(bytes,Charset.forName(encoding(bytes,bytes.length)));}
    private HissiHtmlEncoding(){}
}

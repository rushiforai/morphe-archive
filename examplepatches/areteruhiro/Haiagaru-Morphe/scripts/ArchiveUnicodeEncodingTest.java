package app.morphe.extension.chmate;

import java.nio.charset.*;
import java.util.regex.*;

public final class ArchiveUnicodeEncodingTest {
    private static int checks;
    private static void ok(boolean value){checks++;if(!value)throw new AssertionError();}
    public static void main(String[] args) {
        Charset legacy=Charset.forName("MS932");
        for(String original:new String[]{"本文𝕏😀☺️🧑‍💻𠮷<>題名𝕏\n","日本語の本文<>通常タイトル\n","&#120143; &#128512; &amp; <>記号\n"}){
            String html="<html><h1 id=threadtitle>"+original+"</h1></html>";
            ok(html.equals(ArchiveHtmlEncoding.decode(html.getBytes(StandardCharsets.UTF_8))));
            if(legacy.newEncoder().canEncode(html))ok(html.equals(ArchiveHtmlEncoding.decode(html.getBytes(legacy))));
            String dat=new String(TalkDatEncoding.encode(original),legacy);
            Matcher entity=Pattern.compile("&#(\\d+);").matcher(dat);StringBuffer decoded=new StringBuffer();
            while(entity.find())entity.appendReplacement(decoded,Matcher.quoteReplacement(new String(Character.toChars(Integer.parseInt(entity.group(1))))));
            entity.appendTail(decoded);
            if(!original.contains("&#"))ok(original.equals(decoded.toString()));
            ok(!dat.contains("�"));
        }
        String x=new String(TalkDatEncoding.encode("𝕏の設定画面"),legacy);
        ok(x.equals("&#120143;の設定画面"));
        System.out.println("PASS "+checks+" archive UTF-8/legacy/Unicode DAT encoding checks");
    }
}

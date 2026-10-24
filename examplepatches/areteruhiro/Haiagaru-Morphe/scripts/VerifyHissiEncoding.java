package app.morphe.extension.chmate;
import java.nio.charset.*;
import java.net.*;
public final class VerifyHissiEncoding {
 static int checks;
 static void check(boolean value,String label){if(!value)throw new AssertionError(label);checks++;}
 public static void main(String[]args)throws Exception{
  String japanese="必死チェッカーもどき 書き込み一覧";
  for(String declaration:new String[]{"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=Shift_JIS\">","<meta charset='SJIS'>",""}){
   byte[] raw=(declaration+japanese).getBytes(Charset.forName("Shift_JIS"));
   check(HissiHtmlEncoding.decode(raw).contains(japanese),"SJIS declaration/default");
  }
  byte[] utf=("<meta charset='UTF-8'>"+japanese).getBytes(StandardCharsets.UTF_8);
  check(HissiHtmlEncoding.decode(utf).contains(japanese),"actual UTF8 preserved");
  check(HissiHtmlEncoding.decode(("\ufeff"+japanese).getBytes(StandardCharsets.UTF_8)).contains(japanese),"UTF8 BOM");
  check(HissiHtmlEncoding.decode(new byte[0]).isEmpty(),"empty page");
  if(args.length>0){
   HttpURLConnection c=(HttpURLConnection)new URL(args[0]).openConnection();c.setConnectTimeout(10000);c.setReadTimeout(10000);
   try(var input=c.getInputStream()){
    byte[] raw=input.readAllBytes();String decoded=HissiHtmlEncoding.decode(raw);
    System.out.println("HTTP="+c.getContentType()+" actual="+HissiHtmlEncoding.encoding(raw,raw.length));
    check(decoded.contains("必死チェッカーもどき"),"live Hissi Japanese title");
    check(!decoded.contains("\ufffd"),"live page no replacement character");
   }finally{c.disconnect();}
  }
  System.out.println("PASS "+checks+" Hissi encoding checks");
 }
}

package app.morphe.extension.chmate;
import java.nio.charset.*;import java.nio.file.*;
public class NotificationDatTextTest {
 public static void main(String[] args)throws Exception {
  String text="返信 >>27 日本語・絵文字😀\nしたらば";
  for(String fallback:new String[]{"EUC-JP","MS932"}) {
   if(!text.equals(NotificationDatText.decode(text.getBytes(StandardCharsets.UTF_8),fallback)))throw new AssertionError("UTF8 "+fallback);
   String legacy="返信 >>27 日本語 したらば";
   byte[] bytes=legacy.getBytes(Charset.forName(fallback));
   if(!legacy.equals(NotificationDatText.decode(bytes,fallback)))throw new AssertionError(fallback);
   Path file=Files.createTempFile("notification-dat-", ".dat");
   try { for(byte[] data:new byte[][]{text.getBytes(StandardCharsets.UTF_8),bytes}) {
    Files.write(file,data);StringBuilder out=new StringBuilder();try(var reader=NotificationDatText.reader(file.toFile(),fallback)){char[] b=new char[7];int n;while((n=reader.read(b))!=-1)out.append(b,0,n);}
    if(!out.toString().equals(data==bytes?legacy:text))throw new AssertionError("file "+fallback);
   }}finally{Files.delete(file);}
  }
  System.out.println("PASS UTF8/EUC-JP/MS932 notification decode and streaming file reads");
 }
}

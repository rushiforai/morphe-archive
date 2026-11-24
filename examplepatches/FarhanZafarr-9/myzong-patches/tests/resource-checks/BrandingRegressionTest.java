import app.zonghome.patches.CharcoalResources;
import java.util.*;
import java.util.zip.*;
import java.nio.charset.StandardCharsets;
public class BrandingRegressionTest {
 static byte[] read(ZipFile z,String p)throws Exception{return z.getInputStream(z.getEntry(p)).readAllBytes();}
 static void check(boolean b,String m){if(!b)throw new AssertionError(m);}
 public static void main(String[] a)throws Exception{
 try(var original=new ZipFile(a[0]);var built=new ZipFile(a[1]);var bundle=new ZipFile(a[2])){
 var e=new CharcoalResources();var t=read(original,"resources.arsc");var ids=e.resourceIds(t,Set.of("ic_launcher_background"),"drawable");
 if(a[3].equals("light"))t=e.table(t);
 var expected=e.drawableAlias(t,0x7f0804f2,ids.get("ic_launcher_background"));
 check(Arrays.equals(expected,read(built,"resources.arsc")),"Table changed beyond theme and splash alias");
 var vector=read(bundle,"branding/launcher-"+a[3]+".xml");
 UiFeedbackRegressionTest.icon(vector,a[3]);
 check((new String(vector,StandardCharsets.UTF_16LE).contains("Q108,0 108,24") || new String(vector,StandardCharsets.UTF_8).contains("Q108,0 108,24")),"Missing rounded background path");
 check(Arrays.equals(vector,read(built,"res/drawable/ic_launcher_background.xml")),"Wrong selected vector");
 System.out.println("PASS: rounded "+a[3]+" icon and splash resource alias; table changes scoped");
 }
 }
}

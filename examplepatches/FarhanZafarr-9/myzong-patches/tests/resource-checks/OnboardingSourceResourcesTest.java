import app.zonghome.patches.CharcoalResources;
import java.util.*;
import java.util.zip.*;
import java.nio.*;
public class OnboardingSourceResourcesTest {
 static byte[] read(ZipFile z,String n)throws Exception{var e=z.getEntry(n);if(e==null)throw new AssertionError(n);return z.getInputStream(e).readAllBytes();}
 static int u16(ByteBuffer b,int p){return Short.toUnsignedInt(b.getShort(p));}
 static List<Integer> fills(byte[] xml){
 var b=ByteBuffer.wrap(xml).order(ByteOrder.LITTLE_ENDIAN);int[] ids=null;var colors=new ArrayList<Integer>();
 for(int at=u16(b,2);at<xml.length;at+=b.getInt(at+4)){
 int kind=u16(b,at),size=b.getInt(at+4);
 if(kind==0x180){ids=new int[(size-8)/4];for(int i=0;i<ids.length;i++)ids[i]=b.getInt(at+8+i*4);}
 if(kind!=0x102)continue;
 int first=at+16+u16(b,at+24),stride=u16(b,at+26),count=u16(b,at+28);
 for(int i=0;i<count;i++){int p=first+i*stride,name=b.getInt(p+4);if(ids!=null && name>=0 && name<ids.length && ids[name]==0x01010404)colors.add(b.getInt(p+16));}
 }return colors;
 }
 public static void main(String[] args)throws Exception{
 try(var z=new ZipFile(args[0])){
 var editor=new CharcoalResources();byte[] table=read(z,"resources.arsc");int target=editor.resourceIds(table,Set.of("ic_launcher_background"),"drawable").get("ic_launcher_background");
 byte[] alias=editor.drawableAlias(table,0x7f0804f2,target);if(alias.length!=table.length||Arrays.equals(alias,table))throw new AssertionError("Alias missing or table resized");
 byte[] map=read(z,"res/drawable/ic_illustration_one.xml");var baseline=fills(editor.xml(map,"res/drawable/unchanged_artwork.xml",false));var changed=fills(editor.xml(map,"res/drawable/ic_illustration_one.xml",false));
 if(changed.isEmpty() || changed.get(0)!=0 || !changed.subList(1,changed.size()).equals(baseline.subList(1,baseline.size())))throw new AssertionError("Illustration edits escaped its backdrop");
 var second=editor.drawableAlias(alias,0x7f0804f2,target);if(!Arrays.equals(second,alias))throw new AssertionError("Alias not idempotent");
 System.out.println("PASS: stock splash alias exists/idempotent; map backdrop alone is transparent with remaining artwork preserved");
 }
 }
}

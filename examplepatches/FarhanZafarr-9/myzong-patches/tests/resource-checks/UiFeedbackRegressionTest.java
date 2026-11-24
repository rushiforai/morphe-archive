import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.*;
import java.io.*;
import java.nio.*;
import java.util.*;
import java.util.zip.*;

/** Validate the icon's actual drawable payload, not just equality with a broken fixture. */
public final class UiFeedbackRegressionTest {
    static void check(boolean condition,String message) { if(!condition)throw new AssertionError(message); }
    static int u16(ByteBuffer bytes,int offset){return Short.toUnsignedInt(bytes.getShort(offset));}
    static void icon(byte[] xml,String variant) {
        ByteBuffer b=ByteBuffer.wrap(xml).order(ByteOrder.LITTLE_ENDIAN);
        check(u16(b,0)==3 && b.getInt(4)==xml.length,"Not compiled XML");
        int[] resources=null;Set<Integer> dimensions=new HashSet<>();List<Integer> colors=new ArrayList<>();int paths=0;
        for(int offset=u16(b,2);offset<xml.length;offset+=b.getInt(offset+4)) {
            int type=u16(b,offset),length=b.getInt(offset+4);
            check(length>=8 && offset+length<=xml.length,"Broken XML chunk");
            if(type==0x180) {
                resources=new int[(length-8)/4];
                for(int i=0;i<resources.length;i++)resources[i]=b.getInt(offset+8+i*4);
            }
            if(type!=0x102)continue;
            int first=offset+16+u16(b,offset+24),stride=u16(b,offset+26),count=u16(b,offset+28);
            for(int i=0;i<count;i++) {
                int at=first+i*stride,name=b.getInt(at+4),value=b.getInt(at+16),valueType=Byte.toUnsignedInt(b.get(at+15));
                int attr=resources!=null && name>=0 && name<resources.length?resources[name]:0;
                if(Set.of(0x01010155,0x01010159,0x01010402,0x01010403).contains(attr)) {
                    check(value!=0,"Zero vector dimension");dimensions.add(attr);
                }
                if(attr==0x01010404)colors.add(value);
                if(attr==0x01010405){check(valueType==3 && value>=0,"Missing vector path string");paths++;}
            }
        }
        check(dimensions.size()==4,"AAPT stripped vector dimensions; wrong resource version extracted");
        check(paths==2,"AAPT stripped vector path data");
        List<Integer> expected=variant.equals("light")?List.of(0xffeeece6,0xff242424):List.of(0xff242424,0xffeeece6);
        check(colors.equals(expected),"Wrong Light/Dark colors: "+colors);
    }
    public static void main(String[] args)throws Exception {
        try(ZipFile bundle=new ZipFile(args[1])) {
            for(String variant:List.of("light","dark"))icon(bundle.getInputStream(bundle.getEntry("branding/launcher-"+variant+".xml")).readAllBytes(),variant);
        }
        Set<String> found=new HashSet<>();
        Set<String> needed=Set.of("getItemAnimator","setSupportsChangeAnimations","getItemRippleColor","setItemRippleColor");
        try(ZipFile original=new ZipFile(args[0])) {
            for(var entry:Collections.list(original.entries())) {
                if(!entry.getName().matches("classes[0-9]*\\.dex"))continue;
                var dex=DexBackedDexFile.fromInputStream(Opcodes.getDefault(),new BufferedInputStream(original.getInputStream(entry)));
                for(var type:dex.getClasses()) {
                    // R8 moves SimpleItemAnimator to a renamed root-package class in this APK.
                    for(var method:type.getMethods())if(needed.contains(method.getName()))found.add(method.getName());
                }
            }
        }
        check(found.containsAll(needed),"Native animation/ripple API missing: "+needed.stream().filter(name->!found.contains(name)).toList());
        System.out.println("PASS: both launcher vectors have dimensions, two paths and correct colors; native ripple/change-animation APIs exist");
    }
}

import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.util.*;
import java.util.zip.*;
import java.nio.*;

public class InspectUserAgentBuilders {
 public static void main(String[] args)throws Exception{
  for(String apk:args)try(ZipFile z=new ZipFile(apk)){
   System.out.println("APK "+apk);
   for(var entry:Collections.list(z.entries()))if(entry.getName().matches("classes[0-9]*\\.dex")){
    byte[] bytes;try(var in=z.getInputStream(entry)){bytes=in.readAllBytes();}
    for(ClassDef cls:new DexBackedDexFile(Opcodes.getDefault(),ByteBuffer.wrap(bytes)).getClasses()){
     if(cls.getType().equals("Lo/zzdA;")||cls.getType().equals("Lo/zzcvq;"))for(Method m:cls.getMethods())if(m.getName().equals("<init>")){
      System.out.println("REQUEST_CTOR "+m);
      int n=0;for(var ins:m.getImplementation().getInstructions())if(n++<15)System.out.println(" STEP "+ins.getOpcode()+" "+(ins instanceof OneRegisterInstruction r?"A="+r.getRegisterA():"")+" "+(ins instanceof TwoRegisterInstruction r?"B="+r.getRegisterB():"")+" "+(ins instanceof ReferenceInstruction r?r.getReference():"")+" "+(ins instanceof WideLiteralInstruction r?r.getWideLiteral():""));
      for(var ins:m.getImplementation().getInstructions())if(ins instanceof ReferenceInstruction r&&r.getReference() instanceof FieldReference f)System.out.println(" ASSIGN "+ins.getOpcode()+" "+f);
     }
     if(cls.getType().equals("Lokhttp3/Headers;")||cls.getType().equals("Lo/r8lambda17vlhACr7B0IDgCdn1Q67LKhir8;")){
      System.out.println("TYPE "+cls.getType());
      for(Field f:cls.getInstanceFields())System.out.println(" FIELD "+f);
      for(Method m:cls.getMethods())if(m.getName().equals("<init>"))System.out.println(" CTOR "+m);
     }
     for(Method m:cls.getMethods())if(m.getImplementation()!=null){
      boolean match=false;
      boolean scheme=false,host=false;
      for(var ins:m.getImplementation().getInstructions())if(ins instanceof ReferenceInstruction r&&r.getReference() instanceof StringReference s){if(s.getString().equals("url == null"))match=true;if(s.getString().equals("scheme == null"))scheme=true;if(s.getString().equals("host == null"))host=true;}
      if(scheme&&host&&m.getParameterTypes().isEmpty())System.out.println("HTTP_URL_TYPE="+m.getReturnType());
      if(!match)continue;
      System.out.println("BUILDER "+m);
      for(Field f:cls.getInstanceFields())System.out.println(" FIELD "+f);
      for(Method method:cls.getMethods())if(method.getParameterTypes().size()==2&&method.getParameterTypes().stream().allMatch(p->p.toString().equals("Ljava/lang/String;")))System.out.println(" HEADER "+method);
      for(var ins:m.getImplementation().getInstructions())if(ins instanceof ReferenceInstruction r&&r.getReference() instanceof MethodReference ref)System.out.println(" CALL "+ref);
     }
    }
   }
  }
 }
}

import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import java.util.*;
public class VerifyThumbnailGalleryHook {
 static List<String> normalized(Method m,boolean patched){
  var code=new ArrayList<Instruction>();m.getImplementation().getInstructions().forEach(code::add);
  var rendered=VerifyAutoNgIdMenuHooks.instructions(m);var offsets=new HashMap<Integer,Integer>();
  var skip=new HashSet<Integer>();if(patched)for(int i=0;i<rendered.size();i++)if(rendered.get(i).contains("ThumbnailClickAttachments;->links")){skip.add(i);skip.add(i+1);}
  if(patched&&skip.size()!=2)throw new AssertionError("Expected attachment bridge");
  int address=0,ordinal=0;for(int i=0;i<code.size();i++){if(!skip.contains(i))offsets.put(address,ordinal++);address+=code.get(i).getCodeUnits();}
  var result=new ArrayList<String>();address=0;for(int i=0;i<code.size();i++){
   if(!skip.contains(i)){String value=rendered.get(i);if(code.get(i) instanceof OffsetInstruction branch){Integer target=offsets.get(address+branch.getCodeOffset());if(target==null)throw new AssertionError("Branch into injected code");value=value.replaceAll(" offset-?[0-9]+$"," target"+target);}result.add(value);}
   address+=code.get(i).getCodeUnits();
  }return result;
 }
 public static void main(String[] a)throws Exception{
  ClassDef before=VerifyAutoNgIdMenuHooks.load(a[0],"Lo/zzbhe;"),after=VerifyAutoNgIdMenuHooks.load(a[1],"Lo/zzbhe;");
  Method orig=null,delegate=null,wrapper=null;
  for(Method m:before.getMethods())if(m.getName().equals("onClick"))orig=m;
  for(Method m:after.getMethods()){if(m.getName().equals("onClick"))wrapper=m;if(m.getName().equals("haiagaruNativeThumbnailClick"))delegate=m;}
  if(orig==null||delegate==null||wrapper==null)throw new AssertionError("Missing methods");
  var old=normalized(orig,false);var retained=normalized(delegate,true);
  if(!old.equals(retained)||orig.getImplementation().getRegisterCount()!=delegate.getImplementation().getRegisterCount())throw new AssertionError("Original thumbnail instructions or branch targets changed");
  var code=VerifyAutoNgIdMenuHooks.instructions(wrapper);
  if(wrapper.getImplementation().getRegisterCount()!=3||code.size()!=6||!code.get(0).contains("->openThread")||!code.get(4).contains("->haiagaruNativeThumbnailClick"))throw new AssertionError("Wrapper layout");
  System.out.println("PASS 242 thumbnail wrapper and original native instructions/registers retained");
 }
}

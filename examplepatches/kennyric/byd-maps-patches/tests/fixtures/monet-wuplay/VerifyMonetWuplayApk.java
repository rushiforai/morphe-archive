package patches.monet;
import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import java.nio.file.*;import java.util.*;import java.util.zip.*;import java.io.*;
/** Independent full-APK audit, derived from upstream verification under GPL-3.0; see NOTICE. */
public final class VerifyMonetWuplayApk {
 static void require(boolean ok,String message){if(!ok)throw new AssertionError(message);}
 static String ref(Instruction i){return MonetWuplayHooks.ref(i);}
 static Object initial(Field f){return f.getInitialValue()!=null?f.getInitialValue():com.android.tools.smali.dexlib2.immutable.value.ImmutableEncodedValueFactory.defaultValueForType(f.getType());}
 static void call(List<Instruction> code,int index,String name,int... registers){
  require(code.get(index).getOpcode()==Opcode.INVOKE_STATIC&&ref(code.get(index)).startsWith(MonetWuplayHooks.EXTENSION+"->"+name+"("),"Wrong callback "+name);
  FiveRegisterInstruction i=(FiveRegisterInstruction)code.get(index);int[] r={i.getRegisterC(),i.getRegisterD(),i.getRegisterE(),i.getRegisterF(),i.getRegisterG()};
  require(i.getRegisterCount()==registers.length,"Wrong argument count");for(int n=0;n<registers.length;n++)require(r[n]==registers[n],"Wrong register");
 }
 static List<ClassDef> read(String path)throws Exception {List<ClassDef> result=new ArrayList<>();
  try(ZipFile zip=new ZipFile(path)){for(ZipEntry e:Collections.list(zip.entries()))if(e.getName().matches("classes[0-9]*\\.dex"))
   try(BufferedInputStream in=new BufferedInputStream(zip.getInputStream(e))){result.addAll(DexBackedDexFile.fromInputStream(null,in).getClasses());}}
  return result;
 }
    public static void mutation(Method original,Method actual) {
        Method patched=actual;
        var before=MonetWuplayHooks.instructions(original); var after=MonetWuplayHooks.instructions(patched);
        require(original.getAccessFlags()==patched.getAccessFlags() && original.getImplementation().getRegisterCount()==patched.getImplementation().getRegisterCount(),"Native flags/registers changed");
        var restored=new MutableMethod(patched); var nativeCode=new MutableMethod(original).getImplementation().getInstructions(); var code=restored.getImplementation();
        String s=original.toString();
        if(s.equals(MonetWuplayHooks.STATE)) {
            require(after.size()==before.size()+2,"State size changed");
            call(after,382,"selection",6);call(after,535,"rowItems",3,9);call(after,549,"matches",13,9);
            call(after,552,"matchesChannel",1,9,10);call(after,565,"hidden",4,6);
            call(after,902,"sources",11,10,9,12);call(after,913,"sources",3,10,1,12);
            for(int[] pair:new int[][]{{913,911},{902,900},{565,563},{552,550},{549,547},{382,382}})code.replaceInstruction(pair[0],nativeCode.get(pair[1]));
            code.removeInstruction(536);code.removeInstruction(535);
        } else if(s.equals(MonetWuplayHooks.MODEL)) {
            require(after.size()==before.size()+3 && ref(after.get(225)).contains("->wrap("),"Missing revision flow");
            var range=(RegisterRangeInstruction)after.get(225);
            require(range.getStartRegister()==54 && range.getRegisterCount()==1 && ((OneRegisterInstruction)after.get(226)).getRegisterA()==15
                && ref(after.get(227)).equals("La/ap1;"),"Wrong flow registers/types");
            var oldStore=(ThreeRegisterInstruction)before.get(225); var newStore=(ThreeRegisterInstruction)after.get(228);
            require(newStore.getRegisterA()==15 && oldStore.getRegisterB()==newStore.getRegisterB() && oldStore.getRegisterC()==newStore.getRegisterC(),"Flow array store changed");
            code.removeInstruction(228);code.removeInstruction(227);code.removeInstruction(226);code.replaceInstruction(225,nativeCode.get(225));
        } else if(s.equals(MonetWuplayHooks.FILTER)) {
            require(after.size()==before.size(),"Filter size changed");call(after,118,"disabled",2,14);code.replaceInstruction(118,nativeCode.get(118));
        } else if(s.equals(MonetWuplayHooks.OWNER)) {
            require(after.size()==before.size()+2,"Owner size changed");call(after,7,"owner",2);
            code.removeInstruction(8);code.removeInstruction(7);code.replaceInstruction(7,nativeCode.get(7));
        } else if(s.equals(MonetWuplayHooks.HEADER)) {
            require(after.size()==before.size()+2,"Header size changed");call(after,113,"contentLabel",7,2);
            code.removeInstruction(114);code.removeInstruction(113);
        } else if(s.equals(MonetWuplayHooks.PICKER)) {
            require(after.size()==before.size()+1 && ref(after.get(398)).contains("->preparePicker(") && ref(after.get(399)).contains("->contentPicker("),"Picker hooks missing");
            var capture=(RegisterRangeInstruction)after.get(398);var picker=(RegisterRangeInstruction)after.get(399);
            require(capture.getStartRegister()==28 && capture.getRegisterCount()==1 && picker.getStartRegister()==4 && picker.getRegisterCount()==18,"Picker range/row changed");
            code.removeInstruction(398);code.replaceInstruction(398,nativeCode.get(398));
        } else {
            boolean reader=s.equals(MonetWuplayHooks.READER),programs=s.equals(MonetWuplayHooks.PROGRAMS),resume=s.equals(MonetWuplayHooks.RESUME);
            require(after.size()==before.size()+1,"Entry hook size changed");
            var range=(RegisterRangeInstruction)after.get(0);
            require(range.getStartRegister()==(reader?31:programs?8:resume?15:6) && range.getRegisterCount()==(reader?4:1),"Wrong entry receiver/parameters");
            String owner=reader||programs?MonetWuplayHooks.EXTENSION:"Lnl/johninnl/monetwuplay/WuplayCatalogRefresh;";
            String name=reader?"reader":programs?"programs":resume?"resume":"pause";
            require(ref(after.get(0)).startsWith(owner+"->"+name+"("),"Wrong entry hook");
            code.removeInstruction(0);
        }
        require(MonetWuplayHooks.fingerprint(restored).equals(MonetWuplayHooks.fingerprint(new MutableMethod(original))),"Unrelated native instructions/branches changed: "+s);
    }
 public static void main(String[] args)throws Exception {
  List<ClassDef> original=read(args[0]),patched=read(args[1]);MonetWuplayHooks.validate(original);
  Map<String,ClassDef> originals=new HashMap<>();for(ClassDef c:original)require(originals.put(c.getType(),c)==null,"Duplicate original class");
  Set<String> seen=new HashSet<>(),callbacks=new HashSet<>(),calls=new HashSet<>();int hooks=0,extensions=0;
  for(ClassDef c:patched){require(seen.add(c.getType()),"Duplicate patched class");ClassDef old=originals.get(c.getType());
   if(old==null){require(c.getType().startsWith("Lnl/johninnl/monetwuplay/"),"Unexpected added class "+c.getType());extensions++;
    for(Method m:c.getMethods())if((m.getAccessFlags()&9)==9)callbacks.add(m.toString());continue;}
   require(old.getAccessFlags()==c.getAccessFlags()&&Objects.equals(old.getSuperclass(),c.getSuperclass())&&old.getInterfaces().equals(c.getInterfaces()),"Class ABI changed");
   Map<String,Field> fields=new HashMap<>();for(Field f:old.getFields())fields.put(f.toString(),f);int fieldCount=0;
   for(Field f:c.getFields()){fieldCount++;Field originalField=fields.get(f.toString());
    require(originalField!=null&&originalField.getAccessFlags()==f.getAccessFlags()&&Objects.equals(initial(originalField),initial(f)),"Native field changed: "+f);
   }require(fieldCount==fields.size(),"Native field removed");
   Map<String,Method> methods=new HashMap<>();for(Method m:old.getMethods())methods.put(m.toString(),m);int count=0;
   for(Method m:c.getMethods()){count++;Method before=methods.get(m.toString());require(before!=null,"New native method");require(before.getAccessFlags()==m.getAccessFlags(),"Method flags changed");
    require((before.getImplementation()==null)==(m.getImplementation()==null),"Native body availability changed");
    if(MonetWuplayHooks.TARGETS.contains(m.toString())){mutation(before,m);hooks++;for(Instruction i:MonetWuplayHooks.instructions(m))if(ref(i).startsWith("Lnl/johninnl/monetwuplay/"))calls.add(ref(i));}
    else if(before.getImplementation()!=null)require(MonetWuplayHooks.fingerprint(before).equals(MonetWuplayHooks.fingerprint(m)),"Unrelated method changed: "+m);
   }require(count==methods.size(),"Native method removed");
  }
  require(seen.containsAll(originals.keySet())&&hooks==8&&extensions>0,"Incomplete hooks/classes");require(callbacks.containsAll(calls),"Missing extension callback");
  int unchanged=0;try(ZipFile a=new ZipFile(args[0]);ZipFile b=new ZipFile(args[1])){for(ZipEntry e:Collections.list(a.entries())){
   String n=e.getName();if(e.isDirectory()||n.startsWith("META-INF/")||n.equals("AndroidManifest.xml")||n.equals("resources.arsc")||n.matches("classes[0-9]*\\.dex"))continue;
   require(b.getEntry(n)!=null,"Missing entry "+n);try(InputStream x=a.getInputStream(e);InputStream y=b.getInputStream(b.getEntry(n))){require(Arrays.equals(x.readAllBytes(),y.readAllBytes()),"Changed non-DEX entry "+n);}unchanged++;}}
  System.out.println("PASS: "+original.size()+" native classes; eight exact additive hooks; "+extensions+" owned extension classes; "+unchanged+" unchanged non-DEX/non-signature entries");
 }
}

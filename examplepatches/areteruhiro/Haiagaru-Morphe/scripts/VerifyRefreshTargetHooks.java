import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.util.*;
import java.util.zip.*;

/** Compare injected paths to the preceding verified candidate; no register rewriting allowed. */
public final class VerifyRefreshTargetHooks {
 static final String R="Lapp/morphe/extension/chmate/RefreshTargets;",W="Ljp/syoboi/a2chMate/autocheck/AutoCheckWork;";
 static Map<String,ClassDef> read(String path)throws Exception{var result=new HashMap<String,ClassDef>();try(var z=new ZipFile(path)){for(var e:Collections.list(z.entries()))if(e.getName().matches("classes[0-9]*\\.dex")){byte[] bytes;try(var in=z.getInputStream(e)){bytes=in.readAllBytes();}for(var c:new DexBackedDexFile(Opcodes.getDefault(),java.nio.ByteBuffer.wrap(bytes)).getClasses())result.put(c.getType(),c);}}return result;}
 static Method method(ClassDef c,String name){return java.util.stream.StreamSupport.stream(c.getMethods().spliterator(),false).filter(m->m.getName().equals(name)).findFirst().orElseThrow();}
 static String sig(Instruction i){String s=i.getOpcode().name();if(i instanceof ReferenceInstruction x)s+=" "+x.getReference();if(i instanceof FiveRegisterInstruction x)s+=" "+List.of(x.getRegisterCount(),x.getRegisterC(),x.getRegisterD(),x.getRegisterE(),x.getRegisterF(),x.getRegisterG());else if(i instanceof RegisterRangeInstruction x)s+=" "+x.getStartRegister()+":"+x.getRegisterCount();else if(i instanceof ThreeRegisterInstruction x)s+=" "+x.getRegisterA()+":"+x.getRegisterB()+":"+x.getRegisterC();else if(i instanceof TwoRegisterInstruction x)s+=" "+x.getRegisterA()+":"+x.getRegisterB();else if(i instanceof OneRegisterInstruction x)s+=" "+x.getRegisterA();if(i instanceof WideLiteralInstruction x)s+=" #"+x.getWideLiteral();return s;}
 static List<Instruction> ins(Method m){var out=new ArrayList<Instruction>();m.getImplementation().getInstructions().forEach(out::add);return out;}
 static void same(Method before,Method after,boolean strip){if(before.getImplementation().getRegisterCount()!=after.getImplementation().getRegisterCount())throw new AssertionError("register count "+after);var expected=ins(before).stream().map(VerifyRefreshTargetHooks::sig).toList();var actual=new ArrayList<String>();var all=ins(after);int hooks=0;for(int i=0;i<all.size();i++){var op=all.get(i);if(strip&&op instanceof ReferenceInstruction x&&x.getReference() instanceof MethodReference call&&call.getDefiningClass().equals(R)){hooks++;int size=switch(call.getName()){case "mark"->1;case "filter"->3;case "download","keywords"->2;default->throw new AssertionError(call);};i+=size-1;}else actual.add(sig(op));}if(!expected.equals(actual))throw new AssertionError("native instructions changed "+after);if(strip&&hooks!=(after.getName().equals("<init>")?1:3))throw new AssertionError("hook count "+hooks);}
 public static void main(String[]args)throws Exception{
  String v=args[0];var before=read(args[1]);var after=read(args[2]);
  same(method(before.get(W),"<init>"),method(after.get(W),"<init>"),true);same(method(before.get(W),"doWork"),method(after.get(W),"doWork"),true);
  String owner=v.equals("191")?"Lo/n9;":v.equals("226")?"Lo/getTileModeX;":"Lo/PackageSignatureVerifier;";
  var clone=method(after.get(owner),"haiagaruNativeConfirmPost");Method original=null;for(var m:before.get(owner).getMethods())if(m.getName().equals(clone.getName()))throw new AssertionError("preexisting clone");else if(m.getParameterTypes().equals(clone.getParameterTypes())&&m.getReturnType().equals("V"))original=m;
  same(Objects.requireNonNull(original),clone,false);Method wrapper=null;for(var m:after.get(owner).getMethods())if(m.getName().equals(original.getName())&&m.getParameterTypes().equals(original.getParameterTypes()))wrapper=m;if(ins(wrapper).size()!=3||wrapper.getImplementation().getRegisterCount()!=3)throw new AssertionError("confirmation wrapper changed");
  var body=ins(method(after.get(W),"doWork"));int filter=-1,firstGroup=-1;for(int i=0;i<body.size();i++)if(body.get(i) instanceof ReferenceInstruction x&&x.getReference() instanceof MethodReference call){if(call.getDefiningClass().equals(R)&&call.getName().equals("filter"))filter=i;if(v.equals("242")&&call.getDefiningClass().equals(W)&&call.getName().equals("b")&&call.getParameterTypes().equals(List.of("Ljava/util/List;")))firstGroup=i;}
  if(v.equals("242")&&!(filter>=0&&filter<firstGroup))throw new AssertionError("filter must precede board grouping");
  String reader=v.equals("191")?"Lo/getLabel;":v.equals("226")?"Lo/OpenJSSEPlatformCompanion;":"Lo/getHostAppName;";
  var delegate=method(after.get(reader),"haiagaruNativeReplyDownload");Method previous=null;for(var m:before.get(reader).getMethods())if(m.getImplementation()!=null)for(var i:m.getImplementation().getInstructions())if(i instanceof ReferenceInstruction ref&&ref.getReference().toString().equals("notifyReplySound"))previous=m;
  if(previous==null||previous.getImplementation().getRegisterCount()!=delegate.getImplementation().getRegisterCount())throw new AssertionError("reader registers");
  var oldCode=ins(previous);var newCode=ins(delegate);if(oldCode.size()!=newCode.size())throw new AssertionError("reader instruction count");int changed=0;
  for(int i=0;i<oldCode.size();i++)if(!sig(oldCode.get(i)).equals(sig(newCode.get(i)))){
   changed++;if(!(newCode.get(i) instanceof ReferenceInstruction x)||!x.getReference().toString().contains("ThreadWatchNative;->emit"))throw new AssertionError("unexpected reader change");
   if(!(oldCode.get(i) instanceof RegisterRangeInstruction a)||!(newCode.get(i) instanceof RegisterRangeInstruction b)||a.getStartRegister()!=b.getStartRegister()||a.getRegisterCount()!=b.getRegisterCount())throw new AssertionError("native notification arguments changed");
  }
  if(changed!=1)throw new AssertionError("one native notification replacement required");
  Method guarded=null;for(var m:after.get(reader).getMethods())if(m.getName().equals(previous.getName())&&m.getParameterTypes().equals(previous.getParameterTypes())&&m.getReturnType().equals(previous.getReturnType()))guarded=m;
  if(guarded==null||guarded.getImplementation().getTryBlocks().isEmpty())throw new AssertionError("missing reader finally "+guarded);
  if(v.equals("242"))for(String callback:List.of("Lo/zzamr;","Lo/zzand;")){
   var oldClick=method(before.get(callback),"c");var newClick=method(after.get(callback),"c");if(oldClick.getImplementation().getRegisterCount()!=newClick.getImplementation().getRegisterCount())throw new AssertionError("tablet registers");
   if(!ins(oldClick).stream().map(VerifyRefreshTargetHooks::sig).toList().equals(ins(newClick).stream().skip(6).map(VerifyRefreshTargetHooks::sig).toList()))throw new AssertionError("tablet original click changed");
  }
  System.out.println("PASS "+v+": native registers/instructions retained, 1 constructor + 3 worker hooks, original confirmation retained, 242 grouping scope");
 }
}

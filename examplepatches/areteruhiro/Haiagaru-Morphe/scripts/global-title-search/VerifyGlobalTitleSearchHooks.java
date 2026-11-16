import com.android.tools.smali.dexlib2.*;import com.android.tools.smali.dexlib2.dexbacked.*;import com.android.tools.smali.dexlib2.iface.*;import com.android.tools.smali.dexlib2.iface.instruction.*;import com.android.tools.smali.dexlib2.iface.reference.*;import java.util.*;import java.util.zip.*;
public final class VerifyGlobalTitleSearchHooks {
 static final String HOME_ACTIVITY="Ljp/syoboi/a2chMate/activity/HomeActivity;";
 static final Set<String> HOME=Set.of("Lo/r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk;","Ljp/syoboi/a2chMate/fragment/HomeFragment;","Ljp/syoboi/a2chMate/ui/home/HomeFragment;");
 static List<Instruction> code(Method m){var out=new ArrayList<Instruction>();m.getImplementation().getInstructions().forEach(out::add);return out;}
 static boolean calls(Instruction i,String name){return i instanceof ReferenceInstruction r&&r.getReference().toString().contains("->"+name+"(");}
 static void verifyHome(Map<String,ClassDef> before,Map<String,ClassDef> after){
  var owner=after.values().stream().filter(c->HOME.contains(c.getType())).filter(c->{for(var m:c.getMethods())if(m.getName().equals("haiagaruNativeGlobalClick"))return true;return false;}).findFirst().orElseThrow();
  Method delegate=null,wrapper=null;
  for(var m:owner.getMethods())if(m.getImplementation()!=null){var body=code(m);if(m.getName().equals("haiagaruNativeGlobalClick"))delegate=m;else if(body.size()==6&&calls(body.get(4),"haiagaruNativeGlobalClick"))wrapper=m;}
  if(delegate==null||wrapper==null)throw new AssertionError("saved-search HOME click wrapper missing");
  Method original=null;
  for(var m:before.get(owner.getType()).getMethods())if(m.getName().equals(wrapper.getName())&&m.getParameterTypes().equals(wrapper.getParameterTypes()))original=m;
  var outer=code(wrapper);var fallback=(RegisterRangeInstruction)outer.get(4);boolean modern=wrapper.getParameterTypes().size()==1;int words=modern?2:6;
  var listener=(FiveRegisterInstruction)outer.get(0);
  if(!calls(outer.get(0),modern?"click":"legacyClick")||listener.getRegisterC()!=1||listener.getRegisterD()!=2||(!modern&&listener.getRegisterE()!=4)
     ||fallback.getStartRegister()!=1||fallback.getRegisterCount()!=words||outer.get(2).getOpcode()!=Opcode.IF_EQZ
     ||((OffsetInstruction)outer.get(2)).getCodeOffset()!=outer.get(2).getCodeUnits()+outer.get(3).getCodeUnits())throw new AssertionError("HOME click argument or branch changed");
  if(original==null||original.getImplementation().getRegisterCount()!=delegate.getImplementation().getRegisterCount())throw new AssertionError("native HOME click registers changed");
  var raw=code(original);var modified=code(delegate);
  int p=0,injected=0;
  for(var expected:raw){
   if(p<modified.size()&&calls(modified.get(p),"overrideRow")){
    var invoke=(RegisterRangeInstruction)modified.get(p);
    if(invoke.getRegisterCount()!=1||((OneRegisterInstruction)modified.get(p+1)).getRegisterA()!=invoke.getStartRegister()||modified.get(p+2).getOpcode()!=Opcode.CHECK_CAST)throw new AssertionError("native row result register changed");
    p+=3;injected++;
   }
   var actual=modified.get(p++);
   if(expected.getOpcode()!=actual.getOpcode()||expected instanceof ReferenceInstruction x&&!x.getReference().toString().equals(((ReferenceInstruction)actual).getReference().toString()))throw new AssertionError("native click instruction changed at "+p+" "+expected.getOpcode()+" -> "+actual.getOpcode()+" "+(expected instanceof ReferenceInstruction r?r.getReference():"")+" -> "+(actual instanceof ReferenceInstruction r?r.getReference():""));
  }
  if(p!=modified.size()||injected!=(modern?0:1))throw new AssertionError("unexpected saved-search HOME injection");
 }

 static Map<String,ClassDef> load(String apk)throws Exception{var out=new HashMap<String,ClassDef>();try(var z=new ZipFile(apk)){for(var e:Collections.list(z.entries()))if(e.getName().matches("classes[0-9]*\\.dex"))try(var in=new java.io.BufferedInputStream(z.getInputStream(e))){for(var c:DexBackedDexFile.fromInputStream(Opcodes.getDefault(),in).getClasses())if(HOME_ACTIVITY.equals(c.getType())||HOME.contains(c.getType())||Set.of("Lo/getSdkVersion;","Lo/afterHandshake;","Lo/AXE3;").contains(c.getType()))out.put(c.getType(),c);}}return out;}
 public static void main(String[] args)throws Exception{
  var before=load(args[0]);var after=load(args[1]);int hooks=0;
  for(var c:after.values())for(var m:c.getMethods())if(m.getImplementation()!=null){var code=new ArrayList<Instruction>();m.getImplementation().getInstructions().forEach(code::add);if(code.isEmpty()||!(code.get(0) instanceof ReferenceInstruction r)||!(r.getReference() instanceof MethodReference ref)||!ref.getDefiningClass().equals("Lapp/morphe/extension/chmate/GlobalTitleSearch;"))continue;
   Method original=null;for(var old:before.get(c.getType()).getMethods())if(old.getName().equals(m.getName().equals("haiagaruNativeTitleUrl")?(c.getType().equals("Lo/AXE3;")?"c":"b"):m.getName())&&old.getParameterTypes().equals(m.getParameterTypes())&&old.getReturnType().equals(m.getReturnType()))original=old;
   if(original==null||original.getImplementation().getRegisterCount()!=m.getImplementation().getRegisterCount())throw new AssertionError("method/register preservation");
   var call=(RegisterRangeInstruction)code.get(0);int params=m.getParameterTypes().size()+1;if(call.getStartRegister()!=m.getImplementation().getRegisterCount()-params||call.getRegisterCount()!=2)throw new AssertionError("original provider/query registers");
   int prefix=ref.getName().equals("capture")?1:2;if(prefix==2&&(!(code.get(1) instanceof OneRegisterInstruction result)||code.get(1).getOpcode()!=Opcode.MOVE_RESULT_OBJECT||result.getRegisterA()!=call.getStartRegister()+1))throw new AssertionError("original TSV replacement register");
   var originalCode=new ArrayList<Instruction>();original.getImplementation().getInstructions().forEach(originalCode::add);if(code.size()!=originalCode.size()+prefix)throw new AssertionError("original instruction count");
   for(int n=0;n<originalCode.size();n++){var a=originalCode.get(n);var b=code.get(n+prefix);if(a.getOpcode()!=b.getOpcode())throw new AssertionError("native opcode changed");if(a instanceof ReferenceInstruction x&&!x.getReference().toString().equals(((ReferenceInstruction)b).getReference().toString()))throw new AssertionError("native reference changed");if(a instanceof OneRegisterInstruction x&&x.getRegisterA()!=((OneRegisterInstruction)b).getRegisterA())throw new AssertionError("native registers changed");}
   hooks++;
  }
  int wrapped=0;
  for(var c:after.values())for(var m:c.getMethods())if(m.getImplementation()!=null){
   var code=new ArrayList<Instruction>();m.getImplementation().getInstructions().forEach(code::add);
   if(code.size()!=5||!(code.get(0) instanceof ReferenceInstruction first)
       ||!first.getReference().toString().contains("->haiagaruNativeTitleUrl("))continue;
   var a=(FiveRegisterInstruction)code.get(0);var b=(FiveRegisterInstruction)code.get(2);
   if(m.getImplementation().getRegisterCount()!=3||a.getRegisterCount()!=2||a.getRegisterC()!=1||a.getRegisterD()!=2||
      b.getRegisterCount()!=3||b.getRegisterC()!=1||b.getRegisterD()!=2||b.getRegisterE()!=0
      ||!((ReferenceInstruction)code.get(2)).getReference().toString().contains("GlobalSearchHome;->url(")
      ||code.get(4).getOpcode()!=Opcode.RETURN_OBJECT)throw new AssertionError("saved-result URL wrapper register wiring");
   wrapped++;
  }
  verifyHome(args.length>2?load(args[2]):before,after);
  if(args.length>3&&args[3].equals("notification")){
   Method receive=null;
   for(var m:after.get(HOME_ACTIVITY).getMethods())if(m.getName().equals("onNewIntent")&&m.getParameterTypes().equals(List.of("Landroid/content/Intent;")))receive=m;
   if(receive==null)throw new AssertionError("HOME must receive warm completion notification");
   boolean hook=false;
   for(var i:code(receive))if(calls(i,"received")){
    var regs=(RegisterRangeInstruction)i;
    if(regs.getRegisterCount()!=2||regs.getStartRegister()!=receive.getImplementation().getRegisterCount()-2)throw new AssertionError("notification Activity/Intent argument registers");
    hook=true;
   }
   if(!hook)throw new AssertionError("warm completion notification hook missing");
  }
  if(wrapped!=1)throw new AssertionError("missing saved-result URL wrapper");
  if(hooks!=2)throw new AssertionError("expected exactly two global search hooks, got "+hooks);System.out.println("PASS native global title search: original URL/parser instructions, registers and provider/query operands retained");
 }
}

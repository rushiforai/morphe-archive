// SPDX-License-Identifier: GPL-3.0-only
package local.maps.patches;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.*;
import kotlin.Unit;
import app.morphe.patcher.extensions.InstructionExtensions;
import app.morphe.patcher.patch.BytecodePatchContext;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.*;

/** Removes only the stock collapsed-search top margin through Maps' reactive layout DSL.
 * Expanded-card spacing, START/END margins and all prior value-function cases stay native.
 * Pinned to the original AAOS26.10 implementation; no Google implementation is bundled.
 * 26.10 names: factory ion->imx, merged value functions ilf->ijv (selector field $cid), search
 * state isu->irf with expanded() = irf.f (delegates to irc.f, implemented by ird/iqt), constant
 * property txh->twh, reactive property txp->twp, dp factory tyr->txr, TOP key tsp.bb->trp.bb.
 * Google folded 26.09 ilg.a into the factory; the TOP key is now a static read, not v41.
 */
final class SearchAlignmentHooks {
    private static final String FACTORY="Limx;", PROVIDER="Lijv;";
    private static final String FACTORY_KEY="d[[Ltvx;]Ltvr;";
    private static final String VALUE_KEY="a[Ltty;]Ljava/lang/Object;";
    private static final String CONSTRUCTOR="Lijv;-><init>(I)V";
    /** irf.f() reads the expanded flag through this interface; its only implementations are pinned below. */
    private static final String SEARCH_STATE="Lirc;";
    private static final Set<String> SEARCH_STATE_IMPLEMENTATIONS=Set.of("Lird;","Liqt;");
    private static final int SEARCH_CASE=21;
    private static final Map<String,String> ORIGINAL=Map.ofEntries(
        Map.entry("Limx;->"+FACTORY_KEY,"ab53baeaa85776ca535b4ba99188f33073b9b260364cc1bddae5d166238be4d7"),
        Map.entry("Lijv;->"+VALUE_KEY,"259894c745826d1c9dec1a70b5fadc8fe81056e3f565783e026891643d946968"),
        Map.entry("Lijv;-><init>[I]V","a19e27b06f570531ee2034e2662ed7430b539ca92075094feb3a75cd2acace64"),
        Map.entry("Lijw;->a[]Ltvr;","580ff930bf744a8e68ab7a31a743af5a528aa252e63b928c0e5e77017493b86f"),
        Map.entry("Limx;-><clinit>[]V","ae896adbe719f6b8b29c283646b3a4a1b9619b444eda00c72b5a4cc015d22751"),
        Map.entry("Lmjz;-><clinit>[]V","4cdcf0299b06be80e31f2b0e34df4b953f45ba585faa26511563c4a5327e0e08"),
        Map.entry("Lirf;->f[]Z","d3145426c9075cdbb3c67ea35b0dcd27b392b8fcb9367240aeb637be3ec2593e"),
        Map.entry("Lird;->f[]Z","965543d7adfcc96055ee447efbc3ee1849e9cf1784804db2d214efc00caa9ea9"),
        Map.entry("Liqt;->f[]Z","ce8565111e6cd735a6f380940ee8c7ceac4af459b9196450c0d479084d8491c8")
    );
    // These are every original direct call, not merely the factory sites we change.
    // Their two caller-method fingerprints above pin all integer arguments to0..20.
    private static final Set<String> CALLS=Set.of(
        "Lijw;->a[]Ltvr;@00b8","Lijw;->a[]Ltvr;@00c7",
        "Limx;->"+FACTORY_KEY+"@0056","Limx;->"+FACTORY_KEY+"@006e","Limx;->"+FACTORY_KEY+"@0083",
        "Limx;->"+FACTORY_KEY+"@00db","Limx;->"+FACTORY_KEY+"@00eb","Limx;->"+FACTORY_KEY+"@023e",
        "Limx;->"+FACTORY_KEY+"@02ad","Limx;->"+FACTORY_KEY+"@038b","Limx;->"+FACTORY_KEY+"@03ef",
        "Limx;->"+FACTORY_KEY+"@04c4","Limx;->"+FACTORY_KEY+"@058a","Limx;->"+FACTORY_KEY+"@0621",
        "Limx;->"+FACTORY_KEY+"@066a","Limx;->"+FACTORY_KEY+"@067b","Limx;->"+FACTORY_KEY+"@0758",
        "Limx;->"+FACTORY_KEY+"@08f4","Limx;->"+FACTORY_KEY+"@0919","Limx;->"+FACTORY_KEY+"@093e",
        "Limx;->"+FACTORY_KEY+"@0976","Limx;->"+FACTORY_KEY+"@098a"
    );
    private static String key(Method m){return m.getName()+m.getParameterTypes()+m.getReturnType();}
    private static String fullKey(Method m){return m.getDefiningClass()+"->"+key(m);}
    private static String reference(Instruction i){return i instanceof ReferenceInstruction?((ReferenceInstruction)i).getReference().toString():"";}
    private static void require(boolean value,String message){if(!value)throw new IllegalStateException("Native search alignment schema: "+message);}
 static String fingerprint(Method m){
  StringBuilder b=new StringBuilder().append(m.getImplementation().getRegisterCount()).append('\n');
  for(var i:m.getImplementation().getInstructions()){
   b.append(i.getOpcode()).append('/').append(i.getCodeUnits());
   if(i instanceof ThreeRegisterInstruction){var x=(ThreeRegisterInstruction)i;b.append(" abc=").append(x.getRegisterA()).append(',').append(x.getRegisterB()).append(',').append(x.getRegisterC());}
   else if(i instanceof TwoRegisterInstruction){var x=(TwoRegisterInstruction)i;b.append(" ab=").append(x.getRegisterA()).append(',').append(x.getRegisterB());}
   else if(i instanceof OneRegisterInstruction)b.append(" a=").append(((OneRegisterInstruction)i).getRegisterA());
   if(i instanceof FiveRegisterInstruction){var x=(FiveRegisterInstruction)i;b.append(" args=").append(x.getRegisterCount()).append(':').append(x.getRegisterC()).append(',').append(x.getRegisterD()).append(',').append(x.getRegisterE()).append(',').append(x.getRegisterF()).append(',').append(x.getRegisterG());}
   if(i instanceof RegisterRangeInstruction){var x=(RegisterRangeInstruction)i;b.append(" range=").append(x.getStartRegister()).append(',').append(x.getRegisterCount());}
   if(i instanceof ReferenceInstruction)b.append(" ref=").append(((ReferenceInstruction)i).getReference());
   if(i instanceof WideLiteralInstruction)b.append(" literal=").append(((WideLiteralInstruction)i).getWideLiteral());
   if(i instanceof OffsetInstruction)b.append(" offset=").append(((OffsetInstruction)i).getCodeOffset());
   if(i instanceof SwitchPayload)for(var e:((SwitchPayload)i).getSwitchElements())b.append(" switch=").append(e.getKey()).append(',').append(e.getOffset());
   b.append('\n');
  }
  for(var t:m.getImplementation().getTryBlocks()){
   b.append("try=").append(t.getStartCodeAddress()).append(',').append(t.getCodeUnitCount()).append('\n');
   for(var h:t.getExceptionHandlers())b.append("catch=").append(h.getExceptionType()).append(',').append(h.getHandlerCodeAddress()).append('\n');
  }
  try{return HexFormat.of().formatHex(MessageDigest.getInstance("SHA-256").digest(b.toString().getBytes(StandardCharsets.UTF_8)));}catch(Exception e){throw new IllegalStateException(e);}
 }
    private static MutableMethod mutable(BytecodePatchContext context,String type,String key){
        MutableMethod found=null;
        for(var m:context.mutableClassDefBy(type).getMethods())if(key(m).equals(key)){
            require(found==null,"ambiguous target "+type+key);found=m;
        }
        require(found!=null,"missing target "+type+key);return found;
    }
    private static int at(List<? extends Instruction> code,int address){
        int current=0;
        for(int i=0;i<code.size();i++){if(current==address)return i;current+=code.get(i).getCodeUnits();}
        throw new IllegalStateException("Native search alignment schema: missing address "+address);
    }
    /** Read-only audit of the whole original DEX before anything is mutated. */
    static void audit(Iterable<? extends ClassDef> classes){
        Set<String> seen=new HashSet<>(),calls=new HashSet<>(),implementations=new TreeSet<>();
        ClassDef nativeProvider=null;
        for(var c:classes){
            if(c.getType().equals(PROVIDER))nativeProvider=c;
            if(c.getInterfaces().contains(SEARCH_STATE))implementations.add(c.getType());
            for(var m:c.getMethods()){
                if(m.getImplementation()==null)continue;
                String id=fullKey(m);
                if(ORIGINAL.containsKey(id)){
                    require(seen.add(id)&&ORIGINAL.get(id).equals(fingerprint(m)),"original method changed: "+id);
                }
                int address=0;
                for(var i:m.getImplementation().getInstructions()){
                    if(reference(i).equals(CONSTRUCTOR)){
                        String call=id+"@"+String.format(Locale.ROOT,"%04x",address);
                        require(i.getOpcode()==Opcode.INVOKE_DIRECT&&CALLS.contains(call)&&calls.add(call),"unowned value-function constructor: "+call);
                    }
                    address+=i.getCodeUnits();
                }
            }
        }
        require(seen.equals(ORIGINAL.keySet()),"missing pinned native methods");
        require(calls.equals(CALLS),"native constructor set changed");
        require(implementations.equals(SEARCH_STATE_IMPLEMENTATIONS),"expanded-state implementations changed: "+implementations);
        require(nativeProvider!=null&&nativeProvider.getAccessFlags()==4113&&nativeProvider.getInterfaces().equals(List.of("Ltuf;")),"value-function class changed");
        int fields=0;
        for(var field:nativeProvider.getFields()){
            fields++;require(field.getName().equals("$cid")&&field.getType().equals("I")&&field.getAccessFlags()==4114,"selector must remain private final synthetic");
        }
        require(fields==1,"extra selector fields");
    }
    /** Case 21: collapsed search TOP 0dp, expanded TOP the native 12dp imx.a. */
    static void patchValue(MutableMethod value){
        require(fullKey(value).equals(PROVIDER+"->"+VALUE_KEY),"value-function target");
        require(value.getImplementation().getRegisterCount()==5&&value.getImplementation().getTryBlocks().isEmpty(),"value-function register/try shape");
        var first=value.getImplementation().getInstructions().get(0);
        require(first.getOpcode()==Opcode.IGET&&reference(first).equals("Lijv;->$cid:I")&&((TwoRegisterInstruction)first).getRegisterA()==3&&((TwoRegisterInstruction)first).getRegisterB()==3,"selector read");
        var code=value.getImplementation().getInstructions();
        require(code.get(1).getOpcode()==Opcode.CONST_4&&((OneRegisterInstruction)code.get(1)).getRegisterA()==0
            &&code.get(2).getOpcode()==Opcode.CONST_4&&((OneRegisterInstruction)code.get(2)).getRegisterA()==1
            &&code.get(3).getOpcode()==Opcode.PACKED_SWITCH&&((OneRegisterInstruction)code.get(3)).getRegisterA()==3,"stock constants/switch prologue");

        // Insert before the original constants/switch. On every original0..20 path,
        // v3 still holds the selector and the original next instructions reset v0/v1.
        // Neither the original default20 nor any old switch branch is rewritten.
        InstructionExtensions.INSTANCE.addInstructionsWithLabels(value,1,
            "const/16 v0, "+SEARCH_CASE+"\n"
            +"if-ne v3, v0, :native_search_stock_case\n"
            +"check-cast p1, Lirf;\n"
            +"invoke-virtual {p1}, Lirf;->f()Z\n"
            +"move-result v0\n"
            +"if-eqz v0, :native_search_collapsed\n"
            +"sget-object v0, Limx;->a:Ltzs;\n"
            +"return-object v0\n"
            +":native_search_collapsed\n"
            +"const/4 v0, 0x0\n"
            +"invoke-static {v0}, Ltxr;->f(I)Ltxr;\n"
            +"move-result-object v0\n"
            +"return-object v0\n"
            +":native_search_stock_case\n"
            +"nop");
    }
    /** TOP changes from a constant property to a reactive value property; key, value and v7 stay native. */
    static void patchFactory(MutableMethod factory){
        require(fullKey(factory).equals(FACTORY+"->"+FACTORY_KEY),"factory target");
        var f=factory.getImplementation();var code=f.getInstructions();
        require(f.getRegisterCount()==60&&code.size()==1170&&f.getTryBlocks().isEmpty(),"factory register/CFG shape");
        for(var i:code)require(!(i instanceof OffsetInstruction),"factory gained a branch");
        int begin=at(code,0x05eb),after=at(code,0x05f8);
        require(after-begin==6&&code.get(begin).getOpcode()==Opcode.SGET_OBJECT&&reference(code.get(begin)).equals("Ltrp;->bb:Ltrp;")
            &&((OneRegisterInstruction)code.get(begin)).getRegisterA()==11,"constant TOP key");
        require(code.get(begin-1).getOpcode()==Opcode.SGET_OBJECT&&reference(code.get(begin-1)).equals("Limx;->a:Ltzs;")
            &&((OneRegisterInstruction)code.get(begin-1)).getRegisterA()==7,"TOP value v7 (also read by the next margins)");
        require(code.get(begin+1).getOpcode()==Opcode.NEW_INSTANCE&&reference(code.get(begin+1)).equals("Ltwh;")
            &&((OneRegisterInstruction)code.get(begin+1)).getRegisterA()==12,"constant TOP property");
        var constant=code.get(begin+5);
        require(reference(constant).equals("Ltwh;-><init>(Ltua;Ljava/lang/Object;Ltub;Z)V")&&((FiveRegisterInstruction)constant).getRegisterCount()==5
            &&((FiveRegisterInstruction)constant).getRegisterC()==12&&((FiveRegisterInstruction)constant).getRegisterD()==11
            &&((FiveRegisterInstruction)constant).getRegisterE()==7&&((FiveRegisterInstruction)constant).getRegisterF()==4,"constant attribute constructor");
        require(code.get(after).getOpcode()==Opcode.CONST_16&&((OneRegisterInstruction)code.get(after)).getRegisterA()==18
            &&code.get(after+1).getOpcode()==Opcode.APUT_OBJECT&&((ThreeRegisterInstruction)code.get(after+1)).getRegisterA()==12,"TOP property store");
        // v11/v12/v14 are redefined right after the store (next key, next property, next flag).
        require(code.get(after+2).getOpcode()==Opcode.SGET_OBJECT&&((OneRegisterInstruction)code.get(after+2)).getRegisterA()==11
            &&code.get(after+3).getOpcode()==Opcode.NEW_INSTANCE&&((OneRegisterInstruction)code.get(after+3)).getRegisterA()==12
            &&code.get(after+5).getOpcode()==Opcode.MOVE_RESULT&&((OneRegisterInstruction)code.get(after+5)).getRegisterA()==14,"scratch registers redefined");

        // Keep the TOP key read, v7=imx.a and all following START/END/radius code.
        InstructionExtensions.INSTANCE.removeInstructions(factory,begin+1,after-begin-1);
        InstructionExtensions.INSTANCE.addInstructions(factory,begin+1,
            "new-instance v14, Lijv;\n"
            +"const/16 v12, "+SEARCH_CASE+"\n"
            +"invoke-direct {v14, v12}, Lijv;-><init>(I)V\n"
            +"new-instance v12, Ltwp;\n"
            +"invoke-direct {v12, v11, v14, v4}, Ltwp;-><init>(Ltua;Ltuf;Ltub;)V");
    }
    static void apply(BytecodePatchContext context){
        List<ClassDef> classes=new ArrayList<>();
        context.classDefForEach(c->{classes.add(c);return Unit.INSTANCE;});
        audit(classes);
        patchValue(mutable(context,PROVIDER,VALUE_KEY));
        patchFactory(mutable(context,FACTORY,FACTORY_KEY));
        System.out.println("Native search alignment: collapsed TOP0dp, expanded TOP12dp through native reactive DSL; START/END and old value-function cases0..20 preserved");
    }
    private SearchAlignmentHooks(){}
}

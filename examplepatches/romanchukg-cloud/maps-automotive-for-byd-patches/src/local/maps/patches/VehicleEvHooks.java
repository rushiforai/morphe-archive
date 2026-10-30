// SPDX-License-Identifier: GPL-3.0-only
package local.maps.patches;

import java.util.*;
import app.morphe.patcher.patch.BytecodePatchContext;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.builder.*;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;

/** Pinned native EV and Connected cars display-name rules. No Google method bodies are bundled. */
final class VehicleEvHooks {
    // 26.10 names: repository hlh->hjo, carrier rco->rjs, vehicle-info factory fkn.m->fhj.l.
    private static final String REPO="Lhjo;", BRIDGE="Llocal/maps/cluster/VehicleEvBridge;", CARRIER="Lrjs;", FACTORY_TYPE="Lfhj;";
    private static final String CTOR="<init>(Lrjs;Lhkg;Ldua;Lddy;Laokl;Lrlw;Lqqq;Lsmt;Lftz;)V";
    private static final String PUBLISH="f(Lafnz;Laodp;)Ljava/lang/Object;";
    private static final String FACTORY="l(Landroid/content/pm/PackageManager;Lrlw;Laoaq;)Lftz;";
    private static final Set<String> READS=Set.of("a()Laepx;","b()Lafnz;","c()Lj$/time/Instant;","e()Z");
    private static final String NATIVE_PUBLISH="Lrjs;->d(Lqvt;)V", ORIGINAL_INPUT="Lhjo;->k:Ljava/util/concurrent/atomic/AtomicReference;";
    private static final String ATOMIC_SET="Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V", UNLOCK="Laovk;->d()V";
    private static void check(boolean value,String message){if(!value)throw new IllegalStateException(message);}
    private static String descriptor(MutableMethod m){StringBuilder d=new StringBuilder(m.getName()).append('(');for(var t:m.getParameterTypes())d.append(t);return d.append(')').append(m.getReturnType()).toString();}
    private static String ref(Instruction i){return i instanceof ReferenceInstruction?((ReferenceInstruction)i).getReference().toString():"";}
    private static MutableMethod method(BytecodePatchContext ctx,String type,String descriptor){
        MutableMethod found=null;
        for(var m:ctx.mutableClassDefBy(type).getMethods())if(descriptor(m).equals(descriptor)){check(found==null,"Ambiguous EV hook "+type+descriptor);found=m;}
        check(found!=null&&found.getImplementation()!=null,"Missing pinned EV hook "+type+descriptor);return found;
    }
    private static void invoke(Instruction i,Opcode opcode,int... registers){
        check(i.getOpcode()==opcode&&i instanceof FiveRegisterInstruction,"EV invocation opcode changed");
        var r=(FiveRegisterInstruction)i;int[] actual={r.getRegisterC(),r.getRegisterD(),r.getRegisterE(),r.getRegisterF(),r.getRegisterG()};
        check(r.getRegisterCount()==registers.length,"EV invocation register count changed");
        for(int n=0;n<registers.length;n++)check(actual[n]==registers[n],"EV invocation registers changed");
    }
    private static int onlyRef(List<Instruction> code,String reference){int at=-1;for(int i=0;i<code.size();i++)if(ref(code.get(i)).equals(reference)){check(at<0,"Repeated pinned EV reference "+reference);at=i;}check(at>=0,"Missing pinned EV reference "+reference);return at;}
    static void connectedName(MutableMethod method){
        check(method.getDefiningClass().equals("Lgva;")&&descriptor(method).equals("a(Ljava/lang/Object;)Ljava/lang/Object;"),"Unexpected Connected cars method");
        check(Api29Hooks.fingerprint(method).equals("f63a5f20cc3224bd89204e6d1956175b068dcd69d838995c8ac5a20b73a059ec"),"Connected cars name fingerprint changed");
        var body=method.getImplementation();check(body!=null&&body.getRegisterCount()==12,"Connected cars name registers changed");
        List<Instruction> code=new ArrayList<>(body.getInstructions());
        int at=onlyRef(code,"Lajod;->c:Ljava/lang/String;");Instruction write=code.get(at);
        check(write.getOpcode()==Opcode.IPUT_OBJECT&&write instanceof TwoRegisterInstruction,"Connected cars name store changed");
        var registers=(TwoRegisterInstruction)write;check(registers.getRegisterA()==3&&registers.getRegisterB()==5,"Connected cars name operands changed");
        // Keep native branches targeting the field write attached to the new call.
        body.replaceInstruction(at,new BuilderInstruction35c(Opcode.INVOKE_STATIC,1,3,0,0,0,0,new ImmutableMethodReference(BRIDGE,"connectedCarDisplayName",List.of("Ljava/lang/String;"),"Ljava/lang/String;")));
        body.addInstruction(at+1,new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,3));
        body.addInstruction(at+2,new BuilderInstruction22c(Opcode.IPUT_OBJECT,3,5,((ReferenceInstruction)write).getReference()));
    }
    /** Package-visible for tests using the exact original methods, without a mock patch context. */
    static void patch(MutableMethod m){
        String d=descriptor(m),type=m.getDefiningClass();boolean repo=type.equals(REPO),factory=type.equals(FACTORY_TYPE)&&d.equals(FACTORY);
        check(factory||repo&&(d.equals(CTOR)||d.equals(PUBLISH)||READS.contains(d))||type.equals(CARRIER)&&d.equals("c(Z)V"),"Unexpected EV method");
        List<Instruction> code=new ArrayList<>(m.getImplementation().getInstructions());
        for(var instruction:code)check(!ref(instruction).startsWith(BRIDGE),"Native EV method already hooked");
        var out=m.getImplementation();
        if(factory){
            check(out.getRegisterCount()==6&&(m.getAccessFlags()&AccessFlags.STATIC.getValue())!=0,"Vehicle info factory register/static schema changed");int at=code.size()-2;
            check(ref(code.get(at)).equals("Ljava/lang/Object;->getClass()Ljava/lang/Class;"),"Vehicle info final non-null check changed");invoke(code.get(at),Opcode.INVOKE_VIRTUAL,3);
            check(code.get(at+1).getOpcode()==Opcode.RETURN_OBJECT&&((OneRegisterInstruction)code.get(at+1)).getRegisterA()==3,"Vehicle info final return changed");
            int returns=0;for(var i:code)if(i.getOpcode()==Opcode.RETURN_OBJECT)returns++;check(returns==1,"Vehicle info return count changed");
            // Replace the labeled native check, so native branches execute the wrapper too.
            out.replaceInstruction(at,new BuilderInstruction35c(Opcode.INVOKE_STATIC,1,3,0,0,0,0,new ImmutableMethodReference(BRIDGE,"wrapVehicleInfo",List.of("Ljava/lang/Object;"),"Ljava/lang/Object;")));
            out.addInstruction(at+1,new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,3));
            out.addInstruction(at+2,new BuilderInstruction21c(Opcode.CHECK_CAST,3,new ImmutableTypeReference("Lftz;")));
            out.addInstruction(at+3,new BuilderInstruction35c(Opcode.INVOKE_VIRTUAL,1,3,0,0,0,0,new ImmutableMethodReference("Ljava/lang/Object;","getClass",List.of(),"Ljava/lang/Class;")));
        }else if(!repo){
            check(out.getRegisterCount()==2,"Carrier availability register schema changed");
            check(ref(code.get(0)).equals("Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;"),"Carrier availability entry changed");invoke(code.get(0),Opcode.INVOKE_STATIC,1);
            out.replaceInstruction(0,new BuilderInstruction35c(Opcode.INVOKE_STATIC,2,0,1,0,0,0,new ImmutableMethodReference(BRIDGE,"availability",List.of("Ljava/lang/Object;","Z"),"Z")));
            out.addInstruction(1,new BuilderInstruction11x(Opcode.MOVE_RESULT,1));
            out.addInstruction(2,new BuilderInstruction35c(Opcode.INVOKE_STATIC,1,1,0,0,0,0,new ImmutableMethodReference("Ljava/lang/Boolean;","valueOf",List.of("Z"),"Ljava/lang/Boolean;")));
        }else if(READS.contains(d)){
            int expected=d.startsWith("c(")?2:1;check(out.getRegisterCount()==expected,"Repository read register schema changed");
            String field=d.startsWith("b(")?ORIGINAL_INPUT:"Lhjo;->i:Lrjs;";
            check(code.get(0).getOpcode()==Opcode.IGET_OBJECT&&ref(code.get(0)).equals(field),"Repository read entry changed");
            int self=expected-1;var original=(TwoRegisterInstruction)code.get(0);check(original.getRegisterA()==self&&original.getRegisterB()==self,"Repository read self register changed");
            out.replaceInstruction(0,new BuilderInstruction35c(Opcode.INVOKE_STATIC,1,self,0,0,0,0,new ImmutableMethodReference(BRIDGE,"beforeNativeRead",List.of("Ljava/lang/Object;"),"V")));
            out.addInstruction(1,new BuilderInstruction22c(Opcode.IGET_OBJECT,self,self,((ReferenceInstruction)code.get(0)).getReference()));
        }else if(d.equals(CTOR)){
            check(out.getRegisterCount()==10,"EV constructor register schema changed");int exit=-1;
            for(int i=0;i<code.size();i++)if(code.get(i).getOpcode()==Opcode.RETURN_VOID){check(exit<0,"Multiple EV constructor exits");exit=i;}
            check(exit==code.size()-1,"EV constructor normal exit changed");
            out.replaceInstruction(exit,new BuilderInstruction35c(Opcode.INVOKE_STATIC,1,0,0,0,0,0,new ImmutableMethodReference(BRIDGE,"register",List.of("Ljava/lang/Object;"),"V")));
            out.addInstruction(exit+1,new BuilderInstruction10x(Opcode.RETURN_VOID));
        }else{
            check(out.getRegisterCount()==13,"EV publisher register schema changed");int at=onlyRef(code,NATIVE_PUBLISH);
            invoke(code.get(at),Opcode.INVOKE_VIRTUAL,1,12);
            check(ref(code.get(at+1)).equals(ORIGINAL_INPUT),"Original EV input field changed");
            var field=(TwoRegisterInstruction)code.get(at+1);check(field.getRegisterA()==10&&field.getRegisterB()==10,"Original EV input field registers changed");
            check(ref(code.get(at+2)).equals(ATOMIC_SET),"Original EV input write changed");invoke(code.get(at+2),Opcode.INVOKE_VIRTUAL,10,0);
            check(ref(code.get(at+3)).equals(UNLOCK),"Native mutex unlock missing after EV publish pair");invoke(code.get(at+3),Opcode.INVOKE_VIRTUAL,11);
            Label unlock=out.newLabelForIndex(at+3);
            out.replaceInstruction(at,new BuilderInstruction35c(Opcode.INVOKE_STATIC,3,10,0,12,0,0,new ImmutableMethodReference(BRIDGE,"handleOwnedPublish",List.of("Ljava/lang/Object;","Ljava/lang/Object;","Ljava/lang/Object;"),"Z")));
            out.addInstruction(at+1,new BuilderInstruction11x(Opcode.MOVE_RESULT,2));
            out.addInstruction(at+2,new BuilderInstruction21t(Opcode.IF_NEZ,2,unlock));
            // Unowned data retains the exact native publish + original-input write pair.
            out.addInstruction(at+3,new BuilderInstruction35c(Opcode.INVOKE_VIRTUAL,2,1,12,0,0,0,new ImmutableMethodReference(CARRIER,"d",List.of("Lqvt;"),"V")));
        }
    }
    static void apply(BytecodePatchContext ctx){
        int count=0;
        for(String descriptor:READS){patch(method(ctx,REPO,descriptor));count++;}
        patch(method(ctx,REPO,CTOR));count++;
        patch(method(ctx,REPO,PUBLISH));count++;
        patch(method(ctx,CARRIER,"c(Z)V"));count++;
        patch(method(ctx,FACTORY_TYPE,FACTORY));count++;
        check(count==8,"Expected eight native EV hooks");
        connectedName(method(ctx,"Lgva;","a(Ljava/lang/Object;)Ljava/lang/Object;"));
        System.out.println("Native EV hooks: 8; repository registration/freshness, owned publication, availability and scoped vehicle profile");
        System.out.println("Connected cars: one scoped display-name hook; registration/session ID unchanged");
    }
}

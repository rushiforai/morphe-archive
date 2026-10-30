package local.maps.patches;

import java.util.*;
import app.morphe.patcher.patch.BytecodePatchContext;
import app.morphe.patcher.extensions.InstructionExtensions;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;

/** Pinned, narrow service lifecycle diagnostics; no Google method bodies bundled. */
final class NavigationHooks {
    private static final String SERVICE="Lcom/google/android/libraries/geo/navcore/service/base/NavigationService;",RUNTIME="Llocal/maps/cluster/NavigationStartup;";
    private static final InstructionExtensions ASM=InstructionExtensions.INSTANCE;
    private static MutableMethod method(BytecodePatchContext ctx,String type,String name,String descriptor,int registers){
        MutableMethod found=null;
        for(var m:ctx.mutableClassDefBy(type).getMethods()){
            StringBuilder d=new StringBuilder("(");for(var t:m.getParameterTypes())d.append(t);d.append(')').append(m.getReturnType());
            if(m.getName().equals(name)&&d.toString().equals(descriptor)){if(found!=null)throw new IllegalStateException("Ambiguous navigation hook");found=m;}
        }
        if(found==null||found.getImplementation()==null||found.getImplementation().getRegisterCount()!=registers)throw new IllegalStateException("Navigation schema changed: "+type+name);
        return found;
    }
    private static String ref(Instruction i){return i instanceof ReferenceInstruction?((ReferenceInstruction)i).getReference().toString():"";}
    /** 26.10 missing-channel path: the null constant either returns directly or jumps to the shared return-object v2. */
    private static boolean returnsV2(MutableMethod method,int index){
        var list=method.getImplementation().getInstructions();var next=list.get(index);
        if(next.getOpcode()==Opcode.RETURN_OBJECT)return ((OneRegisterInstruction)next).getRegisterA()==2;
        if(next.getOpcode()!=Opcode.GOTO&&next.getOpcode()!=Opcode.GOTO_16)return false;
        int address=0;for(int n=0;n<index;n++)address+=list.get(n).getCodeUnits();
        int target=address+((OffsetInstruction)next).getCodeOffset(),position=0;
        for(var candidate:list){
            if(position==target)return candidate.getOpcode()==Opcode.RETURN_OBJECT&&((OneRegisterInstruction)candidate).getRegisterA()==2;
            position+=candidate.getCodeUnits();
        }
        return false;
    }
    private static int exits(MutableMethod method,Opcode opcode,String callback){
        int count=0;
        for(int i=method.getImplementation().getInstructions().size()-1;i>=0;i--){
            var ins=method.getImplementation().getInstructions().get(i);if(ins.getOpcode()!=opcode)continue;
            var ret=opcode==Opcode.RETURN_VOID?new BuilderInstruction10x(opcode):new BuilderInstruction11x(opcode,((OneRegisterInstruction)ins).getRegisterA());
            method.getImplementation().replaceInstruction(i,new BuilderInstruction35c(Opcode.INVOKE_STATIC,0,0,0,0,0,0,new ImmutableMethodReference(RUNTIME,callback,List.of(),"V")));
            method.getImplementation().addInstruction(i+1,ret);count++;
        }
        return count;
    }
    static void apply(BytecodePatchContext ctx){
        // 26.10 R8 merges the method exits: onCreate has one return-void, onStartCommand one return.
        var m=method(ctx,SERVICE,"onCreate","()V",11);int count=exits(m,Opcode.RETURN_VOID,"created");
        if(count!=1)throw new IllegalStateException("Navigation create exits changed");
        ASM.addInstruction(m,0,"invoke-static/range {p0 .. p0}, "+RUNTIME+"->create(Landroid/app/Service;)V");
        m=method(ctx,SERVICE,"onStartCommand","(Landroid/content/Intent;II)I",7);count=exits(m,Opcode.RETURN,"commandFinished");
        if(count!=1)throw new IllegalStateException("Navigation command exits changed");
        ASM.addInstruction(m,0,"invoke-static/range {p0 .. p1}, "+RUNTIME+"->command(Landroid/app/Service;Landroid/content/Intent;)V");
        m=method(ctx,"Lwwg;","a","(I)Ljava/lang/String;",4);count=0;
        for(int i=m.getImplementation().getInstructions().size()-2;i>=0;i--){
            var ins=m.getImplementation().getInstructions().get(i);
            if(ins.getOpcode()==Opcode.CONST_4&&ins instanceof NarrowLiteralInstruction&&((NarrowLiteralInstruction)ins).getNarrowLiteral()==0&&((OneRegisterInstruction)ins).getRegisterA()==2&&returnsV2(m,i+1)){
                m.getImplementation().replaceInstruction(i,new BuilderInstruction35c(Opcode.INVOKE_STATIC,0,0,0,0,0,0,new ImmutableMethodReference(RUNTIME,"missingChannel",List.of(),"V")));
                ASM.addInstruction(m,i+1,"const/4 p0, 0");count++;
            }
        }
        if(count!=1)throw new IllegalStateException("Navigation missing channel path changed");
        m=method(ctx,"Lfdv;","k","(Landroid/app/Notification;)V",4);count=0;
        for(int i=m.getImplementation().getInstructions().size()-1;i>=0;i--)if(ref(m.getImplementation().getInstructions().get(i)).equals("Landroid/app/Service;->startForeground(ILandroid/app/Notification;)V")){
            m.getImplementation().replaceInstruction(i,new BuilderInstruction35c(Opcode.INVOKE_STATIC,3,0,1,3,0,0,new ImmutableMethodReference(RUNTIME,"promote",List.of("Landroid/app/Service;","I","Landroid/app/Notification;"),"V")));count++;
        }
        if(count!=1)throw new IllegalStateException("Navigation foreground invocation changed");
        System.out.println("Navigation startup: lifecycle timings, missing-channel and foreground result diagnostics");
    }
}

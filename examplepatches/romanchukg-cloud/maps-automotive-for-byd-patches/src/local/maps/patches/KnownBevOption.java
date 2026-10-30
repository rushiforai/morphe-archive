// SPDX-License-Identifier: GPL-3.0-only
package local.maps.patches;

import java.util.*;
import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.builder.instruction.*;

/** Explicit immutable vehicle identity, independent of asynchronous profile/settings loading. */
final class KnownBevOption {
    static final String TYPE="Llocal/maps/cluster/VehicleEvBuildProfile;";
    static final String GETTER=TYPE+"->knownBev()Z";
    private static void check(boolean value,String message){if(!value)throw new IllegalStateException(message);}
    static Option<Boolean> register(BytecodePatchBuilder patch){
        return OptionKt.booleanOption(patch,"known_bev",Boolean.FALSE,null,"Legacy CCS2 BEV startup hint",
            "Normally keep off and set your vehicle in Instrument cluster > BYD vehicle data > Vehicle profile. This legacy hint assumes CCS2 only until a profile is saved; saved profiles always take precedence. Does not set capacity, charge or range, or enable the reader. Keep off for GB/T, unknown vehicles and hybrids.",
            false,(option,value)->value!=null);
    }
    static boolean value(Object option){
        check(option instanceof Boolean,"known_bev must be true or false");return (Boolean)option;
    }
    private static String ref(Instruction instruction){return instruction instanceof ReferenceInstruction?((ReferenceInstruction)instruction).getReference().toString():"";}
    static void verifyCaller(Method method){
        check(method.getName().equals("hasVehicleProfile")&&method.getParameterTypes().isEmpty()&&method.getReturnType().equals("Z")&&method.getImplementation()!=null,"Vehicle profile identity caller changed");
        int getters=0;
        for(var instruction:method.getImplementation().getInstructions()){
            if(ref(instruction).equals(GETTER)){check(instruction.getOpcode()==Opcode.INVOKE_STATIC&&instruction instanceof FiveRegisterInstruction&&((FiveRegisterInstruction)instruction).getRegisterCount()==0,"BEV option getter invocation changed");getters++;}
            check(!ref(instruction).equals(TYPE+"->OWNER_BEV_HINT:Z"),"BEV option was compiled as a field read");
        }
        check(getters==1,"BEV option getter was inlined or omitted");
    }
    static void patch(MutableMethod method,Object option){
        boolean enabled=value(option);
        check(method.getDefiningClass().equals(TYPE)&&method.getName().equals("knownBev")&&method.getReturnType().equals("Z")&&method.getParameterTypes().isEmpty()&&(method.getAccessFlags()&AccessFlags.STATIC.getValue())!=0&&method.getImplementation()!=null,"BEV option getter signature changed");
        var body=method.getImplementation();var code=body.getInstructions();
        check(body.getRegisterCount()==1&&code.size()==2&&body.getTryBlocks().isEmpty(),"BEV option getter shape changed or already patched");
        check(code.get(0).getOpcode()==Opcode.CONST_4&&((OneRegisterInstruction)code.get(0)).getRegisterA()==0&&((NarrowLiteralInstruction)code.get(0)).getNarrowLiteral()==0,"BEV option getter is not the unconfigured false stub");
        check(code.get(1).getOpcode()==Opcode.RETURN&&((OneRegisterInstruction)code.get(1)).getRegisterA()==0,"BEV option getter return changed");
        body.replaceInstruction(0,new BuilderInstruction11n(Opcode.CONST_4,0,enabled?1:0));
        // Marks even false -> false as applied, making repeated application fail closed.
        body.addInstruction(1,new BuilderInstruction10x(Opcode.NOP));
    }
    static void apply(BytecodePatchContext context,Object option){
        MutableMethod getter=null,caller=null;
        for(var method:context.mutableClassDefBy(TYPE).getMethods())if(method.getName().equals("knownBev")&&method.getParameterTypes().isEmpty()&&method.getReturnType().equals("Z")){check(getter==null,"Ambiguous BEV option getter");getter=method;}
        for(var method:context.mutableClassDefBy("Llocal/maps/cluster/VehicleEvBridge;").getMethods())if(method.getName().equals("hasVehicleProfile")&&method.getParameterTypes().isEmpty()&&method.getReturnType().equals("Z")){check(caller==null,"Ambiguous vehicle identity caller");caller=method;}
        check(getter!=null&&caller!=null,"BEV option runtime contract missing");verifyCaller(caller);patch(getter,option);
        System.out.println("Explicit known_bev="+value(option)+"; profile, live readings and reader opt-ins remain independent");
    }
}

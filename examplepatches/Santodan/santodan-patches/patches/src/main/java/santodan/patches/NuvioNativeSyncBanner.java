package santodan.patches;

import app.morphe.patcher.patch.BytecodePatchContext;
import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import java.util.List;

/** Reuse beta.8's native updater host and banner without replacing its drawing code. */
final class NuvioNativeSyncBanner {
    static final String EXT = "Lsoftware/santodan/extension/nuviomerged/NuvioSyncBanner;";
    static final String HOST = "Lfb/uj;->i(Lkb/k0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lr1/s;Lh1/n;I)V";
    static void hook(BytecodePatchContext context) {
        hookRoot(context.mutableClassDefBy("Lq8/l;"));
        hookBanner(context.mutableClassDefBy("Lmb/a;"));
    }
    static ImmutableMethodReference ref(String name, List<String> args, String returns) {
        return new ImmutableMethodReference(EXT, name, args, returns);
    }
    static void hookRoot(MutableClass owner) {
        MutableMethod method=NuvioRemainingEpisodesPatch.unique(owner,"invoke",3);
        if(!NuvioPlaybackButtonsPatch.fingerprint(method).equals("b9bcb00e932f362e8bd4d632b937371b65ebae2e4f019c0064c69f9db0ebaf86"))
            throw new IllegalStateException("Native updater root changed or already patched");
        var instructions=NuvioRemainingEpisodesPatch.instructions(method);
        int anchor=-1;
        for(int i=0;i<instructions.size();i++)if(NuvioPlaybackButtonsPatch.reference(instructions.get(i)).equals(HOST)){
            if(anchor!=-1||!(instructions.get(i) instanceof RegisterRangeInstruction))throw new IllegalStateException("Native updater host ambiguous");
            anchor=i;
        }
        if(anchor<0)throw new IllegalStateException("Native updater host missing");
        var call=(RegisterRangeInstruction)instructions.get(anchor);
        if(call.getRegisterCount()!=10||call.getStartRegister()!=2)throw new IllegalStateException("Native updater host registers changed");
        method.getImplementation().replaceInstruction(anchor,new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,2,10,
            ref("host",List.of("Ljava/lang/Object;","Ljava/lang/Object;","Ljava/lang/Object;","Ljava/lang/Object;",
                "Ljava/lang/Object;","Ljava/lang/Object;","Ljava/lang/Object;","Ljava/lang/Object;","Ljava/lang/Object;","I"),"V")));
    }
    static void hookBanner(MutableClass owner) {
        MutableMethod method=NuvioRemainingEpisodesPatch.unique(owner,"b",10);
        if(!NuvioPlaybackButtonsPatch.fingerprint(method).equals("50512aec1d322f8645869c4d99221fdccfb518d08abfdd302b73198a0d49ef9b"))
            throw new IllegalStateException("Native updater banner changed or already patched");
        var code=method.getImplementation();
        var instructions=NuvioRemainingEpisodesPatch.instructions(method);
        int lookups=0,returns=0,scopeEnds=0,closeGuards=0,closeLabels=0,timerGuards=0;
        for(int i=instructions.size()-1;i>=0;i--){
            var instruction=instructions.get(i);
            String target=NuvioPlaybackButtonsPatch.reference(instruction);
            String name=null;
            List<String> args=null;
            // The installed-app close path calls a timed auto-dismiss control.
            // Sync cancellation must use the ordinary explicit close action instead.
            if(i==731){
                if(instruction.getOpcode()!=Opcode.IF_EQZ || ((OneRegisterInstruction)instruction).getRegisterA()!=66)
                    throw new IllegalStateException("Native banner close timer guard changed");
                code.addInstruction(i,new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,66,1,ref("timedClose",List.of("Z"),"Z")));
                code.addInstruction(i+1,new BuilderInstruction11x(Opcode.MOVE_RESULT,66));
                timerGuards++;
            }
            // Original beta.8 b(): instruction 728, v34 cached isDownloading, directly
            // after the primary action group closes. Its branch hides only the Close control.
            if(i==728){
                if(instruction.getOpcode()!=Opcode.IF_NEZ || ((OneRegisterInstruction)instruction).getRegisterA()!=34 ||
                    !NuvioPlaybackButtonsPatch.reference(instructions.get(i-1)).equals("Lh1/k0;->p(Z)V"))
                    throw new IllegalStateException("Native banner close guard changed");
                code.addInstruction(i,new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,34,1,ref("hideClose",List.of("Z"),"Z")));
                code.addInstruction(i+1,new BuilderInstruction11x(Opcode.MOVE_RESULT,34));
                closeGuards++;
            }
            if(i==758){
                if(!target.equals("Lu6/g;->d0(ILh1/n;)Ljava/lang/String;"))
                    throw new IllegalStateException("Native banner close label changed");
                name="closeText";args=List.of("I","Ljava/lang/Object;");closeLabels++;
            }
            if(target.equals("Lma/r;->h(Lh1/k0;IILh1/k0;Z)Ljava/lang/String;")){
                name="groupText";args=List.of("Ljava/lang/Object;","I","I","Ljava/lang/Object;","Z");
            } else if(target.equals("Lu6/g;->e0(I[Ljava/lang/Object;Lh1/n;)Ljava/lang/String;")){
                name="formatted";args=List.of("I","[Ljava/lang/Object;","Ljava/lang/Object;");
            }
            if(name!=null){
                var reference=ref(name,args,"Ljava/lang/String;");
                if(instruction instanceof RegisterRangeInstruction){
                    var call=(RegisterRangeInstruction)instruction;
                    code.replaceInstruction(i,new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,call.getStartRegister(),call.getRegisterCount(),reference));
                }else{
                    var call=(FiveRegisterInstruction)instruction;
                    code.replaceInstruction(i,new BuilderInstruction35c(Opcode.INVOKE_STATIC,call.getRegisterCount(),call.getRegisterC(),call.getRegisterD(),call.getRegisterE(),call.getRegisterF(),call.getRegisterG(),reference));
                }
                lookups++;
            }
            if(target.equals("Lh1/k0;->u()Lh1/d2;")){
                if(instructions.get(i+1).getOpcode()!=Opcode.MOVE_RESULT_OBJECT || instructions.get(i+2).getOpcode()!=Opcode.IF_EQZ)
                    throw new IllegalStateException("Native banner restart-scope tail changed");
                // Clear before the null-restart-scope branch, which jumps directly to return.
                code.addInstruction(i+2,new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,0,0,ref("end",List.of(),"V")));
                scopeEnds++;
            }
            if(instruction.getOpcode()==Opcode.RETURN_VOID)returns++;
        }
        if(lookups!=6||returns!=1||scopeEnds!=1||closeGuards!=1||closeLabels!=1||timerGuards!=1)throw new IllegalStateException("Native updater labels/returns changed: "+lookups+"/"+returns);
        code.addInstruction(0,new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,64,1,ref("begin",List.of("Ljava/lang/Object;"),"V")));
        code.addInstruction(1,new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,66,1,ref("installed",List.of("Z"),"Z")));
        code.addInstruction(2,new BuilderInstruction11x(Opcode.MOVE_RESULT,66));
    }
}

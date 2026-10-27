package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import java.nio.file.*;
import java.util.*;

public final class VerifyMonetDisplayedCards {
    static void require(boolean value,String message){if(!value)throw new AssertionError(message);}
    static void reject(List<? extends ClassDef> classes){
        try{MonetDisplayedCardsPatch.validate(classes);}catch(IllegalStateException expected){return;}
        throw new AssertionError("Invalid displayed cards contract accepted");
    }
    public static void mutation(Method original,Method patched){
        require(original.getAccessFlags()==patched.getAccessFlags(),"Access flags changed");
        require(original.getImplementation().getRegisterCount()==patched.getImplementation().getRegisterCount(),"Registers changed");
        require(original.getImplementation().getTryBlocks().isEmpty()&&patched.getImplementation().getTryBlocks().isEmpty(),"Unexpected try boundary");
        var before=MonetPremiumPatch.instructions(original);var after=MonetPremiumPatch.instructions(patched);
        MutableMethod restored=new MutableMethod(patched);
        if(original.toString().equals(MonetDisplayedCardsPatch.CLAMP)){
            require(before.size()==after.size(),"Clamp size changed");
            require(NuvioPlaybackButtonsPatch.reference(after.get(2)).equals("Ljava/lang/Math;->max(II)I"),"Upper bound still applied");
            var invoke=(FiveRegisterInstruction)after.get(2);
            require(invoke.getRegisterCount()==2&&invoke.getRegisterC()==2&&invoke.getRegisterD()==0,"Clamp arguments changed");
            for(int value:new int[]{Integer.MIN_VALUE,-1,0,3,4,20,21,30,372,10000,Integer.MAX_VALUE})
                require(evaluate(patched,value)==Math.max(4,value),"Card count truncated or wrapped");
            restored.getImplementation().replaceInstruction(2,new MutableMethod(original).getImplementation().getInstructions().get(2));
        }else if(original.toString().equals(MonetDisplayedCardsPatch.SCHEMA)){
            require(after.size()==before.size()+2,"Schema insertion changed");
            require(NuvioPlaybackButtonsPatch.reference(after.get(2)).equals(MonetDisplayedCardsPatch.MODEL+"->schemaMaximum(Ljava/lang/String;I)I"),"Schema hook missing");
            var invoke=(FiveRegisterInstruction)after.get(2);
            require(invoke.getRegisterCount()==2&&invoke.getRegisterC()==13&&invoke.getRegisterD()==1,"Schema arguments changed");
            require(after.get(3).getOpcode()==Opcode.MOVE_RESULT&&((OneRegisterInstruction)after.get(3)).getRegisterA()==1,"Schema result lost");
            restored.getImplementation().removeInstruction(3);restored.getImplementation().removeInstruction(2);
        }else if(original.toString().equals(MonetDisplayedCardsPatch.APPLY)){
            require(after.size()==before.size()+2,"Apply focus hook size changed");
            require(NuvioPlaybackButtonsPatch.reference(after.get(63)).equals(MonetDisplayedCardsPatch.UI+"->properties(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"),"Footer focus adapter missing");
            var call=(FiveRegisterInstruction)after.get(63);
            require(call.getRegisterCount()==2&&call.getRegisterC()==4&&call.getRegisterD()==14,"Footer focus arguments changed");
            require(after.get(64).getOpcode()==Opcode.MOVE_RESULT_OBJECT&&((OneRegisterInstruction)after.get(64)).getRegisterA()==4,"Focus result changed");
            restored.getImplementation().removeInstruction(63);restored.getImplementation().removeInstruction(63);
        }else if(original.toString().equals(MonetDisplayedCardsPatch.PICKER)){
            require(after.size()==before.size()+45,"Native picker augmentation count changed");
            require(NuvioPlaybackButtonsPatch.reference(after.get(2)).equals(MonetDisplayedCardsPatch.MODEL+"->pickerMaximum(II)I"),"Native picker maximum hook missing");
            require(((TwoRegisterInstruction)after.get(0)).getRegisterA()==0&&((TwoRegisterInstruction)after.get(0)).getRegisterB()==79,"Minimum source changed");
            require(((TwoRegisterInstruction)after.get(1)).getRegisterA()==1&&((TwoRegisterInstruction)after.get(1)).getRegisterB()==80,"Maximum source changed");
            require(after.get(3).getOpcode()==Opcode.MOVE_RESULT&&((OneRegisterInstruction)after.get(3)).getRegisterA()==1,"Maximum result changed");
            require(((TwoRegisterInstruction)after.get(4)).getRegisterA()==80&&((TwoRegisterInstruction)after.get(4)).getRegisterB()==1,"Native maximum parameter not updated");
            for(int index:new int[]{340,465}){
                Instruction instruction=after.get(index);
                require(NuvioPlaybackButtonsPatch.reference(instruction).equals(MonetDisplayedCardsPatch.UI+"->buttons(Ljava/lang/String;ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;IILjava/lang/Object;II)V"),"Native button adapter missing");
                var call=(RegisterRangeInstruction)instruction;
                require(call.getStartRegister()==57&&call.getRegisterCount()==14,"Button range changed");
                Set<Integer> primitive=Set.of(1,9,10,12,13);
                for(int n=0;n<14;n++){
                    Instruction copy=after.get(index-14+n);
                    require(copy.getOpcode()==(primitive.contains(n)?Opcode.MOVE_FROM16:Opcode.MOVE_OBJECT_FROM16),"Button argument type changed");
                    var registers=(TwoRegisterInstruction)copy;
                    int source=n<11?n:n==11?(index==340?34:13):n==12?79:80;
                    require(registers.getRegisterA()==57+n&&registers.getRegisterB()==source,"Button argument register changed");
                }
            }
            require(NuvioPlaybackButtonsPatch.reference(after.get(353)).equals(MonetDisplayedCardsPatch.MODEL+"->number(III)Ljava/lang/String;"),"Native number formatting hook missing");
            for(int n=0;n<3;n++){
                var copy=(TwoRegisterInstruction)after.get(350+n);
                require(copy.getRegisterA()==57+n&&copy.getRegisterB()==(n==0?2:n==1?79:80),"Number argument changed");
            }
            require(NuvioPlaybackButtonsPatch.reference(after.get(578)).equals(MonetDisplayedCardsPatch.UI+"->footer(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ILjava/lang/Object;II)V"),"Footer row adapter missing");
            var footer=(RegisterRangeInstruction)after.get(578);
            require(footer.getStartRegister()==57&&footer.getRegisterCount()==9,"Footer argument range changed");
            for(int n=0;n<9;n++){
                Instruction copy=after.get(569+n);
                require(copy.getOpcode()==(n==5||n>=7?Opcode.MOVE_FROM16:Opcode.MOVE_OBJECT_FROM16),"Footer argument type changed");
                var registers=(TwoRegisterInstruction)copy;
                require(registers.getRegisterA()==57+n&&registers.getRegisterB()==(n<6?n:n==6?13:n==7?79:80),"Footer argument register changed");
            }
            // Reverse only our exact insertions, then compare the whole original body. This
            // preserves native dialog/layout/font/theme, Apply/Cancel and original composition.
            for(int n=0;n<5;n++)restored.getImplementation().removeInstruction(0);
            restored.getImplementation().replaceInstruction(573,new MutableMethod(original).getImplementation().getInstructions().get(533));
            for(int n=0;n<9;n++)restored.getImplementation().removeInstruction(564);
            restored.getImplementation().replaceInstruction(460,new MutableMethod(original).getImplementation().getInstructions().get(429));
            for(int n=0;n<14;n++)restored.getImplementation().removeInstruction(446);
            restored.getImplementation().replaceInstruction(348,new MutableMethod(original).getImplementation().getInstructions().get(331));
            for(int n=0;n<3;n++)restored.getImplementation().removeInstruction(345);
            restored.getImplementation().replaceInstruction(335,new MutableMethod(original).getImplementation().getInstructions().get(321));
            for(int n=0;n<14;n++)restored.getImplementation().removeInstruction(321);
        }else{
            require(after.size()==before.size()+4,"Summary guard size changed");
            require(NuvioPlaybackButtonsPatch.reference(after.get(0)).equals(MonetDisplayedCardsPatch.MODEL+"->label(I[Ljava/lang/Object;)Ljava/lang/String;"),"Summary hook missing");
            var invoke=(FiveRegisterInstruction)after.get(0);
            require(invoke.getRegisterCount()==2&&invoke.getRegisterC()==1&&invoke.getRegisterD()==2,"Summary arguments changed");
            require(after.get(1).getOpcode()==Opcode.MOVE_RESULT_OBJECT&&((OneRegisterInstruction)after.get(1)).getRegisterA()==0,"Summary result register changed");
            require(after.get(2).getOpcode()==Opcode.IF_EQZ&&((OneRegisterInstruction)after.get(2)).getRegisterA()==0&&((OffsetInstruction)after.get(2)).getCodeOffset()==3,"Native summary fallback changed");
            require(after.get(3).getOpcode()==Opcode.RETURN_OBJECT,"Max summary does not return");
            for(int n=0;n<4;n++)restored.getImplementation().removeInstruction(0);
        }
        require(NuvioPlaybackButtonsPatch.fingerprint(restored).equals(NuvioPlaybackButtonsPatch.fingerprint(new MutableMethod(original))),"Unrelated instructions changed");
    }
    static int evaluate(Method method,int value){
        int[] registers={0,0,value};int result=0;
        for(var instruction:method.getImplementation().getInstructions()){
            switch(instruction.getOpcode()){
                case CONST_4:case CONST_16:registers[((OneRegisterInstruction)instruction).getRegisterA()]=((NarrowLiteralInstruction)instruction).getNarrowLiteral();break;
                case INVOKE_STATIC:
                    var call=(FiveRegisterInstruction)instruction;
                    result=Math.max(registers[call.getRegisterC()],registers[call.getRegisterD()]);break;
                case MOVE_RESULT:registers[((OneRegisterInstruction)instruction).getRegisterA()]=result;break;
                case RETURN:return registers[((OneRegisterInstruction)instruction).getRegisterA()];
                default:throw new AssertionError("Unexpected clamp instruction");
            }
        }throw new AssertionError("No clamp result");
    }
    public static void main(String[] args)throws Exception{
        List<ClassDef> classes=VerifyMonet.read(args[0]);var contracts=MonetDisplayedCardsPatch.validate(classes);
        List<ClassDef> missing=new ArrayList<>(classes);missing.removeIf(c->c.getType().equals("La/iq1;"));reject(missing);
        List<ClassDef> duplicate=new ArrayList<>(classes);duplicate.add(classes.get(0));reject(duplicate);
        List<MutableClass> changed=new ArrayList<>();
        for(ClassDef c:classes){
            List<Method> methods=new ArrayList<>();c.getMethods().forEach(methods::add);
            if(methods.stream().noneMatch(m->MonetDisplayedCardsPatch.TARGETS.contains(m.toString())))continue;
            MutableClass copy=new MutableClass(c);
            for(MutableMethod m:copy.getMethods())if(MonetDisplayedCardsPatch.TARGETS.contains(m.toString())){
                MonetDisplayedCardsPatch.apply(m);mutation(contracts.get(m.toString()),m);
                try{MonetDisplayedCardsPatch.apply(m);throw new AssertionError("Already patched method accepted");}catch(IllegalStateException expected){}
            }changed.add(copy);
        }
        List<ClassDef> patched=new ArrayList<>(classes);patched.removeIf(c->changed.stream().anyMatch(m->m.getType().equals(c.getType())));patched.addAll(changed);reject(patched);
        Path output=Path.of(args[1]);Files.createDirectories(output.getParent());
        DexPool.writeTo(output.toString(),new ImmutableDexFile(com.android.tools.smali.dexlib2.Opcodes.getDefault(),changed));
        int hooks=0;
        try(var input=new java.io.BufferedInputStream(Files.newInputStream(output))){
            for(ClassDef c:DexBackedDexFile.fromInputStream(null,input).getClasses())for(Method m:c.getMethods())
                if(MonetDisplayedCardsPatch.TARGETS.contains(m.toString())){mutation(contracts.get(m.toString()),m);hooks++;}
        }
        require(hooks==5,"Serialized hooks missing");
        System.out.println("PASS: original displayed cards contracts, missing/duplicate/already-patched rejection, unlimited clamp values, preserved fallback/arguments and DEX write/reload");
    }
}

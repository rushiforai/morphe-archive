package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.*;
import java.nio.file.*;
import java.util.*;

public final class VerifyMonetCatalog {
    static void require(boolean condition, String message) { if (!condition) throw new AssertionError(message); }
    static void reject(List<? extends ClassDef> classes) {
        try { MonetCatalogChannelsPatch.validate(classes); }
        catch (IllegalStateException expected) { return; }
        throw new AssertionError("Invalid catalog layout accepted");
    }
    static void call(List<Instruction> code, int index, String target, int... registers) {
        Instruction instruction = code.get(index);
        require(instruction.getOpcode() == Opcode.INVOKE_STATIC && NuvioPlaybackButtonsPatch.reference(instruction).equals(MonetCatalogChannelsPatch.EXTENSION+"->"+target), "Wrong callback at "+index);
        var invoke = (FiveRegisterInstruction) instruction;
        int[] actual = {invoke.getRegisterC(), invoke.getRegisterD(), invoke.getRegisterE(), invoke.getRegisterF(), invoke.getRegisterG()};
        require(invoke.getRegisterCount() == registers.length, "Callback word count at "+index);
        for (int i=0;i<registers.length;i++) require(actual[i] == registers[i], "Callback register at "+index);
    }
    public static void mutation(Method original, Method patched) {
        List<Instruction> before = MonetPremiumPatch.instructions(original), after = MonetPremiumPatch.instructions(patched);
        require(original.getAccessFlags() == patched.getAccessFlags(), "Method access changed");
        require(original.getImplementation().getRegisterCount() == patched.getImplementation().getRegisterCount(), "Registers changed");
        MutableMethod restored = new MutableMethod(patched);
        MutableMethod source = new MutableMethod(original);
        var code = restored.getImplementation();
        String signature = original.toString();
        if (signature.equals(MonetCatalogChannelsPatch.STATE)) {
            require(after.size() == before.size() + 2, "State instruction count changed");
            require(NuvioPlaybackButtonsPatch.reference(after.get(675)).contains("->rowItems("), "Independent row data missing");
            require(NuvioPlaybackButtonsPatch.reference(after.get(547)).contains("->selection("), "Saved catalog identity missing");
            call(after,547,"selection(Ljava/lang/Object;)Ljava/lang/String;",7);
            call(after,675,"rowItems(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;",10,8);
            call(after,689,"matches(Ljava/lang/Object;Ljava/lang/Object;)Z",15,8);
            call(after,701,"hidden(Ljava/util/Set;Ljava/lang/Object;)Ljava/util/LinkedHashSet;",8,7);
            call(after,967,"sources(Ljava/util/List;Ljava/util/LinkedHashMap;Ljava/util/Set;Ljava/util/Locale;)Ljava/util/List;",10,14,1,11);
            require(after.get(688).getOpcode()==Opcode.MOVE_OBJECT_FROM16 && ((TwoRegisterInstruction)after.get(688)).getRegisterA()==15 && ((TwoRegisterInstruction)after.get(688)).getRegisterB()==15,"Item reference not retained");
            code.replaceInstruction(967, source.getImplementation().getInstructions().get(965));
            code.replaceInstruction(701, source.getImplementation().getInstructions().get(699));
            code.replaceInstruction(689, source.getImplementation().getInstructions().get(687));
            code.replaceInstruction(688, source.getImplementation().getInstructions().get(686));
            code.removeInstruction(677); code.removeInstruction(676);
            code.replaceInstruction(675, source.getImplementation().getInstructions().get(675));
            code.replaceInstruction(547, source.getImplementation().getInstructions().get(547));
        } else if (signature.equals(MonetCatalogChannelsPatch.MODEL)) {
            require(after.size() == before.size()+3, "Model flow instruction count changed");
            require(NuvioPlaybackButtonsPatch.reference(after.get(215)).contains("->wrap("), "Independent catalog revision flow missing");
            code.removeInstruction(218); code.removeInstruction(217); code.removeInstruction(216);
            code.replaceInstruction(215, source.getImplementation().getInstructions().get(215));
        } else if (signature.equals(MonetCatalogChannelsPatch.FILTER)) {
            require(after.size() == before.size(), "Filter instruction count changed");
            call(after,111,"disabled(Ljava/util/Set;Ljava/lang/Object;)Z",1,8);
            code.replaceInstruction(111, source.getImplementation().getInstructions().get(111));
        } else if (signature.equals(MonetCatalogChannelsPatch.OWNER)) {
            require(after.size() == before.size()+2, "Owner instruction count changed");
            require(NuvioPlaybackButtonsPatch.reference(after.get(7)).contains("->owner("), "Real icon owner missing");
            call(after,7,"owner(Ljava/lang/String;)Ljava/lang/String;",2);
            code.removeInstruction(9); code.removeInstruction(8);
            code.replaceInstruction(7, source.getImplementation().getInstructions().get(7));
        } else if (signature.equals(MonetCatalogChannelsPatch.HEADER)) {
            require(after.size() == before.size()+2, "Header instruction count changed");
            call(after,80,"contentLabel(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;",6,2);
            code.removeInstruction(81); code.removeInstruction(80);
        } else if (signature.equals(MonetCatalogChannelsPatch.PICKER)) {
            require(after.size() == before.size()+1, "Picker instruction count changed");
            require(NuvioPlaybackButtonsPatch.reference(after.get(1466)).contains("->contentPicker("), "Nested picker missing");
            code.removeInstruction(1465);
            code.replaceInstruction(1465, source.getImplementation().getInstructions().get(1465));
        } else {
            require(after.size() == before.size()+1 && after.get(0).getOpcode() == Opcode.INVOKE_STATIC_RANGE, "Lifecycle/reader callback missing");
            var callback = (RegisterRangeInstruction) after.get(0);
            int register = signature.equals(MonetCatalogChannelsPatch.READER) ? 31 : signature.equals(MonetCatalogChannelsPatch.PROGRAMS) ? 8 : signature.equals(MonetCatalogChannelsPatch.RESUME) ? 14 : 7;
            require(callback.getStartRegister() == register, "Callback receiver changed");
            boolean reader = signature.equals(MonetCatalogChannelsPatch.READER);
            require(callback.getRegisterCount() == (reader ? 4 : 1),"Callback parameter width changed");
            String expected = signature.equals(MonetCatalogChannelsPatch.RESUME) || signature.equals(MonetCatalogChannelsPatch.PAUSE)
                ? "Lsoftware/santodan/extension/monetchannels/CatalogRefresh;->"+(signature.equals(MonetCatalogChannelsPatch.RESUME)?"resume":"pause")+"(Ljava/lang/Object;)V"
                : MonetCatalogChannelsPatch.EXTENSION+(reader?"->reader(Landroid/content/Context;Ljava/lang/Object;ILjava/lang/Object;)V":"->programs(Ljava/util/List;)V");
            require(NuvioPlaybackButtonsPatch.reference(after.get(0)).equals(expected),"Lifecycle/reader callback signature changed");
            code.removeInstruction(0);
        }
        require(NuvioPlaybackButtonsPatch.fingerprint(restored).equals(NuvioPlaybackButtonsPatch.fingerprint(new MutableMethod(original))), "Unrelated instructions changed");
        int address=0;
        int shift=original.toString().equals(MonetCatalogChannelsPatch.READER)||original.toString().equals(MonetCatalogChannelsPatch.PROGRAMS)?3:0;
        for (Instruction instruction : before) {
            require(handlers(original,address,0).equals(handlers(patched,address+shift,shift)), "Exception coverage changed at "+address);
            address+=instruction.getCodeUnits();
        }
    }
    private static Set<String> handlers(Method method,int address,int shift) {
        Set<String> result=new TreeSet<>();
        for(var block:method.getImplementation().getTryBlocks()) if(address>=block.getStartCodeAddress()&&address<block.getStartCodeAddress()+block.getCodeUnitCount())
            for(var handler:block.getExceptionHandlers()) result.add(handler.getExceptionType()+":"+(handler.getHandlerCodeAddress()-shift));
        return result;
    }
    public static void main(String[] args) throws Exception {
        List<ClassDef> classes=VerifyMonet.read(args[0]);
        Map<String,Method> contracts=MonetCatalogChannelsPatch.validate(classes);
        List<ClassDef> duplicates=new ArrayList<>(classes); duplicates.add(classes.get(0)); reject(duplicates);
        List<ClassDef> missing=new ArrayList<>(classes); missing.removeIf(c->c.getType().equals("La/fi5;")); reject(missing);
        List<MutableClass> changed=new ArrayList<>();
        for(ClassDef c:classes) if(MonetCatalogChannelsPatch.TARGETS.stream().anyMatch(t -> t.startsWith(c.getType()+"->"))) {
            MutableClass copy=new MutableClass(c);
            for(MutableMethod m:copy.getMethods()) if(MonetCatalogChannelsPatch.TARGETS.contains(m.toString())) {
                MonetCatalogChannelsPatch.apply(m); mutation(contracts.get(m.toString()),m);
                try { MonetCatalogChannelsPatch.apply(m); throw new AssertionError("Already patched method accepted"); }
                catch(IllegalStateException expected) {}
            }
            changed.add(copy);
        }
        List<ClassDef> patched=new ArrayList<>(classes); patched.removeIf(c->MonetCatalogChannelsPatch.TARGETS.stream().anyMatch(t -> t.startsWith(c.getType()+"->")));patched.addAll(changed);reject(patched);
        Path output=Path.of(args[1]);Files.createDirectories(output.getParent());
        DexPool.writeTo(output.toString(),new ImmutableDexFile(com.android.tools.smali.dexlib2.Opcodes.getDefault(),changed));
        int found=0;
        try(var input=new BufferedInputStream(Files.newInputStream(output))) {
            for(ClassDef c:DexBackedDexFile.fromInputStream(null,input).getClasses()) for(Method m:c.getMethods())
                if(MonetCatalogChannelsPatch.TARGETS.contains(m.toString())) {mutation(contracts.get(m.toString()),m);found++;}
        }
        require(found==MonetCatalogChannelsPatch.TARGETS.size(),"Serialized hooks missing");
        System.out.println("PASS: original Monet catalog contracts, missing/duplicate/already-patched rejection, register/instruction scope and DEX write/reload");
    }
}

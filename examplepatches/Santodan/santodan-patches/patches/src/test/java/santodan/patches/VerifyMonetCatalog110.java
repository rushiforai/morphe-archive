package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.nio.file.*;
import java.util.*;

public final class VerifyMonetCatalog110 {
    static void require(boolean ok,String message) { if(!ok)throw new AssertionError(message); }
    static String ref(Instruction i) { return NuvioPlaybackButtonsPatch.reference(i); }
    static void call(List<Instruction> code,int index,String name,int... registers) {
        require(code.get(index).getOpcode()==Opcode.INVOKE_STATIC && ref(code.get(index)).startsWith(MonetCatalogChannels110.EXTENSION+"->"+name+"("),"Wrong callback "+name);
        var i=(FiveRegisterInstruction)code.get(index); int[] r={i.getRegisterC(),i.getRegisterD(),i.getRegisterE(),i.getRegisterF(),i.getRegisterG()};
        require(i.getRegisterCount()==registers.length,"Wrong argument count");
        for(int n=0;n<registers.length;n++)require(r[n]==registers[n],"Wrong callback register");
    }
    public static void mutation(Method original,Method actual) {
        Method patched=MonetCatalogChannels110.withoutCardSummary(actual);
        var before=MonetPremiumPatch.instructions(original); var after=MonetPremiumPatch.instructions(patched);
        require(original.getAccessFlags()==patched.getAccessFlags() && original.getImplementation().getRegisterCount()==patched.getImplementation().getRegisterCount(),"Native flags/registers changed");
        var restored=new MutableMethod(patched); var nativeCode=new MutableMethod(original).getImplementation().getInstructions(); var code=restored.getImplementation();
        String s=original.toString();
        if(s.equals(MonetCatalogChannels110.STATE)) {
            require(after.size()==before.size()+2,"State size changed");
            call(after,1331,"selection",8);call(after,1470,"rowItems",2,4);call(after,1486,"matches",1,4);
            call(after,1489,"matches110",1,4,10);call(after,1503,"hidden",2,8);
            call(after,1793,"sources",3,11,6,9);call(after,1802,"sources",14,11,0,9);
            require(after.get(1485).getOpcode()==Opcode.MOVE_OBJECT_FROM16 && ((TwoRegisterInstruction)after.get(1485)).getRegisterA()==1 && ((TwoRegisterInstruction)after.get(1485)).getRegisterB()==1,"Item object lost");
            for(int[] pair:new int[][]{{1802,1800},{1793,1791},{1503,1501},{1489,1487},{1486,1484},{1485,1483}})code.replaceInstruction(pair[0],nativeCode.get(pair[1]));
            code.removeInstruction(1472);code.removeInstruction(1471);code.replaceInstruction(1470,nativeCode.get(1470));code.replaceInstruction(1331,nativeCode.get(1331));
        } else if(s.equals(MonetCatalogChannels110.MODEL)) {
            require(after.size()==before.size()+3 && ref(after.get(215)).contains("->wrap("),"Missing revision flow");
            var range=(RegisterRangeInstruction)after.get(215);
            require(range.getStartRegister()==20 && range.getRegisterCount()==1 && ((OneRegisterInstruction)after.get(216)).getRegisterA()==15
                && ref(after.get(217)).equals("La/in1;"),"Wrong flow registers/types");
            var oldStore=(ThreeRegisterInstruction)before.get(215); var newStore=(ThreeRegisterInstruction)after.get(218);
            require(newStore.getRegisterA()==15 && oldStore.getRegisterB()==newStore.getRegisterB() && oldStore.getRegisterC()==newStore.getRegisterC(),"Flow array store changed");
            code.removeInstruction(218);code.removeInstruction(217);code.removeInstruction(216);code.replaceInstruction(215,nativeCode.get(215));
        } else if(s.equals(MonetCatalogChannels110.FILTER)) {
            require(after.size()==before.size(),"Filter size changed");call(after,113,"disabled",1,8);code.replaceInstruction(113,nativeCode.get(113));
        } else if(s.equals(MonetCatalogChannels110.OWNER)) {
            require(after.size()==before.size()+2,"Owner size changed");call(after,7,"owner",2);
            code.removeInstruction(9);code.removeInstruction(8);code.replaceInstruction(7,nativeCode.get(7));
        } else if(s.equals(MonetCatalogChannels110.HEADER)) {
            require(after.size()==before.size()+2,"Header size changed");call(after,112,"contentLabel",3,2);
            restored=MonetCatalogChannels110.withoutHeader(patched);
        } else if(s.equals(MonetCatalogChannels110.PICKER)) {
            require(after.size()==before.size()+1 && ref(after.get(397)).contains("->preparePicker(") && ref(after.get(398)).contains("->contentPicker110("),"Picker hooks missing");
            var capture=(RegisterRangeInstruction)after.get(397);var picker=(RegisterRangeInstruction)after.get(398);
            require(capture.getStartRegister()==28 && capture.getRegisterCount()==1 && picker.getStartRegister()==4 && picker.getRegisterCount()==18,"Picker range/row changed");
            code.removeInstruction(397);code.replaceInstruction(397,nativeCode.get(397));
        } else {
            boolean reader=s.equals(MonetCatalogChannels110.READER),programs=s.equals(MonetCatalogChannels110.PROGRAMS),resume=s.equals(MonetCatalogChannels110.RESUME);
            require(after.size()==before.size()+1,"Entry hook size changed");
            var range=(RegisterRangeInstruction)after.get(0);
            require(range.getStartRegister()==(reader?31:programs?8:resume?15:6) && range.getRegisterCount()==(reader?4:1),"Wrong entry receiver/parameters");
            String owner=reader||programs?MonetCatalogChannels110.EXTENSION:"Lsoftware/santodan/extension/monetchannels/CatalogRefresh;";
            String name=reader?"reader":programs?"programs":resume?"resume":"pause";
            require(ref(after.get(0)).startsWith(owner+"->"+name+"("),"Wrong entry hook");
            code.removeInstruction(0);
        }
        require(NuvioPlaybackButtonsPatch.fingerprint(restored).equals(NuvioPlaybackButtonsPatch.fingerprint(new MutableMethod(original))),"Unrelated native instructions/branches changed: "+s);
        int shift=s.equals(MonetCatalogChannels110.READER)||s.equals(MonetCatalogChannels110.PROGRAMS)?3:0;
        int address=0;
        for(var i:before) {
            require(handlers(original,address,0).equals(handlers(patched,address+shift,shift)),"Exception coverage changed"); address+=i.getCodeUnits();
        }
    }
    static Set<String> handlers(Method m,int address,int shift) {
        Set<String> result=new TreeSet<>();
        for(var t:m.getImplementation().getTryBlocks())if(address>=t.getStartCodeAddress()&&address<t.getStartCodeAddress()+t.getCodeUnitCount())
            for(var h:t.getExceptionHandlers())result.add(h.getExceptionType()+":"+(h.getHandlerCodeAddress()-shift));
        return result;
    }
    static void reject(List<? extends ClassDef> classes) {
        try { MonetCatalogChannels110.validate(classes); } catch(IllegalStateException expected) { return; }
        throw new AssertionError("Invalid catalog layout accepted");
    }
    static void apply(List<ClassDef> classes,boolean cards) {
        var contracts=cards?MonetDisplayedCards110.validate(classes):MonetCatalogChannels110.validate(classes);
        var targets=cards?MonetDisplayedCards110.TARGETS:MonetCatalogChannels110.TARGETS;
        Map<String,MutableClass> changed=new HashMap<>();
        for(String s:targets) {
            var original=contracts.get(s);
            MutableClass owner=changed.computeIfAbsent(original.getDefiningClass(),type->{
                ClassDef c=classes.stream().filter(v->v.getType().equals(type)).findFirst().orElseThrow();
                MutableClass copy=c instanceof MutableClass?(MutableClass)c:new MutableClass(c);classes.set(classes.indexOf(c),copy);return copy;
            });
            var method=owner.getMethods().stream().filter(m->m.toString().equals(s)).findFirst().orElseThrow();
            if(cards)MonetDisplayedCards110.apply(method);else MonetCatalogChannels110.apply(method);
            try {
                if(cards)MonetDisplayedCards110.apply(method);else MonetCatalogChannels110.apply(method);
                throw new AssertionError("Already patched method accepted: "+s);
            } catch(IllegalStateException expected) {}
        }
    }
    public static void audit(List<ClassDef> original,List<ClassDef> patched,boolean cards,boolean premium) {
        var contracts=MonetCatalogChannels110.validate(original);var cardContracts=cards?MonetDisplayedCards110.validate(original):Map.<String,Method>of();
        Map<String,ClassDef> byType=new HashMap<>();original.forEach(c->byType.put(c.getType(),c));
        Set<String> seen=new HashSet<>(),callbacks=new HashSet<>(),calls=new HashSet<>();int hooks=0,cardHooks=0,layouts=0,entitlements=0,extensions=0;
        Method premiumHook=premium?MonetPremiumPatch.findUnique(original):null;
        for(ClassDef c:patched) {
            require(seen.add(c.getType()),"Duplicate class "+c.getType());var old=byType.get(c.getType());
            if(old==null) {
                require(c.getType().startsWith("Lsoftware/santodan/extension/monetchannels/") || cards&&c.getType().startsWith("Lsoftware/santodan/extension/monetcards/"),"Unexpected class "+c.getType());extensions++;
                if(c.getType().equals(MonetCatalogChannels110.LAYOUT)||c.getType().equals(MonetDisplayedCards110.LAYOUT)) {
                    for(Field f:c.getFields())if(f.getName().equals("modern")) { require(((com.android.tools.smali.dexlib2.iface.value.BooleanEncodedValue)f.getInitialValue()).getValue(),"Wrong layout binding");layouts++; }
                }
                for(Method m:c.getMethods())if((m.getAccessFlags()&9)==9)callbacks.add(m.toString());
                continue;
            }
            Map<String,Method> methods=new HashMap<>();old.getMethods().forEach(m->methods.put(m.toString(),m));int count=0;
            for(Method m:c.getMethods()) {
                count++;Method before=methods.get(m.toString());require(before!=null,"New native method");boolean changed=false;
                if(MonetCatalogChannels110.TARGETS.contains(m.toString())) { mutation(before,m);hooks++;changed=true; }
                if(cards&&MonetDisplayedCards110.TARGETS.contains(m.toString())) { VerifyMonetDisplayedCards110.mutation(before,MonetCatalogChannels110.withoutHeader(m));cardHooks++;changed=true; }
                if(premium&&m.equals(premiumHook)) { VerifyMonet.verifyBehavior(before,m);entitlements++;changed=true; }
                if(!changed&&before.getImplementation()!=null)require(NuvioPlaybackButtonsPatch.fingerprint(new MutableMethod(before)).equals(NuvioPlaybackButtonsPatch.fingerprint(new MutableMethod(m))),"Unrelated method changed: "+m);
                if(changed)for(Instruction i:MonetPremiumPatch.instructions(m))if(ref(i).startsWith("Lsoftware/santodan/extension/"))calls.add(ref(i));
            }
            require(count==methods.size(),"Native method lost");
        }
        require(seen.containsAll(byType.keySet()) && hooks==10 && cardHooks==(cards?8:0) && entitlements==(premium?1:0) && layouts==(cards?2:1) && extensions>0,"Incomplete native hooks/classes/layouts");
        require(callbacks.containsAll(calls),"Missing runtime callback signature");
        System.out.println("PASS: 1.1.0 ten catalog hooks; cards="+cards+" premium="+premium+"; "+byType.size()+" native classes; "+extensions+" extension classes; complete callbacks; no duplicate/lost classes or unrelated method changes");
    }
    public static void main(String[] args)throws Exception {
        var original=VerifyMonet.read(args[0]);var contracts=MonetCatalogChannels110.validate(original);
        var missing=new ArrayList<>(original);missing.removeIf(c->c.getType().equals("La/vt5;"));reject(missing);
        var duplicate=new ArrayList<>(original);duplicate.add(original.get(0));reject(duplicate);
        var invalid=new ArrayList<>(original);
        ClassDef readerClass=original.stream().filter(c->c.getType().equals("La/vt5;")).findFirst().orElseThrow();
        var altered=new MutableClass(readerClass);
        altered.getMethods().stream().filter(m->m.toString().equals(MonetCatalogChannels110.READER)).findFirst().orElseThrow()
            .getImplementation().replaceInstruction(0,new com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21s(Opcode.CONST_16,0,511));
        invalid.set(original.indexOf(readerClass),altered);reject(invalid);
        var standalone=new ArrayList<>(original);apply(standalone,false);reject(standalone);
        for(ClassDef c:standalone)for(Method m:c.getMethods())if(MonetCatalogChannels110.TARGETS.contains(m.toString()))mutation(contracts.get(m.toString()),m);
        List<ClassDef> changed=standalone.stream().filter(c->c instanceof MutableClass).collect(java.util.stream.Collectors.toList());
        Path output=Path.of(args[1]);Files.createDirectories(output.getParent());
        DexPool.writeTo(output.toString(),new ImmutableDexFile(com.android.tools.smali.dexlib2.Opcodes.getDefault(),changed));
        int hooks=0;
        try(var in=new java.io.BufferedInputStream(Files.newInputStream(output))) {
            for(ClassDef c:DexBackedDexFile.fromInputStream(null,in).getClasses())for(Method m:c.getMethods())if(MonetCatalogChannels110.TARGETS.contains(m.toString())) {mutation(contracts.get(m.toString()),m);hooks++;}
        }
        require(hooks==10,"Serialized hooks missing");
        for(boolean cardsFirst:new boolean[]{false,true}) {
            var combined=new ArrayList<>(original);apply(combined,cardsFirst);apply(combined,!cardsFirst);
            for(ClassDef c:combined)for(Method m:c.getMethods()) {
                if(MonetCatalogChannels110.TARGETS.contains(m.toString()))mutation(contracts.get(m.toString()),m);
                if(MonetDisplayedCards110.TARGETS.contains(m.toString())) {
                    Method before=MonetDisplayedCards110.validate(original).get(m.toString());
                    VerifyMonetDisplayedCards110.mutation(before,MonetCatalogChannels110.withoutHeader(m));
                }
            }
        }
        System.out.println("PASS: latest catalog native contracts; missing/duplicate/already-patched rejection; registers/branches/exception coverage; DEX write/reload; card overlap safe in both application orders");
    }
}

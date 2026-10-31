package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import java.util.*;

/** Reviewed native channel/filter/picker contracts for Monet 1.1.0 only. */
final class MonetCatalogChannels110 {
    static final String EXTENSION = MonetCatalogChannelsPatch.EXTENSION;
    static final String LAYOUT = "Lsoftware/santodan/extension/monetchannels/NativeLayout;";
    static final String READER = "La/vt5;->l(Landroid/content/Context;Landroid/net/Uri;ILjava/lang/Long;)La/dn5;";
    static final String PROGRAMS = "La/vt5;->e(Ljava/util/List;)Ljava/util/List;";
    static final String STATE = "La/ko2;->i(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;";
    static final String FILTER = "La/c32;->C(Ljava/util/List;Ljava/util/Set;Ljava/util/Set;Ljava/util/Set;Ljava/util/LinkedHashMap;Ljava/util/List;I)La/yr4;";
    static final String SOURCES = "La/c32;->q(Ljava/util/List;Ljava/util/LinkedHashMap;Ljava/util/Set;Ljava/util/Locale;)Ljava/util/List;";
    static final String RESUME = MonetCatalogChannelsPatch.RESUME, PAUSE = MonetCatalogChannelsPatch.PAUSE;
    static final String OWNER = "La/wv0;->i()Ljava/lang/String;";
    static final String HEADER = "La/jz3;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;";
    static final String MODEL = "La/u64;-><init>(Landroid/content/Context;La/po;La/a73;La/co;La/va;La/va;La/q08;La/f50;La/nm7;La/es0;La/xp7;La/no2;)V";
    static final String PICKER = "La/f24;->X(Ljava/lang/String;La/wv0;La/ez2;La/uu1;La/jw1;I)V";
    static final String GENERIC = "La/f24;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/Object;La/lv1;ZLa/lv1;La/wu1;La/wu1;Ljava/util/Set;Ljava/util/Set;La/nv1;La/wu1;La/uu1;La/jw1;III)V";
    static final String CONVERTER = "La/vt5;->m(La/pt5;La/do4;Ljava/util/List;JLjava/util/Map;)La/vs0;";
    static final String NATIVE_FILTER = "La/yp7;->M(La/vs0;Ljava/lang/String;La/ip4;)Z";
    static final List<String> TARGETS = List.of(READER, PROGRAMS, STATE, FILTER, MODEL, RESUME, PAUSE, OWNER, HEADER, PICKER);
    static final Map<String,String> CONTRACTS = Map.ofEntries(
        Map.entry(READER,"731cd70d652b19a67cc0fe36beefa2be5a94c8acd6c370d0a4adaf22caaf97b1"),
        Map.entry(PROGRAMS,"78022252d917d816acd954b5c8ddd978094359d880e26c37f4c47014a2e54935"),
        Map.entry(STATE,"4d96be4d720844e2be790cd858b1ffb10d8e7f8a7ea8f71d7c56a0ffd41ffbba"),
        Map.entry(FILTER,"301d6c4dc29c3db36c9be43ee633616bf6d1118eac9574d1bd56daa8782e8a7e"),
        Map.entry(MODEL,"cc881d2131078ecb8e327636dda2e524305d4d5e1b5c0ad8b7f5337ddacf34c3"),
        Map.entry(RESUME,"6e203fd937756361692091185cd08e18c25db7890eb0b2315fdd1182452e93cc"),
        Map.entry(PAUSE,"89374cf10853879df98a299470c8805118a6c075c2cfa997234f9ce65f5aa2a4"),
        Map.entry(OWNER,"8cb42f8ef196a32f0a79a686eafe652cc2ea85e8ba3f9844e16715ff3e5e35ce"),
        Map.entry(HEADER,"1453cafde8e487745d9093903ccd03b355eaf40f9f3aa047762a5e9901e1fe31"),
        Map.entry(PICKER,"ff7ddae2919725f7553f744b5139434619c7ad96e8dbddc5fa2268a27eb7fab7"),
        Map.entry(SOURCES,"885711a584c76830c4133172361f27357536811822311ae959a71d46ec5b984d"),
        Map.entry(CONVERTER,"7803d0970d44795d9e4f293ff58f09a6d6a3cf2b881067c57d01b1d50bf557cd"),
        Map.entry(GENERIC,"3fbeb478536c55fd45119fc1618c2b56809f0a31e936ab283a6dec4859b3c019"),
        Map.entry(NATIVE_FILTER,"a7d499662c4d01b895a9e47e2d6577b002f37ca685c0eac67cd70a16cdcb5046"),
        Map.entry("La/k88;->g(Ljava/lang/Object;)La/ct6;","abf3dd20112b5a96775079f02fa9796dca18f5f3d50d229f2adbe1700906e028"),
        Map.entry("La/p35;->s(La/in1;La/in1;La/in1;La/mv1;)La/bo;","059ca53acb4e69ad8cda08d536a8875950f00371ad2589935424ce06d0043eaf"),
        Map.entry("La/ct6;->k(Ljava/lang/Object;)V","79425a41920cf35ba0e30b7dd7a3f2c62fbe3b36dcf9168e9558b9afb8aed677"),
        Map.entry("La/do4;-><init>(Landroid/content/Context;)V","78ad317d006ebfbb4955e06e5461b0e2634eebc0f20c7d59c6b9a7b6abd9ff0f"),
        Map.entry("La/gt4;-><init>(ILjava/lang/String;Ljava/lang/String;Z)V","5e45f5e1a8112e354301e2183e4c55188a0f61c4bb215d115e70a2cf8365543e"),
        Map.entry("La/wr4;-><init>(La/vv0;)V","fe664b0294ecc879c2b1e8854f2153bdc7a3b5ed13f8221e947e4bef901794d6"),
        Map.entry("La/j83;->a(Ljava/lang/Object;)Ljava/lang/Object;","02335393bc98532c1f6067946dbc539e50bb512322360ca7cc845c3450963511"),
        Map.entry("La/ez2;->toString()Ljava/lang/String;","b83b81cfcac62997730383d378c8897021265af01add59916cb6c9d17e7d1829"),
        Map.entry("La/vs0;->a(Z)Ljava/lang/String;","1979ea138bcef1bb17b20cdb3cb9648b6dad2a22793722fe57fab5302480a030"));
    private MonetCatalogChannels110() {}
    static IllegalStateException unsupported(String message) { return new IllegalStateException("Unsupported Monet 1.1.0 catalog bytecode: " + message); }
    static String ref(Instruction i) { return NuvioPlaybackButtonsPatch.reference(i); }
    static String fingerprint(Method m) {
        return NuvioPlaybackButtonsPatch.fingerprint(withoutCardSummary(m));
    }
    /** Only the reviewed disjoint card-summary call is normalized; our own hooks still reject. */
    static MutableMethod withoutCardSummary(Method method) {
        var copy = new MutableMethod(method);
        if (!method.toString().equals(HEADER)) return copy;
        var ins = MonetPremiumPatch.instructions(copy);
        int index = 187 + headerShift(copy);
        if (ref(ins.get(index)).equals(MonetDisplayedCards110.MODEL + "->summary(I)Ljava/lang/String;")) {
            if (!(ins.get(index) instanceof FiveRegisterInstruction)) throw unsupported("Card summary encoding changed");
            var call = (FiveRegisterInstruction) ins.get(index);
            if (ins.get(index).getOpcode() != Opcode.INVOKE_STATIC || call.getRegisterCount() != 1 || call.getRegisterC() != 3)
                throw unsupported("Card summary operands changed");
            copy.getImplementation().replaceInstruction(index, new BuilderInstruction35c(Opcode.INVOKE_STATIC,1,3,0,0,0,0,
                new ImmutableMethodReference("Ljava/lang/String;","valueOf",List.of("I"),"Ljava/lang/String;")));
        }
        return copy;
    }
    static int headerShift(Method method) {
        if (!method.toString().equals(HEADER)) return 0;
        var ins = MonetPremiumPatch.instructions(method);
        if (ins.size() <= 114 || !ref(ins.get(112)).equals(EXTENSION+"->contentLabel(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;")) return 0;
        if (!(ins.get(112) instanceof FiveRegisterInstruction)) throw unsupported("Catalog header encoding changed");
        var call = (FiveRegisterInstruction)ins.get(112);
        if (ins.get(112).getOpcode() != Opcode.INVOKE_STATIC || call.getRegisterCount()!=2 || call.getRegisterC()!=3 || call.getRegisterD()!=2
            || ins.get(113).getOpcode()!=Opcode.MOVE_RESULT_OBJECT || ((OneRegisterInstruction)ins.get(113)).getRegisterA()!=3
            || ins.get(114).getOpcode()!=Opcode.NEW_INSTANCE || ((OneRegisterInstruction)ins.get(114)).getRegisterA()!=6
            || !ref(ins.get(114)).equals("La/if6;")) throw unsupported("Catalog header operands changed");
        return 2;
    }
    /** Used by the card patch and combined verifiers; no arbitrary instruction removal. */
    static MutableMethod withoutHeader(Method method) {
        var copy = new MutableMethod(method);
        if (headerShift(copy) == 2) { copy.getImplementation().removeInstruction(112); copy.getImplementation().removeInstruction(112); }
        return copy;
    }
    static Map<String,Method> validate(List<? extends ClassDef> classes) {
        Map<String,Method> found = new HashMap<>(); Set<String> types = new HashSet<>(), symbols = new HashSet<>();
        for (ClassDef c : classes) {
            if (!types.add(c.getType())) throw unsupported("Duplicate class " + c.getType());
            for (Method m : c.getMethods()) {
                if ((m.getAccessFlags()&1)!=0) symbols.add(m.toString());
                if (!CONTRACTS.containsKey(m.toString())) continue;
                String s=m.toString();
                int expected = m.getName().equals("<init>") ? 65537 : List.of(STATE,RESUME,PAUSE,OWNER,HEADER).contains(s)
                    || s.startsWith("La/ct6;") || s.startsWith("La/j83;") || s.startsWith("La/ez2;") || s.startsWith("La/vs0;") ? 17 : 25;
                if (found.put(s,m)!=null || m.getAccessFlags()!=expected || m.getImplementation()==null || !CONTRACTS.get(s).equals(fingerprint(m)))
                    throw unsupported("Changed or already patched contract " + m);
            }
            for (Field f : c.getFields()) if ((f.getAccessFlags()&1)!=0) symbols.add(f.toString());
        }
        if (found.size()!=CONTRACTS.size() || !symbols.containsAll(List.of(
            "La/pt5;->c:J","La/pt5;->b:Ljava/lang/String;","La/pt5;->f:Ljava/util/List;",
            "La/vs0;->n:Ljava/lang/String;","La/vs0;->b:Ljava/lang/String;","La/dn5;->a:Ljava/util/ArrayList;",
            "La/wv0;->g:Ljava/util/List;","La/wv0;->A:Ljava/util/List;","La/gt4;->a:Ljava/lang/String;",
            "La/j83;->l:La/ez2;","La/j83;->m:Ljava/lang/String;","La/ez2;->M:La/kj4;","La/ez2;->F:La/yk4;",
            "La/kv1;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
            "La/lv1;->e(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
            "La/wu1;->a(Ljava/lang/Object;)Ljava/lang/Object;",
            "La/xr4;->a()Ljava/lang/Object;",
            "La/mv1;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
            "La/vr4;->a:La/ip4;","La/ip4;->c:J","La/vv0;->RECOMMENDATIONS:La/vv0;",
            "La/vv0;->BOTH:La/vv0;","La/vv0;->CONTINUE_WATCHING:La/vv0;")))
            throw unsupported("Missing native reader/item/picker/action/flow ABI");
        return found;
    }
    static void selectLayout(MutableClass layout) {
        var init=layout.getMethods().stream().filter(m->m.getName().equals("<clinit>")).findFirst().orElseThrow();
        var code=MonetPremiumPatch.instructions(init);
        var field=layout.getFields().stream().filter(f->f.getName().equals("modern")).findFirst().orElseThrow();
        if (code.size()!=1 || code.get(0).getOpcode()!=Opcode.RETURN_VOID || field.getAccessFlags()!=9 || !field.getType().equals("Z")
            || !(field.getInitialValue() instanceof com.android.tools.smali.dexlib2.iface.value.BooleanEncodedValue)
            || ((com.android.tools.smali.dexlib2.iface.value.BooleanEncodedValue)field.getInitialValue()).getValue()) throw unsupported("Runtime layout initializer changed");
        field.setInitialValue(new app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableBooleanEncodedValue(
            com.android.tools.smali.dexlib2.immutable.value.ImmutableBooleanEncodedValue.TRUE_VALUE));
    }
    static void replace(MutableMethod method,int index,String name,List<String> args,String result,int... registers) {
        int[] r=new int[5]; System.arraycopy(registers,0,r,0,registers.length);
        method.getImplementation().replaceInstruction(index,new BuilderInstruction35c(Opcode.INVOKE_STATIC,registers.length,r[0],r[1],r[2],r[3],r[4],
            new ImmutableMethodReference(EXTENSION,name,args,result)));
    }
    static void apply(MutableMethod method) {
        String s=method.toString();
        if (!TARGETS.contains(s) || !CONTRACTS.get(s).equals(fingerprint(method))) throw unsupported("Changed or already patched method " + method);
        var code=method.getImplementation();
        if (s.equals(STATE)) {
            var sourceArgs=List.of("Ljava/util/List;","Ljava/util/LinkedHashMap;","Ljava/util/Set;","Ljava/util/Locale;");
            replace(method,1800,"sources",sourceArgs,"Ljava/util/List;",14,11,0,9);
            replace(method,1791,"sources",sourceArgs,"Ljava/util/List;",3,11,6,9);
            replace(method,1501,"hidden",List.of("Ljava/util/Set;","Ljava/lang/Object;"),"Ljava/util/LinkedHashSet;",2,8);
            replace(method,1487,"matches110",List.of("Ljava/lang/Object;","Ljava/lang/String;","Ljava/lang/Object;"),"Z",1,4,10);
            replace(method,1484,"matches",List.of("Ljava/lang/Object;","Ljava/lang/Object;"),"Z",1,4);
            code.replaceInstruction(1483,new BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16,1,1));
            replace(method,1470,"rowItems",List.of("Ljava/util/ArrayList;","Ljava/lang/Object;"),"Ljava/util/ArrayList;",2,4);
            code.addInstruction(1471,new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,2));
            code.addInstruction(1472,new BuilderInstruction21c(Opcode.NEW_INSTANCE,11,new ImmutableTypeReference("Ljava/util/ArrayList;")));
            replace(method,1331,"selection",List.of("Ljava/lang/Object;"),"Ljava/lang/String;",8);
        } else if (s.equals(MODEL)) {
            var original=(ThreeRegisterInstruction)MonetPremiumPatch.instructions(method).get(215);
            code.replaceInstruction(215,new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,20,1,new ImmutableMethodReference(EXTENSION,"wrap",List.of("Ljava/lang/Object;"),"Ljava/lang/Object;")));
            code.addInstruction(216,new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,15));
            code.addInstruction(217,new BuilderInstruction21c(Opcode.CHECK_CAST,15,new ImmutableTypeReference("La/in1;")));
            code.addInstruction(218,new BuilderInstruction23x(Opcode.APUT_OBJECT,15,original.getRegisterB(),original.getRegisterC()));
        } else if (s.equals(FILTER)) {
            replace(method,113,"disabled",List.of("Ljava/util/Set;","Ljava/lang/Object;"),"Z",1,8);
        } else if (s.equals(OWNER)) {
            replace(method,7,"owner",List.of("Ljava/lang/String;"),"Ljava/lang/String;",2);
            code.addInstruction(8,new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,2));
            code.addInstruction(9,new BuilderInstruction11x(Opcode.RETURN_OBJECT,2));
        } else if (s.equals(HEADER)) {
            replace(method,112,"contentLabel",List.of("Ljava/lang/String;","Ljava/lang/Object;"),"Ljava/lang/String;",3,2);
            code.addInstruction(113,new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,3));
            code.addInstruction(114,new BuilderInstruction21c(Opcode.NEW_INSTANCE,6,new ImmutableTypeReference("La/if6;")));
        } else if (s.equals(PICKER)) {
            var parameters=List.of("Ljava/lang/String;","Ljava/lang/String;","Ljava/util/List;","Ljava/lang/Object;","Ljava/lang/Object;","Z",
                "Ljava/lang/Object;","Ljava/lang/Object;","Ljava/lang/Object;","Ljava/util/Set;","Ljava/util/Set;","Ljava/lang/Object;",
                "Ljava/lang/Object;","Ljava/lang/Object;","Ljava/lang/Object;","I","I","I");
            code.replaceInstruction(397,new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,4,18,new ImmutableMethodReference(EXTENSION,"contentPicker110",parameters,"V")));
            code.addInstruction(397,new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,28,1,new ImmutableMethodReference(EXTENSION,"preparePicker",List.of("Ljava/lang/Object;"),"V")));
        } else {
            boolean reader=s.equals(READER), programs=s.equals(PROGRAMS), resume=s.equals(RESUME);
            int start=reader?31:programs?8:resume?15:6;
            code.addInstruction(0,new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,start,reader?4:1,
                new ImmutableMethodReference(reader||programs?EXTENSION:"Lsoftware/santodan/extension/monetchannels/CatalogRefresh;",
                    reader?"reader":programs?"programs":resume?"resume":"pause",
                    reader?List.of("Landroid/content/Context;","Ljava/lang/Object;","I","Ljava/lang/Object;"):programs?List.of("Ljava/util/List;"):List.of("Ljava/lang/Object;"),"V")));
        }
    }
}

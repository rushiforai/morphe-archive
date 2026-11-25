package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import java.util.*;

/** Reviewed native channel/filter/picker contracts for Monet 1.1.2 only. */
final class MonetCatalogChannels112 {
    static final String EXTENSION = MonetCatalogChannelsPatch.EXTENSION;
    static final String LAYOUT = "Lsoftware/santodan/extension/monetchannels/NativeLayout;";
    static final String READER = "La/n86;->m(Landroid/content/Context;Landroid/net/Uri;ILjava/lang/Long;)La/e16;";
    static final String PROGRAMS = "La/n86;->e(Ljava/util/List;)Ljava/util/List;";
    static final String STATE = "La/gf4;->g(Ljava/util/List;Ljava/util/Map;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;ZZLa/k73;ZLa/ym;Ljava/util/Locale;La/xm2;Ljava/util/Map;)La/za4;";
    static final String FILTER = "La/gf4;->Q(Ljava/util/List;Ljava/util/Set;Ljava/util/Set;Ljava/util/Set;Ljava/util/LinkedHashMap;Ljava/util/List;IZZ)La/t15;";
    static final String SOURCES = "La/gf4;->z(Ljava/util/List;Ljava/util/LinkedHashMap;Ljava/util/Set;Ljava/util/Locale;)Ljava/util/List;";
    static final String RESUME = MonetCatalogChannelsPatch.RESUME, PAUSE = MonetCatalogChannelsPatch.PAUSE;
    static final String OWNER = "La/sx0;->h()Ljava/lang/String;";
    static final String HEADER = MonetDisplayedCards112.HEADER;
    static final String MODEL = "La/bf4;-><init>(Landroid/content/Context;La/sq;La/zd3;La/bq;La/rb;La/rb;La/mr8;La/n70;La/sd8;La/ru0;La/hh8;La/cu2;)V";
    static final String PICKER = "La/ea4;->Y(Ljava/lang/String;La/sx0;La/l53;La/fx1;La/ty1;I)V";
    static final String GENERIC = "La/ea4;->H1(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/Object;La/wx1;ZLa/wx1;La/hx1;La/hx1;Ljava/util/Set;Ljava/util/Set;La/hx1;La/fx1;La/ty1;III)V";
    static final String CONVERTER = "La/n86;->n(La/i86;La/sk4;Ljava/util/List;JLjava/util/Map;)La/iv0;";
    static final String NATIVE_FILTER = "La/ke3;->D(La/iv0;Ljava/lang/String;La/zy4;)Z";
    /** Default (non-custom) section label result in the shared header; custom row names keep priority. */
    static final int HEADER_INDEX = 152, CARD_SUMMARY = 248;
    static final List<String> TARGETS = List.of(READER, PROGRAMS, STATE, FILTER, MODEL, RESUME, PAUSE, OWNER, HEADER, PICKER);
    static final Map<String,String> CONTRACTS = Map.ofEntries(
        Map.entry(READER, "d9692c07bd6e7b392a3814e87a8df771cd6fc65c45d4132e6eb993b9523f9c5b"),
        Map.entry(PROGRAMS, "02307245e7d72e7714c7effb1b1d0f55f06a065168f52c00024047dc2efec39c"),
        Map.entry(STATE, "8d6b12a14b638dd1be6092305dc9377eced03c39d92042ec09a890bc4ee4bf46"),
        Map.entry(FILTER, "56f6083c16be9d0fa923028d88cec324e343570da12a3cc95243a5897131b64f"),
        Map.entry(MODEL, "cdfaa73d47f7fdb5ffed6ecc965f46650166d82a707bfcda071207894f892019"),
        Map.entry(RESUME, "bf129fb0dad7edc74a0271f2a59fb05e46540102b951f3388c8ba1421a01133e"),
        Map.entry(PAUSE, "c3204ba8bb10fec2dc5118d9855a3d1106090eb3932b48af1ced1187b18a04d8"),
        Map.entry(OWNER, "212bd83b68a4d86f04923a2954ab265cce516eafee0449e7156b067e18403eae"),
        Map.entry(HEADER, "1ef59c2ee1b537ea1913a88e48457c08758b1fdc4929cc4bb7afc69ba05c013b"),
        Map.entry(PICKER, "4cb0fa877b46f03f1b9e2f6981292de65233e1f7ff54040b9919a393793c9b4e"),
        Map.entry(SOURCES, "7b98f0d74ea9c08e9baa6dc60d9b073b25e213fc3b1b4fd72165dec4cdf5a329"),
        Map.entry(CONVERTER, "6f0e87639a93c4d33acfe0309c3d856006d5cd7073e109e6a425addf0c5d8bc3"),
        Map.entry(GENERIC, "e61b97300e04c5e237c625e438143f9659ea96b131b89a7781e0e05f4d8405bb"),
        Map.entry(NATIVE_FILTER, "56ccc71ac3219eb6086e8ca24126530365afd6fbd5703a04ccf15b5882a268f6"),
        Map.entry("La/td5;->a(Ljava/lang/Object;)La/jl7;", "0345db2cdee2173596fcf093ae17fc5d66fb272de8a56c8357796d9eff250a86"),
        Map.entry("La/s39;->z(La/ap1;La/ap1;La/ap1;La/xx1;)La/aq;", "2ff5507e842a1a8d86afa4b48ee504d1ded7fc3360bef55ebf5032f03979b7d4"),
        Map.entry("La/jl7;->j(Ljava/lang/Object;)V", "30ae63a4f268fb69628e262fb264b12fc6c1988e21aa7cbc83cf9cb7dcce9457"),
        Map.entry("La/sk4;-><init>(Landroid/content/Context;)V", "b732b8d728d2015bd99aa23b519c494d3033e35b9f26a43d17186bae83c9f604"),
        Map.entry("La/h35;-><init>(ILjava/lang/String;Ljava/lang/String;Z)V", "fde6511316f26856436590e34eba28c3246677c383bf177f9ae797079af7163a"),
        Map.entry("La/r15;-><init>(La/rx0;)V", "042392369aaf93877458edbea5e80e79da05ca55840c6d9e0f051ba5f7c79d20"),
        Map.entry("La/jf3;->a(Ljava/lang/Object;)Ljava/lang/Object;", "9b3f540ad73c3864fa8ab8481f307ecc876dfe757952e1eaf8640df18c87f007"),
        Map.entry("La/l53;->toString()Ljava/lang/String;", "7c0c8bb8e78110dde5532614dc452af49f08c99664237e33cdd545bd116a9cba"),
        Map.entry("La/iv0;->a(Z)Ljava/lang/String;", "3d98c62291c2d30c741d6c0063b94d6d47e2035f7a0c9551644e22d0e124f4f3"));
    private MonetCatalogChannels112() {}
    static IllegalStateException unsupported(String message) { return new IllegalStateException("Unsupported Monet 1.1.2 catalog bytecode: " + message); }
    static String ref(Instruction i) { return NuvioPlaybackButtonsPatch.reference(i); }
    static String fingerprint(Method m) {
        return NuvioPlaybackButtonsPatch.fingerprint(withoutCardSummary(m));
    }
    /** Only the reviewed disjoint card-summary call is normalized; our own hooks still reject. */
    static MutableMethod withoutCardSummary(Method method) {
        var copy = new MutableMethod(method);
        if (!method.toString().equals(HEADER)) return copy;
        var ins = MonetPremiumPatch.instructions(copy);
        int index = CARD_SUMMARY + headerShift(copy);
        if (ref(ins.get(index)).equals(MonetDisplayedCards112.MODEL + "->summary(I)Ljava/lang/String;")) {
            if (!(ins.get(index) instanceof FiveRegisterInstruction)) throw unsupported("Card summary encoding changed");
            var call = (FiveRegisterInstruction) ins.get(index);
            if (ins.get(index).getOpcode() != Opcode.INVOKE_STATIC || call.getRegisterCount() != 1 || call.getRegisterC() != 5)
                throw unsupported("Card summary operands changed");
            copy.getImplementation().replaceInstruction(index, new BuilderInstruction35c(Opcode.INVOKE_STATIC,1,5,0,0,0,0,
                new ImmutableMethodReference("Ljava/lang/String;","valueOf",List.of("I"),"Ljava/lang/String;")));
        }
        return copy;
    }
    static int headerShift(Method method) {
        if (!method.toString().equals(HEADER)) return 0;
        var ins = MonetPremiumPatch.instructions(method);
        int at = HEADER_INDEX;
        if (ins.size() <= at + 1 || !ref(ins.get(at)).equals(EXTENSION+"->contentLabel(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;")) return 0;
        if (!(ins.get(at) instanceof FiveRegisterInstruction)) throw unsupported("Catalog header encoding changed");
        var call = (FiveRegisterInstruction)ins.get(at);
        if (ins.get(at).getOpcode() != Opcode.INVOKE_STATIC || call.getRegisterCount()!=2 || call.getRegisterC()!=14 || call.getRegisterD()!=2
            || ins.get(at+1).getOpcode()!=Opcode.MOVE_RESULT_OBJECT || ((OneRegisterInstruction)ins.get(at+1)).getRegisterA()!=14)
            throw unsupported("Catalog header operands changed");
        return 2;
    }
    /** Used by the card patch and combined verifiers; no arbitrary instruction removal. */
    static MutableMethod withoutHeader(Method method) {
        var copy = new MutableMethod(method);
        if (headerShift(copy) == 2) { copy.getImplementation().removeInstruction(HEADER_INDEX); copy.getImplementation().removeInstruction(HEADER_INDEX); }
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
                int expected = m.getName().equals("<init>") ? 65537 : List.of(RESUME,PAUSE,OWNER,HEADER).contains(s)
                    || s.startsWith("La/jl7;") || s.startsWith("La/jf3;") || s.startsWith("La/l53;") || s.startsWith("La/iv0;") ? 17 : 25;
                if (found.put(s,m)!=null || m.getAccessFlags()!=expected || m.getImplementation()==null || !CONTRACTS.get(s).equals(fingerprint(m)))
                    throw unsupported("Changed or already patched contract " + m);
            }
            for (Field f : c.getFields()) if ((f.getAccessFlags()&1)!=0) symbols.add(f.toString());
        }
        if (found.size()!=CONTRACTS.size() || !symbols.containsAll(List.of(
            "La/i86;->c:J","La/i86;->b:Ljava/lang/String;","La/i86;->f:Ljava/util/List;",
            "La/iv0;->o:Ljava/lang/String;","La/iv0;->b:Ljava/lang/String;","La/e16;->a:Ljava/util/ArrayList;",
            "La/sx0;->g:Ljava/util/List;","La/sx0;->D:Ljava/util/List;","La/h35;->a:Ljava/lang/String;",
            "La/jf3;->l:La/l53;","La/jf3;->m:Ljava/lang/String;","La/l53;->P:La/sr4;","La/l53;->H:La/jt4;",
            "La/vx1;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
            "La/wx1;->e(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
            "La/hx1;->a(Ljava/lang/Object;)Ljava/lang/Object;",
            "La/sr4;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
            "La/jt4;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
            "La/xx1;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
            "La/q15;->a:La/zy4;","La/zy4;->c:J","La/rx0;->RECOMMENDATIONS:La/rx0;",
            "La/rx0;->BOTH:La/rx0;","La/rx0;->CONTINUE_WATCHING:La/rx0;")))
            throw unsupported("Missing native reader/item/picker/action/flow ABI");
        return found;
    }
    static void selectLayout(MutableClass layout) {
        var init=layout.getMethods().stream().filter(m->m.getName().equals("<clinit>")).findFirst().orElseThrow();
        var code=MonetPremiumPatch.instructions(init);
        var field=layout.getFields().stream().filter(f->f.getName().equals("v112")).findFirst().orElseThrow();
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
            // Original 1.1.2 coordinates, applied from the end: row v0 (sx0), selection v7, item v13, filter v11.
            var sourceArgs=List.of("Ljava/util/List;","Ljava/util/LinkedHashMap;","Ljava/util/Set;","Ljava/util/Locale;");
            replace(method,1059,"sources",sourceArgs,"Ljava/util/List;",2,8,1,10);
            replace(method,1049,"sources",sourceArgs,"Ljava/util/List;",9,8,7,10);
            replace(method,721,"hidden",List.of("Ljava/util/Set;","Ljava/lang/Object;"),"Ljava/util/LinkedHashSet;",1,0);
            replace(method,710,"matches110",List.of("Ljava/lang/Object;","Ljava/lang/String;","Ljava/lang/Object;"),"Z",13,7,11);
            replace(method,707,"matches",List.of("Ljava/lang/Object;","Ljava/lang/Object;"),"Z",13,7);
            code.replaceInstruction(706,new BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16,13,13));
            // v1 may be Kotlin's shared empty list (rg1.k at 574), not an ArrayList: use a List callback.
            replace(method,694,"rowItems112",List.of("Ljava/util/List;","Ljava/lang/Object;"),"Ljava/util/List;",1,7);
            code.addInstruction(695,new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,1));
            code.addInstruction(696,new BuilderInstruction21c(Opcode.NEW_INSTANCE,8,new ImmutableTypeReference("Ljava/util/ArrayList;")));
            replace(method,539,"selection",List.of("Ljava/lang/Object;"),"Ljava/lang/String;",0);
        } else if (s.equals(MODEL)) {
            // Recommendations flow (copied at 103) is array slot 1; v15 is dead at the store.
            var original=(ThreeRegisterInstruction)MonetPremiumPatch.instructions(method).get(247);
            code.replaceInstruction(247,new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,17,1,new ImmutableMethodReference(EXTENSION,"wrap",List.of("Ljava/lang/Object;"),"Ljava/lang/Object;")));
            code.addInstruction(248,new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,15));
            code.addInstruction(249,new BuilderInstruction21c(Opcode.CHECK_CAST,15,new ImmutableTypeReference("La/ap1;")));
            code.addInstruction(250,new BuilderInstruction23x(Opcode.APUT_OBJECT,15,original.getRegisterB(),original.getRegisterC()));
        } else if (s.equals(FILTER)) {
            replace(method,113,"disabled",List.of("Ljava/util/Set;","Ljava/lang/Object;"),"Z",2,11);
        } else if (s.equals(OWNER)) {
            replace(method,10,"owner",List.of("Ljava/lang/String;"),"Ljava/lang/String;",2);
            code.addInstruction(11,new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,2));
            code.addInstruction(12,new BuilderInstruction11x(Opcode.RETURN_OBJECT,2));
        } else if (s.equals(HEADER)) {
            code.addInstruction(HEADER_INDEX,new BuilderInstruction35c(Opcode.INVOKE_STATIC,2,14,2,0,0,0,
                new ImmutableMethodReference(EXTENSION,"contentLabel",List.of("Ljava/lang/String;","Ljava/lang/Object;"),"Ljava/lang/String;")));
            code.addInstruction(HEADER_INDEX+1,new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,14));
        } else if (s.equals(PICKER)) {
            // 1.1.2's generic picker dropped the 1.1.0/1.1.1 predicate argument (17 arguments, v0-v16).
            var parameters=List.of("Ljava/lang/String;","Ljava/lang/String;","Ljava/util/List;","Ljava/lang/Object;","Ljava/lang/Object;","Z",
                "Ljava/lang/Object;","Ljava/lang/Object;","Ljava/lang/Object;","Ljava/util/Set;","Ljava/util/Set;","Ljava/lang/Object;",
                "Ljava/lang/Object;","Ljava/lang/Object;","I","I","I");
            code.replaceInstruction(427,new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,0,17,new ImmutableMethodReference(EXTENSION,"contentPicker112",parameters,"V")));
            code.addInstruction(427,new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,26,1,new ImmutableMethodReference(EXTENSION,"preparePicker",List.of("Ljava/lang/Object;"),"V")));
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

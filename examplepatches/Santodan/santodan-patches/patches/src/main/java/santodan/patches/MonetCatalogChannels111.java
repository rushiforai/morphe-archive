package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import java.util.*;

/** Reviewed native channel/filter/picker contracts for Monet 1.1.1 only. */
final class MonetCatalogChannels111 {
    static final String EXTENSION = MonetCatalogChannelsPatch.EXTENSION;
    static final String LAYOUT = "Lsoftware/santodan/extension/monetchannels/NativeLayout;";
    static final String READER = "La/s46;->l(Landroid/content/Context;Landroid/net/Uri;ILjava/lang/Long;)La/rx5;";
    static final String PROGRAMS = "La/s46;->e(Ljava/util/List;)Ljava/util/List;";
    static final String STATE = "La/b42;->k(Ljava/util/List;Ljava/util/Map;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;ZZLa/h63;ZLa/rm;Ljava/util/Locale;La/nm2;)La/x84;";
    static final String FILTER = "La/b42;->C(Ljava/util/List;Ljava/util/Set;Ljava/util/Set;Ljava/util/Set;Ljava/util/LinkedHashMap;Ljava/util/List;IZZ)La/dy4;";
    static final String SOURCES = "La/b42;->n(Ljava/util/List;Ljava/util/LinkedHashMap;Ljava/util/Set;Ljava/util/Locale;)Ljava/util/List;";
    static final String RESUME = MonetCatalogChannelsPatch.RESUME, PAUSE = MonetCatalogChannelsPatch.PAUSE;
    static final String OWNER = "La/nx0;->i()Ljava/lang/String;";
    static final String HEADER = "La/bv3;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;";
    static final String MODEL = "La/qc4;-><init>(Landroid/content/Context;La/aq;La/jc3;La/op;La/xb;La/xb;La/pc8;La/u60;La/uy7;La/vt0;La/k28;La/lt2;)V";
    static final String PICKER = "La/b84;->X(Ljava/lang/String;La/nx0;La/o43;La/tw1;La/iy1;I)V";
    static final String GENERIC = "La/b84;->E1(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/Object;La/kx1;ZLa/kx1;La/vw1;La/vw1;Ljava/util/Set;Ljava/util/Set;La/mx1;La/vw1;La/tw1;La/iy1;III)V";
    static final String CONVERTER = "La/s46;->m(La/n46;La/ss4;Ljava/util/List;JLjava/util/Map;)La/mu0;";
    static final String NATIVE_FILTER = "La/m42;->d0(La/mu0;Ljava/lang/String;La/ov4;)Z";
    static final List<String> TARGETS = List.of(READER, PROGRAMS, STATE, FILTER, MODEL, RESUME, PAUSE, OWNER, HEADER, PICKER);
    static final Map<String,String> CONTRACTS = Map.ofEntries(
        Map.entry(READER, "0568c313394ea299c08aab77db2c9b6b2734196a752e265b321cc70fc67aac01"),
        Map.entry(PROGRAMS, "bd8c39e04effcfed28c100cba7f98279e5c8fbd2642c4a22eab180f38ae7469e"),
        Map.entry(STATE, "dc6b25a9f6f7ec8dabd7d6c0b3a94355a03e06e7b1583d5e7628b4830e446240"),
        Map.entry(FILTER, "895af397553541a3ece94f353c9f70c65c44fb7e824a3bb656154c72349dea8c"),
        Map.entry(MODEL, "7bd699c6272f1c5a81b7e3d731a722dd263dd44a062c0cd9fbfd6257f2ae8455"),
        Map.entry(RESUME, "1a0f9e5330841265697050087bf638bac525aa784f663135e4d6493223f94223"),
        Map.entry(PAUSE, "de5d022044426157f74725341fdb911f92288fe430eba6470c53d97863466f18"),
        Map.entry(OWNER, "d0ccbb47b4d2411b14f8703dd818ce64975646127854958aff5ddc8dadc8043b"),
        Map.entry(HEADER, "218de76b5478be96944a1a37aa00898633d29c7d061b10546e5850e3892999c1"),
        Map.entry(PICKER, "fd1e9b999d94c20f3ce3c0f48248870043384e5719733f53dee8e070d23db2b9"),
        Map.entry(SOURCES, "d9b847a243bc46f3e1131ebe92524fb08b5ac1cc5ca011c84ae8a620b62fa7e6"),
        Map.entry(CONVERTER, "4a4aab0ab0374d426cd5b1656ce5e68068c883e805066167b3bfd14041e9eb25"),
        Map.entry(GENERIC, "8c488e1f1aae02dde525e775a041f507b4a1435183abfda9d628ea52e275450a"),
        Map.entry(NATIVE_FILTER, "75a3c49e4e7dcb3e3efbbd04e45776dac623a8f09e9fbc6dd11bf764be208059"),
        Map.entry("La/lz7;->g(Ljava/lang/Object;)La/w47;", "bda96cda3a556b67559da592e28558c05043534d7716d456064e5692b869094c"),
        Map.entry("La/zl0;->q(La/ap1;La/ap1;La/ap1;La/lx1;)La/np;", "5dfbcd15089eb43fd4b623025a4fa8d5fc39568f720e02861097b35291d094f3"),
        Map.entry("La/w47;->j(Ljava/lang/Object;)V", "9c09035407da7738e87de5f9b1b0a17143b1a99e5e08638473932ea334f9ae22"),
        Map.entry("La/ss4;-><init>(Landroid/content/Context;)V", "6a58e2f4945f08fd6a551092076188f6ba82c3e63b0426c94c6d8a987674fd15"),
        Map.entry("La/lz4;-><init>(ILjava/lang/String;Ljava/lang/String;Z)V", "efc86eceb1351d18d234a6893b224a3dc7ebe1547a8b3f169f7bc58c7dfca577"),
        Map.entry("La/by4;-><init>(La/mx0;)V", "e44119649f2ee11b75dfc903aa703ddf6b9f74d5cd2508b3c6405f81090e296a"),
        Map.entry("La/nd3;->a(Ljava/lang/Object;)Ljava/lang/Object;", "3164d0b4db4dd25d9735fef6284075dc5cdcf7566ae1962726d4000db15dd9b6"),
        Map.entry("La/o43;->toString()Ljava/lang/String;", "463c926b1b758abf3649818c1f9e2b2d0aadb52ad304cac4c4f46be0df61157c"),
        Map.entry("La/mu0;->a(Z)Ljava/lang/String;", "55a7861f8aa3a25e8931a736c298c2d00a896f71df32c927aea38cd34a5620da"));
    private MonetCatalogChannels111() {}
    static IllegalStateException unsupported(String message) { return new IllegalStateException("Unsupported Monet 1.1.1 catalog bytecode: " + message); }
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
        if (ref(ins.get(index)).equals(MonetDisplayedCards111.MODEL + "->summary(I)Ljava/lang/String;")) {
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
            || !ref(ins.get(114)).equals("La/vq6;")) throw unsupported("Catalog header operands changed");
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
                int expected = m.getName().equals("<init>") ? 65537 : List.of(RESUME,PAUSE,OWNER,HEADER).contains(s)
                    || s.startsWith("La/w47;") || s.startsWith("La/nd3;") || s.startsWith("La/o43;") || s.startsWith("La/mu0;") ? 17 : 25;
                if (found.put(s,m)!=null || m.getAccessFlags()!=expected || m.getImplementation()==null || !CONTRACTS.get(s).equals(fingerprint(m)))
                    throw unsupported("Changed or already patched contract " + m);
            }
            for (Field f : c.getFields()) if ((f.getAccessFlags()&1)!=0) symbols.add(f.toString());
        }
        if (found.size()!=CONTRACTS.size() || !symbols.containsAll(List.of(
            "La/n46;->c:J","La/n46;->b:Ljava/lang/String;","La/n46;->f:Ljava/util/List;",
            "La/mu0;->n:Ljava/lang/String;","La/mu0;->b:Ljava/lang/String;","La/rx5;->a:Ljava/util/ArrayList;",
            "La/nx0;->g:Ljava/util/List;","La/nx0;->A:Ljava/util/List;","La/lz4;->a:Ljava/lang/String;",
            "La/nd3;->l:La/o43;","La/nd3;->m:Ljava/lang/String;","La/o43;->M:La/yp4;","La/o43;->F:La/br4;",
            "La/jx1;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
            "La/kx1;->e(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
            "La/vw1;->a(Ljava/lang/Object;)Ljava/lang/Object;",
            "La/yp4;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
            "La/lx1;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
            "La/ay4;->a:La/ov4;","La/ov4;->c:J","La/mx0;->RECOMMENDATIONS:La/mx0;",
            "La/mx0;->BOTH:La/mx0;","La/mx0;->CONTINUE_WATCHING:La/mx0;")))
            throw unsupported("Missing native reader/item/picker/action/flow ABI");
        return found;
    }
    static void selectLayout(MutableClass layout) {
        var init=layout.getMethods().stream().filter(m->m.getName().equals("<clinit>")).findFirst().orElseThrow();
        var code=MonetPremiumPatch.instructions(init);
        var field=layout.getFields().stream().filter(f->f.getName().equals("v111")).findFirst().orElseThrow();
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
            replace(method,911,"sources",sourceArgs,"Ljava/util/List;",3,10,1,12);
            replace(method,900,"sources",sourceArgs,"Ljava/util/List;",11,10,9,12);
            replace(method,563,"hidden",List.of("Ljava/util/Set;","Ljava/lang/Object;"),"Ljava/util/LinkedHashSet;",4,6);
            replace(method,550,"matches110",List.of("Ljava/lang/Object;","Ljava/lang/String;","Ljava/lang/Object;"),"Z",1,9,10);
            replace(method,547,"matches",List.of("Ljava/lang/Object;","Ljava/lang/Object;"),"Z",1,9);
            code.replaceInstruction(546,new BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16,1,1));
            replace(method,533,"rowItems",List.of("Ljava/util/ArrayList;","Ljava/lang/Object;"),"Ljava/util/ArrayList;",1,9);
            code.addInstruction(534,new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,1));
            code.addInstruction(535,new BuilderInstruction21c(Opcode.NEW_INSTANCE,3,new ImmutableTypeReference("Ljava/util/ArrayList;")));
            replace(method,382,"selection",List.of("Ljava/lang/Object;"),"Ljava/lang/String;",6);
        } else if (s.equals(MODEL)) {
            var original=(ThreeRegisterInstruction)MonetPremiumPatch.instructions(method).get(225);
            code.replaceInstruction(225,new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,54,1,new ImmutableMethodReference(EXTENSION,"wrap",List.of("Ljava/lang/Object;"),"Ljava/lang/Object;")));
            code.addInstruction(226,new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,15));
            code.addInstruction(227,new BuilderInstruction21c(Opcode.CHECK_CAST,15,new ImmutableTypeReference("La/ap1;")));
            code.addInstruction(228,new BuilderInstruction23x(Opcode.APUT_OBJECT,15,original.getRegisterB(),original.getRegisterC()));
        } else if (s.equals(FILTER)) {
            replace(method,118,"disabled",List.of("Ljava/util/Set;","Ljava/lang/Object;"),"Z",2,9);
        } else if (s.equals(OWNER)) {
            replace(method,7,"owner",List.of("Ljava/lang/String;"),"Ljava/lang/String;",2);
            code.addInstruction(8,new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,2));
            code.addInstruction(9,new BuilderInstruction11x(Opcode.RETURN_OBJECT,2));
        } else if (s.equals(HEADER)) {
            replace(method,112,"contentLabel",List.of("Ljava/lang/String;","Ljava/lang/Object;"),"Ljava/lang/String;",3,2);
            code.addInstruction(113,new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,3));
            code.addInstruction(114,new BuilderInstruction21c(Opcode.NEW_INSTANCE,6,new ImmutableTypeReference("La/vq6;")));
        } else if (s.equals(PICKER)) {
            var parameters=List.of("Ljava/lang/String;","Ljava/lang/String;","Ljava/util/List;","Ljava/lang/Object;","Ljava/lang/Object;","Z",
                "Ljava/lang/Object;","Ljava/lang/Object;","Ljava/lang/Object;","Ljava/util/Set;","Ljava/util/Set;","Ljava/lang/Object;",
                "Ljava/lang/Object;","Ljava/lang/Object;","Ljava/lang/Object;","I","I","I");
            code.replaceInstruction(398,new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,4,18,new ImmutableMethodReference(EXTENSION,"contentPicker110",parameters,"V")));
            code.addInstruction(398,new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,28,1,new ImmutableMethodReference(EXTENSION,"preparePicker",List.of("Ljava/lang/Object;"),"V")));
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

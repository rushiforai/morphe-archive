package patches.monet;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import java.util.*;

/** Exact Monet 1.1.1 contracts for dedicated Wuplay rows.
 * Derived from Santodan/santodan-patches under GPL-3.0; see NOTICE. */
final class MonetWuplayHooks {
    static final String EXTENSION = "Lnl/johninnl/monetwuplay/MonetWuplayCatalogs;";
    static final String NUVIO_EXTENSION = "Lnl/johninnl/monetnuvio/MonetNuvioCatalogs;";
    static final String NUVIO_REFRESH = "Lnl/johninnl/monetnuvio/NuvioCatalogRefresh;";
    static final String READER = "La/s46;->l(Landroid/content/Context;Landroid/net/Uri;ILjava/lang/Long;)La/rx5;";
    static final String PROGRAMS = "La/s46;->e(Ljava/util/List;)Ljava/util/List;";
    static final String STATE = "La/b42;->k(Ljava/util/List;Ljava/util/Map;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;ZZLa/h63;ZLa/rm;Ljava/util/Locale;La/nm2;)La/x84;";
    static final String FILTER = "La/b42;->C(Ljava/util/List;Ljava/util/Set;Ljava/util/Set;Ljava/util/Set;Ljava/util/LinkedHashMap;Ljava/util/List;IZZ)La/dy4;";
    static final String SOURCES = "La/b42;->n(Ljava/util/List;Ljava/util/LinkedHashMap;Ljava/util/Set;Ljava/util/Locale;)Ljava/util/List;";
    static final String RESUME = "Lcom/klevico/monet/MainActivity;->onResume()V", PAUSE = "Lcom/klevico/monet/MainActivity;->onPause()V";
    static final String OWNER = "La/nx0;->i()Ljava/lang/String;";
    static final String HEADER = "La/bv3;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;";
    static final String MODEL = "La/qc4;-><init>(Landroid/content/Context;La/aq;La/jc3;La/op;La/xb;La/xb;La/pc8;La/u60;La/uy7;La/vt0;La/k28;La/lt2;)V";
    static final String PICKER = "La/b84;->X(Ljava/lang/String;La/nx0;La/o43;La/tw1;La/iy1;I)V";
    static final String GENERIC = "La/b84;->E1(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/Object;La/kx1;ZLa/kx1;La/vw1;La/vw1;Ljava/util/Set;Ljava/util/Set;La/mx1;La/vw1;La/tw1;La/iy1;III)V";
    static final String CONVERTER = "La/s46;->m(La/n46;La/ss4;Ljava/util/List;JLjava/util/Map;)La/mu0;";
    static final String NATIVE_FILTER = "La/m42;->d0(La/mu0;Ljava/lang/String;La/ov4;)Z";
    static final List<String> TARGETS = List.of(STATE, FILTER, MODEL, RESUME, PAUSE, OWNER, HEADER, PICKER);
    static final Map<String,String> CONTRACTS = Map.ofEntries(
        Map.entry(READER,"5a16898ce0705bf68cf2b02f5ea7fb17ffb0208fd5a66d3978bb5efa5f8e0aba"),
        Map.entry(PROGRAMS,"bd8c39e04effcfed28c100cba7f98279e5c8fbd2642c4a22eab180f38ae7469e"),
        Map.entry(STATE,"dc6b25a9f6f7ec8dabd7d6c0b3a94355a03e06e7b1583d5e7628b4830e446240"),
        Map.entry(FILTER,"895af397553541a3ece94f353c9f70c65c44fb7e824a3bb656154c72349dea8c"),
        Map.entry(MODEL,"7bd699c6272f1c5a81b7e3d731a722dd263dd44a062c0cd9fbfd6257f2ae8455"),
        Map.entry(RESUME,"1a0f9e5330841265697050087bf638bac525aa784f663135e4d6493223f94223"),
        Map.entry(PAUSE,"de5d022044426157f74725341fdb911f92288fe430eba6470c53d97863466f18"),
        Map.entry(OWNER,"d0ccbb47b4d2411b14f8703dd818ce64975646127854958aff5ddc8dadc8043b"),
        Map.entry(HEADER,"218de76b5478be96944a1a37aa00898633d29c7d061b10546e5850e3892999c1"),
        Map.entry(PICKER,"fd1e9b999d94c20f3ce3c0f48248870043384e5719733f53dee8e070d23db2b9"),
        Map.entry(SOURCES,"d9b847a243bc46f3e1131ebe92524fb08b5ac1cc5ca011c84ae8a620b62fa7e6"),
        Map.entry(CONVERTER,"4a4aab0ab0374d426cd5b1656ce5e68068c883e805066167b3bfd14041e9eb25"),
        Map.entry(GENERIC,"8c488e1f1aae02dde525e775a041f507b4a1435183abfda9d628ea52e275450a"),
        Map.entry(NATIVE_FILTER,"75a3c49e4e7dcb3e3efbbd04e45776dac623a8f09e9fbc6dd11bf764be208059"),
        Map.entry("La/lz7;->g(Ljava/lang/Object;)La/w47;","bda96cda3a556b67559da592e28558c05043534d7716d456064e5692b869094c"),
        Map.entry("La/zl0;->q(La/ap1;La/ap1;La/ap1;La/lx1;)La/np;","5dfbcd15089eb43fd4b623025a4fa8d5fc39568f720e02861097b35291d094f3"),
        Map.entry("La/w47;->j(Ljava/lang/Object;)V","9c09035407da7738e87de5f9b1b0a17143b1a99e5e08638473932ea334f9ae22"),
        Map.entry("La/ss4;-><init>(Landroid/content/Context;)V","6a58e2f4945f08fd6a551092076188f6ba82c3e63b0426c94c6d8a987674fd15"),
        Map.entry("La/lz4;-><init>(ILjava/lang/String;Ljava/lang/String;Z)V","efc86eceb1351d18d234a6893b224a3dc7ebe1547a8b3f169f7bc58c7dfca577"),
        Map.entry("La/by4;-><init>(La/mx0;)V","e44119649f2ee11b75dfc903aa703ddf6b9f74d5cd2508b3c6405f81090e296a"),
        Map.entry("La/nd3;->a(Ljava/lang/Object;)Ljava/lang/Object;","3164d0b4db4dd25d9735fef6284075dc5cdcf7566ae1962726d4000db15dd9b6"),
        Map.entry("La/o43;->toString()Ljava/lang/String;","463c926b1b758abf3649818c1f9e2b2d0aadb52ad304cac4c4f46be0df61157c"),
        Map.entry("La/mu0;->a(Z)Ljava/lang/String;","55a7861f8aa3a25e8931a736c298c2d00a896f71df32c927aea38cd34a5620da"));
    private static final Map<String,Integer> FLAGS = Map.ofEntries(
        Map.entry(STATE,25), Map.entry(FILTER,25), Map.entry(RESUME,17), Map.entry(PAUSE,17),
        Map.entry(OWNER,17), Map.entry(HEADER,17),
        Map.entry("La/lz7;->g(Ljava/lang/Object;)La/w47;",25),
        Map.entry("La/zl0;->q(La/ap1;La/ap1;La/ap1;La/lx1;)La/np;",25),
        Map.entry("La/w47;->j(Ljava/lang/Object;)V",17),
        Map.entry("La/nd3;->a(Ljava/lang/Object;)Ljava/lang/Object;",17),
        Map.entry("La/o43;->toString()Ljava/lang/String;",17),
        Map.entry("La/mu0;->a(Z)Ljava/lang/String;",17));
    private MonetWuplayHooks() {}
    static IllegalStateException unsupported(String message) { return new IllegalStateException("Unsupported Monet 1.1.1 catalog bytecode: " + message); }
    static String ref(Instruction instruction) {
        return instruction instanceof ReferenceInstruction ? ((ReferenceInstruction)instruction).getReference().toString() : "";
    }
    static List<Instruction> instructions(Method method) {
        List<Instruction> result = new ArrayList<>(); method.getImplementation().getInstructions().forEach(result::add); return result;
    }
    static String fingerprint(Method method) {
        StringBuilder text = new StringBuilder();
        text.append(method.getImplementation().getRegisterCount());
        for (Instruction i : method.getImplementation().getInstructions()) {
            text.append('|').append(i.getOpcode()).append(':').append(ref(i));
            if (i instanceof RegisterRangeInstruction) text.append('r').append(((RegisterRangeInstruction)i).getStartRegister()).append(',').append(((RegisterRangeInstruction)i).getRegisterCount());
            if (i instanceof OneRegisterInstruction) text.append('a').append(((OneRegisterInstruction)i).getRegisterA());
            if (i instanceof TwoRegisterInstruction) text.append('b').append(((TwoRegisterInstruction)i).getRegisterB());
            if (i instanceof ThreeRegisterInstruction) text.append('c').append(((ThreeRegisterInstruction)i).getRegisterC());
            if (i instanceof FiveRegisterInstruction) {
                FiveRegisterInstruction f = (FiveRegisterInstruction)i;
                text.append('f').append(f.getRegisterCount()).append(',').append(f.getRegisterC()).append(',').append(f.getRegisterD())
                    .append(',').append(f.getRegisterE()).append(',').append(f.getRegisterF()).append(',').append(f.getRegisterG());
            }
            if (i instanceof WideLiteralInstruction) text.append('l').append(((WideLiteralInstruction)i).getWideLiteral());
            if (i instanceof OffsetInstruction) text.append('o').append(((OffsetInstruction)i).getCodeOffset());
            if (i instanceof SwitchPayload) for (SwitchElement e : ((SwitchPayload)i).getSwitchElements()) text.append('s').append(e.getKey()).append(',').append(e.getOffset());
            if (i instanceof ArrayPayload) {
                ArrayPayload payload = (ArrayPayload)i;
                text.append('w').append(payload.getElementWidth());
                for (Number element : payload.getArrayElements()) text.append('v').append(element.longValue());
            }
        }
        for (TryBlock<? extends ExceptionHandler> block : method.getImplementation().getTryBlocks()) {
            text.append("|try:").append(block.getStartCodeAddress()).append(',').append(block.getCodeUnitCount());
            for (ExceptionHandler handler : block.getExceptionHandlers())
                text.append('|').append(handler.getExceptionType()).append('@').append(handler.getHandlerCodeAddress());
        }
        try {
            byte[] digest = java.security.MessageDigest.getInstance("SHA-256").digest(text.toString().getBytes(java.nio.charset.StandardCharsets.UTF_8));
            StringBuilder result = new StringBuilder();
            for (byte b : digest) result.append(String.format("%02x", b & 255));
            return result.toString();
        } catch (java.security.NoSuchAlgorithmException impossible) { throw new AssertionError(impossible); }
    }
    static Map<String,Method> validate(List<? extends ClassDef> classes) {
        Map<String,Method> found = new HashMap<>(); Set<String> types = new HashSet<>(), symbols = new HashSet<>();
        for (ClassDef c : classes) {
            if (!types.add(c.getType())) throw unsupported("Duplicate class " + c.getType());
            for (Method m : c.getMethods()) {
                if ((m.getAccessFlags()&1)!=0) symbols.add(m.toString());
                if (!CONTRACTS.containsKey(m.toString())) continue;
                String s=m.toString();
                Integer expected = FLAGS.get(s);
                if (expected == null) expected = m.getName().equals("<init>") ? 65537 : 25;
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
            "La/cy4;->a()Ljava/lang/Object;",
            "La/lx1;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
            "La/ay4;->a:La/ov4;","La/ov4;->c:J","La/mx0;->RECOMMENDATIONS:La/mx0;",
            "La/mx0;->BOTH:La/mx0;","La/mx0;->CONTINUE_WATCHING:La/mx0;")))
            throw unsupported("Missing native reader/item/picker/action/flow ABI");
        return found;
    }
    static void replace(MutableMethod method,String extension,int index,String name,List<String> args,String result,int... registers) {
        int[] r=new int[5]; System.arraycopy(registers,0,r,0,registers.length);
        method.getImplementation().replaceInstruction(index,new BuilderInstruction35c(Opcode.INVOKE_STATIC,registers.length,r[0],r[1],r[2],r[3],r[4],
            new ImmutableMethodReference(extension,name,args,result)));
    }
    static void apply(MutableMethod method) {
        apply(method, EXTENSION, "Lnl/johninnl/monetwuplay/WuplayCatalogRefresh;");
    }
    static void apply(MutableMethod method, String extension, String refresh) {
        String s=method.toString();
        if (!TARGETS.contains(s) || !CONTRACTS.get(s).equals(fingerprint(method))) throw unsupported("Changed or already patched method " + method);
        var code=method.getImplementation();
        if (s.equals(STATE)) {
            var sourceArgs=List.of("Ljava/util/List;","Ljava/util/LinkedHashMap;","Ljava/util/Set;","Ljava/util/Locale;");
            // Selection: native first-source read on the MEDIA row (v6) resolves
            // catalog selections through the extension instead.
            replace(method,extension,382,"selection",List.of("Ljava/lang/Object;"),"Ljava/lang/String;",6);
            // Row items: the second filter loop consumes the first loop's list in v1;
            // catalog selections swap that source for the channel items before filtering.
            code.addInstruction(535,new BuilderInstruction35c(Opcode.INVOKE_STATIC,2,3,9,0,0,0,
                new ImmutableMethodReference(extension,"rowItems",List.of("Ljava/util/ArrayList;","Ljava/lang/Object;"),"Ljava/util/ArrayList;")));
            code.addInstruction(536,new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,3));
            // Owner match: keep the branch on the loop item (v13) and selected id (v9);
            // the owner string read at 546 is dead once its result register is reused.
            replace(method,extension,549,"matches",List.of("Ljava/lang/Object;","Ljava/lang/Object;"),"Z",13,9);
            replace(method,extension,552,"matchesChannel",List.of("Ljava/lang/Object;","Ljava/lang/String;","Ljava/lang/Object;"),"Z",1,9,10);
            replace(method,extension,565,"hidden",List.of("Ljava/util/Set;","Ljava/lang/Object;"),"Ljava/util/LinkedHashSet;",4,6);
            replace(method,extension,902,"sources",sourceArgs,"Ljava/util/List;",11,10,9,12);
            replace(method,extension,913,"sources",sourceArgs,"Ljava/util/List;",3,10,1,12);
        } else if (s.equals(MODEL)) {
            var original=(ThreeRegisterInstruction)instructions(method).get(225);
            code.replaceInstruction(225,new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,54,1,new ImmutableMethodReference(extension,"wrap",List.of("Ljava/lang/Object;"),"Ljava/lang/Object;")));
            code.addInstruction(226,new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,15));
            code.addInstruction(227,new BuilderInstruction21c(Opcode.CHECK_CAST,15,new ImmutableTypeReference("La/ap1;")));
            code.addInstruction(228,new BuilderInstruction23x(Opcode.APUT_OBJECT,15,original.getRegisterB(),original.getRegisterC()));
        } else if (s.equals(FILTER)) {
            replace(method,extension,118,"disabled",List.of("Ljava/util/Set;","Ljava/lang/Object;"),"Z",2,14);
        } else if (s.equals(OWNER)) {
            // MEDIA rows read their first source after a null-check cast; map saved
            // catalog selections to their real owner before the caller compares it.
            code.addInstruction(7,new BuilderInstruction35c(Opcode.INVOKE_STATIC,1,2,0,0,0,0,
                new ImmutableMethodReference(extension,"owner",List.of("Ljava/lang/String;"),"Ljava/lang/String;")));
            code.addInstruction(8,new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,2));
        } else if (s.equals(HEADER)) {
            // Wrap the shared header title before the vq6 allocation consumes it,
            // preserving the original wrapper allocation and both label branches.
            code.addInstruction(113,new BuilderInstruction35c(Opcode.INVOKE_STATIC,2,7,2,0,0,0,
                new ImmutableMethodReference(extension,"contentLabel",List.of("Ljava/lang/String;","Ljava/lang/Object;"),"Ljava/lang/String;")));
            code.addInstruction(114,new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,7));
        } else if (s.equals(PICKER)) {
            var parameters=List.of("Ljava/lang/String;","Ljava/lang/String;","Ljava/util/List;","Ljava/lang/Object;","Ljava/lang/Object;","Z",
                "Ljava/lang/Object;","Ljava/lang/Object;","Ljava/lang/Object;","Ljava/util/Set;","Ljava/util/Set;","Ljava/lang/Object;",
                "Ljava/lang/Object;","Ljava/lang/Object;","Ljava/lang/Object;","I","I","I");
            code.replaceInstruction(398,new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,4,18,new ImmutableMethodReference(extension,"contentPicker",parameters,"V")));
            code.addInstruction(398,new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,28,1,new ImmutableMethodReference(extension,"preparePicker",List.of("Ljava/lang/Object;"),"V")));
        } else {
            boolean resume=s.equals(RESUME);
            code.addInstruction(0,new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,resume?15:6,1,
                new ImmutableMethodReference(refresh,resume?"resume":"pause",
                    List.of("Ljava/lang/Object;"),"V")));
        }
    }
}

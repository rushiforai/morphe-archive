package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import java.util.*;

/** Reviewed 1.1.0 layout; historical 1.0.97 contracts remain in MonetDisplayedCardsPatch. */
final class MonetDisplayedCards110 {
    static final String CLAMP = "La/b13;->k(I)I";
    static final String PICKER = "La/ux2;->s0(Ljava/lang/String;IIIZLa/y95;La/wu1;La/uu1;La/jw1;I)V";
    static final String SCHEMA = "La/th6;->w(Ljava/lang/String;IIIILa/wu1;)La/uh6;";
    static final String APPLY = "La/ux2;->B0(ILa/wp1;La/wp1;La/uu1;La/jw1;)V";
    static final String TEXT = "La/u42;->a(JLa/jw1;I)V";
    static final String BUTTON = "La/ux2;->C0(Ljava/lang/String;ZLa/wp1;La/y95;La/uu1;La/wp1;La/wp1;La/wp1;La/jw1;II)V";
    static final String MENU = "La/ux2;->u0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/util/List;ZZZLa/uu1;La/uu1;La/uu1;La/wu1;La/wu1;La/kv1;La/uu1;La/uu1;La/uu1;La/uu1;La/uu1;La/uu1;La/jw1;III)V";
    static final Map<String,Integer> SUMMARIES = Map.of(
        "La/g30;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", 92,
        "La/jz3;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", 187, MENU, 456);
    static final List<String> TARGETS = List.of(CLAMP, PICKER, SCHEMA, APPLY, TEXT,
        "La/g30;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
        "La/jz3;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", MENU);
    static final String UI = MonetDisplayedCardsPatch.UI, MODEL = MonetDisplayedCardsPatch.MODEL;
    static final String LAYOUT = "Lsoftware/santodan/extension/monetcards/NativeLayout;";
    static final Map<String,String> CONTRACTS = Map.ofEntries(
        Map.entry(CLAMP, "159936e09d5e341a72a78703f17b92a8afdf90e7e9720d2f9b4e2c63ef9192c9"),
        Map.entry(PICKER, "4f8b7943e1873bab6a8febe1e115f6423480976fff726b78ce1c8a6003347bee"),
        Map.entry(SCHEMA, "180c55c732f67eefb9f85984865a97c0303275dc92a48931cee7b83aa85b659c"),
        Map.entry(APPLY, "8bf4efe0f9d32930c9d70b06f6fd1b4bf53fdc461b071ba0b92f8eb5b9250416"),
        Map.entry(TEXT, "017296644844f496b3271cd097130568c48856f78b1d6bc4e03ba67628426a44"),
        Map.entry(BUTTON, "5d754bbd3958fe791a279cb9d33aabc2614567de449d81069d7fafcb8d65c301"),
        Map.entry("La/g30;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", "00efa096c44007d4a76d934921bb055e31f877d37164e44e447d7702c48f58ab"),
        Map.entry("La/jz3;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", "1453cafde8e487745d9093903ccd03b355eaf40f9f3aa047762a5e9901e1fe31"),
        Map.entry(MENU, "736cb7b48fe09ad0c5197f9dc80fc05ad811023c8511fbb2a09585112f85d29e"),
        Map.entry("La/fp3;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", "c68f2a3c9042d2920933094dd3ac1cda9fd81f6fc9c032f87e4ac3e75adb0313"),
        Map.entry("La/fy3;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", "66e9895a23fc383c265a1ca3f96380170202a913a058f2535652113fedce23a9"),
        Map.entry("La/zo2;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", "589a1e70ccd081bd4c50342aeda5171180d9c654e9af043f208a0d3237756c3e"),
        Map.entry("La/jw1;->h0(I)V", "a468d22c01f590397490db50a65ad390093e5e3b4c24d2260c91965b6ebddcc8"),
        Map.entry("La/jw1;->T()Ljava/lang/Object;", "740e02edebcde965da74f2effdb0e18146fb2121f7fa709df4bcfd24005e0bb9"),
        Map.entry("La/jw1;->r0(Ljava/lang/Object;)V", "b67a79cadac0a01e64e6a035785a92290ec103dc15ad9feca2183bb0be2b9b4f"),
        Map.entry("La/jw1;->r(Z)V", "c1f6c0a4bc13d0df0cd6b0029dd1b2bf6ed69058d8bb52acbe0de9740fed0ca7"),
        Map.entry("La/xb5;->g()I", "74c304fa83faa412718992d3c58847a8d21e9186d4046c7dc61dd4867c9e9429"),
        Map.entry("La/xb5;->i(I)V", "0c6f8a6558be16ca3b4205d17f48c0c05114c8df226e815c30bf4a5a82a3e493"),
        Map.entry("La/wp1;-><init>()V", "457b16c8f4b2fa33fa99fa07f5550fd8e7db251782885c21c590f65d46a64ab6"),
        Map.entry("La/qp1;->e(La/wp1;)V", "4e0cd0d219f0f23e01f5a9d23ac0586a022973bad3939eb21158d37da6746735"),
        Map.entry("La/qp1;->k(La/wp1;)V", "4e0cd0d219f0f23e01f5a9d23ac0586a022973bad3939eb21158d37da6746735"),
        Map.entry("La/qp1;->j(La/wp1;)V", "4e0cd0d219f0f23e01f5a9d23ac0586a022973bad3939eb21158d37da6746735"));
    private MonetDisplayedCards110() {}
    static IllegalStateException unsupported(String message) {
        return new IllegalStateException("Unsupported Monet 1.1.0 displayed cards bytecode: " + message);
    }
    static String fingerprint(Method method) {
        return NuvioPlaybackButtonsPatch.fingerprint(MonetCatalogChannels110.withoutHeader(method));
    }
    static Map<String,Method> validate(List<? extends ClassDef> classes) {
        Map<String,Method> found = new HashMap<>();
        Set<String> types = new HashSet<>(), symbols = new HashSet<>();
        for (ClassDef c : classes) {
            if (!types.add(c.getType())) throw unsupported("Duplicate class " + c.getType());
            for (Method m : c.getMethods()) {
                if ((m.getAccessFlags() & 1) != 0) symbols.add(m.toString());
                if (!CONTRACTS.containsKey(m.toString())) continue;
                int flags = m.getDefiningClass().equals("La/qp1;") ? 1 : m.toString().equals(SCHEMA) ? 9
                    : m.getName().equals("<init>") ? 65537
                    : m.getDefiningClass().equals("La/jw1;") || m.getDefiningClass().equals("La/xb5;")
                        || m.getName().equals("f") ? 17 : 25;
                if (found.put(m.toString(), m) != null || m.getAccessFlags() != flags || m.getImplementation() == null
                    || !CONTRACTS.get(m.toString()).equals(fingerprint(m)))
                    throw unsupported("Changed or already patched contract " + m);
            }
            for (Field f : c.getFields()) if ((f.getAccessFlags() & 9) == 9) symbols.add(f.toString());
        }
        if (found.size() != CONTRACTS.size() || !symbols.containsAll(List.of(
            "La/uu1;->b()Ljava/lang/Object;", "La/wu1;->a(Ljava/lang/Object;)Ljava/lang/Object;",
            "La/pp0;->a:La/mv;", "La/lo7;->a:La/lo7;"))) throw unsupported("Missing native UI/runtime contract");
        return found;
    }
    static void selectLayout(MutableClass layout) {
        var initializer = layout.getMethods().stream().filter(m -> m.getName().equals("<clinit>")).findFirst().orElseThrow();
        var ins = MonetPremiumPatch.instructions(initializer);
        var field = layout.getFields().stream().filter(f -> f.getName().equals("modern")).findFirst().orElseThrow();
        if (ins.size() != 1 || ins.get(0).getOpcode() != Opcode.RETURN_VOID || field.getAccessFlags() != 9
            || !field.getType().equals("Z") || !(field.getInitialValue() instanceof com.android.tools.smali.dexlib2.iface.value.BooleanEncodedValue)
            || ((com.android.tools.smali.dexlib2.iface.value.BooleanEncodedValue)field.getInitialValue()).getValue())
            throw unsupported("Runtime layout initializer changed");
        field.setInitialValue(new app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableBooleanEncodedValue(
            com.android.tools.smali.dexlib2.immutable.value.ImmutableBooleanEncodedValue.TRUE_VALUE));
    }
    static void apply(MutableMethod method) {
        String signature = method.toString();
        if (!TARGETS.contains(signature) || !CONTRACTS.get(signature).equals(fingerprint(method)))
            throw unsupported("Changed or already patched method " + method);
        var code = method.getImplementation();
        if (signature.equals(CLAMP)) {
            code.replaceInstruction(2, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 2, 0, 0, 0, 0,
                new ImmutableMethodReference("Ljava/lang/Math;", "max", List.of("I", "I"), "I")));
        } else if (signature.equals(SCHEMA)) {
            code.addInstruction(2, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 13, 1, 0, 0, 0,
                new ImmutableMethodReference(MODEL, "schemaMaximum", List.of("Ljava/lang/String;", "I"), "I")));
            code.addInstruction(3, new BuilderInstruction11x(Opcode.MOVE_RESULT, 1));
        } else if (signature.equals(APPLY)) {
            code.replaceInstruction(52, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 5, 14, 0, 0, 0,
                new ImmutableMethodReference(UI, "properties", List.of("Ljava/lang/Object;", "Ljava/lang/Object;"), "Ljava/lang/Object;")));
            code.addInstruction(53, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 5));
            code.addInstruction(54, new BuilderInstruction21c(Opcode.CHECK_CAST, 5, new ImmutableTypeReference("La/wu1;")));
        } else if (signature.equals(TEXT)) {
            code.addInstruction(77, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 0, 5, 0, 0, 0,
                new ImmutableMethodReference(UI, "text", List.of("Ljava/lang/String;", "Ljava/lang/Object;"), "Ljava/lang/String;")));
            code.addInstruction(78, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0));
        } else if (SUMMARIES.containsKey(signature)) {
            int index = SUMMARIES.get(signature) + MonetCatalogChannels110.headerShift(method);
            Instruction original = MonetPremiumPatch.instructions(method).get(index);
            ImmutableMethodReference reference = new ImmutableMethodReference(MODEL, "summary", List.of("I"), "Ljava/lang/String;");
            if (original instanceof RegisterRangeInstruction) {
                var call = (RegisterRangeInstruction) original;
                code.replaceInstruction(index, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, call.getStartRegister(), 1, reference));
            } else {
                var call = (FiveRegisterInstruction) original;
                code.replaceInstruction(index, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, call.getRegisterC(), 0, 0, 0, 0, reference));
            }
        } else {
            // Work backwards so the reviewed original instruction indexes stay meaningful.
            augment(method, 539, "footer110", List.of("I", "Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;",
                "Ljava/lang/Object;", "Ljava/lang/Object;", "I", "I"), new int[]{0,7,6,1,8,21,62,63}, Set.of(0,6,7));
            augment(method, 441, "buttons", buttonParameters(), new int[]{0,1,2,3,4,5,6,7,8,9,10,21,62,63}, Set.of(1,9,10,12,13));
            augment(method, 323, "number", List.of("I","I","I"), new int[]{1,62,63}, Set.of(0,1,2));
            augment(method, 316, "buttons", buttonParameters(), new int[]{0,1,2,3,4,5,6,7,8,9,10,37,62,63}, Set.of(1,9,10,12,13));
            code.addInstruction(0, new BuilderInstruction22x(Opcode.MOVE_FROM16, 0, 62));
            code.addInstruction(1, new BuilderInstruction22x(Opcode.MOVE_FROM16, 1, 63));
            code.addInstruction(2, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 0, 1, 0, 0, 0,
                new ImmutableMethodReference(MODEL, "pickerMaximum", List.of("I","I"), "I")));
            code.addInstruction(3, new BuilderInstruction11x(Opcode.MOVE_RESULT, 1));
            code.addInstruction(4, new BuilderInstruction22x(Opcode.MOVE_FROM16, 63, 1));
        }
    }
    private static List<String> buttonParameters() {
        return List.of("Ljava/lang/String;","Z","Ljava/lang/Object;","Ljava/lang/Object;","Ljava/lang/Object;",
            "Ljava/lang/Object;","Ljava/lang/Object;","Ljava/lang/Object;","Ljava/lang/Object;","I","I","Ljava/lang/Object;","I","I");
    }
    private static void augment(MutableMethod method, int index, String name, List<String> params, int[] sources, Set<Integer> primitive) {
        var code = method.getImplementation();
        code.replaceInstruction(index, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 42, sources.length,
            new ImmutableMethodReference(name.equals("number") ? MODEL : UI, name, params, name.equals("number") ? "Ljava/lang/String;" : "V")));
        // v42-v55 are dead at both button sites: native style construction fully redefines
        // them before its range invoke. Live state/sentinel/focus registers v36-v41/v56 survive.
        for (int n = 0; n < sources.length; n++) code.addInstruction(index + n,
            new BuilderInstruction22x(primitive.contains(n) ? Opcode.MOVE_FROM16 : Opcode.MOVE_OBJECT_FROM16, 42+n, sources[n]));
    }
}

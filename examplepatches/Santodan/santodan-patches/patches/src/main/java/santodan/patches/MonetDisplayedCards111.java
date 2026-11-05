package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import java.util.*;

/** Reviewed 1.1.1 layout; historical 1.0.97 contracts remain in MonetDisplayedCardsPatch. */
final class MonetDisplayedCards111 {
    static final String CLAMP = "La/j63;->j(I)I";
    static final String PICKER = "La/b33;->v0(Ljava/lang/String;IIIZLa/og5;La/vw1;La/tw1;La/iy1;I)V";
    static final String SCHEMA = "La/ht6;->w(Ljava/lang/String;IIIILa/vw1;)La/it6;";
    static final String APPLY = "La/b33;->E0(ILa/ur1;La/ur1;La/tw1;La/iy1;)V";
    static final String TEXT = "La/x22;->a(JLa/iy1;I)V";
    static final String BUTTON = "La/b33;->F0(Ljava/lang/String;ZLa/ur1;La/og5;La/tw1;La/ur1;La/ur1;La/ur1;La/iy1;II)V";
    static final String MENU = "La/b33;->x0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/util/List;ZZZLa/tw1;La/tw1;La/tw1;La/vw1;La/vw1;La/jx1;La/tw1;La/tw1;La/tw1;La/tw1;La/tw1;La/tw1;La/iy1;III)V";
    static final Map<String,Integer> SUMMARIES = Map.of(
        "La/u40;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", 128,
        "La/bv3;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", 187, MENU, 456);
    static final List<String> TARGETS = List.of(CLAMP, PICKER, SCHEMA, APPLY, TEXT,
        "La/u40;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
        "La/bv3;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", MENU);
    static final String UI = MonetDisplayedCardsPatch.UI, MODEL = MonetDisplayedCardsPatch.MODEL;
    static final String LAYOUT = "Lsoftware/santodan/extension/monetcards/NativeLayout;";
    static final Map<String,String> CONTRACTS = Map.ofEntries(
        Map.entry(CLAMP, "c175b8129c6d09974b67ffb7680785e77d712abd827a83ecce74c47217dbcdb1"),
        Map.entry(PICKER, "377ed9c5d4c599ac7fa192978a0121eb9744d03b3ab45cacf3d4258521fd7720"),
        Map.entry(SCHEMA, "eedc0ac5f571198a6e8ce495a55d1d2ccc2efa8f6b6ca9273576abfd872195a7"),
        Map.entry(APPLY, "4ba70f6dc5e82cfe9677c53a46eae4f7837e33e6cf830d5c75a2dea68615b6f9"),
        Map.entry(TEXT, "7e271eb77ef5c1fe9d30a955efd6348a5c0f46b716e778d430101ba413b3c6e4"),
        Map.entry(BUTTON, "45b6f89d5a420471de633025e7b2011046a74872ec66ee09b3ae5c65e9e7a1e0"),
        Map.entry("La/u40;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", "1988118ddec96d6598848b692c762ea7e3193b555fb84a3552d82e99fd5afc09"),
        Map.entry("La/bv3;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", "218de76b5478be96944a1a37aa00898633d29c7d061b10546e5850e3892999c1"),
        Map.entry(MENU, "45567dd2d63444a5bb5cc8573a49f3251adb2adc07257f3332654bfbe3fe08bc"),
        Map.entry("La/uu3;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", "cb90f14262617bc8db75e3d16d104b6ceb8dc7b824f6b5553cea4fadbb7c4e60"),
        Map.entry("La/t34;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", "d1f4debd9e916872743c9038ed9f64e650f28f8a63d5445ae4fb4865e294ebc1"),
        Map.entry("La/qu2;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", "3d6fdfc62c4dc42eac7c6fd55a6acb3bb9243dc2f046f82c82bb8b6122295719"),
        Map.entry("La/iy1;->h0(I)V", "0559ccdf783a4761adc025bad10b6ce6d3fc7646496d8305eb254554cccf7bd0"),
        Map.entry("La/iy1;->T()Ljava/lang/Object;", "1b0c30c092a0d3fd09aa02bd124ddc2b4c065144a99e05a8e9974e90c13cb013"),
        Map.entry("La/iy1;->r0(Ljava/lang/Object;)V", "24e1bc7bb76474eb84d2203896ce95f1a603824539c1427923fe6e118df668aa"),
        Map.entry("La/iy1;->r(Z)V", "011a0d7ce81df6960de546880373866bb623dbc5bd15532b80bd8e18cd820f71"),
        Map.entry("La/mi5;->g()I", "97c070495514a5657aa0cd574ce7f807224d45f3d6c2bb0b238f762452d1d5ae"),
        Map.entry("La/mi5;->i(I)V", "b7c05eee8a384d48ab6a7441b3b903456d403d17b1e8f5cfc91d15da6171e923"),
        Map.entry("La/ur1;-><init>()V", "a6409ed30d3330002a499e707c0bf50bd56848fec0753b32ab990d6244976614"),
        Map.entry("La/or1;->e(La/ur1;)V", "4e0cd0d219f0f23e01f5a9d23ac0586a022973bad3939eb21158d37da6746735"),
        Map.entry("La/or1;->k(La/ur1;)V", "4e0cd0d219f0f23e01f5a9d23ac0586a022973bad3939eb21158d37da6746735"),
        Map.entry("La/or1;->j(La/ur1;)V", "4e0cd0d219f0f23e01f5a9d23ac0586a022973bad3939eb21158d37da6746735"));
    private MonetDisplayedCards111() {}
    static IllegalStateException unsupported(String message) {
        return new IllegalStateException("Unsupported Monet 1.1.1 displayed cards bytecode: " + message);
    }
    static String fingerprint(Method method) {
        return NuvioPlaybackButtonsPatch.fingerprint(MonetCatalogChannels111.withoutHeader(method));
    }
    static Map<String,Method> validate(List<? extends ClassDef> classes) {
        Map<String,Method> found = new HashMap<>();
        Set<String> types = new HashSet<>(), symbols = new HashSet<>();
        for (ClassDef c : classes) {
            if (!types.add(c.getType())) throw unsupported("Duplicate class " + c.getType());
            for (Method m : c.getMethods()) {
                if ((m.getAccessFlags() & 1) != 0) symbols.add(m.toString());
                if (!CONTRACTS.containsKey(m.toString())) continue;
                int flags = m.getDefiningClass().equals("La/or1;") ? 1 : m.toString().equals(SCHEMA) ? 9
                    : m.getName().equals("<init>") ? 65537
                    : m.getDefiningClass().equals("La/iy1;") || m.getDefiningClass().equals("La/mi5;")
                        || m.getName().equals("f") ? 17 : 25;
                if (found.put(m.toString(), m) != null || m.getAccessFlags() != flags || m.getImplementation() == null
                    || !CONTRACTS.get(m.toString()).equals(fingerprint(m)))
                    throw unsupported("Changed or already patched contract " + m);
            }
            for (Field f : c.getFields()) if ((f.getAccessFlags() & 9) == 9) symbols.add(f.toString());
        }
        if (found.size() != CONTRACTS.size() || !symbols.containsAll(List.of(
            "La/tw1;->b()Ljava/lang/Object;", "La/vw1;->a(Ljava/lang/Object;)Ljava/lang/Object;",
            "La/fr0;->a:La/bx;", "La/u08;->a:La/u08;"))) throw unsupported("Missing native UI/runtime contract");
        return found;
    }
    static void selectLayout(MutableClass layout) {
        var initializer = layout.getMethods().stream().filter(m -> m.getName().equals("<clinit>")).findFirst().orElseThrow();
        var ins = MonetPremiumPatch.instructions(initializer);
        var field = layout.getFields().stream().filter(f -> f.getName().equals("v111")).findFirst().orElseThrow();
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
            code.addInstruction(54, new BuilderInstruction21c(Opcode.CHECK_CAST, 5, new ImmutableTypeReference("La/vw1;")));
        } else if (signature.equals(TEXT)) {
            code.addInstruction(77, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 0, 5, 0, 0, 0,
                new ImmutableMethodReference(UI, "text", List.of("Ljava/lang/String;", "Ljava/lang/Object;"), "Ljava/lang/String;")));
            code.addInstruction(78, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0));
        } else if (SUMMARIES.containsKey(signature)) {
            int index = SUMMARIES.get(signature) + MonetCatalogChannels111.headerShift(method);
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
            augment(method, 540, "footer110", List.of("I", "Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;",
                "Ljava/lang/Object;", "Ljava/lang/Object;", "I", "I"), new int[]{0,7,6,1,8,21,63,64}, Set.of(0,6,7));
            augment(method, 442, "buttons", buttonParameters(), new int[]{0,1,2,3,4,5,6,7,8,9,10,21,63,64}, Set.of(1,9,10,12,13));
            augment(method, 323, "number", List.of("I","I","I"), new int[]{1,63,64}, Set.of(0,1,2));
            augment(method, 316, "buttons", buttonParameters(), new int[]{0,1,2,3,4,5,6,7,8,9,10,37,63,64}, Set.of(1,9,10,12,13));
            code.addInstruction(0, new BuilderInstruction22x(Opcode.MOVE_FROM16, 0, 63));
            code.addInstruction(1, new BuilderInstruction22x(Opcode.MOVE_FROM16, 1, 64));
            code.addInstruction(2, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 0, 1, 0, 0, 0,
                new ImmutableMethodReference(MODEL, "pickerMaximum", List.of("I","I"), "I")));
            code.addInstruction(3, new BuilderInstruction11x(Opcode.MOVE_RESULT, 1));
            code.addInstruction(4, new BuilderInstruction22x(Opcode.MOVE_FROM16, 64, 1));
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
        // them before its range invoke. Live state/sentinel/focus registers v36-v41/v57 survive.
        for (int n = 0; n < sources.length; n++) code.addInstruction(index + n,
            new BuilderInstruction22x(primitive.contains(n) ? Opcode.MOVE_FROM16 : Opcode.MOVE_OBJECT_FROM16, 42+n, sources[n]));
    }
}

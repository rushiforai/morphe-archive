package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import java.util.*;

/** Reviewed 1.1.2 layout; 1.1.1 and older contracts remain in their own classes. */
final class MonetDisplayedCards112 {
    static final String CLAMP = "La/m73;->j(I)I";
    static final String PICKER = "La/w33;->v0(Ljava/lang/String;IIIZLa/ek5;La/hx1;La/fx1;La/ty1;I)V";
    static final String SCHEMA = "La/r77;->w(Ljava/lang/String;IIIILa/hx1;)La/s77;";
    static final String APPLY = "La/w33;->E0(ILa/gs1;La/gs1;La/fx1;La/ty1;)V";
    static final String TEXT = "La/gx8;->a(JLa/ty1;I)V";
    static final String BUTTON = "La/w33;->F0(Ljava/lang/String;ZLa/gs1;La/ek5;La/fx1;La/gs1;La/gs1;La/gs1;La/ty1;II)V";
    static final String MENU = "La/w33;->x0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/util/List;ZZZLa/fx1;La/fx1;La/fx1;La/hx1;La/hx1;ZLa/pg2;La/vx1;La/fx1;La/fx1;La/fx1;La/fx1;La/fx1;La/fx1;La/ty1;IIII)V";
    static final String VISIBLE = "La/hx3;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;";
    static final String HEADER = "La/xx3;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;";
    /** Every 1.1.2 String.valueOf(int) that formats the media_action_visible_cards summary. */
    static final Map<String,Integer> SUMMARIES = Map.of(VISIBLE, 256, HEADER, 248, MENU, 543);
    static final List<String> TARGETS = List.of(CLAMP, PICKER, SCHEMA, APPLY, TEXT, VISIBLE, HEADER, MENU);
    static final String UI = MonetDisplayedCardsPatch.UI, MODEL = MonetDisplayedCardsPatch.MODEL;
    static final String LAYOUT = "Lsoftware/santodan/extension/monetcards/NativeLayout;";
    /** Picker registers: min/max parameters, live state at each button site and a block dead at all four sites. */
    static final int MINIMUM = 64, MAXIMUM = 65, SCRATCH = 44, FIRST_STATE = 38, SECOND_STATE = 12;
    static final Map<String,String> CONTRACTS = Map.ofEntries(
        Map.entry(CLAMP, "ad5b7d8327a07d57e6032a421a38bcec7c64cea7984ecd785d8b3808a3d5eeca"),
        Map.entry(PICKER, "7410917ebeb52a321ce763787aab8c8bbae5fdde1697612c2fe949c8ecc66ae5"),
        Map.entry(SCHEMA, "ee5a989d79c80bf9780f77afa847decae61c8dc287d9e207b9110ddf51d4d288"),
        Map.entry(APPLY, "9684379fcfeef375072bb04cac442ba48c23f1703d742c757232429811d314ee"),
        Map.entry(TEXT, "7600e30a457f456e93c9b805f8ed3746557eda73e78687cf9a1deed6fd867c79"),
        Map.entry(BUTTON, "09dc57a6921725082b85f2ec332c28827439f10a2c2a4cb77bd7e63223f74541"),
        Map.entry(MENU, "1e8ae2b225e3fd61613323376bcb98ae95024a47d48bc0f8d4b953c591cb8063"),
        Map.entry(VISIBLE, "058d49156fbb7e8f8ccdfa0c542388f89c4447a3a8d3d2dd3c4e1da5ed67cd32"),
        Map.entry(HEADER, "1ef59c2ee1b537ea1913a88e48457c08758b1fdc4929cc4bb7afc69ba05c013b"),
        // Card callers: su2 (second call) and both merged mg calls pass 4..20 with decorative preview disabled.
        Map.entry("La/su2;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", "2e250f619475a4969dfce4cd13cb57e364d4a5bfd2db36d9fe997b91af832492"),
        Map.entry("La/mg;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", "9d0cc9d89a142fef55c45024e1256eb0a8c213510ad08204b16921dc4c2a1189"),
        Map.entry("La/ty1;->h0(I)V", "2d760ea5917a4e6a899e11a51c25227b600597488e3f4e9d7c20a846fae351b3"),
        Map.entry("La/ty1;->T()Ljava/lang/Object;", "78163779f9667ecbd76740db1da74e8a563bba05bef9f7c420ef94962a6ef7eb"),
        Map.entry("La/ty1;->r0(Ljava/lang/Object;)V", "5f7ebefb48016ea8cdc428522df79a201a6b22e73e68a00ea9ba2a821a2c9513"),
        Map.entry("La/ty1;->r(Z)V", "60e459ba937adb5497e542782e8dc253cd671ded6f684b4e987ea4fb5c26f6bc"),
        Map.entry("La/cm5;->g()I", "5a7e0a5d976bafb4e6a77af531042377a0afe61d2912f1d8796e599d42c02b16"),
        Map.entry("La/cm5;->i(I)V", "c1db1f94a0b994d0c27a4792d76366918873632d3398319f31b47a2306b96758"),
        Map.entry("La/gs1;-><init>()V", "2a55aaf63573ea7e82a8067bded5e62470bde8a878748216d0c2f0adc651a488"),
        Map.entry("La/as1;->e(La/gs1;)V", "4e0cd0d219f0f23e01f5a9d23ac0586a022973bad3939eb21158d37da6746735"),
        Map.entry("La/as1;->k(La/gs1;)V", "4e0cd0d219f0f23e01f5a9d23ac0586a022973bad3939eb21158d37da6746735"),
        Map.entry("La/as1;->j(La/gs1;)V", "4e0cd0d219f0f23e01f5a9d23ac0586a022973bad3939eb21158d37da6746735"));
    private MonetDisplayedCards112() {}
    static IllegalStateException unsupported(String message) {
        return new IllegalStateException("Unsupported Monet 1.1.2 displayed cards bytecode: " + message);
    }
    static String fingerprint(Method method) {
        return NuvioPlaybackButtonsPatch.fingerprint(MonetCatalogChannels112.withoutHeader(method));
    }
    static Map<String,Method> validate(List<? extends ClassDef> classes) {
        Map<String,Method> found = new HashMap<>();
        Set<String> types = new HashSet<>(), symbols = new HashSet<>();
        for (ClassDef c : classes) {
            if (!types.add(c.getType())) throw unsupported("Duplicate class " + c.getType());
            for (Method m : c.getMethods()) {
                if ((m.getAccessFlags() & 1) != 0) symbols.add(m.toString());
                if (!CONTRACTS.containsKey(m.toString())) continue;
                int flags = m.getDefiningClass().equals("La/as1;") ? 1 : m.toString().equals(SCHEMA) ? 9
                    : m.getName().equals("<init>") ? 65537
                    : m.getDefiningClass().equals("La/ty1;") || m.getDefiningClass().equals("La/cm5;")
                        || m.getName().equals("f") ? 17 : 25;
                if (found.put(m.toString(), m) != null || m.getAccessFlags() != flags || m.getImplementation() == null
                    || !CONTRACTS.get(m.toString()).equals(fingerprint(m)))
                    throw unsupported("Changed or already patched contract " + m);
            }
            for (Field f : c.getFields()) if ((f.getAccessFlags() & 9) == 9) symbols.add(f.toString());
        }
        if (found.size() != CONTRACTS.size() || !symbols.containsAll(List.of(
            "La/fx1;->b()Ljava/lang/Object;", "La/hx1;->a(Ljava/lang/Object;)Ljava/lang/Object;",
            "La/bs0;->a:La/zk;", "La/qf8;->a:La/qf8;"))) throw unsupported("Missing native UI/runtime contract");
        return found;
    }
    /** Select the reviewed 1.1.2 runtime bindings; the 1.1.1 table stays false. */
    static void selectLayout(MutableClass layout) {
        var initializer = layout.getMethods().stream().filter(m -> m.getName().equals("<clinit>")).findFirst().orElseThrow();
        var ins = MonetPremiumPatch.instructions(initializer);
        var field = layout.getFields().stream().filter(f -> f.getName().equals("v112")).findFirst().orElseThrow();
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
            code.addInstruction(54, new BuilderInstruction21c(Opcode.CHECK_CAST, 5, new ImmutableTypeReference("La/hx1;")));
        } else if (signature.equals(TEXT)) {
            code.addInstruction(77, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 0, 5, 0, 0, 0,
                new ImmutableMethodReference(UI, "text", List.of("Ljava/lang/String;", "Ljava/lang/Object;"), "Ljava/lang/String;")));
            code.addInstruction(78, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0));
        } else if (SUMMARIES.containsKey(signature)) {
            int index = SUMMARIES.get(signature) + MonetCatalogChannels112.headerShift(method);
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
            // Work backwards so the reviewed original instruction indexes stay meaningful. v44-v57 are
            // dead at all four sites (v42/v43 are live in 1.1.2); state and focus registers survive.
            augment(method, 587, "footer110", List.of("I", "Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;",
                "Ljava/lang/Object;", "Ljava/lang/Object;", "I", "I"), new int[]{0,7,6,1,8,SECOND_STATE,MINIMUM,MAXIMUM}, Set.of(0,6,7));
            augment(method, 490, "buttons", buttonParameters(), new int[]{0,1,2,3,4,5,6,7,8,9,10,SECOND_STATE,MINIMUM,MAXIMUM}, Set.of(1,9,10,12,13));
            augment(method, 375, "number", List.of("I","I","I"), new int[]{1,MINIMUM,MAXIMUM}, Set.of(0,1,2));
            augment(method, 368, "buttons", buttonParameters(), new int[]{0,1,2,3,4,5,6,7,8,9,10,FIRST_STATE,MINIMUM,MAXIMUM}, Set.of(1,9,10,12,13));
            code.addInstruction(0, new BuilderInstruction22x(Opcode.MOVE_FROM16, 0, MINIMUM));
            code.addInstruction(1, new BuilderInstruction22x(Opcode.MOVE_FROM16, 1, MAXIMUM));
            code.addInstruction(2, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 0, 1, 0, 0, 0,
                new ImmutableMethodReference(MODEL, "pickerMaximum", List.of("I","I"), "I")));
            code.addInstruction(3, new BuilderInstruction11x(Opcode.MOVE_RESULT, 1));
            code.addInstruction(4, new BuilderInstruction22x(Opcode.MOVE_FROM16, MAXIMUM, 1));
        }
    }
    private static List<String> buttonParameters() {
        return List.of("Ljava/lang/String;","Z","Ljava/lang/Object;","Ljava/lang/Object;","Ljava/lang/Object;",
            "Ljava/lang/Object;","Ljava/lang/Object;","Ljava/lang/Object;","Ljava/lang/Object;","I","I","Ljava/lang/Object;","I","I");
    }
    private static void augment(MutableMethod method, int index, String name, List<String> params, int[] sources, Set<Integer> primitive) {
        var code = method.getImplementation();
        code.replaceInstruction(index, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, SCRATCH, sources.length,
            new ImmutableMethodReference(name.equals("number") ? MODEL : UI, name, params, name.equals("number") ? "Ljava/lang/String;" : "V")));
        for (int n = 0; n < sources.length; n++) code.addInstruction(index + n,
            new BuilderInstruction22x(primitive.contains(n) ? Opcode.MOVE_FROM16 : Opcode.MOVE_OBJECT_FROM16, SCRATCH + n, sources[n]));
    }
}

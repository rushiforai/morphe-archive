package santodan.patches;

import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import java.util.*;
import kotlin.Unit;

/** Remove the card-count clamp while leaving other number controls untouched. */
public final class MonetDisplayedCardsPatch {
    public static final String NAME = "Monet - Unlimited displayed cards";
    static final String MODEL = "Lsoftware/santodan/extension/monetcards/CardLimit;";
    static final String UI = "Lsoftware/santodan/extension/monetcards/DisplayedCards;";
    static final String CLAMP = "La/pt2;->k(I)I";
    static final String PICKER = "La/mq2;->C0(Ljava/lang/String;IIIZLa/zz4;La/kq1;La/iq1;La/yr1;I)V";
    static final String SCHEMA = "La/d46;->u(Ljava/lang/String;IIIILa/kq1;)La/e46;";
    static final String LABEL = "La/yq2;->I0(I[Ljava/lang/Object;La/yr1;)Ljava/lang/String;";
    static final String APPLY = "La/mq2;->L0(Ljava/lang/String;La/iq1;La/cm1;La/cm1;La/yr1;I)V";
    static final List<String> TARGETS = List.of(CLAMP, PICKER, SCHEMA, LABEL, APPLY);
    static final Map<String,String> CONTRACTS = Map.ofEntries(
        Map.entry(APPLY, "3b1f6815fd5f75394b0c9cbfb39d80c4dfacd576b77e5e75e4c3a56ca05c7dd1"),
        Map.entry("La/wl1;->e(La/cm1;)V", "4e0cd0d219f0f23e01f5a9d23ac0586a022973bad3939eb21158d37da6746735"),
        Map.entry("La/wl1;->k(La/cm1;)V", "4e0cd0d219f0f23e01f5a9d23ac0586a022973bad3939eb21158d37da6746735"),
        Map.entry("La/wl1;->j(La/cm1;)V", "4e0cd0d219f0f23e01f5a9d23ac0586a022973bad3939eb21158d37da6746735"),
        Map.entry(CLAMP, "4daf5713892f652345406c6d8c0315766c9d2cb09bf134ff7ae7349148b4bae3"),
        Map.entry(PICKER, "396b480a8f21d00719edf91963338ac5f92e4eea19dc84488cbe6da7c2d07a09"),
        Map.entry(SCHEMA, "bdf8bfdb0277ca0eaba23f274eede86f5279736929545356c598405abe3487b5"),
        Map.entry(LABEL, "f2f63858ee60a6eeb4551f71e5dca765f9aa3da09dd7c5a0903ed57a7b16a542"),
        Map.entry("La/mq2;->M0(Ljava/lang/String;ZLa/cm1;La/zz4;La/iq1;La/cm1;La/cm1;La/cm1;La/yr1;II)V", "ba86e864ce6c9cd0f4e1ff319ec4b0c4d5f50f29248baf81aa4b3deb3cedb38b"),
        Map.entry("La/yr1;->g0(I)V", "6621d8d8859879d009a93c8852ead3cc3c7c5590cc547f762b73eb4636eb493b"),
        Map.entry("La/yr1;->S()Ljava/lang/Object;", "9f0d6cb19db30c7c153c69715b41a61c6b595478d19002daca152aff20e93249"),
        Map.entry("La/yr1;->q0(Ljava/lang/Object;)V", "a8914464f473774f98ee13ca12404d94a36d107642f8f5e9bee33efc4ea34957"),
        Map.entry("La/yr1;->q(Z)V", "a5a5f8385f72ba4c4e020083b294dfcd3c9bc1a8c8cf99d5f59affbe9b8560e0"),
        Map.entry("La/q15;->g()I", "170ec62fe85b8b5ddfb0d895f26be74a8cf8bb0cc6df8342152bdf6e89b1f57e"),
        Map.entry("La/q15;->i(I)V", "a929481d8c08d8c5b419b98e24bbe9bdd5b0c24edfc50fe477ca546cba00e2e7"),
        Map.entry("La/cm1;-><init>()V", "05a1a2286b291a24a338ea29d3b9028b5c312a056fadd6c3ded78a29635c0142"));
    private MonetDisplayedCardsPatch() {}

    @SuppressWarnings({"unchecked", "deprecation"})
    public static BytecodePatch getMonetDisplayedCardsPatch() {
        return PatchKt.bytecodePatch(NAME,
            "Remove the 20-card limit from Displayed Cards. Add -10, +10 and Max to the original themed picker, preserving its layout and single-card steps.", false, builder -> {
                builder.compatibleWith(new Compatibility("com.klevico.monet", "Monet", null, ApkFileType.APK,
                    null, null, Collections.singletonList(new AppTarget("1.0.97", null, false, 26, null)), FormFactor.TV, false));
                builder.extendWith(() -> {
                    var input = MonetDisplayedCardsPatch.class.getClassLoader().getResourceAsStream("extensions/monet-displayed-cards.mpe");
                    if (input == null) throw new IllegalStateException("Missing Monet displayed cards extension");
                    return input;
                });
                builder.execute(context -> {
                    if (!"com.klevico.monet".equals(context.getPackageMetadata().getPackageName())
                        || !"1.0.97".equals(context.getPackageMetadata().getVersionName())) throw unsupported("Unexpected package/version");
                    List<ClassDef> classes = new ArrayList<>();
                    context.classDefForEach(c -> { classes.add(c); return Unit.INSTANCE; });
                    Map<String,Method> contracts = validate(classes);
                    for (String signature : TARGETS) {
                        Method original = contracts.get(signature);
                        MutableMethod target = context.mutableClassDefBy(original.getDefiningClass()).getMethods().stream()
                            .filter(m -> m.equals(original)).findFirst().orElseThrow();
                        apply(target);
                    }
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
    }
    static IllegalStateException unsupported(String reason) {
        return new IllegalStateException("Unsupported Monet displayed cards bytecode: " + reason + ". Use original Monet 1.0.97.");
    }
    static Map<String,Method> validate(List<? extends ClassDef> classes) {
        Map<String,Method> found = new HashMap<>();
        Set<String> types = new HashSet<>();
        Set<String> symbols = new HashSet<>();
        for (ClassDef c : classes) {
            if (!types.add(c.getType())) throw unsupported("Duplicate class " + c.getType());
            for (Method m : c.getMethods()) {
                if ((m.getAccessFlags() & 1) != 0) symbols.add(m.toString());
                if (!CONTRACTS.containsKey(m.toString())) continue;
                if (found.put(m.toString(),m) != null || m.getImplementation() == null
                    || !CONTRACTS.get(m.toString()).equals(NuvioPlaybackButtonsPatch.fingerprint(new MutableMethod(m))))
                    throw unsupported("Changed or already patched contract " + m);
                int expected = m.getDefiningClass().equals("La/wl1;") ? 1 : m.toString().equals(SCHEMA) ? 9 : m.getName().equals("<init>") ? 65537 : m.toString().startsWith("La/yr1;") || m.toString().startsWith("La/q15;") ? 17 : 25;
                if (m.getAccessFlags() != expected) throw unsupported("Method access changed " + m);
            }
            for (Field f : c.getFields()) if ((f.getAccessFlags() & 9) == 9) symbols.add(f.toString());
        }
        if (found.size() != CONTRACTS.size() || !symbols.containsAll(List.of("La/iq1;->b()Ljava/lang/Object;",
            "La/am0;->a:La/u10;", "La/s67;->a:La/s67;", "La/kq1;->a(Ljava/lang/Object;)Ljava/lang/Object;")))
            throw unsupported("Missing native button/state/composer contract");
        return found;
    }
    static void apply(MutableMethod method) {
        String signature = method.toString();
        if (!TARGETS.contains(signature) || !CONTRACTS.get(signature).equals(NuvioPlaybackButtonsPatch.fingerprint(method)))
            throw unsupported("Changed or already patched method " + signature);
        var code = method.getImplementation();
        if (signature.equals(CLAMP)) {
            code.replaceInstruction(2, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 2, 0, 0, 0, 0,
                new ImmutableMethodReference("Ljava/lang/Math;", "max", List.of("I", "I"), "I")));
        } else if (signature.equals(SCHEMA)) {
            code.addInstruction(2, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 13, 1, 0, 0, 0,
                new ImmutableMethodReference(MODEL, "schemaMaximum", List.of("Ljava/lang/String;", "I"), "I")));
            code.addInstruction(3, new BuilderInstruction11x(Opcode.MOVE_RESULT, 1));
        } else if (signature.equals(APPLY)) {
            // Replace the cast at its existing location, so branches targeting it also run
            // the adapter. The remembered native focus lambda and pill renderer stay intact.
            code.replaceInstruction(63, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 4, 14, 0, 0, 0,
                new ImmutableMethodReference(UI, "properties", List.of("Ljava/lang/Object;", "Ljava/lang/Object;"), "Ljava/lang/Object;")));
            code.addInstruction(64, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 4));
            code.addInstruction(65, new BuilderInstruction21c(Opcode.CHECK_CAST, 4,
                new com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference("La/kq1;")));
        } else if (signature.equals(PICKER)) {
            // Native Apply already lives in a centered Row. Prepend Max in that row.
            code.replaceInstruction(533, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 57, 9,
                new ImmutableMethodReference(UI, "footer", List.of("Ljava/lang/String;", "Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;",
                    "Ljava/lang/Object;", "I", "Ljava/lang/Object;", "I", "I"), "V")));
            for (int register = 0; register < 6; register++) code.addInstruction(533 + register,
                new BuilderInstruction22x(register == 5 ? Opcode.MOVE_FROM16 : Opcode.MOVE_OBJECT_FROM16, 57 + register, register));
            code.addInstruction(539, new BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16, 63, 13));
            code.addInstruction(540, new BuilderInstruction22x(Opcode.MOVE_FROM16, 64, 79));
            code.addInstruction(541, new BuilderInstruction22x(Opcode.MOVE_FROM16, 65, 80));
            // v57-v70 are dead at both button sites; native text-style construction redefines
            // them before use between the sites. v72-v76 hold live saved values and stay intact.
            for (int index : new int[]{429, 321}) {
                int state = index == 321 ? 34 : 13;
                var prefix = new ArrayList<com.android.tools.smali.dexlib2.builder.BuilderInstruction>();
                Set<Integer> primitive = Set.of(1, 9, 10);
                for (int register = 0; register < 11; register++)
                    prefix.add(new BuilderInstruction22x(primitive.contains(register) ? Opcode.MOVE_FROM16 : Opcode.MOVE_OBJECT_FROM16, 57 + register, register));
                prefix.add(new BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16, 68, state));
                prefix.add(new BuilderInstruction22x(Opcode.MOVE_FROM16, 69, 79));
                prefix.add(new BuilderInstruction22x(Opcode.MOVE_FROM16, 70, 80));
                code.replaceInstruction(index, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 57, 14,
                    new ImmutableMethodReference(UI, "buttons", List.of("Ljava/lang/String;", "Z", "Ljava/lang/Object;", "Ljava/lang/Object;",
                        "Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;", "I", "I", "Ljava/lang/Object;", "I", "I"), "V")));
                for (int n = 0; n < prefix.size(); n++) code.addInstruction(index + n, prefix.get(n));
            }
            // Preserve the native number text and font; only format the unlimited sentinel.
            code.replaceInstruction(331 + 14, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 57, 3,
                new ImmutableMethodReference(MODEL, "number", List.of("I", "I", "I"), "Ljava/lang/String;")));
            code.addInstruction(331 + 14, new BuilderInstruction22x(Opcode.MOVE_FROM16, 57, 2));
            code.addInstruction(332 + 14, new BuilderInstruction22x(Opcode.MOVE_FROM16, 58, 79));
            code.addInstruction(333 + 14, new BuilderInstruction22x(Opcode.MOVE_FROM16, 59, 80));
            // The native picker still creates, remembers and saves its own q15 integer state.
            code.addInstruction(0, new BuilderInstruction22x(Opcode.MOVE_FROM16, 0, 79));
            code.addInstruction(1, new BuilderInstruction22x(Opcode.MOVE_FROM16, 1, 80));
            code.addInstruction(2, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 0, 1, 0, 0, 0,
                new ImmutableMethodReference(MODEL, "pickerMaximum", List.of("I", "I"), "I")));
            code.addInstruction(3, new BuilderInstruction11x(Opcode.MOVE_RESULT, 1));
            code.addInstruction(4, new BuilderInstruction22x(Opcode.MOVE_FROM16, 80, 1));
        } else {
            var original = code.newLabelForIndex(0);
            code.addInstruction(0, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 1, 2, 0, 0, 0,
                new ImmutableMethodReference(MODEL, "label", List.of("I", "[Ljava/lang/Object;"), "Ljava/lang/String;")));
            code.addInstruction(1, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0));
            code.addInstruction(2, new BuilderInstruction21t(Opcode.IF_EQZ, 0, original));
            code.addInstruction(3, new BuilderInstruction11x(Opcode.RETURN_OBJECT, 0));
        }
    }
}

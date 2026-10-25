package santodan.patches;

import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.util.*;
import kotlin.Unit;

/** Local premium-state evaluator; billing and license storage retain their native behavior. */
public final class MonetPremiumPatch {
    public static final String NAME = "Monet - Unlock premium";
    public static final String EXPERIMENTAL = "Monet - Unlock premium (Experimental, any version)";
    static final String PACKAGE = "com.klevico.monet";
    private MonetPremiumPatch() {}

    public static BytecodePatch getMonetPremiumPatch() { return create(false); }
    public static BytecodePatch getMonetPremiumExperimentalPatch() { return create(true); }

    @SuppressWarnings({"unchecked", "deprecation"})
    private static BytecodePatch create(boolean experimental) {
        return PatchKt.bytecodePatch(experimental ? EXPERIMENTAL : NAME,
            experimental ? "Original premium unlock from Doom's Patches, updated here for Monet 1.0.97. Experimental variant with no version restriction; requires a matching native layout. Select only one Monet premium patch."
                : "Original premium unlock from Doom's Patches, updated here for Monet 1.0.97. Unlock local premium features. Select only one Monet premium patch.",
            false, builder -> {
                builder.compatibleWith(new Compatibility(PACKAGE, "Monet", null, ApkFileType.APK,
                    null, null, Collections.singletonList(new AppTarget(experimental ? null : "1.0.97",
                        null, experimental, 26, null)), FormFactor.TV, false));
                builder.execute(context -> {
                    if (!PACKAGE.equals(context.getPackageMetadata().getPackageName())
                        || !experimental && !"1.0.97".equals(context.getPackageMetadata().getVersionName()))
                        throw unsupported("Unexpected package/version");
                    List<ClassDef> classes = new ArrayList<>();
                    context.classDefForEach(c -> { classes.add(c); return Unit.INSTANCE; });
                    Method match = findUnique(classes);
                    if (!experimental && !"La/sa5;->a()Z".equals(match.toString()))
                        throw unsupported("1.0.97 evaluator differs from the reviewed contract");
                    MutableMethod target = context.mutableClassDefBy(match.getDefiningClass()).getMethods().stream()
                        .filter(m -> m.equals(match)).findFirst().orElseThrow();
                    apply(target);
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
    }

    static IllegalStateException unsupported(String reason) {
        return new IllegalStateException("Unsupported Monet bytecode: " + reason
            + ". Use an original APK and select only one Monet premium patch.");
    }

    static List<Instruction> instructions(Method m) {
        List<Instruction> result = new ArrayList<>();
        if (m.getImplementation() != null) m.getImplementation().getInstructions().forEach(result::add);
        return result;
    }

    private static boolean string(Instruction i, String value) {
        if (!(i instanceof ReferenceInstruction)) return false;
        Object ref = ((ReferenceInstruction) i).getReference();
        return ref instanceof StringReference && value.equals(((StringReference) ref).getString());
    }

    static Method findUnique(List<? extends ClassDef> classes) {
        List<Method> matches = new ArrayList<>();
        for (ClassDef c : classes) for (Method m : c.getMethods()) {
            if (m.getAccessFlags() != 17 || !m.getReturnType().equals("Z") || !m.getParameterTypes().isEmpty()
                || m.getImplementation() == null || m.getImplementation().getRegisterCount() != 4
                || !m.getImplementation().getTryBlocks().isEmpty()) continue;
            List<Instruction> ins = instructions(m);
            Opcode[] ops = {Opcode.IGET_BOOLEAN, Opcode.IGET_BOOLEAN, Opcode.IGET_BOOLEAN, Opcode.IGET_BOOLEAN,
                Opcode.IF_EQZ, Opcode.GOTO, Opcode.IF_EQZ, Opcode.IF_NEZ, Opcode.IF_NEZ,
                Opcode.CONST_4, Opcode.RETURN, Opcode.CONST_4, Opcode.RETURN};
            if (ins.size() != ops.length) continue;
            boolean valid = true;
            Set<String> fields = new HashSet<>();
            for (int n = 0; n < ops.length; n++) valid &= ins.get(n).getOpcode() == ops[n];
            if (!valid) continue;
            for (int n = 0; n < 4; n++) {
                TwoRegisterInstruction r = (TwoRegisterInstruction) ins.get(n);
                FieldReference f = (FieldReference) ((ReferenceInstruction) ins.get(n)).getReference();
                valid &= r.getRegisterA() == n && r.getRegisterB() == 3
                    && f.getDefiningClass().equals(c.getType()) && f.getType().equals("Z");
                fields.add(f.toString());
            }
            int[] registers = {0, -1, 1, 2, 3, 3, 3, 3, 3};
            for (int n = 4; n < 13; n++) if (n != 5)
                valid &= ((OneRegisterInstruction) ins.get(n)).getRegisterA() == registers[n - 4];
            int[] offsets = {3, 7, 8, 4, 4};
            for (int n = 4; n < 9; n++) valid &= ((OffsetInstruction) ins.get(n)).getCodeOffset() == offsets[n - 4];
            valid &= fields.size() == 4 && ((NarrowLiteralInstruction) ins.get(9)).getNarrowLiteral() == 1
                && ((NarrowLiteralInstruction) ins.get(11)).getNarrowLiteral() == 0;
            if (!valid) continue;
            // Prove this state belongs to Monet billing, rather than another boolean reducer.
            int anchors = 0;
            for (ClassDef owner : classes) for (Method ctor : owner.getMethods()) {
                if (!ctor.getName().equals("<init>")) continue;
                List<Instruction> body = instructions(ctor);
                if (!body.stream().anyMatch(i -> string(i, "billing_prefs"))
                    || !body.stream().anyMatch(i -> string(i, "license_blob_v1"))) continue;
                for (Instruction i : body) {
                    if (i.getOpcode() != Opcode.INVOKE_DIRECT || !(i instanceof ReferenceInstruction)) continue;
                    Object reference = ((ReferenceInstruction) i).getReference();
                    if (!(reference instanceof MethodReference)) continue;
                    MethodReference ref = (MethodReference) reference;
                    if (ref.getDefiningClass().equals(c.getType()) && ref.getName().equals("<init>")
                        && ref.getReturnType().equals("V") && ref.getParameterTypes().size() == 2
                        && "Z".contentEquals(ref.getParameterTypes().get(0))
                        && "Z".contentEquals(ref.getParameterTypes().get(1))) anchors++;
                }
            }
            if (anchors == 1) matches.add(m);
        }
        if (matches.size() != 1) throw unsupported("Expected one original billing evaluator; found " + matches.size());
        return matches.get(0);
    }

    static void apply(MutableMethod method) {
        List<Instruction> ins = instructions(method);
        if (ins.size() != 13 || ins.get(11).getOpcode() != Opcode.CONST_4
            || ((NarrowLiteralInstruction) ins.get(11)).getNarrowLiteral() != 0)
            throw unsupported("Evaluator changed or was already patched");
        // Same width/register: every native return path now yields true.
        method.getImplementation().replaceInstruction(11, new BuilderInstruction11n(Opcode.CONST_4, 3, 1));
    }
}

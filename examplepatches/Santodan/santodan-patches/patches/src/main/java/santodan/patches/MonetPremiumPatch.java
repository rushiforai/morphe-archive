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
            experimental ? "Original premium unlock from Doom's Patches, verified on Monet 1.1.0. No version restriction; validates billing ownership and evaluator semantics, not obfuscated names or final flags. Future layouts may still be unsupported. Select only one Monet premium patch."
                : "Original premium unlock from Doom's Patches, updated here for Monet 1.1.0. Unlock local premium features. Select only one Monet premium patch.",
            false, builder -> {
                builder.compatibleWith(new Compatibility(PACKAGE, "Monet", null, ApkFileType.APK,
                    null, null, experimental ? Collections.singletonList(new AppTarget(null, null, true, 26, null))
                        : Arrays.asList(new AppTarget("1.0.97", null, false, 26, null),
                            new AppTarget("1.1.0", null, false, 26, null)), FormFactor.TV, false));
                builder.execute(context -> {
                    if (!PACKAGE.equals(context.getPackageMetadata().getPackageName())
                        || !experimental && !Set.of("1.0.97", "1.1.0").contains(context.getPackageMetadata().getVersionName()))
                        throw unsupported("Unexpected package/version");
                    List<ClassDef> classes = new ArrayList<>();
                    context.classDefForEach(c -> { classes.add(c); return Unit.INSTANCE; });
                    Method match = findUnique(classes);
                    String version = context.getPackageMetadata().getVersionName();
                    String reviewed = "1.1.0".equals(version) ? "La/dl5;->a()Z" : "La/sa5;->a()Z";
                    if (!experimental && !reviewed.equals(match.toString()))
                        throw unsupported(version + " evaluator differs from the reviewed contract");
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
            if ((m.getAccessFlags() & ~16) != 1 || !m.getReturnType().equals("Z") || !m.getParameterTypes().isEmpty()
                || m.getImplementation() == null || m.getImplementation().getRegisterCount() < 4
                || !m.getImplementation().getTryBlocks().isEmpty()) continue;
            List<Instruction> ins = instructions(m);
            if (ins.size() < 8 || ins.size() > 32) continue;
            boolean valid = true;
            Set<String> fields = new HashSet<>();
            for (int n = 0; n < 4; n++) {
                if (ins.get(n).getOpcode() != Opcode.IGET_BOOLEAN) { valid = false; break; }
                TwoRegisterInstruction r = (TwoRegisterInstruction) ins.get(n);
                FieldReference f = (FieldReference) ((ReferenceInstruction) ins.get(n)).getReference();
                valid &= r.getRegisterB() == m.getImplementation().getRegisterCount() - 1
                    && (n == 3 || r.getRegisterA() != r.getRegisterB())
                    && f.getDefiningClass().equals(c.getType()) && f.getType().equals("Z");
                fields.add(f.toString());
            }
            if (!valid || fields.size() != 4 || falseLiteral(m) < 0) continue;
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
            // The holder must seed and refresh the same native evaluator, not merely share strings.
            boolean seeds = false, refreshes = false;
            for (Method caller : c.getMethods()) {
                boolean calls = instructions(caller).stream().anyMatch(i -> i.getOpcode() == Opcode.INVOKE_VIRTUAL
                    && i instanceof ReferenceInstruction && m.equals(((ReferenceInstruction) i).getReference()));
                if (calls && caller.getName().equals("<init>") && caller.getParameterTypes().equals(List.of("Z", "Z"))) seeds = true;
                if (calls && caller.getReturnType().equals("V") && caller.getParameterTypes().equals(List.of("Z"))) refreshes = true;
            }
            if (anchors == 1 && seeds && refreshes) matches.add(m);
        }
        if (matches.size() != 1) throw unsupported("Expected one original billing evaluator; found " + matches.size());
        return matches.get(0);
    }

    /** Prove the pure four-input reducer, allowing register/branch layout changes. Fail closed. */
    static int falseLiteral(Method method) {
        List<Instruction> ins = instructions(method);
        if (ins.size() < 8 || ins.size() > 32) return -1;
        int[] address = new int[ins.size()];
        int falseIndex = -1, trueCount = 0;
        for (int n = 0; n < ins.size(); n++) {
            if (n > 0) address[n] = address[n - 1] + ins.get(n - 1).getCodeUnits();
            Opcode op = ins.get(n).getOpcode();
            if (n < 4) { if (op != Opcode.IGET_BOOLEAN) return -1; continue; }
            if (op == Opcode.CONST_4) {
                int value = ((NarrowLiteralInstruction) ins.get(n)).getNarrowLiteral();
                if (n + 1 >= ins.size() || ins.get(n + 1).getOpcode() != Opcode.RETURN
                    || ((OneRegisterInstruction) ins.get(n)).getRegisterA() != ((OneRegisterInstruction) ins.get(n + 1)).getRegisterA()) return -1;
                if (value == 0 && falseIndex == -1) falseIndex = n;
                else if (value == 1) trueCount++;
                else return -1;
            } else if (op == Opcode.RETURN) {
                if (ins.get(n - 1).getOpcode() != Opcode.CONST_4) return -1;
            } else if (op != Opcode.IF_EQZ && op != Opcode.IF_NEZ && op != Opcode.GOTO
                && op != Opcode.GOTO_16 && op != Opcode.GOTO_32 && op != Opcode.NOP) return -1;
        }
        if (falseIndex < 0 || trueCount != 1) return -1;
        BitSet visited = new BitSet(ins.size());
        for (int mask = 0; mask < 16; mask++) {
            int[] regs = new int[method.getImplementation().getRegisterCount()];
            Arrays.fill(regs, -1);
            int pc = 0;
            boolean returned = false;
            for (int steps = 0; steps < ins.size() * 2; steps++) {
                if (pc < 0 || pc >= ins.size()) return -1;
                visited.set(pc);
                Instruction i = ins.get(pc);
                Opcode op = i.getOpcode();
                int reg = i instanceof OneRegisterInstruction ? ((OneRegisterInstruction) i).getRegisterA() : -1;
                if (reg >= regs.length) return -1;
                if (op == Opcode.IGET_BOOLEAN) regs[reg] = mask >> pc & 1;
                else if (op == Opcode.CONST_4) regs[reg] = ((NarrowLiteralInstruction) i).getNarrowLiteral();
                else if (op == Opcode.RETURN) {
                    boolean expected = (mask & 1) != 0 || (mask & 2) != 0 && ((mask & 4) != 0 || (mask & 8) == 0);
                    if (regs[reg] != (expected ? 1 : 0)) return -1;
                    returned = true;
                    break;
                } else if (i instanceof OffsetInstruction) {
                    if (reg >= 0 && regs[reg] < 0) return -1;
                    boolean jump = reg < 0 || (regs[reg] == 0) == (op == Opcode.IF_EQZ);
                    int target = Arrays.binarySearch(address, address[pc] + ((OffsetInstruction) i).getCodeOffset());
                    if (target < 4 || target <= pc || ins.get(target).getOpcode() == Opcode.RETURN) return -1;
                    // No loops, reloading fields, or bypassing the constant feeding a return.
                    if (jump) { pc = target; continue; }
                }
                pc++;
            }
            if (!returned) return -1;
        }
        return visited.cardinality() == ins.size() ? falseIndex : -1;
    }

    static void apply(MutableMethod method) {
        int index = falseLiteral(method);
        if (index < 0)
            throw unsupported("Evaluator changed or was already patched");
        // Same width/register: every native return path now yields true.
        int register = ((OneRegisterInstruction) instructions(method).get(index)).getRegisterA();
        method.getImplementation().replaceInstruction(index, new BuilderInstruction11n(Opcode.CONST_4, register, 1));
    }
}

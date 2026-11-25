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

    /** Reviewed evaluator per exact version; the regular patch accepts only these. Add one entry per release. */
    static final Map<String, String> REVIEWED = new LinkedHashMap<>();
    static {
        REVIEWED.put("1.0.97", "La/sa5;->a()Z");
        REVIEWED.put("1.1.0", "La/dl5;->a()Z");
        REVIEWED.put("1.1.1", "La/ov5;->a()Z");
        REVIEWED.put("1.1.2", "La/dz5;->a()Z");
    }
    static final String LATEST = "1.1.2";

    @SuppressWarnings({"unchecked", "deprecation"})
    private static BytecodePatch create(boolean experimental) {
        List<AppTarget> exact = new ArrayList<>();
        for (String version : REVIEWED.keySet()) exact.add(new AppTarget(version, null, false, 26, null));
        return PatchKt.bytecodePatch(experimental ? EXPERIMENTAL : NAME,
            experimental ? "Original premium unlock from Doom's Patches, verified on Monet " + LATEST + ". No version restriction; validates billing ownership and evaluator semantics, not obfuscated names, flags, field order or branch layout. Future layouts may still be unsupported. Select only one Monet premium patch."
                : "Original premium unlock from Doom's Patches, updated here for Monet " + LATEST + ". Unlock local premium features. Select only one Monet premium patch.",
            false, builder -> {
                builder.compatibleWith(new Compatibility(PACKAGE, "Monet", null, ApkFileType.APK,
                    null, null, experimental ? Collections.singletonList(new AppTarget(null, null, true, 26, null))
                        : exact, FormFactor.TV, false));
                builder.execute(context -> {
                    String version = context.getPackageMetadata().getVersionName();
                    if (!PACKAGE.equals(context.getPackageMetadata().getPackageName())
                        || !experimental && !REVIEWED.containsKey(version))
                        throw unsupported("Unexpected package/version");
                    List<ClassDef> classes = new ArrayList<>();
                    context.classDefForEach(c -> { classes.add(c); return Unit.INSTANCE; });
                    Method match = findUnique(classes);
                    if (!experimental && !REVIEWED.get(version).equals(match.toString()))
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

    private static boolean references(ClassDef c, String value) {
        for (Method m : c.getMethods()) for (Instruction i : instructions(m)) if (string(i, value)) return true;
        return false;
    }

    static boolean calls(Method caller, MethodReference target) {
        for (Instruction i : instructions(caller)) {
            Opcode op = i.getOpcode();
            if ((op == Opcode.INVOKE_VIRTUAL || op == Opcode.INVOKE_DIRECT || op == Opcode.INVOKE_VIRTUAL_RANGE
                || op == Opcode.INVOKE_DIRECT_RANGE) && target.equals(((ReferenceInstruction) i).getReference())) return true;
        }
        return false;
    }

    private static boolean booleanParameters(MethodReference m, int min, int max) {
        int count = m.getParameterTypes().size();
        if (count < min || count > max) return false;
        for (CharSequence type : m.getParameterTypes()) if (!"Z".contentEquals(type)) return false;
        return true;
    }

    /** Instance, non-native, non-synchronized ()Z without try blocks; any visibility, optional final. */
    private static boolean candidate(Method m) {
        if ((m.getAccessFlags() & ~(1 | 2 | 4 | 16)) != 0 || !m.getReturnType().equals("Z")
            || !m.getParameterTypes().isEmpty()) return false;
        MethodImplementation impl = m.getImplementation();
        return impl != null && impl.getRegisterCount() >= 2 && impl.getRegisterCount() <= 16
            && impl.getTryBlocks().isEmpty();
    }

    /**
     * Matches by billing ownership and semantics, never by obfuscated names. Every layout accepted before
     * 1.1.2 is still accepted; field order, lazy loads, shared return blocks and visibility may now drift.
     */
    static Method findUnique(List<? extends ClassDef> classes) {
        // The billing owner keeps both native storage keys (R8 may move them out of its constructor).
        List<ClassDef> owners = new ArrayList<>();
        for (ClassDef c : classes) if (references(c, "billing_prefs") && references(c, "license_blob_v1")) owners.add(c);
        List<Method> matches = new ArrayList<>();
        for (ClassDef c : classes) for (Method m : c.getMethods()) {
            if (!candidate(m)) continue;
            Semantics semantics = semantics(m);
            if (semantics == null) continue;
            // Exactly one billing-owner site creates this holder through its boolean constructor.
            int anchors = 0;
            for (ClassDef owner : owners) for (Method method : owner.getMethods()) for (Instruction i : instructions(method)) {
                if (i.getOpcode() != Opcode.INVOKE_DIRECT && i.getOpcode() != Opcode.INVOKE_DIRECT_RANGE) continue;
                MethodReference ref = (MethodReference) ((ReferenceInstruction) i).getReference();
                if (ref.getDefiningClass().equals(c.getType()) && ref.getName().equals("<init>")
                    && ref.getReturnType().equals("V") && booleanParameters(ref, 1, 4)) anchors++;
            }
            // The holder seeds the same evaluator, and its license refresh stores the field that alone grants premium.
            boolean seeds = false, refreshes = false, conflicting = false;
            for (Method caller : c.getMethods()) {
                if (!calls(caller, m)) continue;
                if (caller.getName().equals("<init>") && booleanParameters(caller, 1, 4)) seeds = true;
                else if ((caller.getAccessFlags() & 8) == 0 && caller.getReturnType().equals("V")
                    && booleanParameters(caller, 1, 1)) {
                    String written = parameterWrite(caller, 0);
                    if (semantics.license.equals(written)) refreshes = true;
                    else if (written != null && semantics.fields.contains(written)) conflicting = true;
                }
            }
            if (anchors == 1 && seeds && refreshes && !conflicting) matches.add(m);
        }
        if (matches.size() != 1) throw unsupported("Expected one original billing evaluator; found " + matches.size());
        return matches.get(0);
    }

    /** Proven reducer: fields in first-load order, the native license field and every false return literal. */
    static final class Semantics {
        final List<String> fields;
        final String license;
        final List<Integer> falseLiterals;
        Semantics(List<String> fields, String license, List<Integer> falseLiterals) {
            this.fields = fields; this.license = license; this.falseLiterals = falseLiterals;
        }
    }

    private static final int UNSET = -1, FIELD = -2;

    /** Truth table over the four owned fields (bit n = n-th first-loaded field), or null if not a pure reducer. */
    static int[] table(Method method, List<String> fieldsOut, BitSet returnedOut) {
        List<Instruction> ins = instructions(method);
        if (ins.size() < 6 || ins.size() > 48) return null;
        int registers = method.getImplementation().getRegisterCount();
        List<String> fields = new ArrayList<>();
        int[] address = new int[ins.size()];
        for (int n = 0; n < ins.size(); n++) {
            if (n > 0) address[n] = address[n - 1] + ins.get(n - 1).getCodeUnits();
            if (ins.get(n).getOpcode() != Opcode.IGET_BOOLEAN) continue;
            FieldReference f = (FieldReference) ((ReferenceInstruction) ins.get(n)).getReference();
            if (!f.getDefiningClass().equals(method.getDefiningClass()) || !f.getType().equals("Z")) return null;
            if (!fields.contains(f.toString())) fields.add(f.toString());
        }
        if (fields.size() != 4) return null;
        int[] table = new int[16];
        BitSet visited = new BitSet(ins.size()), returned = new BitSet(ins.size());
        for (int mask = 0; mask < 16; mask++)
            if ((table[mask] = run(ins, address, registers, fields, mask, visited, returned)) < 0) return null;
        // No dead code: every instruction is reached by some entitlement state.
        if (visited.cardinality() != ins.size()) return null;
        fieldsOut.addAll(fields);
        returnedOut.or(returned);
        return table;
    }

    /** Interpret one input state. Returns 0/1, or -1 for anything outside the pure, loop-free reducer. */
    private static int run(List<Instruction> ins, int[] address, int registers, List<String> fields, int mask,
                           BitSet visited, BitSet returned) {
        int[] value = new int[registers], source = new int[registers];
        boolean[] self = new boolean[registers];
        Arrays.fill(value, -1);
        Arrays.fill(source, UNSET);
        self[registers - 1] = true;
        for (int pc = 0; pc < ins.size(); ) {
            visited.set(pc);
            Instruction i = ins.get(pc);
            Opcode op = i.getOpcode();
            int a = i instanceof OneRegisterInstruction ? ((OneRegisterInstruction) i).getRegisterA() : -1;
            if (a >= registers) return -1;
            boolean jump;
            switch (op) {
                case NOP: pc++; continue;
                case IGET_BOOLEAN: {
                    int object = ((TwoRegisterInstruction) i).getRegisterB();
                    if (object >= registers || !self[object]) return -1;
                    String field = ((FieldReference) ((ReferenceInstruction) i).getReference()).toString();
                    value[a] = mask >> fields.indexOf(field) & 1;
                    source[a] = FIELD;
                    self[a] = false;
                    pc++; continue;
                }
                case CONST_4: {
                    int literal = ((NarrowLiteralInstruction) i).getNarrowLiteral();
                    if (literal != 0 && literal != 1) return -1;
                    value[a] = literal;
                    source[a] = pc;
                    self[a] = false;
                    pc++; continue;
                }
                case RETURN:
                    // Only constant results can be rewritten without changing widths or registers.
                    if (source[a] < 0) return -1;
                    returned.set(source[a]);
                    return value[a];
                case IF_EQZ: case IF_NEZ:
                    if (source[a] != FIELD) return -1;
                    jump = (value[a] == 0) == (op == Opcode.IF_EQZ);
                    break;
                case GOTO: case GOTO_16: case GOTO_32:
                    jump = true;
                    break;
                default:
                    return -1;
            }
            if (!jump) { pc++; continue; }
            int target = Arrays.binarySearch(address, address[pc] + ((OffsetInstruction) i).getCodeOffset());
            if (target <= pc) return -1; // Forward-only: no loops or invalid targets.
            pc = target;
        }
        return -1;
    }

    /** Reviewed formula L || (A && (X || !Y)) with roles bound to fields in any order. Returns [L, A, X, Y] or null. */
    static int[] roles(int[] table) {
        for (int l = 0; l < 4; l++) for (int a = 0; a < 4; a++) for (int x = 0; x < 4; x++) {
            if (a == l || x == l || x == a) continue;
            int y = 6 - l - a - x;
            boolean ok = true;
            for (int mask = 0; mask < 16 && ok; mask++) {
                boolean expected = (mask >> l & 1) != 0 || (mask >> a & 1) != 0 && ((mask >> x & 1) != 0 || (mask >> y & 1) == 0);
                ok = table[mask] == (expected ? 1 : 0);
            }
            if (ok) return new int[]{l, a, x, y};
        }
        return null;
    }

    static Semantics semantics(Method method) {
        List<String> fields = new ArrayList<>();
        BitSet returned = new BitSet();
        int[] table = table(method, fields, returned);
        int[] roles = table == null ? null : roles(table);
        if (roles == null) return null;
        List<Instruction> ins = instructions(method);
        List<Integer> falses = new ArrayList<>();
        for (int n = returned.nextSetBit(0); n >= 0; n = returned.nextSetBit(n + 1))
            if (((NarrowLiteralInstruction) ins.get(n)).getNarrowLiteral() == 0) falses.add(n);
        return falses.isEmpty() ? null : new Semantics(fields, fields.get(roles[0]), falses);
    }

    /** Field stored from a boolean parameter in the straight-line entry block, or null. */
    static String parameterWrite(Method method, int parameter) {
        MethodImplementation impl = method.getImplementation();
        if (impl == null) return null;
        int self = impl.getRegisterCount() - method.getParameterTypes().size() - 1; // boolean parameters are one word
        int source = self + 1 + parameter;
        Set<Integer> clobbered = new HashSet<>();
        for (Instruction i : instructions(method)) {
            Opcode op = i.getOpcode();
            if (op == Opcode.IPUT_BOOLEAN) {
                TwoRegisterInstruction r = (TwoRegisterInstruction) i;
                FieldReference f = (FieldReference) ((ReferenceInstruction) i).getReference();
                if (r.getRegisterA() == source && r.getRegisterB() == self && !clobbered.contains(source)
                    && !clobbered.contains(self) && f.getDefiningClass().equals(method.getDefiningClass())) return f.toString();
                continue;
            }
            if (i instanceof OffsetInstruction || !op.canContinue()) return null;
            if (op.setsRegister() && i instanceof OneRegisterInstruction) {
                int a = ((OneRegisterInstruction) i).getRegisterA();
                clobbered.add(a);
                if (op.setsWideRegister()) clobbered.add(a + 1);
            }
        }
        return null;
    }

    /** True when every input state returns true (the patched result). */
    static boolean alwaysTrue(Method method) {
        int[] table = table(method, new ArrayList<>(), new BitSet());
        if (table == null) return false;
        for (int result : table) if (result != 1) return false;
        return true;
    }

    static void apply(MutableMethod method) {
        Semantics semantics = semantics(method);
        if (semantics == null)
            throw unsupported("Evaluator changed or was already patched");
        // Same width/register for each false literal: every native return path now yields true.
        List<Instruction> ins = instructions(method);
        for (int index : semantics.falseLiterals) {
            int register = ((OneRegisterInstruction) ins.get(index)).getRegisterA();
            method.getImplementation().replaceInstruction(index, new BuilderInstruction11n(Opcode.CONST_4, register, 1));
        }
        if (!alwaysTrue(method)) throw new IllegalStateException("Monet premium evaluator did not become unconditional");
    }
}

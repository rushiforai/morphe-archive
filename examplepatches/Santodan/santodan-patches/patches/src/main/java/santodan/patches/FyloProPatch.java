package santodan.patches;

import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.util.*;
import kotlin.Unit;

/**
 * Fylo replaced the upstream 1.9 DebugFeatureUnlock hook with a local billing StateFlow.
 * The matcher is structural and version-agnostic: it locates the {@code pro = (entitlement != NONE)}
 * boolean diamond that seeds the Pro StateFlow in the billing constructor and republishes it on
 * refresh, then forces the NONE (false) branch of each diamond to produce true. The exact patch
 * additionally pins the reviewed 2.9 method descriptors; the experimental patch relies on the
 * shared contract alone so it also covers the earlier 2.6 layout and future releases that keep it.
 */
public final class FyloProPatch {
    public static final String NAME = "Fylo - Enable Pro";
    public static final String EXPERIMENTAL = "Fylo - Enable Pro (Experimental, any version)";
    static final String PACKAGE = "com.aeroloom.fylofilemanager";
    static final String LICENSE = "Lcom/pairip/licensecheck/LicenseClient;";
    static final String VALUE_OF = "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;";
    // Reviewed bytecode target. The exact patch pins these; the experimental patch does not.
    static final String REVIEWED_VERSION = "2.9";
    static final String REVIEWED_SEED = "Ljm1;-><init>(Landroid/content/Context;)V";
    static final String REVIEWED_REFRESH = "Ljm1;->p(Lr3f;Ljava/lang/String;)V";
    private FyloProPatch() {}
    public static BytecodePatch getFyloProPatch() { return create(false); }
    public static BytecodePatch getFyloProExperimentalPatch() { return create(true); }

    @SuppressWarnings({"unchecked", "deprecation"})
    private static BytecodePatch create(boolean experimental) {
        return PatchKt.bytecodePatch(experimental ? EXPERIMENTAL : NAME,
            "Enable local Pro features at startup and after billing refresh. Updated from Morning Entree's Fylo 1.9 approach. "
                + "Disables the Pairip launch license check for rebuilt APKs. Select only one Fylo Pro patch. "
                + (experimental ? "No version restriction; the shared billing contract also covers earlier releases, and unsupported bytecode layouts are rejected."
                                : "Verified bytecode target: Fylo " + REVIEWED_VERSION + "."),
            false, builder -> {
                builder.compatibleWith(new Compatibility(PACKAGE, "Fylo — File Manager", null, ApkFileType.APK,
                    null, null, List.of(new AppTarget(experimental ? null : REVIEWED_VERSION, null, experimental, 32, null)), FormFactor.MOBILE, false));
                builder.execute(context -> {
                    if (!PACKAGE.equals(context.getPackageMetadata().getPackageName())
                        || !experimental && !REVIEWED_VERSION.equals(context.getPackageMetadata().getVersionName()))
                        throw unsupported("Unexpected package/version");
                    List<ClassDef> classes = new ArrayList<>();
                    context.classDefForEach(c -> { classes.add(c); return Unit.INSTANCE; });
                    Plan plan = findUnique(classes);
                    if (!experimental && (!plan.seed.toString().equals(REVIEWED_SEED)
                        || !plan.refresh.toString().equals(REVIEWED_REFRESH)))
                        throw unsupported(REVIEWED_VERSION + " billing contract differs from reviewed original");
                    forceTrue(mutable(context.mutableClassDefBy(plan.seed.getDefiningClass()).getMethods(), plan.seed), plan.seedIndex);
                    forceTrue(mutable(context.mutableClassDefBy(plan.refresh.getDefiningClass()).getMethods(), plan.refresh), plan.refreshIndex);
                    if (plan.license != null) mutable(context.mutableClassDefBy(LICENSE).getMethods(), plan.license)
                        .getImplementation().addInstruction(0, new BuilderInstruction10x(Opcode.RETURN_VOID));
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
    }

    static MutableMethod mutable(Collection<MutableMethod> methods, Method wanted) {
        return methods.stream().filter(m -> m.equals(wanted)).findFirst().orElseThrow();
    }
    static IllegalStateException unsupported(String reason) {
        return new IllegalStateException("Unsupported Fylo bytecode: " + reason + ". Use an original APK and select only one Fylo Pro patch.");
    }
    static final class Plan {
        final Method seed, refresh, license;
        final int seedIndex, refreshIndex;
        Plan(Method seed, int seedIndex, Method refresh, int refreshIndex, Method license) {
            this.seed = seed; this.seedIndex = seedIndex; this.refresh = refresh;
            this.refreshIndex = refreshIndex; this.license = license;
        }
    }

    // ---- shared instruction helpers ----
    static List<Instruction> instructions(Method m) {
        List<Instruction> result = new ArrayList<>();
        if (m.getImplementation() != null) m.getImplementation().getInstructions().forEach(result::add);
        return result;
    }
    static Object ref(Instruction i) { return i instanceof ReferenceInstruction ? ((ReferenceInstruction)i).getReference() : null; }
    static boolean string(Instruction i, String s) { return ref(i) instanceof StringReference && s.equals(((StringReference)ref(i)).getString()); }
    static int reg(Instruction i) { return ((OneRegisterInstruction)i).getRegisterA(); }
    static boolean isMove(Opcode op) { return op == Opcode.MOVE || op == Opcode.MOVE_FROM16 || op == Opcode.MOVE_16; }
    static boolean isConst(Opcode op) { return op == Opcode.CONST_4 || op == Opcode.CONST_16 || op == Opcode.CONST
        || op == Opcode.CONST_HIGH16; }
    static boolean ops(List<Instruction> body, int start, Opcode... ops) {
        if (start < 0 || start + ops.length > body.size()) return false;
        for (int n = 0; n < ops.length; n++) if (body.get(start+n).getOpcode() != ops[n]) return false;
        return true;
    }
    static int target(List<Instruction> body, int index) {
        int address = 0;
        for (int n = 0; n < index; n++) address += body.get(n).getCodeUnits();
        address += ((OffsetInstruction)body.get(index)).getCodeOffset();
        for (int n = 0, offset = 0; n < body.size(); n++) {
            if (offset == address) return n;
            offset += body.get(n).getCodeUnits();
        }
        return -1;
    }

    /** Constant integer held by {@code register} just before {@code at}, tracing const seeds through moves. */
    static Integer constValue(List<Instruction> body, int at, int register) {
        for (int k = at - 1; k >= 0; k--) {
            Instruction i = body.get(k);
            if (!(i instanceof OneRegisterInstruction) || reg(i) != register) continue;
            Opcode op = i.getOpcode();
            if (isConst(op)) return (int)((NarrowLiteralInstruction)i).getNarrowLiteral();
            if (isMove(op)) return constValue(body, k, ((TwoRegisterInstruction)i).getRegisterB());
            return null; // last writer was not a constant/move
        }
        return null;
    }
    /** Value written into {@code register} by the single instruction at {@code index}, or null. */
    static Integer writtenValue(List<Instruction> body, int index, int register) {
        Instruction i = body.get(index);
        if (!(i instanceof OneRegisterInstruction) || reg(i) != register) return null;
        Opcode op = i.getOpcode();
        if (isConst(op)) return (int)((NarrowLiteralInstruction)i).getNarrowLiteral();
        if (isMove(op)) return constValue(body, index, ((TwoRegisterInstruction)i).getRegisterB());
        return null;
    }
    /** The one {@code IF_EQ} whose taken branch is {@code targetIndex}; -1 if none or ambiguous. */
    static int ifEqTargeting(List<Instruction> body, int targetIndex) {
        int found = -1;
        for (int k = 0; k < targetIndex; k++) if (body.get(k).getOpcode() == Opcode.IF_EQ && target(body, k) == targetIndex) {
            if (found != -1) return -1;
            found = k;
        }
        return found;
    }
    /** Field of the nearest {@code SGET_OBJECT} that last wrote {@code register} before {@code at}. */
    static FieldReference sgetField(List<Instruction> body, int at, int register) {
        for (int k = at - 1; k >= 0; k--) {
            Instruction i = body.get(k);
            if (!(i instanceof OneRegisterInstruction) || reg(i) != register) continue;
            if (i.getOpcode() == Opcode.SGET_OBJECT && ref(i) instanceof FieldReference) return (FieldReference)ref(i);
            return null;
        }
        return null;
    }
    /** The NONE enum singleton compared by the {@code IF_EQ} at {@code branch}, or null. */
    static FieldReference noneAt(List<? extends ClassDef> classes, List<Instruction> body, int branch) {
        TwoRegisterInstruction cmp = (TwoRegisterInstruction)body.get(branch);
        for (int register : new int[]{cmp.getRegisterA(), cmp.getRegisterB()}) {
            FieldReference f = sgetField(body, branch, register);
            if (f != null && f.getType().equals(f.getDefiningClass()) && isNoneEnum(classes, f)) return f;
        }
        return null;
    }

    static boolean isNoneEnum(List<? extends ClassDef> classes, FieldReference field) {
        for (ClassDef c : classes) if (c.getType().equals(field.getDefiningClass()) && "Ljava/lang/Enum;".equals(c.getSuperclass()))
            for (Method m : c.getMethods()) if (m.getName().equals("<clinit>")) {
                var body = instructions(m);
                for (int n = 0; n + 2 < body.size(); n++) if (string(body.get(n), "NONE")
                    && ops(body, n+1, Opcode.INVOKE_DIRECT, Opcode.SPUT_OBJECT)
                    && field.equals(ref(body.get(n+2)))
                    && ref(body.get(n+1)) instanceof MethodReference) {
                    MethodReference ctor = (MethodReference)ref(body.get(n+1));
                    FiveRegisterInstruction invoke = (FiveRegisterInstruction)body.get(n+1);
                    if (ctor.getDefiningClass().equals(c.getType()) && ctor.getName().equals("<init>")
                        && invoke.getRegisterD() == reg(body.get(n)) && invoke.getRegisterC() == reg(body.get(n+2))) return true;
                }
            }
        return false;
    }

    /**
     * Shared backbone of the {@code pro = (entitlement != NONE)} diamond, identical across releases:
     * <pre>
     *   IF_EQ a, b -> P-1      (a or b is the NONE singleton)
     *   ... pro path assigns the result register 1 (adjacent write or a pre-seed) ...
     *   GOTO -> P              (at P-2, skipping the NONE path)
     *   P-1: write result = 0  (the IF_EQ taken target)
     *   P:   INVOKE_STATIC Boolean.valueOf(Z){result}
     * </pre>
     * Returns the index of the NONE (false) path write (P-1), or -1 if the region at {@code valueOf}
     * is not such a diamond for a NONE singleton in {@code classes}.
     */
    static int falsePath(List<? extends ClassDef> classes, List<Instruction> body, int valueOf, FieldReference none) {
        if (valueOf < 2 || !VALUE_OF.equals(String.valueOf(ref(body.get(valueOf))))) return -1;
        int result = ((FiveRegisterInstruction)body.get(valueOf)).getRegisterC();
        int falseIndex = valueOf - 1;
        Integer falseValue = writtenValue(body, falseIndex, result);
        if (falseValue == null || falseValue != 0) return -1;
        if (body.get(valueOf-2).getOpcode() != Opcode.GOTO || target(body, valueOf-2) != valueOf) return -1;
        int branch = ifEqTargeting(body, falseIndex);
        if (branch < 0) return -1;
        // The pro path (IF_EQ fall-through) must produce 1: an adjacent write, or the result pre-seeded to 1.
        Integer proValue = writtenValue(body, branch + 1, result);
        if (proValue == null) proValue = (branch + 1 == valueOf - 1) ? null : constValue(body, branch, result);
        if (proValue == null) proValue = constValue(body, branch, result);
        if (proValue == null || proValue != 1) return -1;
        FieldReference enumField = noneAt(classes, body, branch);
        if (none == null) return enumField != null ? falseIndex : -1;
        return none.equals(enumField) ? falseIndex : -1;
    }

    static int iputWriters(List<? extends ClassDef> classes, FieldReference field) {
        int writes = 0;
        for (ClassDef owner : classes) for (Method m : owner.getMethods())
            for (Instruction i : instructions(m)) if (i.getOpcode() == Opcode.IPUT_OBJECT && field.equals(ref(i))) writes++;
        return writes;
    }

    static Plan findUnique(List<? extends ClassDef> classes) {
        List<Plan> matches = new ArrayList<>();
        Method license = findLicense(classes);
        for (ClassDef c : classes) for (Method seed : c.getMethods()) {
            if (!seed.getName().equals("<init>") || !seed.getParameterTypes().equals(List.of("Landroid/content/Context;"))) continue;
            var body = instructions(seed);
            if (body.stream().noneMatch(i -> string(i, "fylo_billing"))) continue;
            for (int p = 2; p < body.size(); p++) {
                if (!VALUE_OF.equals(String.valueOf(ref(body.get(p))))) continue;
                int seedFalse = falsePath(classes, body, p, null);
                if (seedFalse < 0) continue;
                int branch = ifEqTargeting(body, seedFalse);
                FieldReference none = noneAt(classes, body, branch);
                // Seed tail: valueOf -> MOVE_RESULT -> StateFlow factory -> MOVE_RESULT -> IPUT field.
                if (!ops(body, p, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_STATIC,
                    Opcode.MOVE_RESULT_OBJECT, Opcode.IPUT_OBJECT)) continue;
                if (((FiveRegisterInstruction)body.get(p+2)).getRegisterC() != reg(body.get(p+1))
                    || reg(body.get(p+3)) != reg(body.get(p+4))) continue;
                if (!(ref(body.get(p+2)) instanceof MethodReference) || !(ref(body.get(p+4)) instanceof FieldReference)) continue;
                MethodReference factory = (MethodReference)ref(body.get(p+2));
                FieldReference flowField = (FieldReference)ref(body.get(p+4));
                if (!flowField.getDefiningClass().equals(c.getType())
                    || !factory.getParameterTypes().equals(List.of("Ljava/lang/Object;"))
                    || !factory.getReturnType().equals(flowField.getType())) continue;
                if (iputWriters(classes, flowField) != 1) continue;
                String noneType = none.getType();
                for (Method refresh : c.getMethods()) {
                    if (!refresh.getReturnType().equals("V")
                        || !refresh.getParameterTypes().equals(List.of(noneType, "Ljava/lang/String;"))
                        || (refresh.getAccessFlags() & 8) != 0) continue;
                    var update = instructions(refresh);
                    int fieldReg = -1;
                    for (Instruction i : update) if (i.getOpcode() == Opcode.IGET_OBJECT && flowField.equals(ref(i))) { fieldReg = reg(i); break; }
                    if (fieldReg < 0) continue;
                    for (int q = 2; q < update.size(); q++) {
                        int refreshFalse = falsePath(classes, update, q, none);
                        if (refreshFalse < 0) continue;
                        if (q + 1 >= update.size() || update.get(q+1).getOpcode() != Opcode.MOVE_RESULT_OBJECT) continue;
                        if (!publishesTo(update, q + 1, fieldReg, reg(update.get(q+1)), flowField.getType())) continue;
                        matches.add(new Plan(seed, seedFalse, refresh, refreshFalse, license));
                    }
                }
            }
        }
        if (matches.size() != 1) throw unsupported("Expected one original startup/refresh Pro flow; found " + matches.size());
        return matches.get(0);
    }

    /** True if the boxed boolean in {@code boxedReg} is published to the StateFlow held in {@code fieldReg}. */
    static boolean publishesTo(List<Instruction> body, int from, int fieldReg, int boxedReg, String flowType) {
        for (int r = from + 1; r < body.size(); r++) {
            Instruction i = body.get(r);
            if ((i.getOpcode() != Opcode.INVOKE_INTERFACE && i.getOpcode() != Opcode.INVOKE_VIRTUAL)
                || !(ref(i) instanceof MethodReference)) continue;
            MethodReference setter = (MethodReference)ref(i);
            if (!setter.getDefiningClass().equals(flowType)) continue;
            FiveRegisterInstruction invoke = (FiveRegisterInstruction)i;
            if (invoke.getRegisterC() != fieldReg) continue;
            int[] args = {invoke.getRegisterD(), invoke.getRegisterE(), invoke.getRegisterF(), invoke.getRegisterG()};
            for (int n = 1; n < invoke.getRegisterCount(); n++) if (args[n-1] == boxedReg) return true;
        }
        return false;
    }

    static Method findLicense(List<? extends ClassDef> classes) {
        Method license = null;
        for (ClassDef c : classes) if (c.getType().equals(LICENSE)) {
            List<Method> entry = new ArrayList<>();
            for (Method m : c.getMethods()) if (m.getName().equals("checkLicense") && m.getReturnType().equals("V")
                && m.getParameterTypes().equals(List.of("Landroid/content/Context;")) && m.getAccessFlags() == 9
                && instructions(m).stream().anyMatch(i -> string(i, "Cannot check license with null context."))) entry.add(m);
            if (entry.size() != 1 || instructions(entry.get(0)).get(0).getOpcode() == Opcode.RETURN_VOID)
                throw unsupported("Pairip launch entry changed or already patched");
            license = entry.get(0);
        }
        return license;
    }

    static void forceTrue(MutableMethod method, int index) {
        int register = reg(instructions(method).get(index));
        method.getImplementation().replaceInstruction(index, new BuilderInstruction11n(Opcode.CONST_4, register, 1));
    }
}

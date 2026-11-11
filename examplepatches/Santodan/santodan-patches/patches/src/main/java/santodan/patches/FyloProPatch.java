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

/** Fylo 2.6 replaced the upstream 1.9 DebugFeatureUnlock hook with billing StateFlows. */
public final class FyloProPatch {
    public static final String NAME = "Fylo - Enable Pro";
    public static final String EXPERIMENTAL = "Fylo - Enable Pro (Experimental, any version)";
    static final String PACKAGE = "com.aeroloom.fylofilemanager";
    static final String LICENSE = "Lcom/pairip/licensecheck/LicenseClient;";
    private FyloProPatch() {}
    public static BytecodePatch getFyloProPatch() { return create(false); }
    public static BytecodePatch getFyloProExperimentalPatch() { return create(true); }

    @SuppressWarnings({"unchecked", "deprecation"})
    private static BytecodePatch create(boolean experimental) {
        return PatchKt.bytecodePatch(experimental ? EXPERIMENTAL : NAME,
            "Enable local Pro features at startup and after billing refresh. Updated from Morning Entree's Fylo 1.9 approach for 2.6. "
                + "Disables the Pairip launch license check for rebuilt APKs. Select only one Fylo Pro patch. "
                + (experimental ? "No version restriction; unsupported bytecode layouts are rejected." : "Verified bytecode target: Fylo 2.6."),
            false, builder -> {
                builder.compatibleWith(new Compatibility(PACKAGE, "Fylo — File Manager", null, ApkFileType.APK,
                    null, null, List.of(new AppTarget(experimental ? null : "2.6", null, experimental, 32, null)), FormFactor.MOBILE, false));
                builder.execute(context -> {
                    if (!PACKAGE.equals(context.getPackageMetadata().getPackageName())
                        || !experimental && !"2.6".equals(context.getPackageMetadata().getVersionName()))
                        throw unsupported("Unexpected package/version");
                    List<ClassDef> classes = new ArrayList<>();
                    context.classDefForEach(c -> { classes.add(c); return Unit.INSTANCE; });
                    Plan plan = findUnique(classes);
                    if (!experimental && (!plan.seed.toString().equals("Lce1;-><init>(Landroid/content/Context;)V")
                        || !plan.refresh.toString().equals("Lce1;->a0(Lqte;Ljava/lang/String;)V")))
                        throw unsupported("2.6 billing contract differs from reviewed original");
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
    static List<Instruction> instructions(Method m) {
        List<Instruction> result = new ArrayList<>();
        if (m.getImplementation() != null) m.getImplementation().getInstructions().forEach(result::add);
        return result;
    }
    static Object ref(Instruction i) { return i instanceof ReferenceInstruction ? ((ReferenceInstruction)i).getReference() : null; }
    static boolean string(Instruction i, String s) { return ref(i) instanceof StringReference && s.equals(((StringReference)ref(i)).getString()); }
    static int reg(Instruction i) { return ((OneRegisterInstruction)i).getRegisterA(); }
    static boolean literal(Instruction i, int value) {
        return i.getOpcode() == Opcode.CONST_4 && ((NarrowLiteralInstruction)i).getNarrowLiteral() == value;
    }
    static boolean compares(Instruction i, int first, int second) {
        TwoRegisterInstruction pair = (TwoRegisterInstruction)i;
        return pair.getRegisterA() == first && pair.getRegisterB() == second
            || pair.getRegisterA() == second && pair.getRegisterB() == first;
    }
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

    static boolean isNoneEnum(List<? extends ClassDef> classes, FieldReference field) {
        for (ClassDef c : classes) if (c.getType().equals(field.getDefiningClass()) && "Ljava/lang/Enum;".equals(c.getSuperclass()))
            for (Method m : c.getMethods()) if (m.getName().equals("<clinit>")) {
                var body = instructions(m);
                for (int n = 0; n+2 < body.size(); n++) if (string(body.get(n), "NONE")
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

    static Plan findUnique(List<? extends ClassDef> classes) {
        List<Plan> matches = new ArrayList<>();
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
        for (ClassDef c : classes) for (Method seed : c.getMethods()) {
            if (!seed.getName().equals("<init>") || !seed.getParameterTypes().equals(List.of("Landroid/content/Context;"))) continue;
            var body = instructions(seed);
            if (body.stream().noneMatch(i -> string(i, "fylo_billing"))) continue;
            for (int n = 0; n < body.size(); n++) {
                if (!ops(body, n, Opcode.SGET_OBJECT, Opcode.IF_EQ, Opcode.GOTO, Opcode.MOVE, Opcode.INVOKE_STATIC,
                    Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.IPUT_OBJECT)) continue;
                if (!"Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;".equals(String.valueOf(ref(body.get(n+4))))) continue;
                int boolReg = reg(body.get(n+3));
                int source = ((TwoRegisterInstruction)body.get(n+3)).getRegisterB();
                if (target(body, n+1) != n+3 || target(body, n+2) != n+4
                    || ((FiveRegisterInstruction)body.get(n+4)).getRegisterC() != boolReg) continue;
                // Both inputs of the native enum-to-boolean diamond must be original 0/1 seeds.
                boolean zero = false, one = false;
                for (int k = 0; k < n; k++) {
                    if (literal(body.get(k), 0) && reg(body.get(k)) == source) zero = true;
                    if (literal(body.get(k), 1) && reg(body.get(k)) == boolReg) one = true;
                    else if (body.get(k) instanceof OneRegisterInstruction && reg(body.get(k)) == boolReg) one = false;
                    if (body.get(k) instanceof OneRegisterInstruction && reg(body.get(k)) == source && !literal(body.get(k), 0)) zero = false;
                }
                if (!zero || !one || boolReg > 15) continue;
                Object flowField = ref(body.get(n+8)), noneField = ref(body.get(n));
                if (!(flowField instanceof FieldReference) || !((FieldReference)flowField).getDefiningClass().equals(c.getType())
                    || !(noneField instanceof FieldReference) || !((FieldReference)noneField).getType().equals(((FieldReference)noneField).getDefiningClass())) continue;
                if (!isNoneEnum(classes, (FieldReference)noneField)) continue;
                TwoRegisterInstruction initialCompare = (TwoRegisterInstruction)body.get(n+1);
                if (initialCompare.getRegisterA() != reg(body.get(n)) && initialCompare.getRegisterB() != reg(body.get(n))) continue;
                // Boxing, StateFlow creation and field assignment must share the actual registers.
                if (((FiveRegisterInstruction)body.get(n+6)).getRegisterC() != reg(body.get(n+5))
                    || reg(body.get(n+7)) != reg(body.get(n+8))
                    || ((TwoRegisterInstruction)body.get(n+8)).getRegisterB() != seed.getImplementation().getRegisterCount()-2
                    || !(ref(body.get(n+6)) instanceof MethodReference)) continue;
                MethodReference factory = (MethodReference)ref(body.get(n+6));
                if (!factory.getParameterTypes().equals(List.of("Ljava/lang/Object;"))
                    || !factory.getReturnType().equals(((FieldReference)flowField).getType())) continue;
                // Require the same field's only instance writer and refresh publication.
                int writes = 0;
                for (ClassDef owner : classes) for (Method m : owner.getMethods())
                    for (Instruction i : instructions(m)) if (i.getOpcode() == Opcode.IPUT_OBJECT && flowField.equals(ref(i))) writes++;
                if (writes != 1) continue;
                for (Method refresh : c.getMethods()) {
                    if (!refresh.getReturnType().equals("V") || !refresh.getParameterTypes().equals(List.of(((FieldReference)noneField).getType(), "Ljava/lang/String;"))) continue;
                    if ((refresh.getAccessFlags() & 8) != 0) continue;
                    var update = instructions(refresh);
                    for (int k = 0; k < update.size(); k++) {
                        if (!ops(update, k, Opcode.IGET_OBJECT, Opcode.SGET_OBJECT, Opcode.IF_EQ, Opcode.CONST_4,
                            Opcode.GOTO, Opcode.CONST_4, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_INTERFACE)) continue;
                        if (!flowField.equals(ref(update.get(k))) || !noneField.equals(ref(update.get(k+1)))
                            || !literal(update.get(k+3), 1) || !literal(update.get(k+5), 0)
                            || reg(update.get(k+3)) != reg(update.get(k+5)) || reg(update.get(k+5)) > 15
                            || target(update, k+2) != k+5 || target(update, k+4) != k+6
                            || !ref(body.get(n+4)).equals(ref(update.get(k+6)))
                            || ((FiveRegisterInstruction)update.get(k+6)).getRegisterC() != reg(update.get(k+5))) continue;
                        if (!compares(update.get(k+2), reg(update.get(k+1)), refresh.getImplementation().getRegisterCount()-2)
                            || ((TwoRegisterInstruction)update.get(k)).getRegisterB() != refresh.getImplementation().getRegisterCount()-3) continue;
                        MethodReference setter = ref(update.get(k+8)) instanceof MethodReference ? (MethodReference)ref(update.get(k+8)) : null;
                        if (setter == null || !setter.getName().equals("setValue")
                            || !setter.getDefiningClass().equals(((FieldReference)flowField).getType()) || !setter.getParameterTypes().equals(List.of("Ljava/lang/Object;"))
                            || !setter.getReturnType().equals("V")) continue;
                        var invoke = (FiveRegisterInstruction)update.get(k+8);
                        if (invoke.getRegisterC() != reg(update.get(k)) || invoke.getRegisterD() != reg(update.get(k+7))) continue;
                        matches.add(new Plan(seed, n+3, refresh, k+5, license));
                    }
                }
            }
        }
        if (matches.size() != 1) throw unsupported("Expected one original startup/refresh Pro flow; found " + matches.size());
        return matches.get(0);
    }
    static void forceTrue(MutableMethod method, int index) {
        int register = reg(instructions(method).get(index));
        method.getImplementation().replaceInstruction(index, new BuilderInstruction11n(Opcode.CONST_4, register, 1));
    }
}

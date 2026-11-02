import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;
import java.util.*;

/** Independently inspect emitted wrappers; no release-name or obfuscation table. */
public final class InspectBrowser {
    static final String SUPPORT = "Lpatches/ytmusic/GearslipSupport;";
    static List<MethodReference> calls(Method m) {
        List<MethodReference> result = new ArrayList<>();
        if (m.getImplementation() != null) for (Instruction i : m.getImplementation().getInstructions())
            if (i instanceof ReferenceInstruction && ((ReferenceInstruction)i).getReference() instanceof MethodReference)
                result.add((MethodReference)((ReferenceInstruction)i).getReference());
        return result;
    }
    static <T> T one(List<T> values, String what) {
        if (values.size() != 1) throw new AssertionError("Expected one " + what + ", found " + values.size());
        return values.get(0);
    }
    static boolean hook(Method m, String name) {
        return calls(m).stream().anyMatch(r -> r.getDefiningClass().equals(SUPPORT) && r.getName().equals(name));
    }
    static FieldReference field(Method m, String type) {
        Map<String,FieldReference> fields = new LinkedHashMap<>();
        for (Instruction i : m.getImplementation().getInstructions()) if (i.getOpcode() == Opcode.IGET_OBJECT && i instanceof ReferenceInstruction) {
            Reference r = ((ReferenceInstruction)i).getReference();
            if (r instanceof FieldReference && ((FieldReference)r).getType().equals(type)) fields.put(r.toString(), (FieldReference)r);
        }
        return one(new ArrayList<>(fields.values()), type + " field");
    }
    static String javaName(String descriptor) { return descriptor.substring(1, descriptor.length()-1).replace('/', '.'); }
    static void value(String key, String value) { System.out.println(key + "=" + value); }
    public static void main(String[] args) throws Exception {
        Map<String,ClassDef> classes = new HashMap<>();
        var container = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        for (String name : container.getDexEntryNames()) for (ClassDef cls : container.getEntry(name).getDexFile().getClasses()) classes.put(cls.getType(), cls);
        List<Method> trustHooks = new ArrayList<>(), eligibilityHooks = new ArrayList<>();
        for (ClassDef cls : classes.values()) for (Method m : cls.getMethods()) {
            if (hook(m, "decision")) trustHooks.add(m);
            if (hook(m, "isConfiguredPackage")) eligibilityHooks.add(m);
        }
        Method trust = one(trustHooks, "captured-UID trust wrapper");
        eligibilityHooks.removeIf(m -> !m.getDefiningClass().equals(trust.getDefiningClass()));
        Method eligible = one(eligibilityHooks, "browser eligibility wrapper");
        if (!trust.getDefiningClass().equals(eligible.getDefiningClass())) throw new AssertionError("Wrappers have different owners");
        ClassDef owner = classes.get(trust.getDefiningClass());
        Method originalTrust = null, originalEligible = null;
        for (Method m : owner.getMethods()) {
            if (m.getName().equals("morpheOriginalCallerPolicy")) originalTrust = m;
            if (m.getName().equals("morpheOriginalBrowserEligibility")) originalEligible = m;
        }
        if (originalTrust == null || originalEligible == null) throw new AssertionError("Original policy bodies missing");
        final Method fallbackTrust = originalTrust, fallbackEligible = originalEligible;
        if (calls(trust).stream().noneMatch(r -> r.toString().equals(fallbackTrust.toString())) ||
            calls(eligible).stream().noneMatch(r -> r.toString().equals(fallbackEligible.toString()))) throw new AssertionError("Original fallback missing");
        for (Instruction i : trust.getImplementation().getInstructions()) if (i instanceof ReferenceInstruction &&
                ((ReferenceInstruction)i).getReference().toString().contains(SUPPORT + "->decision")) {
            if (!(i instanceof FiveRegisterInstruction) || ((FiveRegisterInstruction)i).getRegisterE() != trust.getImplementation().getRegisterCount()-1)
                throw new AssertionError("Trust wrapper is not using its captured UID parameter");
        }
        if (calls(originalTrust).stream().filter(r -> r.toString().equals("Landroid/content/pm/PackageManager;->getPackagesForUid(I)[Ljava/lang/String;")).count() != 1)
            throw new AssertionError("Original ownership lookup missing");
        if (calls(originalEligible).stream().filter(r -> r.toString().equals("Ljava/util/Set;->contains(Ljava/lang/Object;)Z")).count() != 1)
            throw new AssertionError("Original eligibility membership missing");
        String client = eligible.getParameterTypes().get(0).toString();
        List<Method> roots = new ArrayList<>();
        for (Method m : classes.get("Lcom/google/android/apps/youtube/music/mediabrowser/MusicBrowserService;").getMethods())
            if (calls(m).stream().filter(r -> r.toString().equals(trust.toString())).count() == 2) roots.add(m);
        Method root = one(roots, "browser root");
        Map<String,MethodReference> browseRefs = new LinkedHashMap<>();
        for (MethodReference r : calls(root)) if (r.getDefiningClass().equals(owner.getType()) && r.getReturnType().equals("Z") &&
                r.getParameterTypes().size()==1 && r.getParameterTypes().get(0).toString().equals(client)) browseRefs.put(r.toString(),r);
        MethodReference browse = one(new ArrayList<>(browseRefs.values()), "browser eligibility entry");
        value("manager",javaName(owner.getType())); value("caller",javaName(trust.getParameterTypes().get(0).toString())); value("client",javaName(client));
        value("trust",trust.getName()); value("eligible",eligible.getName()); value("browsable",browse.getName());
        value("context",field(trust,"Landroid/content/Context;").getName()); value("callerField",field(trust,"Ljava/lang/String;").getName());
        value("clientField",field(eligible,"Ljava/lang/String;").getName()); value("membership",field(originalEligible,"Ljava/util/Set;").getName());
    }
}

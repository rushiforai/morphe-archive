package patches.ytmusic;

import static org.junit.Assert.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import java.lang.reflect.InvocationTargetException;
import java.util.*;
import java.util.function.Function;
import org.junit.Test;

public final class BrowserDiscoveryTest {
    private static final String BROWSER = "Lcom/google/android/apps/youtube/music/mediabrowser/MusicBrowserService;";
    private static final String LOG = "isAllowlistedForMediaBrowser failed UID check. Package: %s, UID: %d";
    private static final String CONTEXT = "Landroid/content/Context;";
    private static final String STRING = "Ljava/lang/String;";
    private static final String SET = "Ljava/util/Set;";

    private static ImmutableMethodReference ref(String type, String name, List<String> params, String result) {
        return new ImmutableMethodReference(type, name, params, result);
    }
    private static ImmutableInstruction35c call(Opcode op, ImmutableMethodReference method, int... regs) {
        int[] r = Arrays.copyOf(regs, 5);
        return new ImmutableInstruction35c(op, regs.length, r[0], r[1], r[2], r[3], r[4], method);
    }
    private static ImmutableMethod method(String owner, String name, List<String> params, String result,
                                           int registers, List<com.android.tools.smali.dexlib2.iface.instruction.Instruction> code) {
        return new ImmutableMethod(owner, name, params.stream().map(p -> new ImmutableMethodParameter(p, Set.of(), null)).collect(java.util.stream.Collectors.toList()),
            result, 17, Set.of(), Set.of(), new ImmutableMethodImplementation(registers, code, List.of(), List.of()));
    }
    private static ImmutableField field(String owner, String name, String type) {
        return new ImmutableField(owner, name, type, 17, null, Set.of(), Set.of());
    }
    private static ImmutableClassDef cls(String type, List<ImmutableField> fields, List<? extends Method> methods) {
        return new ImmutableClassDef(type, 1, "Ljava/lang/Object;", List.of(), null, Set.of(), fields, methods);
    }
    private static ImmutableClassDef packageClass(String type, String name) {
        return cls(type, List.of(field(type, name, STRING)), List.of(method(type, "<init>", List.of(STRING), "V", 2,
            List.of(new ImmutableInstruction22c(Opcode.IPUT_OBJECT, 1, 0, new ImmutableFieldReference(type, name, STRING)),
                new ImmutableInstruction10x(Opcode.RETURN_VOID)))));
    }
    private static final class Fixture {
        String policy = "Lfuture/Policy;", caller = "Lfuture/Caller;", client = "Lfuture/Client;";
        Map<String, ClassDef> classes = new HashMap<>();
        List<Method> candidates = new ArrayList<>();
        Fixture(boolean wrongUid, boolean rootLinked, int eligibilityRegisters) {
            var trust = method(policy, "authorizeRenamed", List.of(caller, client, "I"), "Z", 8, List.of(
                new ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, 4, new ImmutableFieldReference(policy, "managerContext", CONTEXT)),
                call(Opcode.INVOKE_VIRTUAL, ref(CONTEXT, "getPackageManager", List.of(), "Landroid/content/pm/PackageManager;"), 0),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
                call(Opcode.INVOKE_VIRTUAL, ref("Landroid/content/pm/PackageManager;", "getPackagesForUid", List.of("I"), "[Ljava/lang/String;"), 0, wrongUid ? 6 : 7),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
                new ImmutableInstruction21c(Opcode.CONST_STRING, 1, new ImmutableStringReference(LOG)),
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), new ImmutableInstruction11x(Opcode.RETURN, 0)));
            int self = eligibilityRegisters - 2, argument = eligibilityRegisters - 1;
            var eligible = method(policy, "eligibleRenamed", List.of(client), "Z", eligibilityRegisters, List.of(
                new ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, self, new ImmutableFieldReference(policy, "allowedClients", SET)),
                call(Opcode.INVOKE_INTERFACE, ref(SET, "contains", List.of("Ljava/lang/Object;"), "Z"), 0, argument),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction11x(Opcode.RETURN, 0)));
            var browse = method(policy, "browseRenamed", List.of(client), "Z", 3, List.of(
                call(Opcode.INVOKE_VIRTUAL, ref(policy, "eligibleRenamed", List.of(client), "Z"), 1, 2),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0), new ImmutableInstruction11x(Opcode.RETURN, 0)));
            var root = method(BROWSER, "rootRenamed", List.of(STRING, "I", "Landroid/os/Bundle;"), "Lfuture/Root;", 9, List.of(
                call(Opcode.INVOKE_VIRTUAL, ref(policy, rootLinked ? "authorizeRenamed" : "wrong", List.of(caller, client, "I"), "Z"), 0, 1, 2, 7),
                call(Opcode.INVOKE_VIRTUAL, ref(policy, rootLinked ? "authorizeRenamed" : "wrong", List.of(caller, client, "I"), "Z"), 0, 1, 2, 7),
                call(Opcode.INVOKE_VIRTUAL, ref(policy, "browseRenamed", List.of(client), "Z"), 0, 2),
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)));
            candidates.add(trust);
            classes.put(policy, cls(policy, List.of(field(policy, "managerContext", CONTEXT), field(policy, "allowedClients", SET)), List.of(trust, eligible, browse)));
            classes.put(caller, packageClass(caller, "sourceName"));
            classes.put(client, packageClass(client, "clientName"));
            classes.put(BROWSER, cls(BROWSER, List.of(), List.of(root)));
        }
        Object discover() throws Exception {
            try {
                Class<?> discovery = Class.forName("patches.ytmusic.BrowserDiscovery");
                return discovery.getMethod("discover", List.class, ClassDef.class, Function.class)
                    .invoke(null, candidates, classes.get(BROWSER), (Function<String, ClassDef>)classes::get);
            } catch (ClassNotFoundException missing) {
                throw new AssertionError("Version-independent browser discovery is not implemented", missing);
            } catch (InvocationTargetException failure) {
                if (failure.getCause() instanceof Exception) throw (Exception) failure.getCause();
                throw failure;
            }
        }
    }
    @Test public void resolvesRenamedClassesMethodsAndFieldsWithoutAReleaseMap() throws Exception {
        Object layout = new Fixture(false, true, 2).discover();
        assertEquals("authorizeRenamed", ((Method)layout.getClass().getMethod("getTrust").invoke(layout)).getName());
        assertEquals("sourceName", ((com.android.tools.smali.dexlib2.iface.reference.FieldReference)layout.getClass().getMethod("getCallerPackage").invoke(layout)).getName());
        assertEquals("clientName", ((com.android.tools.smali.dexlib2.iface.reference.FieldReference)layout.getClass().getMethod("getClientPackage").invoke(layout)).getName());
    }
    @Test public void acceptsChangedOriginalRegisterAllocation() throws Exception {
        Object layout = new Fixture(false, true, 6).discover();
        assertEquals(6, ((Method)layout.getClass().getMethod("getEligible").invoke(layout)).getImplementation().getRegisterCount());
    }
    private void rejects(Fixture fixture, String expected) throws Exception {
        try { fixture.discover(); fail("Unrecognized layout was accepted"); }
        catch (IllegalStateException error) { assertTrue(error.getMessage(), error.getMessage().contains(expected)); }
    }
    @Test public void rejectsAmbiguousTrustAnchors() throws Exception {
        Fixture f = new Fixture(false, true, 2); f.candidates.add(f.candidates.get(0)); rejects(f, "trust method");
    }
    @Test public void rejectsAnUnrelatedIntegerUsedAsUid() throws Exception { rejects(new Fixture(true, true, 2), "UID parameter"); }
    @Test public void rejectsMissingBrowserLink() throws Exception { rejects(new Fixture(false, false, 2), "browser root"); }
    @Test public void rejectsMissingAnchor() throws Exception {
        Fixture f = new Fixture(false, true, 2); f.candidates.clear(); rejects(f, "trust method");
    }
    @Test public void rejectsPrivatePackageFieldsBeforeGeneratingCrossClassAccess() throws Exception {
        Fixture f = new Fixture(false, true, 2);
        ClassDef original = f.classes.get(f.caller);
        List<Method> methods = new ArrayList<>();
        original.getMethods().forEach(methods::add);
        f.classes.put(f.caller, cls(f.caller, List.of(new ImmutableField(f.caller, "sourceName", STRING,
            18, null, Set.of(), Set.of())), methods));
        rejects(f, "accessible package field");
    }

}

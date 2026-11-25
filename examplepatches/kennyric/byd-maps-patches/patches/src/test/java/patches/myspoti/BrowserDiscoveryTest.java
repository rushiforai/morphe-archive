package patches.myspoti;

import static org.junit.Assert.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import java.lang.reflect.InvocationTargetException;
import java.util.*;
import org.junit.Test;

public final class BrowserDiscoveryTest {
    private static final String OWNER = "Lapp/myspoti/host/android/PlaybackService;";
    private static final String STRING = "Ljava/lang/String;";
    private static final String PM = "Landroid/content/pm/PackageManager;";
    private static ImmutableInstruction35c call(String owner, String name, List<String> params, String result) {
        return new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 0, 1, 0, 0, 0,
            new ImmutableMethodReference(owner, name, params, result));
    }
    private static ImmutableMethod method(String name, List<String> params, String result,
            com.android.tools.smali.dexlib2.iface.instruction.Instruction... instructions) {
        return new ImmutableMethod(OWNER, name, params.stream().map(p -> new ImmutableMethodParameter(p, Set.of(), null)).collect(java.util.stream.Collectors.toList()),
            result, 17, Set.of(), Set.of(), new ImmutableMethodImplementation(5, List.of(instructions), List.of(), List.of()));
    }
    private static List<Method> fixture(boolean callerUid, boolean searchUsesCaller) {
        var uid = call(PM, "getPackagesForUid", List.of("I"), "[Ljava/lang/String;");
        var predicate = call(OWNER, "renamedPolicy", List.of(STRING), "Z");
        var caller = call(OWNER, "renamedCaller", List.of(), "Z");
        return new ArrayList<>(List.of(
            method("renamedRoot", List.of("I", STRING), "Lfuture/Root;", uid, predicate,
                new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference("media browser: empty root for "))),
            method("renamedPolicy", List.of(STRING), "Z",
                call(PM, "getApplicationInfo", List.of(STRING, "I"), "Landroid/content/pm/ApplicationInfo;"),
                call("Ljava/util/Set;", "contains", List.of("Ljava/lang/Object;"), "Z")),
            method("renamedCaller", List.of(), "Z", callerUid ? uid : caller, predicate),
            method("childrenRenamed", List.of(STRING, "Lfuture/Result;"), "V", caller),
            method("searchRenamed", List.of(STRING, "Landroid/os/Bundle;", "Lfuture/Result;"), "V",
                searchUsesCaller ? caller : predicate)));
    }
    private static Method discover(List<Method> methods) throws Exception {
        ClassDef service = new ImmutableClassDef(OWNER, 1, "Lfuture/BrowserService;", List.of(), null, Set.of(), List.of(), methods);
        try {
            return (Method) Class.forName("patches.myspoti.BrowserDiscovery").getMethod("discover", ClassDef.class).invoke(null, service);
        } catch (ClassNotFoundException missing) {
            throw new AssertionError("Shared Myspoti browser permission discovery is missing", missing);
        } catch (InvocationTargetException failure) {
            if (failure.getCause() instanceof Exception) throw (Exception) failure.getCause();
            throw failure;
        }
    }
    @Test public void findsSharedPolicyWithoutObfuscatedNames() throws Exception {
        assertEquals("renamedPolicy", discover(fixture(true, true)).getName());
    }
    @Test public void acceptsSearchInlinedIntoCompatDispatch() throws Exception {
        var methods = fixture(true, true); methods.remove(4);
        ClassDef service = new ImmutableClassDef(OWNER, 1, "Lfuture/BrowserService;", List.of(), null, Set.of(), List.of(), methods);
        Method dispatch = method("run", List.of(), "V", call(OWNER, "renamedCaller", List.of(), "Z"),
            new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference(
                "onSearch must call detach() or sendResult() before returning for query=")));
        Method result = (Method) Class.forName("patches.myspoti.BrowserDiscovery").getMethod("discover", ClassDef.class, List.class)
            .invoke(null, service, List.of(dispatch));
        assertEquals("renamedPolicy", result.getName());
    }
    private static void rejects(List<Method> methods) throws Exception {
        try { discover(methods); fail("Unsafe or ambiguous browser layout accepted"); }
        catch (IllegalStateException expected) { assertTrue(expected.getMessage().contains("Myspoti")); }
    }
    @Test public void rejectsChildrenWithoutUidOwnershipCheck() throws Exception { rejects(fixture(false, true)); }
    @Test public void rejectsSearchWithADifferentPermissionPath() throws Exception { rejects(fixture(true, false)); }
    @Test public void rejectsMissingRootDiagnostic() throws Exception {
        var methods = fixture(true, true); methods.remove(0); rejects(methods);
    }
    @Test public void rejectsAmbiguousPermissionPredicates() throws Exception {
        var methods = fixture(true, true);
        methods.add(method("otherPolicy", List.of(STRING), "Z",
            call(PM, "getApplicationInfo", List.of(STRING, "I"), "Landroid/content/pm/ApplicationInfo;"),
            call("Ljava/util/Set;", "contains", List.of("Ljava/lang/Object;"), "Z")));
        methods.set(0, method("renamedRoot", List.of("I", STRING), "Lfuture/Root;",
            call(PM, "getPackagesForUid", List.of("I"), "[Ljava/lang/String;"),
            call(OWNER, "renamedPolicy", List.of(STRING), "Z"), call(OWNER, "otherPolicy", List.of(STRING), "Z"),
            new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference("media browser: empty root for "))));
        rejects(methods);
    }
}

package io.github.emotionbug.patches.adot.privacy;

import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.MethodImplementationBuilder;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.MethodImplementation;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import io.github.emotionbug.patches.adot.dex.MethodPatch;
import java.util.*;
import java.util.regex.Pattern;
import org.junit.Test;
import static org.junit.Assert.*;

/** Executes transformed DEX fixture request builders, not source-string assertions.
 * This bounded interpreter is not an ART verifier or an execution of the private APK.
 */
public class GalaxyDeviceProfilePatchTest {
    private static final String LOGIN = "Lsy1;->a(Lsy1;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V";
    private static final String REFRESH = "Lgz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;";
    private static final String TRANSPORT = "Lcv5;->a(Le52;)Le52;";
    private static final String BUILD = "Landroid/os/Build;";
    private static final Map<String, Object> SOURCES = Map.ofEntries(
        Map.entry(BUILD + "MODEL", "Actual Phone"), Map.entry(BUILD + "MANUFACTURER", "Actual Vendor"),
        Map.entry(BUILD + "BRAND", "Actual Brand"), Map.entry(BUILD + "HARDWARE", "actual-hardware"),
        Map.entry(BUILD + "DEVICE", "actual-device"), Map.entry(BUILD + "PRODUCT", "actual-product"),
        Map.entry(BUILD + "ID", "actual-os-build"), Map.entry(BUILD + "FINGERPRINT", "actual/stock/fingerprint"),
        Map.entry("Landroid/os/Build$VERSION;RELEASE", "17"),
        Map.entry("Lfixture/Identity;androidId", "real-android-id"),
        Map.entry("Lfixture/Identity;adId", "real-ad-id"),
        Map.entry("Lfixture/Identity;token", "real-token"));

    @Test public void loginAndRefreshPropagateProfileAndPreserveIdsOsAndBranches() {
        checkAccount(LOGIN, 49, 10, 51, 9);
        checkAccount(REFRESH, 89, 6, 91, 5);
    }

    private static void checkAccount(String id, int manufacturerIndex, int manufacturerRegister,
                                     int modelIndex, int modelRegister) {
        var fixture = new Fixture();
        fixture.branch();
        fixture.pad(manufacturerIndex);
        fixture.source(BUILD, "MANUFACTURER", manufacturerRegister);
        fixture.pad(modelIndex);
        fixture.source(BUILD, "MODEL", modelRegister);
        fixture.put("device_manufacturer", manufacturerRegister);
        fixture.put("device_model", modelRegister);
        fixture.identities();
        fixture.finish();
        var original = method(id, fixture.body());
        var patched = recipe(id).implementation(original);
        var before = execute(original.getImplementation(), true);
        var after = execute(patched, true);
        assertEquals("Actual Phone", before.get("device_model"));
        assertEquals("SM-S911N", after.get("device_model"));
        assertEquals("samsung", after.get("device_manufacturer"));
        assertIdentities(after);
        before.remove("device_model"); before.remove("device_manufacturer");
        var untouched = new LinkedHashMap<>(after);
        untouched.remove("device_model"); untouched.remove("device_manufacturer");
        assertEquals(before, untouched);
        assertEquals(Map.of("route", "unrelated"), execute(patched, false));
        assertEquals(execute(original.getImplementation(), false), execute(patched, false));
    }

    @Test public void transportChangesOnlySelectedIdentityAndRetainsCompositeResiduals() {
        var fixture = new Fixture();
        fixture.branch();
        fixture.pad(16);
        for (String field : List.of("MODEL", "HARDWARE", "DEVICE", "PRODUCT", "ID", "MANUFACTURER", "FINGERPRINT")) {
            fixture.source(BUILD, field, 2);
            fixture.put(field, 2);
        }
        fixture.identities();
        fixture.finish();
        var original = method(TRANSPORT, fixture.body());
        var patched = recipe(TRANSPORT).implementation(original);
        var before = execute(original.getImplementation(), true);
        var after = execute(patched, true);
        assertEquals("SM-S911N", after.get("MODEL"));
        assertEquals("samsung", after.get("MANUFACTURER"));
        for (String field : List.of("HARDWARE", "DEVICE", "PRODUCT", "ID", "FINGERPRINT")) {
            assertEquals(before.get(field), after.get(field));
        }
        assertIdentities(after);
        assertEquals(execute(original.getImplementation(), false), execute(patched, false));
    }

    @Test public void appsFlyerBrandAndModelPropagateWithoutChangingDeviceAndProduct() {
        String id = "Lcom/appsflyer/internal/AFg1oSDK;->AFLoggerLogLevel(Ljava/util/Map;)V";
        var fixture = new Fixture();
        fixture.branch();
        fixture.pad(27);
        for (String field : List.of("BRAND", "DEVICE", "PRODUCT")) {
            fixture.source(BUILD, field, 1);
            // Use key register 3 because this collector's source register is v1.
            fixture.putWithKey(field, 1, 3);
        }
        fixture.pad(41);
        fixture.source(BUILD, "MODEL", 1); fixture.putWithKey("MODEL", 1, 3);
        fixture.source(BUILD, "TYPE", 1); fixture.putWithKey("TYPE", 1, 3);
        fixture.identities(); fixture.finish();
        var sources = new HashMap<>(SOURCES); sources.put(BUILD + "TYPE", "userdebug");
        var patched = recipe(id).implementation(method(id, fixture.body()));
        var result = execute(patched, true, sources);
        assertEquals("samsung", result.get("BRAND"));
        assertEquals("SM-S911N", result.get("MODEL"));
        assertEquals("actual-device", result.get("DEVICE"));
        assertEquals("actual-product", result.get("PRODUCT"));
        assertEquals("userdebug", result.get("TYPE"));
        assertIdentities(result);
    }

    @Test public void accountUserAgentCompositeUsesProfileButRealAndroidRelease() {
        String id = "Le60;->invoke()Ljava/lang/Object;";
        var fixture = new Fixture();
        fixture.branch(); fixture.pad(248);
        fixture.source(BUILD, "MANUFACTURER", 12);
        fixture.source(BUILD, "MODEL", 7);
        fixture.source("Landroid/os/Build$VERSION;", "RELEASE", 2);
        fixture.add(new BuilderInstruction21c(Opcode.NEW_INSTANCE, 4, new ImmutableTypeReference("Ljava/lang/StringBuilder;")));
        fixture.add(new BuilderInstruction35c(Opcode.INVOKE_DIRECT, 1, 4, 0, 0, 0, 0,
            new ImmutableMethodReference("Ljava/lang/StringBuilder;", "<init>", List.of(), "V")));
        for (Object part : List.of("ApolloSDK-client/14.4.0 (Android ", 2, "; ", 12, " ", 7, ")")) {
            int register;
            if (part instanceof Integer value) register = value;
            else {
                register = 3;
                fixture.add(new BuilderInstruction21c(Opcode.CONST_STRING, register, new ImmutableStringReference((String) part)));
            }
            fixture.add(new BuilderInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 4, register, 0, 0, 0,
                new ImmutableMethodReference("Ljava/lang/StringBuilder;", "append", List.of("Ljava/lang/String;"), "Ljava/lang/StringBuilder;")));
        }
        fixture.add(new BuilderInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 4, 0, 0, 0, 0,
            new ImmutableMethodReference("Ljava/lang/StringBuilder;", "toString", List.of(), "Ljava/lang/String;")));
        fixture.add(new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 2));
        fixture.put("User-Agent", 2); fixture.identities(); fixture.finish();
        var original = method(id, fixture.body());
        var after = execute(recipe(id).implementation(original), true);
        assertEquals("ApolloSDK-client/14.4.0 (Android 17; samsung SM-S911N)", after.get("User-Agent"));
        assertEquals("ApolloSDK-client/14.4.0 (Android 17; Actual Vendor Actual Phone)",
            execute(original.getImplementation(), true).get("User-Agent"));
        assertIdentities(after);
    }

    @Test public void unexpectedReadRegisterFieldOrAdditionalBuildReadFailsClosed() {
        String id = "Lgoo;->d()Ljava/util/HashMap;";
        for (String field : List.of("MANUFACTURER", "MODEL")) {
            var fixture = new Fixture(); fixture.pad(54);
            fixture.source(BUILD, field, field.equals("MODEL") ? 2 : 3);
            fixture.finish();
            assertThrows(IllegalStateException.class, () -> recipe(id).implementation(method(id, fixture.body())));
        }
        var fixture = new Fixture(); fixture.pad(54); fixture.source(BUILD, "MODEL", 3);
        fixture.source(BUILD, "MANUFACTURER", 2); fixture.finish();
        assertThrows(IllegalStateException.class, () -> recipe(id).implementation(method(id, fixture.body())));
        var missing = new Fixture(); missing.finish();
        assertThrows(IllegalStateException.class, () -> recipe(id).implementation(method(id, missing.body())));
    }

    private static void assertIdentities(Map<String, Object> result) {
        assertEquals("17", result.get("os"));
        assertEquals("real-android-id", result.get("androidId"));
        assertEquals("real-ad-id", result.get("adId"));
        assertEquals("real-token", result.get("token"));
    }

    private static MethodPatch recipe(String id) {
        return GalaxyDeviceProfilePatch.create().stream().filter(p -> p.methods().contains(id)).findFirst().orElseThrow();
    }

    private static Method method(String id, MethodImplementation body) {
        int arrow = id.indexOf("->"), start = id.indexOf('('), end = id.indexOf(')');
        var parameters = new ArrayList<ImmutableMethodParameter>();
        var matcher = Pattern.compile("\\[*(?:L[^;]+;|[ZBCSIFJD])").matcher(id.substring(start + 1, end));
        while (matcher.find()) parameters.add(new ImmutableMethodParameter(matcher.group(), null, null));
        return new ImmutableMethod(id.substring(0, arrow), id.substring(arrow + 2, start), parameters,
            id.substring(end + 1), AccessFlags.PUBLIC.getValue() | AccessFlags.STATIC.getValue(), null, null, body);
    }

    private static final class Fixture {
        private final MethodImplementationBuilder builder = new MethodImplementationBuilder(22);
        private int count;
        void add(com.android.tools.smali.dexlib2.builder.BuilderInstruction instruction) { builder.addInstruction(instruction); count++; }
        void branch() { add(new BuilderInstruction21t(Opcode.IF_EQZ, 14, builder.getLabel("fallback"))); }
        void pad(int index) { while (count < index) add(new BuilderInstruction10x(Opcode.NOP)); assertEquals(index, count); }
        void source(String owner, String name, int register) {
            add(new BuilderInstruction21c(Opcode.SGET_OBJECT, register, new ImmutableFieldReference(owner, name, "Ljava/lang/String;")));
        }
        void put(String key, int register) { putWithKey(key, register, 1); }
        void putWithKey(String key, int register, int keyRegister) {
            add(new BuilderInstruction21c(Opcode.CONST_STRING, keyRegister, new ImmutableStringReference(key)));
            add(new BuilderInstruction35c(Opcode.INVOKE_INTERFACE, 3, 0, keyRegister, register, 0, 0,
                new ImmutableMethodReference("Ljava/util/Map;", "put", List.of("Ljava/lang/Object;", "Ljava/lang/Object;"), "Ljava/lang/Object;")));
        }
        void identities() {
            source("Landroid/os/Build$VERSION;", "RELEASE", 2); put("os", 2);
            for (String name : List.of("androidId", "adId", "token")) { source("Lfixture/Identity;", name, 2); put(name, 2); }
        }
        void finish() {
            add(new BuilderInstruction11x(Opcode.RETURN_OBJECT, 0));
            builder.addLabel("fallback");
            add(new BuilderInstruction21c(Opcode.CONST_STRING, 2, new ImmutableStringReference("unrelated")));
            put("route", 2); add(new BuilderInstruction11x(Opcode.RETURN_OBJECT, 0));
        }
        MethodImplementation body() { return builder.getMethodImplementation(); }
    }

    private static Map<String, Object> execute(MethodImplementation body, boolean enabled) {
        return execute(body, enabled, SOURCES);
    }

    @SuppressWarnings("unchecked")
    private static Map<String, Object> execute(MethodImplementation body, boolean enabled, Map<String, Object> sources) {
        // Resolve code-unit branch targets after jumbo replacements, not instruction indices.
        var instructions = new HashMap<Integer, Instruction>();
        int offset = 0;
        for (var instruction : body.getInstructions()) { instructions.put(offset, instruction); offset += instruction.getCodeUnits(); }
        Object[] registers = new Object[body.getRegisterCount()];
        registers[0] = new LinkedHashMap<String, Object>(); registers[14] = enabled ? 1 : 0;
        int pc = 0;
        Object result = null;
        for (int steps = 0; steps < 1000; steps++) {
            var instruction = Objects.requireNonNull(instructions.get(pc));
            int next = pc + instruction.getCodeUnits();
            switch (instruction.getOpcode()) {
                case NOP -> { }
                case SGET_OBJECT -> {
                    var field = (FieldReference) ((ReferenceInstruction) instruction).getReference();
                    String key = field.getDefiningClass() + field.getName();
                    if (!sources.containsKey(key)) throw new AssertionError("Unmodeled source " + key);
                    registers[((OneRegisterInstruction) instruction).getRegisterA()] = sources.get(key);
                }
                case CONST_STRING, CONST_STRING_JUMBO -> registers[((OneRegisterInstruction) instruction).getRegisterA()] =
                    ((StringReference) ((ReferenceInstruction) instruction).getReference()).getString();
                case NEW_INSTANCE -> {
                    var type = (TypeReference) ((ReferenceInstruction) instruction).getReference();
                    if (!type.getType().equals("Ljava/lang/StringBuilder;")) throw new AssertionError(type);
                    registers[((OneRegisterInstruction) instruction).getRegisterA()] = new StringBuilder();
                }
                case INVOKE_DIRECT, INVOKE_VIRTUAL -> {
                    var call = (FiveRegisterInstruction) instruction;
                    var reference = (MethodReference) ((ReferenceInstruction) instruction).getReference();
                    if (!reference.getDefiningClass().equals("Ljava/lang/StringBuilder;"))
                        throw new AssertionError("Unmodeled call " + reference);
                    var builder = (StringBuilder) registers[call.getRegisterC()];
                    switch (reference.getName()) {
                        case "<init>" -> { }
                        case "append" -> result = builder.append((String) registers[call.getRegisterD()]);
                        case "toString" -> result = builder.toString();
                        default -> throw new AssertionError("Unmodeled call " + reference);
                    }
                }
                case MOVE_RESULT_OBJECT -> registers[((OneRegisterInstruction) instruction).getRegisterA()] = result;
                case IF_EQZ -> {
                    if (Objects.equals(registers[((OneRegisterInstruction) instruction).getRegisterA()], 0))
                        next = pc + ((OffsetInstruction) instruction).getCodeOffset();
                }
                case INVOKE_INTERFACE -> {
                    var call = (FiveRegisterInstruction) instruction;
                    var reference = (MethodReference) ((ReferenceInstruction) instruction).getReference();
                    if (!reference.getDefiningClass().equals("Ljava/util/Map;") || !reference.getName().equals("put"))
                        throw new AssertionError("Unmodeled call " + reference);
                    ((Map<Object, Object>) registers[call.getRegisterC()]).put(registers[call.getRegisterD()], registers[call.getRegisterE()]);
                }
                case RETURN_OBJECT -> { return (Map<String, Object>) registers[((OneRegisterInstruction) instruction).getRegisterA()]; }
                default -> throw new AssertionError("Unmodeled opcode " + instruction.getOpcode());
            }
            pc = next;
        }
        throw new AssertionError("Request fixture did not terminate");
    }
}

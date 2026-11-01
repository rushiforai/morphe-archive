import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef;
import com.android.tools.smali.dexlib2.immutable.ImmutableExceptionHandler;
import com.android.tools.smali.dexlib2.immutable.ImmutableField;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter;
import com.android.tools.smali.dexlib2.immutable.ImmutableTryBlock;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Reusable authenticated account scaffold for independently generated feature contracts. */
public final class AccountDexFixture {
    static final String BASE = "Lapp/hushtumblr/extension/tumblr/";
    static final String USER = "Lcom/tumblr/UserInfo;", MODEL = "Lcom/tumblr/rumblr/model/UserInfo;";
    static final String RESPONSE = "Lcom/tumblr/rumblr/response/UserInfoResponse;", AGE = "Lcom/tumblr/rumblr/model/AgeVerification;";
    static final String ROOT = BASE + "rootmute/RootPostMutes;", UUID = BASE + "rootmute/HushAccountIdentity;";
    static final String OBJECT = "Ljava/lang/Object;", STRING = "Ljava/lang/String;";

    static ImmutableMethodReference ref(String owner, String name, String result, String... parameters) {
        return new ImmutableMethodReference(owner, name, Arrays.asList(parameters), result);
    }
    static Instruction call(Opcode opcode, String owner, String name, String result, int[] registers, String... parameters) {
        int[] words = new int[5]; System.arraycopy(registers, 0, words, 0, registers.length);
        return new ImmutableInstruction35c(opcode, registers.length, words[0], words[1], words[2], words[3], words[4], ref(owner, name, result, parameters));
    }
    static Instruction hook(String name, int... registers) {
        return call(Opcode.INVOKE_STATIC, ROOT, name, "V", registers, registers.length == 0 ? new String[0] : new String[]{OBJECT});
    }
    static Instruction rangeHook(String name, int register) {
        return new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, register, 1, ref(ROOT, name, "V", OBJECT));
    }
    static Instruction end() { return new ImmutableInstruction10x(Opcode.RETURN_VOID); }
    static Instruction integer(int register, int value) { return new ImmutableInstruction11n(Opcode.CONST_4, register, value); }
    static Instruction result(int register, boolean object) { return new ImmutableInstruction11x(object ? Opcode.MOVE_RESULT_OBJECT : Opcode.MOVE_RESULT, register); }
    static Instruction returns(int register, boolean object) { return new ImmutableInstruction11x(object ? Opcode.RETURN_OBJECT : Opcode.RETURN, register); }
    static Instruction field(Opcode opcode, int value, int receiver, String owner, String name, String type) {
        return new ImmutableInstruction22c(opcode, value, receiver, new ImmutableFieldReference(owner, name, type));
    }
    static Instruction type(Opcode opcode, int register, String type) { return new ImmutableInstruction21c(opcode, register, new ImmutableTypeReference(type)); }
    static Method method(String owner, String name, String result, int flags, int registers, List<Instruction> body, String... parameters) {
        return method(owner, name, result, flags, registers, body, List.of(), parameters);
    }
    static Method method(String owner, String name, String result, int flags, int registers, List<Instruction> body,
                         List<ImmutableTryBlock> tries, String... parameters) {
        List<ImmutableMethodParameter> args = Arrays.stream(parameters).map(p -> new ImmutableMethodParameter(p, Set.of(), null)).toList();
        return new ImmutableMethod(owner, name, args, result, flags, Set.of(), Set.of(),
                body == null ? null : new ImmutableMethodImplementation(registers, body, tries, List.of()));
    }
    static ImmutableField immutableField(String owner, String name, String type) {
        return new ImmutableField(owner, name, type, AccessFlags.PRIVATE.getValue() | AccessFlags.FINAL.getValue(), null, Set.of(), Set.of());
    }
    static ClassDef clazz(String owner, List<String> interfaces, List<ImmutableField> fields, List<Method> methods) {
        return new ImmutableClassDef(owner, AccessFlags.PUBLIC.getValue(), OBJECT, interfaces, null, Set.of(), fields, methods);
    }
    static ClassDef contract(String owner, String[] names, String[] results, String[][] parameters) {
        List<Method> methods = new ArrayList<>();
        for (int i = 0; i < names.length; i++) methods.add(method(owner, names[i], results[i],
                AccessFlags.PUBLIC.getValue() | AccessFlags.ABSTRACT.getValue(), 0, null, parameters[i]));
        return new ImmutableClassDef(owner, AccessFlags.PUBLIC.getValue() | AccessFlags.INTERFACE.getValue() | AccessFlags.ABSTRACT.getValue(),
                OBJECT, List.of(), null, Set.of(), List.of(), methods);
    }
    static List<Instruction> nops(int count) {
        List<Instruction> body = new ArrayList<>();
        for (int i = 0; i < count; i++) body.add(new ImmutableInstruction10x(Opcode.NOP));
        return body;
    }
    static List<ImmutableTryBlock> caught(List<Instruction> body, int start, int end, int handler) {
        int[] address = new int[body.size() + 1];
        for (int i = 0; i < body.size(); i++) address[i + 1] = address[i] + body.get(i).getCodeUnits();
        return List.of(new ImmutableTryBlock(address[start], address[end] - address[start],
                List.of(new ImmutableExceptionHandler(null, address[handler]))));
    }

    static void add(Map<String, ClassDef> classes, boolean patched) {
        int pub = AccessFlags.PUBLIC.getValue(), ctor = pub | AccessFlags.CONSTRUCTOR.getValue();
        List<Instruction> persist = nops(73);
        persist.set(50, field(Opcode.IGET_OBJECT, 0, 1, USER, "A", STRING));
        persist.set(51, call(Opcode.INVOKE_STATIC, USER, "y0", "V", new int[]{0}, STRING));
        persist.set(70, field(Opcode.IGET_OBJECT, 1, 1, USER, "J", AGE));
        persist.set(71, call(Opcode.INVOKE_STATIC, USER, "R", "V", new int[]{1}, AGE));
        persist.set(72, end());
        if (patched) { persist.add(72, hook("commitAccount")); persist.add(0, rangeHook("beginAccountChange", 1)); }
        List<Instruction> fresh = nops(127);
        fresh.set(0, call(Opcode.INVOKE_DIRECT, OBJECT, "<init>", "V", new int[]{2}));
        fresh.set(1, call(Opcode.INVOKE_VIRTUAL, RESPONSE, "getUserInfo", MODEL, new int[]{3})); fresh.set(2, result(0, true));
        fresh.set(6, call(Opcode.INVOKE_VIRTUAL, RESPONSE, "getUserInfo", MODEL, new int[]{3})); fresh.set(7, result(3, true));
        fresh.set(39, call(Opcode.INVOKE_VIRTUAL, MODEL, "getBlogs", "Ljava/util/List;", new int[]{3})); fresh.set(40, result(0, true));
        fresh.set(41, field(Opcode.IPUT_OBJECT, 0, 2, USER, "k", "Ljava/util/List;"));
        fresh.set(42, call(Opcode.INVOKE_VIRTUAL, MODEL, "getCanModifySafeMode", "Z", new int[]{3})); fresh.set(43, result(0, false));
        fresh.set(44, field(Opcode.IPUT_BOOLEAN, 0, 2, USER, "l", "Z"));
        fresh.set(87, call(Opcode.INVOKE_VIRTUAL, MODEL, "getAge", "Ljava/lang/Integer;", new int[]{3})); fresh.set(88, result(0, true));
        fresh.set(89, new ImmutableInstruction21t(Opcode.IF_NEZ, 0, 4)); fresh.set(90, integer(0, 0));
        fresh.set(91, new ImmutableInstruction10t(Opcode.GOTO, 9));
        fresh.set(92, call(Opcode.INVOKE_VIRTUAL, MODEL, "getAge", "Ljava/lang/Integer;", new int[]{3})); fresh.set(93, result(0, true));
        fresh.set(94, call(Opcode.INVOKE_VIRTUAL, "Ljava/lang/Integer;", "intValue", "I", new int[]{0})); fresh.set(95, result(0, false));
        fresh.set(96, field(Opcode.IPUT, 0, 2, USER, "C", "I"));
        fresh.set(103, call(Opcode.INVOKE_VIRTUAL, MODEL, "getUserUuid", STRING, new int[]{3})); fresh.set(104, result(0, true));
        fresh.set(105, field(Opcode.IPUT_OBJECT, 0, 2, USER, "A", STRING));
        fresh.set(123, call(Opcode.INVOKE_VIRTUAL, MODEL, "getAgeVerification", AGE, new int[]{3})); fresh.set(124, result(3, true));
        fresh.set(125, field(Opcode.IPUT_OBJECT, 3, 2, USER, "J", AGE)); fresh.set(126, end());
        List<Method> user = new ArrayList<>(List.of(method(USER, "<init>", "V", ctor, 4, fresh, RESPONSE),
                method(USER, "M", "V", pub, 2, persist), method(USER, "y0", "V", pub | AccessFlags.STATIC.getValue(), 2,
                        List.of(new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference("user_uuid")),
                                call(Opcode.INVOKE_STATIC, "Lcom/tumblr/Remember;", "o", "Lcom/tumblr/Remember;", new int[]{0, 1}, STRING, STRING), end()), STRING),
                method(USER, "R", "V", pub | AccessFlags.STATIC.getValue(), 1, List.of(end()), AGE)));
        if (patched) user.add(method(USER, "hushAccountId", STRING, pub, 2,
                List.of(field(Opcode.IGET_OBJECT, 0, 1, USER, "A", STRING), returns(0, true))));
        classes.put(USER, clazz(USER, patched ? List.of(UUID) : List.of(), List.of(immutableField(USER, "A", STRING),
                immutableField(USER, "C", "I"), immutableField(USER, "l", "Z"), immutableField(USER, "J", AGE), immutableField(USER, "E", STRING),
                immutableField(USER, "k", "Ljava/util/List;")), user));
        List<Instruction> made = new ArrayList<>(List.of(call(Opcode.INVOKE_DIRECT, OBJECT, "<init>", "V", new int[]{0}),
                field(Opcode.IPUT_OBJECT, 1, 0, "Lvu5;", "a", "Lou5;"), end()));
        if (patched) made.add(2, rangeHook("requestCreated", 0));
        List<Instruction> accept = new ArrayList<>(List.of(field(Opcode.IGET_OBJECT, 0, 0, "Lvu5;", "a", "Lou5;"),
                type(Opcode.CHECK_CAST, 1, RESPONSE), call(Opcode.INVOKE_STATIC, "Lou5;", "v", "V", new int[]{0, 1}, "Lou5;", RESPONSE), end()));
        if (patched) {
            accept.add(3, hook("requestExited")); accept.add(0, rangeHook("requestEntered", 0));
            accept.add(new ImmutableInstruction11x(Opcode.MOVE_EXCEPTION, 1)); accept.add(hook("requestExited"));
            accept.add(new ImmutableInstruction11x(Opcode.THROW, 1));
        }
        classes.put("Lvu5;", clazz("Lvu5;", List.of(), List.of(immutableField("Lvu5;", "a", "Lou5;")), List.of(
                method("Lvu5;", "<init>", "V", ctor, 2, made, "Lou5;"),
                method("Lvu5;", "accept", "V", pub, 2, accept, patched ? caught(accept, 1, 4, 6) : List.of(), OBJECT))));
        classes.put("Lou5;", clazz("Lou5;", List.of(), List.of(immutableField("Lou5;", "e", "Lcom/tumblr/rumblr/TumblrService;")), List.of(
                method("Lou5;", "f", "Lsm4;", pub, 3,
                        List.of(field(Opcode.IGET_OBJECT, 0, 2, "Lou5;", "e", "Lcom/tumblr/rumblr/TumblrService;"),
                                call(Opcode.INVOKE_STATIC, "Lhoj;", "v", "Lhoj;", new int[]{0}, OBJECT), result(0, true), type(Opcode.NEW_INSTANCE, 1, "Lvu5;"),
                                call(Opcode.INVOKE_DIRECT, "Lvu5;", "<init>", "V", new int[]{1, 2}, "Lou5;"),
                                call(Opcode.INVOKE_VIRTUAL, "Lhoj;", "l", "Lhoj;", new int[]{0, 1}, "Lg05;"), result(0, true),
                                call(Opcode.INVOKE_VIRTUAL, "Lhoj;", "u", "Lsm4;", new int[]{0}), result(0, true), returns(0, true))),
                method("Lou5;", "v", "V", pub | AccessFlags.STATIC.getValue(), 2,
                        List.of(call(Opcode.INVOKE_DIRECT, "Lou5;", "D", "V", new int[]{0, 1}, RESPONSE), end()), "Lou5;", RESPONSE),
                method("Lou5;", "D", "V", AccessFlags.PRIVATE.getValue(), 3,
                        List.of(type(Opcode.NEW_INSTANCE, 0, USER), call(Opcode.INVOKE_DIRECT, USER, "<init>", "V", new int[]{0, 2}, RESPONSE),
                                call(Opcode.INVOKE_VIRTUAL, USER, "M", "V", new int[]{0}), end()), RESPONSE))));
        List<Instruction> replace = new ArrayList<>(List.of(new ImmutableInstruction11x(Opcode.MONITOR_ENTER, 2),
                new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference("AuthToken2")),
                call(Opcode.INVOKE_STATIC, "Lcom/tumblr/Remember;", "o", "Lcom/tumblr/Remember;", new int[]{0, 3}, STRING, STRING),
                new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference("AuthTokenSecret2")),
                call(Opcode.INVOKE_STATIC, "Lcom/tumblr/Remember;", "o", "Lcom/tumblr/Remember;", new int[]{0, 4}, STRING, STRING),
                new ImmutableInstruction11x(Opcode.MONITOR_EXIT, 2), end(),
                new ImmutableInstruction11x(Opcode.MOVE_EXCEPTION, 0), new ImmutableInstruction11x(Opcode.MONITOR_EXIT, 2), new ImmutableInstruction11x(Opcode.THROW, 0)));
        if (patched) { replace.add(5, hook("credentialsChanged")); replace.add(1, hook("credentialsChanging")); }
        List<Instruction> reset = new ArrayList<>(List.of(new ImmutableInstruction11x(Opcode.MONITOR_ENTER, 2),
                call(Opcode.INVOKE_DIRECT, "Lnw0;", "a", "V", new int[]{2}), new ImmutableInstruction11x(Opcode.MONITOR_EXIT, 2), end(),
                new ImmutableInstruction11x(Opcode.MOVE_EXCEPTION, 0), new ImmutableInstruction11x(Opcode.MONITOR_EXIT, 2), new ImmutableInstruction11x(Opcode.THROW, 0)));
        if (patched) reset.add(1, hook("logout"));
        classes.put("Lnw0;", clazz("Lnw0;", List.of(), List.of(), List.of(
                method("Lnw0;", "r", "V", pub | AccessFlags.DECLARED_SYNCHRONIZED.getValue(), 5, replace,
                        caught(replace, 1, patched ? 7 : 5, patched ? 9 : 7), STRING, STRING),
                method("Lnw0;", "p", "V", pub | AccessFlags.DECLARED_SYNCHRONIZED.getValue(), 4, reset,
                        caught(reset, 1, patched ? 3 : 2, patched ? 5 : 4), "Llsm;"),
                method("Lnw0;", "a", "V", AccessFlags.PRIVATE.getValue(), 1, List.of(end())))));
        List<Instruction> logout = new ArrayList<>(List.of(integer(0, 0), call(Opcode.INVOKE_STATIC, "Lcom/tumblr/Remember;", "b", "V", new int[]{}), returns(0, true)));
        if (patched) logout.add(0, hook("logout"));
        classes.put("Lo4c;", clazz("Lo4c;", List.of(), List.of(), List.of(method("Lo4c;", "i", OBJECT, AccessFlags.PRIVATE.getValue(), 13,
                logout, "Landroid/content/Context;", "Z", "Lox5;"))));
        if (!patched) return;
        classes.put(UUID, contract(UUID, new String[]{"hushAccountId"}, new String[]{STRING}, new String[][]{new String[0]}));
        List<Method> hooks = new ArrayList<>();
        for (String name : List.of("commitAccount", "logout", "credentialsChanging", "credentialsChanged", "requestExited"))
            hooks.add(method(ROOT, name, "V", pub | AccessFlags.STATIC.getValue(), 0, List.of(end())));
        for (String name : List.of("beginAccountChange", "requestCreated", "requestEntered"))
            hooks.add(method(ROOT, name, "V", pub | AccessFlags.STATIC.getValue(), 1, List.of(end()), OBJECT));
        classes.put(ROOT, clazz(ROOT, List.of(), List.of(), hooks));
    }
}

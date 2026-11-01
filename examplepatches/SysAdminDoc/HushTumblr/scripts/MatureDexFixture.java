import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.AnnotationVisibility;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Standalone account-scoped mature-cover good and deliberately refused outputs. */
public final class MatureDexFixture {
    private static final String BASE = AccountDexFixture.BASE, OBJECT = AccountDexFixture.OBJECT, STRING = AccountDexFixture.STRING;
    private static final String USER = AccountDexFixture.USER, AGE = AccountDexFixture.AGE, MODEL = AccountDexFixture.MODEL;
    private static final String HELPER = BASE + "mature/AllowedMatureContent;", REQUESTER = BASE + "mature/NativeMatureService;";
    private static final String CONTINUATION = BASE + "mature/NativeMatureContinuation;", SERVICE = "Lcom/tumblr/communitylabel/data/settings/CommunityLabelService;";
    private static final String REPOSITORY = "Lcom/tumblr/communitylabel/data/settings/a;", PERMISSION = "Lcom/tumblr/communitylabel/data/settings/CommunityLabelUserConfigResponse;";
    private static final String API = "Lcom/tumblr/rumblr/response/ApiResponse;", META = "Lcom/tumblr/rumblr/response/Metadata;";
    private static final String BOOLEAN = "Ljava/lang/Boolean;", UTILS = "Lapp/hushtumblr/extension/shared/Utils;";
    private static final int PUBLIC = AccessFlags.PUBLIC.getValue(), STATIC = AccessFlags.STATIC.getValue();
    private static Instruction call(Opcode op, String owner, String name, String result, int[] regs, String... args) { return AccountDexFixture.call(op, owner, name, result, regs, args); }
    private static Instruction field(Opcode op, int value, int receiver, String owner, String name, String type) { return AccountDexFixture.field(op, value, receiver, owner, name, type); }
    private static Instruction type(Opcode op, int reg, String owner) { return AccountDexFixture.type(op, reg, owner); }
    private static Instruction end() { return AccountDexFixture.end(); }
    private static Instruction integer(int reg, int value) { return AccountDexFixture.integer(reg, value); }
    private static Instruction result(int reg, boolean object) { return AccountDexFixture.result(reg, object); }
    private static Instruction returns(int reg, boolean object) { return AccountDexFixture.returns(reg, object); }
    private static Instruction literal(int reg, String value) { return new ImmutableInstruction21c(Opcode.CONST_STRING, reg, new ImmutableStringReference(value)); }
    private static Instruction hook(String name, int[] regs, String... args) { return call(Opcode.INVOKE_STATIC, HELPER, name, name.equals("cover") ? "Z" : "V", regs, args); }
    private static Instruction cover(int reg) { return new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, reg, 1, AccountDexFixture.ref(HELPER, "cover", "Z", "Z")); }
    private static Method method(String owner, String name, String result, int flags, int regs, List<Instruction> code, String... args) { return AccountDexFixture.method(owner, name, result, flags, regs, code, args); }
    private static ClassDef clazz(String owner, List<String> api, List<ImmutableField> fields, List<Method> methods) { return AccountDexFixture.clazz(owner, api, fields, methods); }
    private static ImmutableField immutableField(String owner, String name, String type) { return AccountDexFixture.immutableField(owner, name, type); }
    private static void append(Map<String, ClassDef> classes, String owner, String contract, List<Method> extra) {
        ClassDef before = classes.get(owner);
        List<String> api = new ArrayList<>(before.getInterfaces()); if (contract != null) api.add(contract);
        List<Method> methods = new ArrayList<>(); before.getMethods().forEach(methods::add); methods.addAll(extra);
        classes.put(owner, new ImmutableClassDef(owner, before.getAccessFlags(), before.getSuperclass(), api,
                before.getSourceFile(), before.getAnnotations(), before.getFields(), methods));
    }
    private static int address(List<Instruction> body, int index) { int sum = 0; for (int i = 0; i < index; i++) sum += body.get(i).getCodeUnits(); return sum; }
    private static void branch(List<Instruction> body, int at, int target) {
        Instruction old = body.get(at); int offset = address(body, target) - address(body, at);
        if (old instanceof com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction two)
            body.set(at, new ImmutableInstruction22t(old.getOpcode(), two.getRegisterA(), two.getRegisterB(), offset));
        else body.set(at, new ImmutableInstruction21t(old.getOpcode(), ((OneRegisterInstruction) old).getRegisterA(), offset));
    }
    private static Method getter(String owner, String name, String result, String field, Opcode op) {
        return method(owner, name, result, PUBLIC, 1, List.of(field(op, 0, 0, owner, field, result), returns(0, result.startsWith("L"))));
    }
    private static Method getterBridge(String owner, String name, String result, String getter) {
        return method(owner, name, result, PUBLIC, 2, List.of(call(Opcode.INVOKE_VIRTUAL, owner, getter, result, new int[]{1}),
                result(0, result.startsWith("L")), returns(0, result.startsWith("L"))));
    }
    private static void contract(Map<String, ClassDef> classes, String simple, String[] names, String[] result) {
        String[][] args = new String[names.length][]; for (int i = 0; i < args.length; i++) args[i] = new String[0];
        classes.put(BASE + "mature/" + simple + ";", AccountDexFixture.contract(BASE + "mature/" + simple + ";", names, result, args));
    }

    static void add(Map<String, ClassDef> classes, boolean patched, String variant) {
        AccountDexFixture.add(classes, patched);
        String[] rawParameters = {"Ljava/lang/String;", "I", "I", "Ljava/lang/String;", "Ljava/lang/String;", "Z", "Z", "Ljava/lang/String;", "Lcom/tumblr/rumblr/model/Notifications;", "Lcom/tumblr/rumblr/model/Sounds;", "Z", "Z", "Ljava/util/List;", "Z", "Z", "Z", "Z", "Z", "Ljava/lang/String;", "Z", "Z", "Z", "Z", "Z", "Z", "Z", "Z", "Z", "Z", "I", "Ljava/lang/Integer;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "I", "Lcom/tumblr/communitylabel/settings/CommunityLabelVisibility;", "Lcom/tumblr/rumblr/model/communitylabel/CommunityLabelUserSubcategoriesConfig;", "Ljava/lang/Long;", "Ljava/util/List;", "Ljava/util/List;", "Ljava/util/List;", "Z", "Lcom/tumblr/rumblr/model/AgeVerification;"};
        String[] defaultParameters = java.util.Arrays.copyOf(rawParameters, rawParameters.length + 3);
        defaultParameters[rawParameters.length] = "I"; defaultParameters[rawParameters.length + 1] = "I";
        defaultParameters[rawParameters.length + 2] = "Lh27;";
        List<Instruction> defaults = AccountDexFixture.nops(224);
        defaults.set(3, integer(3, 0)); defaults.set(23, new ImmutableInstruction21s(Opcode.CONST_16, 0, 0x400));
        defaults.set(25, new ImmutableInstruction12x(Opcode.MOVE, 15, 3));
        defaults.set(222, new ImmutableInstruction3rc(Opcode.INVOKE_DIRECT_RANGE, 4, rawParameters.length + 1,
                AccountDexFixture.ref(MODEL, "<init>", "V", rawParameters)));
        defaults.set(223, end());
        classes.put(MODEL, clazz(MODEL, List.of(), List.of(), List.of(
                method(MODEL, "<init>", "V", PUBLIC | AccessFlags.CONSTRUCTOR.getValue() | AccessFlags.SYNTHETIC.getValue(), 95, defaults, defaultParameters))));
        List<Instruction> cleanCover = new ArrayList<>(List.of(
                call(Opcode.INVOKE_VIRTUAL, OBJECT, "getClass", "Ljava/lang/Class;", new int[]{3}),
                call(Opcode.INVOKE_VIRTUAL, "Lxg4;", "l", "Z", new int[]{2, 3}, "Lyzf;"), result(0, false), integer(1, 0),
                new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 1),
                call(Opcode.INVOKE_DIRECT, "Lxg4;", "f", "Z", new int[]{2, 3}, "Lyzf;"), result(0, false),
                new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 1),
                call(Opcode.INVOKE_DIRECT, "Lxg4;", "j", "Z", new int[]{2, 3}, "Lyzf;"), result(2, false),
                new ImmutableInstruction21t(Opcode.IF_NEZ, 2, 1), integer(2, 1), returns(2, false), returns(1, false),
                call(Opcode.INVOKE_DIRECT, "Lxg4;", "j", "Z", new int[]{2, 3}, "Lyzf;"), result(2, false), returns(2, false), returns(1, false)));
        branch(cleanCover, 4, 17); branch(cleanCover, 7, 14); branch(cleanCover, 10, 13);
        List<Instruction> gated = new ArrayList<>(); int[] mapped = new int[18], original = new int[18];
        for (int i = 0; i < cleanCover.size(); i++) {
            mapped[i] = gated.size();
            if (patched && cleanCover.get(i).getOpcode() == Opcode.RETURN) {
                int register = ((OneRegisterInstruction) cleanCover.get(i)).getRegisterA();
                gated.add(cover(variant.equals("wrong-cover-register") && i == 12 ? 1 : register)); gated.add(result(register, false));
            }
            original[i] = gated.size(); gated.add(cleanCover.get(i));
        }
        branch(gated, original[4], mapped[17]); branch(gated, original[7], mapped[14]);
        branch(gated, original[10], variant.equals("bypass-cover") ? original[13] : mapped[13]);
        classes.put("Lxg4;", clazz("Lxg4;", List.of(), List.of(), List.of(method("Lxg4;", "k", "Z", PUBLIC, 4, gated, "Lyzf;"))));
        List<Instruction> nsfw = AccountDexFixture.nops(26);
        nsfw.set(5, call(Opcode.INVOKE_VIRTUAL, "Led1;", "U0", "Z", new int[]{0})); nsfw.set(6, result(0, false));
        nsfw.set(7, new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 1)); nsfw.set(8, integer(3, 0)); nsfw.set(9, returns(3, true));
        nsfw.set(10, call(Opcode.INVOKE_VIRTUAL, "Lxg4;", "k", "Z", new int[]{4, 3}, "Lyzf;")); nsfw.set(11, result(0, false));
        nsfw.set(24, integer(3, 0)); nsfw.set(25, returns(3, true)); branch(nsfw, 7, 10);
        if (variant.equals("changed-nsfw")) nsfw.set(5, call(Opcode.INVOKE_VIRTUAL, "Led1;", "L0", "Z", new int[]{0}));
        classes.put("Ls7n;", clazz("Ls7n;", List.of(), List.of(), List.of(method("Ls7n;", "b", "Luan;", PUBLIC | STATIC, 5, nsfw, "Lyzf;", "Lxg4;"))));
        classes.put(AGE, clazz(AGE, List.of(), List.of(immutableField(AGE, "blockApp", "Z")), List.of(getter(AGE, "getBlockApp", "Z", "blockApp", Opcode.IGET_BOOLEAN))));
        List<Instruction> parser = AccountDexFixture.nops(97);
        parser.set(4, integer(1, 0)); parser.set(5, integer(2, 0)); parser.set(6, integer(3, -1)); parser.set(7, new ImmutableInstruction12x(Opcode.MOVE, 5, 1));
        parser.set(8, new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 6, 2)); parser.set(9, new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 7, 6));
        parser.set(10, new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 8, 7)); parser.set(11, new ImmutableInstruction12x(Opcode.MOVE, 9, 3));
        parser.set(53, literal(4, "block_app")); parser.set(65, new ImmutableInstruction22b(Opcode.AND_INT_LIT8, 9, 9, -2));
        parser.set(74, new ImmutableInstruction21s(Opcode.CONST_16, 14, -16)); parser.set(75, new ImmutableInstruction22t(Opcode.IF_NE, 9, 14, 1));
        parser.set(76, type(Opcode.NEW_INSTANCE, 14, AGE));
        parser.set(77, call(Opcode.INVOKE_DIRECT, AGE, "<init>", "V", new int[]{14, 5, 6, 7, 8}, "Z", STRING, STRING, "Lcom/tumblr/rumblr/model/AgeGroup;"));
        parser.set(78, returns(14, true)); parser.set(79, type(Opcode.NEW_INSTANCE, 4, AGE)); parser.set(80, integer(10, 0));
        parser.set(81, new ImmutableInstruction3rc(Opcode.INVOKE_DIRECT_RANGE, 4, 7, AccountDexFixture.ref(AGE, "<init>", "V", "Z", STRING, STRING, "Lcom/tumblr/rumblr/model/AgeGroup;", "I", "Lh27;")));
        parser.set(82, returns(4, true)); parser.set(96, returns(2, true)); branch(parser, 75, 79);
        if (patched) {
            parser.add(82, hook("ageGateParsed", new int[]{4, variant.equals("wrong-age-mask") ? 3 : 9}, OBJECT, "I"));
            parser.add(78, hook("ageGateParsed", new int[]{14, 9}, OBJECT, "I"));
            branch(parser, 75, 80);
            if (variant.equals("error-age-hook")) parser.add(parser.size() - 1, hook("ageGateParsed", new int[]{2, 9}, OBJECT, "I"));
        }
        classes.put(AGE.replace(";", "JsonAdapter;"), clazz(AGE.replace(";", "JsonAdapter;"), List.of(), List.of(), List.of(
                method(AGE.replace(";", "JsonAdapter;"), "fromJson", OBJECT, PUBLIC, 16, parser, "Le9b;"),
                method(AGE.replace(";", "JsonAdapter;"), "toJson", "V", PUBLIC, 3,
                        List.of(literal(0, "block_app"), call(Opcode.INVOKE_VIRTUAL, AGE, "getBlockApp", "Z", new int[]{2}), result(0, false), end()), "Ldab;", OBJECT))));
        classes.put(PERMISSION, clazz(PERMISSION, List.of(), List.of(immutableField(PERMISSION, "show", BOOLEAN), immutableField(PERMISSION, "edit", BOOLEAN)),
                List.of(getter(PERMISSION, "f", BOOLEAN, "show", Opcode.IGET_OBJECT), getter(PERMISSION, "b", BOOLEAN, "edit", Opcode.IGET_OBJECT))));
        String writer = PERMISSION.replace(";", "JsonAdapter;");
        List<Instruction> permissionParser = AccountDexFixture.nops(110);
        permissionParser.set(1, call(Opcode.INVOKE_STATIC, "Ldui;", "e", "Ljava/util/Set;", new int[]{}));
        permissionParser.set(2, result(0, true)); permissionParser.set(4, integer(1, 0));
        permissionParser.set(5, integer(2, -1)); permissionParser.set(13, new ImmutableInstruction12x(Opcode.MOVE, 11, 2));
        permissionParser.set(34, new ImmutableInstruction22b(Opcode.AND_INT_LIT8, 11, 11, -33));
        permissionParser.set(41, new ImmutableInstruction22b(Opcode.AND_INT_LIT8, 11, 11, -17));
        String[] permissionParameters = {"Lcom/tumblr/communitylabel/settings/CommunityLabelVisibility;", "Lcom/tumblr/communitylabel/settings/CommunityLabelVisibility;", "Lcom/tumblr/communitylabel/settings/CommunityLabelVisibility;", "Lcom/tumblr/communitylabel/settings/CommunityLabelVisibility;", BOOLEAN, BOOLEAN, BOOLEAN};
        String[] permissionDefaults = java.util.Arrays.copyOf(permissionParameters, 9);
        permissionDefaults[7] = "I"; permissionDefaults[8] = "Lh27;";
        permissionParser.set(75, call(Opcode.INVOKE_INTERFACE, "Ljava/util/Set;", "size", "I", new int[]{0}));
        permissionParser.set(76, result(13, false)); permissionParser.set(77, new ImmutableInstruction21t(Opcode.IF_NEZ, 13, 1));
        permissionParser.set(78, new ImmutableInstruction21s(Opcode.CONST_16, 13, -128));
        permissionParser.set(79, new ImmutableInstruction22t(Opcode.IF_NE, 11, 13, 1));
        permissionParser.set(80, type(Opcode.NEW_INSTANCE, 2, PERMISSION));
        permissionParser.set(81, new ImmutableInstruction3rc(Opcode.INVOKE_DIRECT_RANGE, 2, 8, AccountDexFixture.ref(PERMISSION, "<init>", "V", permissionParameters)));
        permissionParser.set(82, returns(2, true));
        permissionParser.set(83, type(Opcode.NEW_INSTANCE, 13, PERMISSION)); permissionParser.set(84, integer(12, 0));
        permissionParser.set(92, new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 3, 13));
        permissionParser.set(93, new ImmutableInstruction3rc(Opcode.INVOKE_DIRECT_RANGE, 3, 10, AccountDexFixture.ref(PERMISSION, "<init>", "V", permissionDefaults)));
        permissionParser.set(94, returns(3, true)); permissionParser.set(108, returns(1, true));
        branch(permissionParser, 77, 95); branch(permissionParser, 79, 83);
        if (patched) {
            if (variant.equals("error-permission-hook")) permissionParser.add(108, hook("permissionParsed", new int[]{1, 11}, OBJECT, "I"));
            permissionParser.add(94, hook("permissionParsed", new int[]{3, variant.equals("wrong-permission-mask") ? 2 : 11}, OBJECT, "I"));
            permissionParser.add(82, hook("permissionParsed", new int[]{2, 11}, OBJECT, "I"));
            branch(permissionParser, 77, 97); branch(permissionParser, 79, 84);
        }
        classes.put(writer, clazz(writer, List.of(), List.of(), List.of(method(writer, "fromJson", OBJECT, PUBLIC, 15, permissionParser, "Le9b;"),
                method(writer, "toJson", "V", PUBLIC, 3,
                List.of(literal(0, "can_edit"), call(Opcode.INVOKE_VIRTUAL, PERMISSION, "b", BOOLEAN, new int[]{2}), result(0, true),
                        literal(0, "show_mature_content"), call(Opcode.INVOKE_VIRTUAL, PERMISSION, "f", BOOLEAN, new int[]{2}), result(0, true), end()), "Ldab;", OBJECT))));
        classes.put(API, clazz(API, List.of(), List.of(immutableField(API, "response", OBJECT), immutableField(API, "metaData", META)),
                List.of(getter(API, "getResponse", OBJECT, "response", Opcode.IGET_OBJECT), getter(API, "getMetaData", META, "metaData", Opcode.IGET_OBJECT))));
        classes.put(META, clazz(META, List.of(), List.of(immutableField(META, "status", "I")), List.of(getter(META, "getStatus", "I", "status", Opcode.IGET))));
        List<Instruction> repo = AccountDexFixture.nops(14);
        repo.set(2, call(Opcode.INVOKE_DIRECT, OBJECT, "<init>", "V", new int[]{6})); repo.set(4, field(Opcode.IPUT_OBJECT, 8, 6, REPOSITORY, "b", SERVICE)); repo.set(13, end());
        if (patched && !variant.equals("missing-service-capture")) repo.addAll(13, List.of(type(Opcode.NEW_INSTANCE, 0, REQUESTER),
                call(Opcode.INVOKE_DIRECT, REQUESTER, "<init>", "V", new int[]{0, variant.equals("wrong-service-param") ? 7 : 8}, OBJECT),
                hook("service", new int[]{0}, OBJECT)));
        classes.put(REPOSITORY, clazz(REPOSITORY, List.of("Lp84;"), List.of(immutableField(REPOSITORY, "b", SERVICE)),
                List.of(method(REPOSITORY, "<init>", "V", PUBLIC | AccessFlags.CONSTRUCTOR.getValue(), 9, repo, "Lii7;", SERVICE))));
        Method get = method(SERVICE, "getCommunityLabelUserConfig", OBJECT, PUBLIC | AccessFlags.ABSTRACT.getValue(), 0, null, "Lox5;");
        get = new ImmutableMethod(SERVICE, get.getName(), get.getParameters(), get.getReturnType(), get.getAccessFlags(),
                Set.of(new ImmutableAnnotation(AnnotationVisibility.RUNTIME, patched && variant.equals("unsafe-native-request-verb") ? "Lretrofit2/http/POST;" : "Lretrofit2/http/GET;", Set.of(new ImmutableAnnotationElement("value", new ImmutableStringEncodedValue("v2/user/content_filters"))))), Set.of(), null);
        classes.put(SERVICE, new ImmutableClassDef(SERVICE, PUBLIC | AccessFlags.INTERFACE.getValue() | AccessFlags.ABSTRACT.getValue(), OBJECT,
                List.of(), null, Set.of(), List.of(), List.of(get)));
        classes.put("Lox5;", AccountDexFixture.contract("Lox5;", new String[]{"getContext", "resumeWith"}, new String[]{"Ll86;", "V"}, new String[][]{new String[0], {OBJECT}}));
        classes.put("Lo68;", clazz("Lo68;", List.of("Ll86;"), List.of(new ImmutableField("Lo68;", "a", "Lo68;", PUBLIC | STATIC | AccessFlags.FINAL.getValue(), null, Set.of(), Set.of())),
                List.of(method("Lo68;", "toString", STRING, PUBLIC, 1, List.of(literal(0, "EmptyCoroutineContext"), returns(0, true))))));
        classes.put("Lu3b;", new ImmutableClassDef("Lu3b;", PUBLIC, "Lw3b;", List.of(), null, Set.of(), List.of(), List.of()));
        classes.put("Lw3b;", clazz("Lw3b;", List.of(), List.of(), List.of(method("Lw3b;", "g", OBJECT, PUBLIC | STATIC, 1,
                List.of(new ImmutableInstruction21c(Opcode.SGET_OBJECT, 0, new ImmutableFieldReference("Lc96;", "COROUTINE_SUSPENDED", "Lc96;")), returns(0, true))))));
        if (!patched) return;
        contract(classes, "HushMatureAccount", new String[]{"hushAge", "hushCanModifySafeMode", "hushAgeVerification"}, new String[]{"I", "Z", OBJECT});
        contract(classes, "HushAgeVerification", new String[]{"hushBlockApp"}, new String[]{"Z"});
        contract(classes, "HushMaturePermission", new String[]{"hushShowMatureContent", "hushCanEditMatureContent"}, new String[]{BOOLEAN, BOOLEAN});
        contract(classes, "HushMatureResponse", new String[]{"hushResponse", "hushStatus"}, new String[]{OBJECT, "I"});
        classes.put(BASE + "mature/HushMatureService;", AccountDexFixture.contract(BASE + "mature/HushMatureService;", new String[]{"hushFetchMaturePermission"}, new String[]{"V"}, new String[][]{{OBJECT}}));
        append(classes, USER, BASE + "mature/HushMatureAccount;", List.of(
                method(USER, "hushAge", "I", PUBLIC, 2, List.of(field(Opcode.IGET, 0, 1, USER, variant.equals("wrong-age-field") ? "B" : "C", "I"), returns(0, false))),
                method(USER, "hushCanModifySafeMode", "Z", PUBLIC, 2, List.of(field(Opcode.IGET_BOOLEAN, 0, 1, USER, "l", "Z"), returns(0, false))),
                method(USER, "hushAgeVerification", OBJECT, PUBLIC, 2, List.of(field(Opcode.IGET_OBJECT, 0, 1, USER, "J", AGE), returns(0, true)))));
        append(classes, AGE, variant.equals("missing-age-interface") ? null : BASE + "mature/HushAgeVerification;", List.of(getterBridge(AGE, "hushBlockApp", "Z", "getBlockApp")));
        append(classes, PERMISSION, BASE + "mature/HushMaturePermission;", List.of(
                getterBridge(PERMISSION, "hushShowMatureContent", BOOLEAN, variant.equals("wrong-permission-getter") ? "b" : "f"), getterBridge(PERMISSION, "hushCanEditMatureContent", BOOLEAN, "b")));
        List<Instruction> status = new ArrayList<>(List.of(call(Opcode.INVOKE_VIRTUAL, API, "getMetaData", META, new int[]{1}), result(0, true),
                new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 1), call(Opcode.INVOKE_VIRTUAL, META, "getStatus", "I", new int[]{0}), result(0, false), returns(0, false), integer(0, 0), returns(0, false)));
        branch(status, 2, 6);
        append(classes, API, BASE + "mature/HushMatureResponse;", List.of(getterBridge(API, "hushResponse", OBJECT, "getResponse"), method(API, "hushStatus", "I", PUBLIC, 2, status)));
        List<Instruction> fetch = new ArrayList<>(List.of(field(Opcode.IGET_OBJECT, 0, 4, REQUESTER, "service", OBJECT), type(Opcode.CHECK_CAST, 0, SERVICE),
                type(Opcode.NEW_INSTANCE, 1, CONTINUATION), call(Opcode.INVOKE_DIRECT, CONTINUATION, "<init>", "V", new int[]{1, 5}, OBJECT),
                call(variant.equals("request-virtual") ? Opcode.INVOKE_VIRTUAL : Opcode.INVOKE_INTERFACE, SERVICE,
                        variant.equals("request-setter") ? "setCommunityLabelUserConfig" : "getCommunityLabelUserConfig", OBJECT, new int[]{0, 1}, "Lox5;"), result(2, true),
                call(Opcode.INVOKE_STATIC, "Lu3b;", "g", OBJECT, new int[]{}), result(3, true),
                new ImmutableInstruction22t(Opcode.IF_EQ, 2, 3, 1), hook("received", new int[]{5, 2}, OBJECT, OBJECT), end()));
        branch(fetch, 8, variant.equals("bad-suspension") ? 9 : 10);
        classes.put(REQUESTER, clazz(REQUESTER, List.of(BASE + "mature/HushMatureService;"), List.of(immutableField(REQUESTER, "service", OBJECT)), List.of(
                method(REQUESTER, "<init>", "V", PUBLIC | AccessFlags.CONSTRUCTOR.getValue(), 2,
                        List.of(call(Opcode.INVOKE_DIRECT, OBJECT, "<init>", "V", new int[]{0}), field(Opcode.IPUT_OBJECT, 1, 0, REQUESTER, "service", OBJECT), end()), OBJECT),
                method(REQUESTER, "hushFetchMaturePermission", "V", PUBLIC, 6, fetch, OBJECT))));
        classes.put(CONTINUATION, clazz(CONTINUATION, variant.equals("missing-continuation") ? List.of() : List.of("Lox5;"), List.of(immutableField(CONTINUATION, "request", OBJECT)), List.of(
                method(CONTINUATION, "<init>", "V", PUBLIC | AccessFlags.CONSTRUCTOR.getValue(), 2,
                        List.of(call(Opcode.INVOKE_DIRECT, OBJECT, "<init>", "V", new int[]{0}), field(Opcode.IPUT_OBJECT, 1, 0, CONTINUATION, "request", OBJECT), end()), OBJECT),
                method(CONTINUATION, "getContext", "Ll86;", PUBLIC, 2,
                        List.of(new ImmutableInstruction21c(Opcode.SGET_OBJECT, 0, new ImmutableFieldReference("Lo68;", variant.equals("wrong-context") ? "b" : "a", "Lo68;")), returns(0, true))),
                method(CONTINUATION, "resumeWith", "V", PUBLIC, 3,
                        List.of(field(Opcode.IGET_OBJECT, 0, 1, CONTINUATION, "request", OBJECT), hook("received", new int[]{0, 2}, OBJECT, OBJECT), end()), OBJECT))));
        classes.put(HELPER, clazz(HELPER, List.of(), List.of(), List.of(
                method(HELPER, "cover", "Z", PUBLIC | STATIC, 2, List.of(call(Opcode.INVOKE_STATIC, UTILS, "settingsReady", "Z", new int[]{}), result(0, false), returns(1, false)), "Z"),
                method(HELPER, "ageGateParsed", "V", PUBLIC | STATIC, 2, List.of(end()), OBJECT, "I"),
                method(HELPER, "permissionParsed", "V", PUBLIC | STATIC, 2, List.of(end()), OBJECT, "I"),
                method(HELPER, "service", "V", PUBLIC | STATIC, 1, List.of(end()), OBJECT),
                method(HELPER, "received", "V", PUBLIC | STATIC, 2, List.of(call(Opcode.INVOKE_STATIC, UTILS, "settingsReady", "Z", new int[]{}), result(0, false), end()), OBJECT, OBJECT))));
    }

    public static void main(String[] args) throws Exception {
        Path output = Path.of(args[0]); Files.createDirectories(output);
        FeatureDexFixture.initialize(Path.of(args[1]));
        FeatureDexFixture.reset(); Map<String, ClassDef> clean = FeatureDexFixture.baseClasses(false); add(clean, false, "clean");
        DexPool.writeTo(output.resolve("mature-clean.dex").toString(), new ImmutableDexFile(Opcodes.getDefault(), clean.values()));
        Map<String, String> variants = new LinkedHashMap<>();
        variants.put("good", ""); variants.put("wrong-cover-register", "mature cover answer hook changed");
        variants.put("bypass-cover", "mature cover answer hook changed"); variants.put("wrong-age-mask", "age verification presence hook changed");
        variants.put("error-age-hook", "age verification presence hook changed"); variants.put("changed-nsfw", "native NSFW restriction changed");
        variants.put("wrong-age-field", "mature account bridge changed"); variants.put("wrong-permission-getter", "mature account bridge changed");
        variants.put("missing-age-interface", "mature account bridge changed"); variants.put("request-virtual", "mature permission requester changed");
        variants.put("request-setter", "mature permission requester changed"); variants.put("bad-suspension", "mature permission requester changed");
        variants.put("wrong-context", "mature continuation bridge changed"); variants.put("missing-continuation", "mature continuation bridge changed");
        variants.put("missing-service-capture", "mature permission requester changed"); variants.put("wrong-service-param", "mature permission requester changed");
        variants.put("wrong-permission-mask", "mature permission presence hook changed"); variants.put("error-permission-hook", "mature permission presence hook changed");
        variants.put("unsafe-native-request-verb", "mature permission requester changed");
        List<String> cases = new ArrayList<>();
        for (Map.Entry<String, String> variant : variants.entrySet()) {
            FeatureDexFixture.reset(); FeatureDexFixture.enable("revealAllowedMatureContent");
            Map<String, ClassDef> classes = FeatureDexFixture.baseClasses(true); add(classes, true, variant.getKey());
            String name = "feature-mature-" + variant.getKey();
            DexPool.writeTo(output.resolve(name + ".dex").toString(), new ImmutableDexFile(Opcodes.getDefault(), classes.values()));
            Files.write(output.resolve(name + ".selected"), FeatureDexFixture.selected("revealAllowedMatureContent"), StandardCharsets.UTF_8);
            cases.add(name + "|" + variant.getValue().isEmpty() + "|" + variant.getValue());
        }
        Files.write(output.resolve("mature-cases.txt"), cases, StandardCharsets.UTF_8);
    }
}

import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.AnnotationVisibility;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

/** Primary-blog mutual marker output contracts, independent of the full host APK. */
public final class MutualDexFixture {
    private static final String BASE = AccountDexFixture.BASE, OBJECT = AccountDexFixture.OBJECT, STRING = AccountDexFixture.STRING;
    private static final String LIST = "Ljava/util/List;", USER = AccountDexFixture.USER;
    private static final String HELPER = BASE + "mutual/MutualMarkers;", SOURCE = BASE + "mutual/NativeMutualSource;";
    private static final String HEADER = "Lcom/tumblr/ui/widget/PostCardHeader;", PRIMARY = "Lcom/tumblr/rumblr/model/blog/UserBlogInfo;";
    private static final String SHORT = "Lcom/tumblr/rumblr/model/blog/ShortBlogInfo;", RAW_BLOG = "Lcom/tumblr/rumblr/model/blog/BlogInfo;";
    private static final String BLOG = "Lcom/tumblr/bloginfo/BlogInfo;", FOLLOWER = "Lcom/tumblr/rumblr/model/User;";
    private static final String PAGE = "Lcom/tumblr/rumblr/response/FollowerResponse;", PAGINATION = "Lcom/tumblr/rumblr/model/PaginationLink;";
    private static final String LINK = "Lcom/tumblr/rumblr/model/link/LinkImpl;", SIMPLE = "Lcom/tumblr/rumblr/model/link/SimpleLink;";
    private static final String API = "Lcom/tumblr/rumblr/response/ApiResponse;", META = "Lcom/tumblr/rumblr/response/Metadata;";
    private static final String SERVICE = "Lcom/tumblr/rumblr/TumblrService;", CORE = "Lcom/tumblr/CoreApp;";
    private static final String CALL = "Lretrofit2/Call;", RESPONSE = "Lretrofit2/Response;", TIME_UNIT = "Ljava/util/concurrent/TimeUnit;";
    private static final String FIELDS = "name,title,description,url,uuid,updated,blog_view_url,key,theme,can_message,share_likes,share_following,?share_replies,is_nsfw,is_adult,can_be_followed,placement_id,tumblrmart_accessories,can_show_badges,avatar,?can_be_booped";
    private static final int PUBLIC = AccessFlags.PUBLIC.getValue(), STATIC = AccessFlags.STATIC.getValue(), CTOR = PUBLIC | AccessFlags.CONSTRUCTOR.getValue();
    private static Instruction call(Opcode op, String owner, String name, String result, int[] regs, String... args) { return AccountDexFixture.call(op, owner, name, result, regs, args); }
    private static Instruction field(Opcode op, int value, int receiver, String owner, String name, String type) { return AccountDexFixture.field(op, value, receiver, owner, name, type); }
    private static Instruction type(Opcode op, int register, String type) { return AccountDexFixture.type(op, register, type); }
    private static Instruction end() { return AccountDexFixture.end(); }
    private static Instruction integer(int register, int value) { return AccountDexFixture.integer(register, value); }
    private static Instruction result(int register, boolean object) { return AccountDexFixture.result(register, object); }
    private static Instruction returns(int register, boolean object) { return AccountDexFixture.returns(register, object); }
    private static Instruction literal(int register, String value) { return new ImmutableInstruction21c(Opcode.CONST_STRING, register, new ImmutableStringReference(value)); }
    private static Method method(String owner, String name, String result, int flags, int regs, List<Instruction> body, String... args) { return AccountDexFixture.method(owner, name, result, flags, regs, body, args); }
    private static ClassDef clazz(String owner, String parent, List<String> api, List<ImmutableField> fields, List<Method> methods) {
        return new ImmutableClassDef(owner, PUBLIC, parent, api, null, Set.of(), fields, methods);
    }
    private static ImmutableField nativeField(String owner, String name, String type, boolean immutable) {
        return new ImmutableField(owner, name, type, AccessFlags.PRIVATE.getValue() | (immutable ? AccessFlags.FINAL.getValue() : 0), null, Set.of(), Set.of());
    }
    private static void append(Map<String, ClassDef> classes, String owner, String contract, List<Method> extra) {
        ClassDef before = classes.get(owner); List<String> api = new ArrayList<>(before.getInterfaces());
        if (contract != null && !api.contains(contract)) api.add(contract);
        List<Method> methods = new ArrayList<>(); before.getMethods().forEach(methods::add); methods.addAll(extra);
        classes.put(owner, new ImmutableClassDef(owner, before.getAccessFlags(), before.getSuperclass(), api,
                before.getSourceFile(), before.getAnnotations(), before.getFields(), methods));
    }
    private static String[] parameters(String descriptor) {
        return Pattern.compile("\\[*L[^;]*;|\\[*[ZBCSIJFD]").matcher(descriptor).results().map(match -> match.group()).toArray(String[]::new);
    }
    private static int address(List<Instruction> body, int index) { int sum = 0; for (int i = 0; i < index; i++) sum += body.get(i).getCodeUnits(); return sum; }
    private static void branch(List<Instruction> body, int at, int target) {
        Instruction old = body.get(at); int offset = address(body, target) - address(body, at);
        if (old instanceof TwoRegisterInstruction two) body.set(at, new ImmutableInstruction22t(old.getOpcode(), two.getRegisterA(), two.getRegisterB(), offset));
        else if (old instanceof OneRegisterInstruction one) body.set(at, new ImmutableInstruction21t(old.getOpcode(), one.getRegisterA(), offset));
        else body.set(at, new ImmutableInstruction10t(old.getOpcode(), offset));
    }
    private static Method getter(String owner, String name, String result, String field) {
        boolean object = result.startsWith("L"); Opcode op = object ? Opcode.IGET_OBJECT : result.equals("Z") ? Opcode.IGET_BOOLEAN : Opcode.IGET;
        return method(owner, name, result, PUBLIC, 1, List.of(field(op, 0, 0, owner, field, result), returns(0, object)));
    }
    private static Method getterBridge(String owner, String name, String result, String nativeName, String nativeResult) {
        boolean object = result.startsWith("L");
        return method(owner, name, result, PUBLIC, 2, List.of(call(Opcode.INVOKE_VIRTUAL, owner, nativeName, nativeResult, new int[]{1}), result(0, object), returns(0, object)));
    }
    private static void contract(Map<String, ClassDef> classes, String simple, String[] names, String[] results) {
        String[][] args = new String[names.length][]; Arrays.setAll(args, ignored -> new String[0]);
        String owner = BASE + "mutual/" + simple + ";";
        classes.put(owner, AccountDexFixture.contract(owner, names, results, args));
    }
    private static void writer(Map<String, ClassDef> classes, String owner, String[] keys, String[] getters, String[] results) {
        String adapter = owner.replace(";", "JsonAdapter;"); List<Instruction> body = new ArrayList<>();
        for (int i = 0; i < keys.length; i++) {
            body.add(literal(0, keys[i])); body.add(call(Opcode.INVOKE_VIRTUAL, owner, getters[i], results[i], new int[]{2}));
            body.add(result(0, results[i].startsWith("L")));
        }
        body.add(end()); classes.put(adapter, clazz(adapter, OBJECT, List.of(), List.of(), List.of(method(adapter, "toJson", "V", PUBLIC, 3, body, "Ldab;", OBJECT))));
    }
    private static ImmutableAnnotation annotation(String type, String value) {
        return new ImmutableAnnotation(AnnotationVisibility.RUNTIME, "Lretrofit2/http/" + type + ";", value == null ? Set.of()
                : Set.of(new ImmutableAnnotationElement("value", new ImmutableStringEncodedValue(value))));
    }

    static void add(Map<String, ClassDef> classes, boolean patched, String variant) {
        if (!classes.containsKey(USER)) AccountDexFixture.add(classes, patched);
        String[] fullArgs = parameters("Lyzf;Ldnl;Llsm;Lcom/tumblr/analytics/NavigationState;Lmjd;Lxie;Llu2;Lfsl;ZZLjava/lang/String;Lyfc;Lxg4;Lmrn;Lcwb;Lga4;Lr9a;Lm02;");
        List<Instruction> bind = AccountDexFixture.nops(128);
        bind.set(0, new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 2, 16));
        bind.set(1, new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 5, 19));
        bind.set(3, new ImmutableInstruction22x(Opcode.MOVE_FROM16, 4, 18));
        bind.set(14, call(Opcode.INVOKE_DIRECT, HEADER, "Z0", STRING, new int[]{15, 2, 5}, "Lyzf;", BLOG)); bind.set(15, result(13, true));
        bind.set(16, new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 8, 13));
        bind.set(60, new ImmutableInstruction21t(Opcode.IF_EQZ, 4, 1));
        bind.set(104, field(Opcode.IGET_OBJECT, 0, 15, HEADER, "K", "Landroid/widget/TextView;"));
        bind.set(105, call(Opcode.INVOKE_VIRTUAL, "Landroid/widget/TextView;", "setText", "V", new int[]{0, 8}, "Ljava/lang/CharSequence;"));
        bind.set(127, end()); branch(bind, 60, 106);
        if (patched && !variant.equals("missing-bind")) {
            bind.add(106, call(Opcode.INVOKE_STATIC, HELPER, "bind", "V", new int[]{0, variant.equals("wrong-bind-blog") ? 2 : 5, 13}, OBJECT, OBJECT, STRING));
            branch(bind, 60, variant.equals("bypass-bind") ? 107 : 106);
        }
        List<Instruction> full = AccountDexFixture.nops(297); full.set(0, integer(0, 0));
        full.set(7, new ImmutableInstruction3rc(Opcode.INVOKE_DIRECT_RANGE, 16, 1, AccountDexFixture.ref(HEADER, "X1", "V")));
        full.set(296, end());
        if (patched && !variant.equals("missing-full-clear")) full.add(0, new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 16, 1, AccountDexFixture.ref(HELPER, "clear", "V", OBJECT)));
        List<Instruction> detach = new ArrayList<>(List.of(call(Opcode.INVOKE_SUPER, "Landroid/view/View;", "onDetachedFromWindow", "V", new int[]{0}),
                field(Opcode.IGET_OBJECT, 0, 0, HEADER, "w0", "Lbq4;"), call(Opcode.INVOKE_VIRTUAL, "Lbq4;", "e", "V", new int[]{0}), end()));
        if (patched && !variant.equals("missing-detach-clear")) detach.add(0, call(Opcode.INVOKE_STATIC, HELPER, "clear", "V", new int[]{0}, OBJECT));
        List<Instruction> displayName = AccountDexFixture.nops(17); displayName.set(4, call(Opcode.INVOKE_VIRTUAL, BLOG, "Z", STRING, new int[]{3})); displayName.set(5, result(0, true)); displayName.set(16, returns(0, true));
        classes.put(HEADER, clazz(HEADER, "Landroid/widget/LinearLayout;", List.of(), List.of(nativeField(HEADER, "K", "Landroid/widget/TextView;", false), nativeField(HEADER, "w0", "Lbq4;", true)),
                List.of(method(HEADER, "t2", "V", AccessFlags.PRIVATE.getValue(), 21, bind, "Lyzf;", "Lmrn;", "Z", BLOG, "Z"),
                        method(HEADER, "S0", "V", PUBLIC, 35, full, fullArgs), method(HEADER, "onDetachedFromWindow", "V", AccessFlags.PROTECTED.getValue(), 1, detach),
                        method(HEADER, "Z0", STRING, AccessFlags.PRIVATE.getValue(), 4, displayName, "Lyzf;", BLOG), method(HEADER, "X1", "V", AccessFlags.PRIVATE.getValue(), 1, List.of(end())))));

        classes.put(SHORT, clazz(SHORT, OBJECT, List.of(), List.of(nativeField(SHORT, "a", STRING, true), nativeField(SHORT, "g", STRING, true)), List.of(getter(SHORT, "m", STRING, "a"), getter(SHORT, "Y", STRING, "g"))));
        classes.put(RAW_BLOG, clazz(RAW_BLOG, SHORT, List.of(), List.of(), List.of()));
        String[] primaryArgs = parameters("Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/tumblr/rumblr/model/blog/BlogTheme;Ljava/lang/String;ZZZZZZZILcom/tumblr/rumblr/model/blog/SubscriptionPlan;Lcom/tumblr/rumblr/model/memberships/Subscription;ZZZLjava/lang/String;ZZZZIZZZZZZLjava/lang/String;IZZZZLcom/tumblr/rumblr/model/premiumold/TumblrmartAccessories;Ljava/util/List;ZLjava/lang/Boolean;Ljava/lang/String;ZZZJJJZLjava/util/List;Lcom/tumblr/rumblr/model/blog/BlogType;Lcom/tumblr/rumblr/model/ReplyConditions;JLjava/util/List;Lcom/tumblr/rumblr/model/BlazeControl;");
        String[] primaryDefaults = Arrays.copyOf(primaryArgs, primaryArgs.length + 3); primaryDefaults[primaryArgs.length] = "I"; primaryDefaults[primaryArgs.length + 1] = "I"; primaryDefaults[primaryArgs.length + 2] = "Lh27;";
        List<Instruction> primary = AccountDexFixture.nops(83); primary.set(11, new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 0, 49));
        primary.set(55, call(Opcode.INVOKE_DIRECT, OBJECT, "<init>", "V", new int[]{0}));
        primary.set(58, new ImmutableInstruction22x(Opcode.MOVE_FROM16, 1, patched && variant.equals("wrong-primary-constructor") ? 95 : 94));
        primary.set(59, field(Opcode.IPUT_BOOLEAN, 1, 0, PRIMARY, "X", "Z")); primary.set(82, end());
        List<Instruction> defaults = AccountDexFixture.nops(283); defaults.set(1, new ImmutableInstruction22x(Opcode.MOVE_FROM16, 1, 127)); defaults.set(19, integer(3, 0));
        defaults.set(199, new ImmutableInstruction22s(Opcode.AND_INT_LIT16, 0, 1, 0x1000));
        defaults.set(200, new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 1)); defaults.set(201, new ImmutableInstruction22x(Opcode.MOVE_FROM16, 49, 3));
        defaults.set(202, new ImmutableInstruction10t(Opcode.GOTO, 1)); defaults.set(203, new ImmutableInstruction22x(Opcode.MOVE_FROM16, 49, 110));
        defaults.set(280, new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 4, 65));
        defaults.set(281, new ImmutableInstruction3rc(Opcode.INVOKE_DIRECT_RANGE, 4, 61, AccountDexFixture.ref(PRIMARY, "<init>", "V", primaryArgs))); defaults.set(282, end());
        branch(defaults, 200, patched && variant.equals("bypass-primary-default") ? 204 : 203); branch(defaults, 202, 204);
        classes.put(PRIMARY, clazz(PRIMARY, RAW_BLOG, List.of(), List.of(nativeField(PRIMARY, "X", "Z", true)), List.of(getter(PRIMARY, "N0", "Z", "X"),
                method(PRIMARY, "<init>", "V", CTOR, 110, primary, primaryArgs), method(PRIMARY, "<init>", "V", CTOR | AccessFlags.SYNTHETIC.getValue(), 129, defaults, primaryDefaults))));
        List<Instruction> copied = AccountDexFixture.nops(116); copied.set(39, call(Opcode.INVOKE_VIRTUAL, SHORT, "Y", STRING, new int[]{2})); copied.set(40, result(1, true));
        copied.set(41, field(Opcode.IPUT_OBJECT, 1, 0, BLOG, "E", STRING)); copied.set(115, returns(0, true));
        classes.put(BLOG, clazz(BLOG, OBJECT, List.of(), List.of(nativeField(BLOG, "a", STRING, false), nativeField(BLOG, "E", STRING, false)), List.of(getter(BLOG, "Z", STRING, "a"), getter(BLOG, "t0", STRING, "E"), method(BLOG, "W0", BLOG, PUBLIC, 3, copied, SHORT))));

        String[] followerArgs = {STRING, STRING, "J", "Z", SHORT};
        List<Instruction> follower = new ArrayList<>(List.of(call(Opcode.INVOKE_DIRECT, OBJECT, "<init>", "V", new int[]{0}), field(Opcode.IPUT_OBJECT, 1, 0, FOLLOWER, "name", STRING),
                field(Opcode.IPUT_OBJECT, 2, 0, FOLLOWER, "url", STRING), field(Opcode.IPUT_WIDE, 3, 0, FOLLOWER, "updated", "J"), field(Opcode.IPUT_BOOLEAN, 5, 0, FOLLOWER, "isFollowing", "Z"), field(Opcode.IPUT_OBJECT, 6, 0, FOLLOWER, "blog", SHORT), end()));
        List<Instruction> following = AccountDexFixture.nops(18); following.set(10, new ImmutableInstruction22b(Opcode.AND_INT_LIT8, 9, 8, 8)); following.set(11, new ImmutableInstruction21t(Opcode.IF_EQZ, 9, 1));
        following.set(12, integer(6, 0)); following.set(13, new ImmutableInstruction22b(Opcode.AND_INT_LIT8, 8, 8, 16));
        following.set(16, new ImmutableInstruction3rc(Opcode.INVOKE_DIRECT_RANGE, 1, 7, AccountDexFixture.ref(FOLLOWER, "<init>", "V", followerArgs))); following.set(17, end());
        branch(following, 11, patched && variant.equals("bypass-following-default") ? 16 : 13);
        classes.put(FOLLOWER, clazz(FOLLOWER, OBJECT, List.of(), List.of(nativeField(FOLLOWER, "name", STRING, false), nativeField(FOLLOWER, "url", STRING, false), nativeField(FOLLOWER, "updated", "J", false), nativeField(FOLLOWER, "isFollowing", "Z", false), nativeField(FOLLOWER, "blog", SHORT, false)),
                List.of(getter(FOLLOWER, "isFollowing", "Z", "isFollowing"), getter(FOLLOWER, "getBlog", SHORT, "blog"), method(FOLLOWER, "<init>", "V", CTOR, 7, follower, followerArgs),
                        method(FOLLOWER, "<init>", "V", CTOR | AccessFlags.SYNTHETIC.getValue(), 10, following, STRING, STRING, "J", "Z", SHORT, "I", "Lh27;"))));
        List<Instruction> pageCtor = List.of(call(Opcode.INVOKE_DIRECT, OBJECT, "<init>", "V", new int[]{0}), field(Opcode.IPUT, 1, 0, PAGE, "totalUsers", "I"), field(Opcode.IPUT_OBJECT, 2, 0, PAGE, "users", LIST),
                field(Opcode.IPUT_OBJECT, 3, 0, PAGE, "paginationLinks", PAGINATION), field(Opcode.IPUT_OBJECT, 3, 0, PAGE, "links", PAGINATION), end());
        classes.put(PAGE, clazz(PAGE, OBJECT, List.of(), List.of(nativeField(PAGE, "users", LIST, true), nativeField(PAGE, "paginationLinks", PAGINATION, true), nativeField(PAGE, "links", PAGINATION, true), nativeField(PAGE, "totalUsers", "I", true)),
                List.of(method(PAGE, "<init>", "V", CTOR, 4, pageCtor, "I", LIST, PAGINATION), getter(PAGE, "getUsers", LIST, "users"), getter(PAGE, "getPaginationLinks", PAGINATION, "paginationLinks"), getter(PAGE, "getLinks", PAGINATION, "links"))));
        classes.put(PAGINATION, clazz(PAGINATION, OBJECT, List.of(), List.of(nativeField(PAGINATION, "next", SIMPLE, true)), List.of(getter(PAGINATION, "getNext", SIMPLE, "next"))));
        classes.put(LINK, clazz(LINK, OBJECT, List.of(), List.of(nativeField(LINK, "link", STRING, true)), List.of(getter(LINK, "d", STRING, "link"),
                method(LINK, "getLink", STRING, PUBLIC, 1, List.of(call(Opcode.INVOKE_VIRTUAL, LINK, "d", STRING, new int[]{0}), result(0, true), returns(0, true))))));
        classes.put(SIMPLE, clazz(SIMPLE, LINK, List.of(), List.of(), List.of()));
        writer(classes, PRIMARY, new String[]{"primary"}, new String[]{"N0"}, new String[]{"Z"});
        writer(classes, SHORT, new String[]{"name", "uuid"}, new String[]{"m", "Y"}, new String[]{STRING, STRING});
        writer(classes, FOLLOWER, new String[]{"following", "blog"}, new String[]{"isFollowing", "getBlog"}, new String[]{"Z", SHORT});
        writer(classes, PAGE, new String[]{"users", "_links"}, new String[]{"getUsers", "getPaginationLinks"}, new String[]{LIST, PAGINATION});
        writer(classes, PAGINATION, new String[]{"next"}, new String[]{"getNext"}, new String[]{SIMPLE});
        if (!classes.containsKey(API)) classes.put(API, clazz(API, OBJECT, List.of(), List.of(nativeField(API, "response", OBJECT, true), nativeField(API, "metaData", META, true)), List.of(getter(API, "getResponse", OBJECT, "response"), getter(API, "getMetaData", META, "metaData"))));
        if (!classes.containsKey(META)) classes.put(META, clazz(META, OBJECT, List.of(), List.of(nativeField(META, "status", "I", true)), List.of(getter(META, "getStatus", "I", "status"))));
        List<Method> reads = new ArrayList<>();
        for (String name : List.of("followers", "followersPagination")) {
            boolean first = name.equals("followers");
            List<ImmutableMethodParameter> args = List.of(new ImmutableMethodParameter(STRING, Set.of(annotation(first ? "Path" : "Url", first ? "hostname" : null)), null),
                    new ImmutableMethodParameter(STRING, Set.of(annotation("Query", patched && variant.equals("wrong-fields-query") ? "fields" : "fields[blogs]")), null));
            reads.add(new ImmutableMethod(SERVICE, name, args, CALL, PUBLIC | AccessFlags.ABSTRACT.getValue(), Set.of(annotation(patched && variant.equals("unsafe-request-verb") ? "POST" : "GET", first ? "blog/{hostname}/followers?limit=100" : null)), Set.of(), null));
        }
        classes.put(SERVICE, new ImmutableClassDef(SERVICE, PUBLIC | AccessFlags.INTERFACE.getValue() | AccessFlags.ABSTRACT.getValue(), OBJECT, List.of(), null, Set.of(), List.of(), reads));
        append(classes, CORE, null, List.of(method(CORE, "Z", SERVICE, PUBLIC | STATIC | AccessFlags.DECLARED_SYNCHRONIZED.getValue(), 1, List.of(integer(0, 0), returns(0, true)))));
        List<Instruction> nativeRead = AccountDexFixture.nops(18); nativeRead.set(9, literal(1, ".tumblr.com")); nativeRead.set(13, literal(1, FIELDS));
        nativeRead.set(14, call(Opcode.INVOKE_INTERFACE, SERVICE, "followers", CALL, new int[]{0, 2, 1}, STRING, STRING)); nativeRead.set(15, result(0, true)); nativeRead.set(17, returns(0, true));
        classes.put("Lcom/tumblr/ui/fragment/FollowerFragment;", clazz("Lcom/tumblr/ui/fragment/FollowerFragment;", OBJECT, List.of(), List.of(), List.of(method("Lcom/tumblr/ui/fragment/FollowerFragment;", "c5", CALL, PUBLIC, 3, nativeRead))));
        classes.put(CALL, AccountDexFixture.contract(CALL, new String[]{"execute", "timeout", "cancel"}, new String[]{RESPONSE, "Lvsl;", "V"}, new String[][]{ {}, {}, {} }));
        classes.put(TIME_UNIT, clazz(TIME_UNIT, "Ljava/lang/Enum;", List.of(), List.of(new ImmutableField(TIME_UNIT, "MILLISECONDS", TIME_UNIT,
                PUBLIC | STATIC | AccessFlags.FINAL.getValue(), null, Set.of(), Set.of())), List.of()));
        classes.put("Lvsl;", clazz("Lvsl;", OBJECT, List.of(), List.of(), List.of(method("Lvsl;", "timeout", "Lvsl;", PUBLIC, 4, List.of(returns(0, true)), "J", TIME_UNIT))));
        classes.put(RESPONSE, clazz(RESPONSE, OBJECT, List.of(), List.of(nativeField(RESPONSE, "body", OBJECT, true)), List.of(getter(RESPONSE, "body", OBJECT, "body"), method(RESPONSE, "isSuccessful", "Z", PUBLIC, 1, List.of(integer(0, 1), returns(0, false))))));
        if (!patched) return;

        contract(classes, "HushMutualHeader", new String[]{"hushMutualNameView"}, new String[]{OBJECT});
        contract(classes, "HushMutualAccount", new String[]{"hushMutualBlogs"}, new String[]{LIST});
        contract(classes, "HushMutualBlog", new String[]{"hushMutualName", "hushMutualUuid"}, new String[]{STRING, STRING});
        contract(classes, "HushPrimaryBlog", new String[]{"hushMutualPrimary"}, new String[]{"Z"});
        contract(classes, "HushMutualFollower", new String[]{"hushMutualFollowing", "hushMutualFollowerBlog"}, new String[]{"Z", OBJECT});
        contract(classes, "HushMutualPage", new String[]{"hushMutualUsers", "hushMutualPagination", "hushMutualLinks"}, new String[]{LIST, OBJECT, OBJECT});
        contract(classes, "HushMutualPagination", new String[]{"hushMutualNext"}, new String[]{OBJECT});
        contract(classes, "HushMutualLink", new String[]{"hushMutualLink"}, new String[]{STRING});
        contract(classes, "HushMutualResponse", new String[]{"hushMutualResponse", "hushMutualStatus"}, new String[]{OBJECT, "I"});
        append(classes, HEADER, BASE + "mutual/HushMutualHeader;", List.of(method(HEADER, "hushMutualNameView", OBJECT, PUBLIC, 2, List.of(field(Opcode.IGET_OBJECT, 0, 1, HEADER, "K", "Landroid/widget/TextView;"), returns(0, true)))));
        append(classes, USER, BASE + "mutual/HushMutualAccount;", List.of(method(USER, "hushMutualBlogs", LIST, PUBLIC, 2, List.of(field(Opcode.IGET_OBJECT, 0, 1, USER, patched && variant.equals("wrong-account-list") ? "j" : "k", LIST), returns(0, true)))));
        append(classes, PRIMARY, BASE + "mutual/HushPrimaryBlog;", List.of(getterBridge(PRIMARY, "hushMutualPrimary", "Z", "N0", "Z")));
        append(classes, SHORT, BASE + "mutual/HushMutualBlog;", List.of(getterBridge(SHORT, "hushMutualName", STRING, "m", STRING), getterBridge(SHORT, "hushMutualUuid", STRING, "Y", STRING)));
        append(classes, BLOG, BASE + "mutual/HushMutualBlog;", List.of(getterBridge(BLOG, "hushMutualName", STRING, "Z", STRING), getterBridge(BLOG, "hushMutualUuid", STRING, variant.equals("wrong-blog-uuid") ? "d0" : "t0", STRING)));
        append(classes, FOLLOWER, BASE + "mutual/HushMutualFollower;", List.of(getterBridge(FOLLOWER, "hushMutualFollowing", "Z", "isFollowing", "Z"), getterBridge(FOLLOWER, "hushMutualFollowerBlog", OBJECT, "getBlog", SHORT)));
        append(classes, PAGE, variant.equals("missing-page-interface") ? null : BASE + "mutual/HushMutualPage;", List.of(getterBridge(PAGE, "hushMutualUsers", LIST, "getUsers", LIST), getterBridge(PAGE, "hushMutualPagination", OBJECT, "getPaginationLinks", PAGINATION), getterBridge(PAGE, "hushMutualLinks", OBJECT, "getLinks", PAGINATION)));
        append(classes, PAGINATION, BASE + "mutual/HushMutualPagination;", List.of(getterBridge(PAGINATION, "hushMutualNext", OBJECT, "getNext", SIMPLE)));
        append(classes, LINK, BASE + "mutual/HushMutualLink;", List.of(getterBridge(LINK, "hushMutualLink", STRING, "getLink", STRING)));
        List<Instruction> status = new ArrayList<>(List.of(call(Opcode.INVOKE_VIRTUAL, API, "getMetaData", META, new int[]{1}), result(0, true), new ImmutableInstruction21t(Opcode.IF_EQZ, 0, 1),
                call(Opcode.INVOKE_VIRTUAL, META, "getStatus", "I", new int[]{0}), result(0, false), returns(0, false), integer(0, 0), returns(0, false)));
        branch(status, 2, variant.equals("unsafe-null-status") ? 3 : 6);
        append(classes, API, BASE + "mutual/HushMutualResponse;", List.of(getterBridge(API, "hushMutualResponse", OBJECT, "getResponse", OBJECT), method(API, "hushMutualStatus", "I", PUBLIC, 2, status)));
        List<Method> source = new ArrayList<>();
        for (String name : List.of("first", "next")) source.add(method(SOURCE, name, OBJECT, PUBLIC, 4, List.of(call(Opcode.INVOKE_STATIC, CORE, "Z", SERVICE, new int[]{}), result(0, true), literal(1, FIELDS),
                call(variant.equals("request-virtual") ? Opcode.INVOKE_VIRTUAL : Opcode.INVOKE_INTERFACE, SERVICE, name.equals("first") ? "followers" : "followersPagination", CALL, new int[]{0, 3, 1}, STRING, STRING), result(0, true), returns(0, true)), STRING));
        List<Instruction> execute = new ArrayList<>(List.of(new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 0, 5), type(Opcode.CHECK_CAST, 0, CALL), call(Opcode.INVOKE_INTERFACE, CALL, "timeout", "Lvsl;", new int[]{0}), result(1, true),
                new ImmutableInstruction21c(Opcode.SGET_OBJECT, 2, new ImmutableFieldReference(TIME_UNIT, "MILLISECONDS", TIME_UNIT)), call(Opcode.INVOKE_VIRTUAL, "Lvsl;", "timeout", "Lvsl;", new int[]{1, 6, 7, 2}, "J", TIME_UNIT),
                call(Opcode.INVOKE_INTERFACE, CALL, "execute", RESPONSE, new int[]{0}), result(1, true), call(Opcode.INVOKE_VIRTUAL, RESPONSE, "isSuccessful", "Z", new int[]{1}), result(2, false), new ImmutableInstruction21t(Opcode.IF_EQZ, 2, 1),
                call(Opcode.INVOKE_VIRTUAL, RESPONSE, "body", OBJECT, new int[]{1}), result(0, true), returns(0, true), integer(0, 0), returns(0, true)));
        branch(execute, 10, variant.equals("unsafe-http-body") ? 11 : 14);
        if (variant.equals("missing-timeout")) execute.set(5, new ImmutableInstruction10x(Opcode.NOP));
        source.add(method(SOURCE, "execute", OBJECT, PUBLIC, 8, execute, OBJECT, "J"));
        source.add(method(SOURCE, "cancel", "V", PUBLIC, 2, List.of(type(Opcode.CHECK_CAST, 1, CALL),
                variant.equals("missing-cancel") ? new ImmutableInstruction10x(Opcode.NOP) : call(Opcode.INVOKE_INTERFACE, CALL, "cancel", "V", new int[]{1}), end()), OBJECT));
        classes.put(SOURCE, clazz(SOURCE, OBJECT, List.of(), List.of(), source));
        String utils = "Lapp/hushtumblr/extension/shared/Utils;";
        classes.put(HELPER, clazz(HELPER, OBJECT, List.of(), List.of(), List.of(method(HELPER, "bind", "V", PUBLIC | STATIC, 3, List.of(call(Opcode.INVOKE_STATIC, utils, "settingsReady", "Z", new int[]{}), result(0, false), end()), OBJECT, OBJECT, STRING), method(HELPER, "clear", "V", PUBLIC | STATIC, 1, List.of(end()), OBJECT))));
    }

    public static void main(String[] args) throws Exception {
        Path output = Path.of(args[0]); Files.createDirectories(output); FeatureDexFixture.initialize(Path.of(args[1]));
        FeatureDexFixture.reset(); Map<String, ClassDef> clean = FeatureDexFixture.baseClasses(false); add(clean, false, "clean");
        DexPool.writeTo(output.resolve("mutual-clean.dex").toString(), new ImmutableDexFile(Opcodes.getDefault(), clean.values()));
        Map<String, String> variants = new LinkedHashMap<>(); variants.put("good", "");
        for (String value : List.of("missing-bind", "wrong-bind-blog", "bypass-bind", "missing-full-clear", "missing-detach-clear")) variants.put(value, "mutual header hook changed");
        variants.put("wrong-account-list", "mutual account bridge changed");
        for (String value : List.of("wrong-primary-constructor", "bypass-primary-default", "wrong-blog-uuid")) variants.put(value, "mutual blog bridge changed");
        for (String value : List.of("bypass-following-default", "missing-page-interface")) variants.put(value, "mutual follower page bridge changed");
        for (String value : List.of("unsafe-request-verb", "wrong-fields-query", "request-virtual", "missing-timeout", "unsafe-http-body", "missing-cancel")) variants.put(value, "mutual native requester changed");
        variants.put("unsafe-null-status", "mutual response bridge changed");
        List<String> cases = new ArrayList<>();
        for (Map.Entry<String, String> variant : variants.entrySet()) {
            FeatureDexFixture.reset(); FeatureDexFixture.enable("showMutualMarkers"); Map<String, ClassDef> classes = FeatureDexFixture.baseClasses(true); add(classes, true, variant.getKey());
            String name = "feature-mutual-" + variant.getKey(); DexPool.writeTo(output.resolve(name + ".dex").toString(), new ImmutableDexFile(Opcodes.getDefault(), classes.values()));
            Files.write(output.resolve(name + ".selected"), FeatureDexFixture.selected("showMutualMarkers"), StandardCharsets.UTF_8);
            cases.add(name + "|" + variant.getValue().isEmpty() + "|" + variant.getValue());
        }
        Files.write(output.resolve("mutual-cases.txt"), cases, StandardCharsets.UTF_8);
    }
}

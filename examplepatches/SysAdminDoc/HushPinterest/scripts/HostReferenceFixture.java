import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.MethodHandleType;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/** Compiles tiny multidex APKs for HostReferences, including declarations ordinary javac rejects. */
public class HostReferenceFixture {
    private static final int PUBLIC = AccessFlags.PUBLIC.getValue(), STATIC = AccessFlags.STATIC.getValue();
    private static final String OWN = "Lapp/hushpinterest/extension/pinterest/fixture/Consumer;";
    private static final String BASE = "Lcom/google/android/material/widget/FixtureBase;";
    private static final String CHILD = "Lcom/google/android/material/widget/FixtureWidget;";
    private static final String ACTIONS = "Lfixture/Actions;", HOST = "Lfixture/Host;";
    private static final String OBJECT = "Ljava/lang/Object;", VIEW = "Landroid/view/View;", TEXT = "Ljava/lang/CharSequence;";
    private static final ImmutableFieldReference SDK = new ImmutableFieldReference("Landroid/os/Build$VERSION;", "SDK_INT", "I");
    private static ImmutableMethodReference ref(String owner, String name, String result, String... params) {
        return new ImmutableMethodReference(owner, name, Arrays.asList(params), result);
    }
    private static final ImmutableMethodReference PRESENT = ref(CHILD, "present", "V");
    private static final ImmutableMethodReference NEW_API = ref(VIEW, "setStateDescription", "V", TEXT);
    private static final ImmutableMethodReference HELPER = ref(OWN, "guarded", "V", VIEW, TEXT);
    private static final ImmutableMethodReference BRIDGE = ref(OWN, "newerBridge", "V", VIEW, TEXT);
    private static final String LOCALE = "Landroid/app/LocaleManager;", INLINE = "Landroid/widget/inline/InlineContentView;";
    private static final ImmutableMethodReference OWNER_METHOD = ref(LOCALE, "toString", "Ljava/lang/String;");
    private static final ImmutableFieldReference OWNER_FIELD = new ImmutableFieldReference(INLINE, "VISIBLE", "I");
    private static final ImmutableMethodReference MEMBER_METHOD = ref(INLINE, "setScrollCaptureHint", "V", "I");
    private static final ImmutableFieldReference MEMBER_FIELD = new ImmutableFieldReference(INLINE, "SCROLL_CAPTURE_HINT_AUTO", "I");
    private static Instruction ret() { return new ImmutableInstruction10x(Opcode.RETURN_VOID); }
    private static Instruction call(Opcode op, ImmutableMethodReference reference, int... regs) {
        int[] args = new int[5]; System.arraycopy(regs, 0, args, 0, regs.length);
        return new ImmutableInstruction35c(op, regs.length, args[0], args[1], args[2], args[3], args[4], reference);
    }
    private static ImmutableMethod method(String owner, String name, int flags, int regs, List<Instruction> code, String... params) {
        List<ImmutableMethodParameter> parameters = new ArrayList<>();
        for (String p : params) parameters.add(new ImmutableMethodParameter(p, null, null));
        return new ImmutableMethod(owner, name, parameters, "V", flags, null, null,
                code == null ? null : new ImmutableMethodImplementation(regs, code, null, null));
    }
    private static ImmutableClassDef type(String name, int flags, String parent, List<String> interfaces,
                                          List<ImmutableField> fields, List<Method> methods) {
        return new ImmutableClassDef(name, flags, parent, interfaces, null, null, fields, methods);
    }
    private static ImmutableField field(String name, String value, int flags) {
        return new ImmutableField(BASE, name, value, flags, null, null, null);
    }
    private static List<ClassDef> library(String variant, boolean changedHost) {
        List<Method> methods = new ArrayList<>();
        methods.add(method(BASE, "<init>", PUBLIC, 2, List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
                call(Opcode.INVOKE_DIRECT, ref(VIEW, "<init>", "V", "Landroid/content/Context;"), 1, 0), ret())));
        if (!variant.equals("missing-method")) methods.add(method(BASE, "present",
                PUBLIC | (variant.equals("static-method") ? STATIC : 0), 1, List.of(ret())));
        if (!variant.equals("unreferenced-removal")) methods.add(method(BASE, "unusedMaterialMethod", PUBLIC, 1, List.of(ret())));
        methods.add(method(BASE, "hidden", AccessFlags.PRIVATE.getValue(), 1, List.of(ret())));
        List<ImmutableField> fields = new ArrayList<>();
        if (!variant.equals("missing-field")) fields.add(field("value", "I", PUBLIC | (variant.equals("static-field") ? STATIC : 0)));
        fields.add(field("COUNTER", "I", PUBLIC | STATIC));
        List<ClassDef> result = new ArrayList<>();
        if (!variant.equals("missing-parent")) result.add(type(BASE, PUBLIC, VIEW, List.of(), fields, methods));
        result.add(type(ACTIONS, PUBLIC | AccessFlags.INTERFACE.getValue() | AccessFlags.ABSTRACT.getValue(), OBJECT,
                List.of(), List.of(), List.of(method(ACTIONS, "perform", PUBLIC | AccessFlags.ABSTRACT.getValue(), 0, null))));
        result.add(type(CHILD, PUBLIC, BASE, List.of(ACTIONS), List.of(),
                List.of(method(CHILD, "perform", PUBLIC, 1, List.of(ret())))));
        boolean handles = variant.equals("bad-handle-register") || variant.equals("good-handle-register");
        List<Instruction> hostCode = handles ? List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
                call(Opcode.INVOKE_STATIC, ref(OWN, "use", "V", VIEW, TEXT), 2, 0), ret())
                : changedHost ? List.of(call(Opcode.INVOKE_VIRTUAL, PRESENT, 0), ret()) : List.of(ret());
        result.add(type(HOST, PUBLIC, OBJECT, List.of(), List.of(), List.of(method(HOST, "run", PUBLIC | STATIC,
                handles ? 3 : 1, hostCode, CHILD))));
        return result;
    }
    private static List<Instruction> goodCalls(String variant) {
        Opcode methodOp = variant.equals("direct-method") ? Opcode.INVOKE_DIRECT
                : variant.equals("interface-owner") ? Opcode.INVOKE_INTERFACE : Opcode.INVOKE_VIRTUAL;
        ImmutableMethodReference target = variant.equals("private-method") ? ref(CHILD, "hidden", "V")
                : variant.equals("inherited-constructor") ? ref(CHILD, "<init>", "V") : PRESENT;
        if (variant.equals("inherited-constructor")) methodOp = Opcode.INVOKE_DIRECT;
        ImmutableFieldReference value = new ImmutableFieldReference(CHILD, "value", "I");
        return List.of(call(methodOp, target, 2),
                new ImmutableInstruction22c(variant.equals("field-opcode") ? Opcode.IGET_OBJECT : Opcode.IGET, 0, 2, value),
                new ImmutableInstruction21c(Opcode.SGET, 0, new ImmutableFieldReference(CHILD, "COUNTER", "I")),
                call(Opcode.INVOKE_INTERFACE, ref(ACTIONS, "perform", "V"), 2),
                call(Opcode.INVOKE_VIRTUAL, ref(CHILD, "setVisibility", "V", "I"), 2, 0),
                call(Opcode.INVOKE_VIRTUAL, ref(CHILD, "toString", "Ljava/lang/String;"), 2), ret());
    }
    private static List<Instruction> guard(int since, ImmutableMethodReference target, boolean clobber) {
        List<Instruction> code = new ArrayList<>();
        code.add(new ImmutableInstruction21c(Opcode.SGET, 0, SDK));
        if (clobber) code.add(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0));
        code.add(new ImmutableInstruction21s(Opcode.CONST_16, 1, since));
        code.add(new ImmutableInstruction22t(Opcode.IF_LT, 0, 1, 5));
        code.add(call(target.getDefiningClass().equals(OWN) ? Opcode.INVOKE_STATIC : Opcode.INVOKE_VIRTUAL, target, 2, 3));
        code.add(ret());
        return code;
    }
    private static Method inheritedUse(String variant, int since, Instruction use, String... params) {
        List<Instruction> code = new ArrayList<>();
        if (!variant.startsWith("unguarded-")) {
            code.add(new ImmutableInstruction21c(Opcode.SGET, 0, SDK));
            code.add(new ImmutableInstruction21s(Opcode.CONST_16, 1, variant.startsWith("wrong-") ? since - 1 : since));
            code.add(new ImmutableInstruction22t(Opcode.IF_LT, 0, 1, use.getCodeUnits() + 2));
        }
        code.add(use); code.add(ret());
        return method(OWN, "use", PUBLIC | STATIC, 4, code, params);
    }
    private static List<ClassDef> extension(String variant) {
        List<Method> methods = new ArrayList<>();
        switch (variant) {
            case "guarded-owner-method": case "unguarded-owner-method": case "wrong-owner-method":
                methods.add(inheritedUse(variant, 33, call(Opcode.INVOKE_VIRTUAL, OWNER_METHOD, 3), LOCALE)); break;
            case "guarded-owner-field": case "unguarded-owner-field": case "wrong-owner-field":
                methods.add(inheritedUse(variant, 30, new ImmutableInstruction21c(Opcode.SGET, 2, OWNER_FIELD))); break;
            case "guarded-owner-method-handle": case "unguarded-owner-method-handle": case "wrong-owner-method-handle":
                methods.add(inheritedUse(variant, 33, new ImmutableInstruction21c(Opcode.CONST_METHOD_HANDLE, 2,
                        new ImmutableMethodHandleReference(MethodHandleType.INVOKE_INSTANCE, OWNER_METHOD)))); break;
            case "guarded-owner-field-handle": case "unguarded-owner-field-handle": case "wrong-owner-field-handle":
                methods.add(inheritedUse(variant, 30, new ImmutableInstruction21c(Opcode.CONST_METHOD_HANDLE, 2,
                        new ImmutableMethodHandleReference(MethodHandleType.STATIC_GET, OWNER_FIELD)))); break;
            case "guarded-member-method": case "unguarded-member-method": case "wrong-member-method":
                methods.add(inheritedUse(variant, 31, call(Opcode.INVOKE_VIRTUAL, MEMBER_METHOD, 2, 3), INLINE, "I")); break;
            case "guarded-member-field": case "unguarded-member-field": case "wrong-member-field":
                methods.add(inheritedUse(variant, 31, new ImmutableInstruction21c(Opcode.SGET, 2, MEMBER_FIELD))); break;
            case "guarded-member-method-handle": case "unguarded-member-method-handle": case "wrong-member-method-handle":
                methods.add(inheritedUse(variant, 31, new ImmutableInstruction21c(Opcode.CONST_METHOD_HANDLE, 2,
                        new ImmutableMethodHandleReference(MethodHandleType.INVOKE_INSTANCE, MEMBER_METHOD)))); break;
            case "guarded-member-field-handle": case "unguarded-member-field-handle": case "wrong-member-field-handle":
                methods.add(inheritedUse(variant, 31, new ImmutableInstruction21c(Opcode.CONST_METHOD_HANDLE, 2,
                        new ImmutableMethodHandleReference(MethodHandleType.STATIC_GET, MEMBER_FIELD)))); break;
            case "guarded": case "wrong-guard": case "clobbered-guard":
                methods.add(method(OWN, "use", PUBLIC | STATIC, 4,
                        guard(variant.equals("wrong-guard") ? 29 : 30, NEW_API, variant.equals("clobbered-guard")), VIEW, TEXT)); break;
            case "guarded-helper": case "unguarded-helper": case "escaped-helper": case "bad-handle-register": case "good-handle-register":
                methods.add(method(OWN, "guarded", AccessFlags.PRIVATE.getValue() | STATIC, 2,
                        List.of(call(Opcode.INVOKE_VIRTUAL, NEW_API, 0, 1), ret()), VIEW, TEXT));
                methods.add(method(OWN, "use", PUBLIC | STATIC, 4, variant.equals("unguarded-helper")
                        ? List.of(call(Opcode.INVOKE_STATIC, HELPER, 2, 3), ret()) : guard(30, HELPER, false), VIEW, TEXT));
                if (variant.equals("escaped-helper") || variant.endsWith("handle-register")) methods.add(method(OWN, "escape", PUBLIC | STATIC, 1,
                        List.of(new ImmutableInstruction21c(Opcode.CONST_METHOD_HANDLE, variant.equals("bad-handle-register") ? 1 : 0,
                                new ImmutableMethodHandleReference(MethodHandleType.INVOKE_STATIC, HELPER)), ret())));
                break;
            case "reviewed-bridge": case "unguarded-bridge":
                methods.add(method(OWN, "newerBridge", PUBLIC | STATIC, 2,
                        List.of(call(Opcode.INVOKE_VIRTUAL, NEW_API, 0, 1), ret()), VIEW, TEXT));
                methods.add(method(OWN, "use", PUBLIC | STATIC, 4, variant.equals("unguarded-bridge")
                        ? List.of(call(Opcode.INVOKE_STATIC, BRIDGE, 2, 3), ret()) : guard(30, BRIDGE, false), VIEW, TEXT)); break;
            case "bypass-guard": {
                List<Instruction> code = new ArrayList<>();
                code.add(new ImmutableInstruction21t(Opcode.IF_EQZ, 4, 8)); code.addAll(guard(30, NEW_API, false));
                methods.add(method(OWN, "use", PUBLIC | STATIC, 5, code, VIEW, TEXT, "I")); break;
            }
            case "exception-bypass": {
                List<Instruction> code = new ArrayList<>(guard(30, NEW_API, false));
                code.add(new ImmutableInstruction11x(Opcode.MOVE_EXCEPTION, 0));
                code.add(call(Opcode.INVOKE_VIRTUAL, NEW_API, 2, 3)); code.add(ret());
                methods.add(new ImmutableMethod(OWN, "use", List.of(new ImmutableMethodParameter(VIEW, null, null),
                        new ImmutableMethodParameter(TEXT, null, null)), "V", PUBLIC | STATIC, null, null,
                        new ImmutableMethodImplementation(4, code, List.of(new ImmutableTryBlock(0, 10,
                                List.of(new ImmutableExceptionHandler("Ljava/lang/Throwable;", 10)))), null))); break;
            }
            case "unguarded-api":
                methods.add(method(OWN, "use", PUBLIC | STATIC, 2, List.of(call(Opcode.INVOKE_VIRTUAL, NEW_API, 0, 1), ret()), VIEW, TEXT)); break;
            case "missing-framework":
                methods.add(method(OWN, "use", PUBLIC | STATIC, 1,
                        List.of(call(Opcode.INVOKE_VIRTUAL, ref(VIEW, "notAnAndroidMethod", "V"), 0), ret()), VIEW)); break;
            case "array-clone":
                methods.add(method(OWN, "use", PUBLIC | STATIC, 1, List.of(call(Opcode.INVOKE_VIRTUAL,
                        ref("[Ljava/lang/String;", "clone", OBJECT), 0), ret()), "[Ljava/lang/String;")); break;
            case "empty": case "changed-host": case "changed-host-missing":
                methods.add(method(OWN, "use", PUBLIC | STATIC, 0, List.of(ret()))); break;
            default: methods.add(method(OWN, "use", PUBLIC | STATIC, 3, goodCalls(variant), CHILD));
        }
        return List.of(type(OWN, PUBLIC, OBJECT, List.of(), List.of(), methods));
    }
    private static void write(File output, String name, List<ClassDef> library, List<ClassDef> extension) throws Exception {
        File host = new File(output, name + "-host.dex"), own = new File(output, name + "-extension.dex");
        DexPool.writeTo(host.getPath(), new ImmutableDexFile(Opcodes.forApi(28), library));
        if (!extension.isEmpty()) DexPool.writeTo(own.getPath(), new ImmutableDexFile(Opcodes.forApi(28), extension));
        try (ZipOutputStream zip = new ZipOutputStream(Files.newOutputStream(new File(output, name + ".apk").toPath()))) {
            zip.putNextEntry(new ZipEntry("classes.dex")); Files.copy(host.toPath(), zip); zip.closeEntry();
            if (!extension.isEmpty()) { zip.putNextEntry(new ZipEntry("classes2.dex")); Files.copy(own.toPath(), zip); zip.closeEntry(); }
        }
        Files.delete(host.toPath()); if (!extension.isEmpty()) Files.delete(own.toPath());
    }
    public static void main(String[] args) throws Exception {
        File output = new File(args[0]); Files.createDirectories(output.toPath());
        write(output, "clean", library("good", false), List.of());
        List<String> cases = new ArrayList<>(List.of("good", "missing-method", "unreferenced-removal", "missing-field", "missing-parent",
                "static-method", "static-field", "direct-method", "interface-owner", "private-method", "inherited-constructor",
                "field-opcode", "missing-framework", "unguarded-api", "guarded", "wrong-guard", "clobbered-guard", "bypass-guard",
                "exception-bypass", "guarded-helper", "unguarded-helper", "escaped-helper", "bad-handle-register", "good-handle-register", "reviewed-bridge", "unguarded-bridge",
                "array-clone", "empty", "changed-host", "changed-host-missing"));
        for (String family : List.of("owner-method", "owner-field", "owner-method-handle", "owner-field-handle",
                "member-method", "member-field", "member-method-handle", "member-field-handle"))
            for (String guard : List.of("guarded", "unguarded", "wrong")) cases.add(guard + '-' + family);
        for (String name : cases) write(output, name,
                library(name.equals("changed-host-missing") ? "missing-method" : name, name.startsWith("changed-host")), extension(name));
        Files.writeString(new File(output, "reviewed.txt").toPath(), "api-entry " + BRIDGE + " since 30\n", StandardCharsets.UTF_8);
        Files.writeString(new File(output, "stale.txt").toPath(), "api-entry " + OWN + "->missing()V since 30\n", StandardCharsets.UTF_8);
        Files.writeString(new File(output, "empty-removals.txt").toPath(), "", StandardCharsets.UTF_8);
        System.out.println("[host-reference-fixtures] compiled " + cases.size() + " multidex cases");
    }
}

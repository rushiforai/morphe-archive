package santodan.patches;

import app.morphe.patcher.patch.BytecodePatch;
import app.morphe.patcher.patch.PatchKt;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import kotlin.Unit;

/** Spoof only the identity sent to MEO's provisioning service, not Android's global Build values. */
public final class MeoDeviceSpoofPatch {
    public static final String NAME = "MEO - Spoof supported device";
    static final String PACKAGE = "com.alticelabs.meo.androidtv";
    static final String VERSION = "5.7.0";
    static final String DEVICE_INFO_FACTORY = "Lz64;";
    static final String DEVICE_INFO = "Lcom/alticelabs/meo/androidtv/core/deviceinfo/DeviceInfo;";
    static final String WARNING_MAPPER = "Lqz2;";
    static final String SPOOF_MANUFACTURER = "Sagemcom";
    static final String SPOOF_MODEL = "DIW3930";
    private static final Logger LOG = Logger.getLogger("app.morphe.patches.santodan");

    private MeoDeviceSpoofPatch() {}

    @SuppressWarnings({"unchecked", "deprecation"})
    public static BytecodePatch getMeoDeviceSpoofPatch() {
        return PatchKt.bytecodePatch(NAME,
            "Reports a Sagemcom DIW3930 to MEO provisioning and skips the server's non-blocking device-verification warning.",
            false, builder -> {
                builder.compatibleWith(MeoCompatibility.create());
                builder.execute(context -> {
                    if (!PACKAGE.equals(context.getPackageMetadata().getPackageName())
                        || !VERSION.equals(context.getPackageMetadata().getVersionName()))
                        throw unsupported("Expected " + PACKAGE + " " + VERSION);
                    List<ClassDef> classes = new ArrayList<>();
                    context.classDefForEach(c -> { classes.add(c); return Unit.INSTANCE; });
                    Match match = findUnique(classes);
                    MutableMethod target = context.mutableClassDefBy(DEVICE_INFO_FACTORY).getMethods().stream()
                        .filter(m -> m.equals(match.method)).findFirst()
                        .orElseThrow(() -> unsupported("Device-info factory cannot be made mutable"));
                    replace(target, match.manufacturerIndex, SPOOF_MANUFACTURER);
                    replace(target, match.modelIndex, SPOOF_MODEL);
                    MutableMethod warningTarget = context.mutableClassDefBy(WARNING_MAPPER).getMethods().stream()
                        .filter(m -> m.equals(match.warningMethod)).findFirst()
                        .orElseThrow(() -> unsupported("Provisioning warning mapper cannot be made mutable"));
                    suppressWarning(warningTarget, match.warningResultIndex);
                    LOG.info("SantoDan: MEO provisioning identity set to Sagemcom DIW3930 and its non-blocking verification warning suppressed.");
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
    }

    static final class Match {
        final Method method;
        final int manufacturerIndex;
        final int modelIndex;
        final Method warningMethod;
        final int warningResultIndex;
        Match(Method method, int manufacturerIndex, int modelIndex, Method warningMethod, int warningResultIndex) {
            this.method = method;
            this.manufacturerIndex = manufacturerIndex;
            this.modelIndex = modelIndex;
            this.warningMethod = warningMethod;
            this.warningResultIndex = warningResultIndex;
        }
    }

    static IllegalStateException unsupported(String reason) {
        return new IllegalStateException("Unsupported MEO bytecode: " + reason
            + ". No fallback patch was applied. Use the original MEO 5.7.0 APKM.");
    }

    static List<Instruction> instructions(Method method) {
        List<Instruction> result = new ArrayList<>();
        if (method.getImplementation() != null)
            for (Instruction instruction : method.getImplementation().getInstructions()) result.add(instruction);
        return result;
    }

    static boolean deviceInfoConstructor(Instruction instruction) {
        if (!(instruction instanceof ReferenceInstruction)) return false;
        Object reference = ((ReferenceInstruction) instruction).getReference();
        if (!(reference instanceof MethodReference)) return false;
        MethodReference method = (MethodReference) reference;
        return DEVICE_INFO.equals(method.getDefiningClass()) && "<init>".equals(method.getName())
            && "V".equals(method.getReturnType()) && method.getParameterTypes().size() == 17;
    }

    static Match findUnique(List<? extends ClassDef> classes) {
        List<Method> deviceMethods = new ArrayList<>();
        List<int[]> deviceIndices = new ArrayList<>();
        List<Method> warningMethods = new ArrayList<>();
        List<Integer> warningIndices = new ArrayList<>();
        for (ClassDef classDef : classes) {
            if (WARNING_MAPPER.equals(classDef.getType())) {
                for (Method method : classDef.getMethods()) {
                    if (!"a".equals(method.getName()) || !"Ljava/lang/Object;".equals(method.getReturnType())
                        || method.getParameterTypes().size() != 1
                        || !"Ljava/lang/Object;".contentEquals(method.getParameterTypes().get(0))) continue;
                    List<Instruction> ins = instructions(method);
                    boolean warningPreference = ins.stream().anyMatch(i -> string(i, "show_equipment_warning"));
                    if (!warningPreference) continue;
                    for (int index = 0; index + 1 < ins.size(); index++) {
                        if (calls(ins.get(index), "Landroid/content/SharedPreferences;", "getBoolean", "Z",
                                "Ljava/lang/String;", "Z")
                            && ins.get(index + 1).getOpcode() == Opcode.MOVE_RESULT) {
                            warningMethods.add(method);
                            warningIndices.add(index + 1);
                        }
                    }
                }
            }
            if (!DEVICE_INFO_FACTORY.equals(classDef.getType())) continue;
            for (Method method : classDef.getMethods()) {
                if (!"b".equals(method.getName()) || !DEVICE_INFO.equals(method.getReturnType())
                    || method.getParameterTypes().size() != 1
                    || !"Landroid/content/Context;".contentEquals(method.getParameterTypes().get(0))) continue;
                List<Instruction> ins = instructions(method);
                boolean constructsDeviceInfo = ins.stream().anyMatch(MeoDeviceSpoofPatch::deviceInfoConstructor);
                if (!constructsDeviceInfo) continue;
                int manufacturer = -1;
                int model = -1;
                for (int index = 0; index < ins.size(); index++) {
                    Instruction instruction = ins.get(index);
                    if (instruction.getOpcode() != Opcode.SGET_OBJECT || !(instruction instanceof ReferenceInstruction)) continue;
                    Object reference = ((ReferenceInstruction) instruction).getReference();
                    if (!(reference instanceof FieldReference)) continue;
                    FieldReference field = (FieldReference) reference;
                    if (!"Landroid/os/Build;".equals(field.getDefiningClass()) || !"Ljava/lang/String;".equals(field.getType())) continue;
                    if ("MANUFACTURER".equals(field.getName())) {
                        if (manufacturer >= 0) throw unsupported("Multiple manufacturer reads in the provisioning factory");
                        manufacturer = index;
                    } else if ("MODEL".equals(field.getName())) {
                        if (model >= 0) throw unsupported("Multiple model reads in the provisioning factory");
                        model = index;
                    }
                }
                if (manufacturer >= 0 && model >= 0) {
                    deviceMethods.add(method);
                    deviceIndices.add(new int[]{manufacturer, model});
                }
            }
        }
        if (deviceMethods.size() != 1)
            throw unsupported("Expected exactly one provisioning device-info factory; found " + deviceMethods.size());
        if (warningMethods.size() != 1)
            throw unsupported("Expected exactly one equipment-warning preference read; found " + warningMethods.size());
        return new Match(deviceMethods.get(0), deviceIndices.get(0)[0], deviceIndices.get(0)[1],
            warningMethods.get(0), warningIndices.get(0));
    }

    static boolean string(Instruction instruction, String value) {
        if (!(instruction instanceof ReferenceInstruction)) return false;
        Object reference = ((ReferenceInstruction) instruction).getReference();
        return reference instanceof StringReference && value.equals(((StringReference) reference).getString());
    }

    static boolean calls(Instruction instruction, String owner, String name, String result, String... parameters) {
        if (!(instruction instanceof ReferenceInstruction)) return false;
        Object reference = ((ReferenceInstruction) instruction).getReference();
        if (!(reference instanceof MethodReference)) return false;
        MethodReference method = (MethodReference) reference;
        if (!owner.equals(method.getDefiningClass()) || !name.equals(method.getName())
            || !result.equals(method.getReturnType()) || method.getParameterTypes().size() != parameters.length) return false;
        for (int index = 0; index < parameters.length; index++)
            if (!parameters[index].contentEquals(method.getParameterTypes().get(index))) return false;
        return true;
    }

    static void replace(MutableMethod method, int index, String value) {
        Instruction original = instructions(method).get(index);
        if (original.getOpcode() != Opcode.SGET_OBJECT || !(original instanceof OneRegisterInstruction))
            throw unsupported("Provisioning identity read changed before patch execution");
        method.getImplementation().replaceInstruction(index,
            new BuilderInstruction21c(Opcode.CONST_STRING,
                ((OneRegisterInstruction) original).getRegisterA(), new ImmutableStringReference(value)));
    }

    static void suppressWarning(MutableMethod method, int index) {
        Instruction original = instructions(method).get(index);
        if (original.getOpcode() != Opcode.MOVE_RESULT || !(original instanceof OneRegisterInstruction))
            throw unsupported("Equipment-warning preference read changed before patch execution");
        int register = ((OneRegisterInstruction) original).getRegisterA();
        if (register > 15) throw unsupported("Equipment-warning result register is too large");
        method.getImplementation().replaceInstruction(index, new BuilderInstruction11n(Opcode.CONST_4, register, 0));
    }
}

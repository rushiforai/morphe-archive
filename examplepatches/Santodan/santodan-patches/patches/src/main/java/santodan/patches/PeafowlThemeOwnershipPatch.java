package santodan.patches;

import app.morphe.patcher.patch.BytecodePatch;
import app.morphe.patcher.patch.PatchKt;
import app.morphe.patcher.patch.ApkFileType;
import app.morphe.patcher.patch.AppTarget;
import app.morphe.patcher.patch.Compatibility;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import java.util.*;
import java.util.logging.Logger;
import kotlin.Unit;

/** Route theme initialization through the existing free-theme path, before billing. */
public final class PeafowlThemeOwnershipPatch {
    public static final String NAME = "Peafowl - Unlock Theme Ownership (Experimental)";
    static final String PACKAGE = "h7.hamzio.emuithemeotg";
    static final String VERSION = "GMS_27.5.1";
    static final String PREVIEW = "Lh7/hamzio7/peafowl/activities/ThemePreviewActivity;";
    private static final Logger LOG = Logger.getLogger("app.morphe.patches.santodan");

    private PeafowlThemeOwnershipPatch() {}

    @SuppressWarnings({"unchecked", "deprecation"})
    public static BytecodePatch getPeafowlThemeOwnershipPatch() {
        return PatchKt.bytecodePatch(NAME,
            "Use Peafowl's local free-theme path without the billing preflight. Experimental; server downloads are not guaranteed.",
            false, builder -> {
                builder.compatibleWith(new Compatibility(
                    PACKAGE,
                    "Peafowl Theme Maker for EMUI",
                    null,
                    ApkFileType.APK,
                    null,
                    null,
                    Collections.singletonList(new AppTarget(VERSION, false, null)),
                    false
                ));
                builder.execute(context -> {
                    if (!PACKAGE.equals(context.getPackageMetadata().getPackageName())
                        || !VERSION.equals(context.getPackageMetadata().getVersionName()))
                        throw unsupported("Expected " + PACKAGE + " " + VERSION);
                    List<ClassDef> classes = new ArrayList<>();
                    context.classDefForEach(c -> { classes.add(c); return Unit.INSTANCE; });
                    Match match = findUnique(classes);
                    MutableMethod target = null;
                    for (MutableMethod m : context.mutableClassDefBy(match.method.getDefiningClass()).getMethods())
                        if (m.equals(match.method)) { target = m; break; }
                    if (target == null) throw unsupported("Matched theme initialization cannot be made mutable");
                    apply(target, match);
                    LOG.info("SantoDan 0.1.1: routed theme initialization through the existing free-theme path in "
                        + target + "; the theme offerings/customer-info preflight is skipped.");
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
    }

    static final class Match {
        final Method method;
        final int resultIndex, freeIndex, offeringsIndex;
        Match(Method method, int resultIndex, int freeIndex, int offeringsIndex) {
            this.method = method;
            this.resultIndex = resultIndex;
            this.freeIndex = freeIndex;
            this.offeringsIndex = offeringsIndex;
        }
    }

    static IllegalStateException unsupported(String reason) {
        return new IllegalStateException("Unsupported Peafowl bytecode: " + reason
            + ". No fallback patch was applied. Use the original GMS_27.5.1 APK.");
    }

    static List<Instruction> instructions(Method method) {
        List<Instruction> result = new ArrayList<>();
        if (method.getImplementation() != null)
            for (Instruction i : method.getImplementation().getInstructions()) result.add(i);
        return result;
    }

    static boolean signature(MethodReference m, String result, String... parameters) {
        if (!result.equals(m.getReturnType()) || m.getParameterTypes().size() != parameters.length) return false;
        for (int n = 0; n < parameters.length; n++)
            if (!parameters[n].contentEquals(m.getParameterTypes().get(n))) return false;
        return true;
    }

    static boolean calls(Instruction instruction, String owner, String name, String result, String... parameters) {
        if (!(instruction instanceof ReferenceInstruction)) return false;
        Object r = ((ReferenceInstruction) instruction).getReference();
        if (!(r instanceof MethodReference)) return false;
        MethodReference m = (MethodReference) r;
        return owner.equals(m.getDefiningClass()) && name.equals(m.getName()) && signature(m, result, parameters);
    }

    static boolean string(Instruction i, String text) {
        if (!(i instanceof ReferenceInstruction)) return false;
        Object r = ((ReferenceInstruction) i).getReference();
        return r instanceof StringReference && text.equals(((StringReference) r).getString());
    }

    static int branchTarget(List<Instruction> ins, int branch) {
        int target = ((OffsetInstruction) ins.get(branch)).getCodeOffset();
        for (int n = 0; n < branch; n++) target += ins.get(n).getCodeUnits();
        int address = 0;
        for (int n = 0; n < ins.size(); n++) {
            if (address == target) return n;
            address += ins.get(n).getCodeUnits();
        }
        return -1;
    }

    static Match findUnique(List<? extends ClassDef> classes) {
        List<Match> matches = new ArrayList<>();
        for (ClassDef c : classes) {
            if (!PREVIEW.equals(c.getType())) continue;
            for (Method m : c.getMethods()) {
                if (!signature(m, "V", "Landroid/content/Intent;")) continue;
                List<Instruction> ins = instructions(m);
                if (ins.size() != 97 || !ins.stream().anyMatch(i -> string(i, "sku"))
                    || !ins.stream().anyMatch(i -> string(i, "getThemeData: "))) continue;
                for (int index = 2; index + 3 < ins.size(); index++) {
                    if (!string(ins.get(index - 2), "free")
                        || ins.get(index - 1).getOpcode() != Opcode.INVOKE_VIRTUAL
                        || !calls(ins.get(index - 1), "Ljava/lang/String;", "equals", "Z", "Ljava/lang/Object;")
                        || ins.get(index).getOpcode() != Opcode.MOVE_RESULT
                        || ins.get(index + 1).getOpcode() != Opcode.XOR_INT_LIT8
                        || ins.get(index + 2).getOpcode() != Opcode.IPUT_BOOLEAN
                        || ins.get(index + 3).getOpcode() != Opcode.IF_NEZ) continue;
                    int result = ((OneRegisterInstruction) ins.get(index)).getRegisterA();
                    FiveRegisterInstruction equals = (FiveRegisterInstruction) ins.get(index - 1);
                    if (result > 15 || equals.getRegisterCount() != 2
                        || equals.getRegisterD() != ((OneRegisterInstruction) ins.get(index - 2)).getRegisterA()) continue;
                    TwoRegisterInstruction xor = (TwoRegisterInstruction) ins.get(index + 1);
                    TwoRegisterInstruction store = (TwoRegisterInstruction) ins.get(index + 2);
                    FieldReference field = (FieldReference) ((ReferenceInstruction) ins.get(index + 2)).getReference();
                    if (xor.getRegisterB() != result || xor.getRegisterA() == result
                        || ((NarrowLiteralInstruction) ins.get(index + 1)).getNarrowLiteral() != 1
                        || store.getRegisterA() != xor.getRegisterA()
                        || !PREVIEW.equals(field.getDefiningClass()) || !"Z".equals(field.getType())
                        || ((OneRegisterInstruction) ins.get(index + 3)).getRegisterA() != result) continue;
                    int free = branchTarget(ins, index + 3);
                    if (free <= index + 4 || free + 5 >= ins.size()) continue;
                    // The paid path requests offerings, then jumps over Handler.post on the free path.
                    int offerings = free - 2;
                    if (ins.get(offerings).getOpcode() != Opcode.INVOKE_VIRTUAL
                        || !calls(ins.get(offerings), "Lcom/revenuecat/purchases/Purchases;", "getOfferings", "V",
                            "Lcom/revenuecat/purchases/interfaces/ReceiveOfferingsCallback;")
                        || ins.get(free - 1).getOpcode() != Opcode.GOTO
                        || branchTarget(ins, free - 1) != free + 5
                        || ins.get(free).getOpcode() != Opcode.IGET_OBJECT
                        || ins.get(free + 1).getOpcode() != Opcode.NEW_INSTANCE
                        || ins.get(free + 2).getOpcode() != Opcode.CONST_4
                        || ((NarrowLiteralInstruction) ins.get(free + 2)).getNarrowLiteral() != 0
                        || ins.get(free + 3).getOpcode() != Opcode.INVOKE_DIRECT
                        || !calls(ins.get(free + 4), "Landroid/os/Handler;", "post", "Z", "Ljava/lang/Runnable;")
                        || !string(ins.get(free + 5), "contents")) continue;
                    matches.add(new Match(m, index, free, offerings));
                }
            }
        }
        if (matches.size() != 1) throw unsupported("Expected exactly one theme classification; found " + matches.size());
        return matches.get(0);
    }

    static void apply(MutableMethod target, Match match) {
        Instruction result = instructions(target).get(match.resultIndex);
        if (result.getOpcode() != Opcode.MOVE_RESULT || ((OneRegisterInstruction) result).getRegisterA() > 15)
            throw unsupported("Theme classification changed before patch execution");
        // Same register and width. XOR clears the paid flag; IF_NEZ selects the existing
        // asynchronous free-theme path. The original product ID and theme data remain.
        target.getImplementation().replaceInstruction(match.resultIndex,
            new BuilderInstruction11n(Opcode.CONST_4, ((OneRegisterInstruction) result).getRegisterA(), 1));
    }
}

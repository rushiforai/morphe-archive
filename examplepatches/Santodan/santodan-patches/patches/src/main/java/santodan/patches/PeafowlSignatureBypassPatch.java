package santodan.patches;

import app.morphe.patcher.patch.BytecodePatch;
import app.morphe.patcher.patch.PatchKt;
import app.morphe.patcher.patch.ApkFileType;
import app.morphe.patcher.patch.AppTarget;
import app.morphe.patcher.patch.Compatibility;
import app.morphe.patcher.patch.FormFactor;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import com.android.tools.smali.dexlib2.iface.reference.TypeReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Logger;
import kotlin.Unit;

/**
 * Let a resigned Peafowl build start by neutralizing the app's own launch-time
 * signing-certificate check in {@code PeafowlApplication.onCreate}.
 *
 * <p>That method runs {@code super.onCreate()} and then verifies the app's signing
 * certificate (SHA-256 of {@code signingInfo}/legacy {@code signatures}) against a
 * built-in list; its only success exit is {@code return-void} and its only failure
 * exit is {@code throw new SecurityException("Application signature verification failed.")}.
 * Re-signing with a custom key makes the check fail, so the app aborts before any UI.
 * This replaces that final {@code throw} with an equal-width {@code return-void}: the
 * verification still runs, but a mismatch no longer kills the process. It performs no
 * Pairip/license change and spoofs no certificate.
 */
public final class PeafowlSignatureBypassPatch {
    public static final String NAME = "Peafowl - Bypass Signature Verification (Experimental)";
    static final String PACKAGE = "h7.hamzio.emuithemeotg";
    static final String VERSION = "GMS_27.5.2";
    static final String APPLICATION = "Lh7/hamzio7/peafowl/PeafowlApplication;";
    static final String MESSAGE = "Application signature verification failed.";
    private static final Logger LOG = Logger.getLogger("app.morphe.patches.santodan");

    private PeafowlSignatureBypassPatch() {}

    @SuppressWarnings({"unchecked", "deprecation"})
    public static BytecodePatch getPeafowlSignatureBypassPatch() {
        return PatchKt.bytecodePatch(NAME,
            "Allow a resigned Peafowl build to launch by neutralizing its own signing-certificate "
                + "check. Required because GMS_27.5.2 verifies its signature at startup. Experimental.",
            false, builder -> {
                builder.compatibleWith(new Compatibility(
                    PACKAGE,
                    "Peafowl Theme Maker for EMUI",
                    null,
                    ApkFileType.XAPK,
                    null,
                    null,
                    Collections.singletonList(new AppTarget(VERSION, null, false, null, null)),
                    FormFactor.MOBILE, false
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
                    if (target == null) throw unsupported("Matched signature verifier cannot be made mutable");
                    apply(target, match);
                    LOG.info("SantoDan: neutralized Peafowl signing-certificate self-check in "
                        + target + "; a signature mismatch now returns instead of throwing.");
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
    }

    static final class Match {
        final Method method;
        final int throwIndex;
        Match(Method method, int throwIndex) {
            this.method = method;
            this.throwIndex = throwIndex;
        }
    }

    static IllegalStateException unsupported(String reason) {
        return new IllegalStateException("Unsupported Peafowl bytecode: " + reason
            + ". No fallback patch was applied. Use the original " + VERSION + " APK.");
    }

    static List<Instruction> instructions(Method method) {
        List<Instruction> result = new ArrayList<>();
        if (method.getImplementation() != null)
            for (Instruction i : method.getImplementation().getInstructions()) result.add(i);
        return result;
    }

    static boolean string(Instruction i, String text) {
        if (!(i instanceof ReferenceInstruction)) return false;
        Object r = ((ReferenceInstruction) i).getReference();
        return r instanceof StringReference && text.equals(((StringReference) r).getString());
    }

    static boolean type(Instruction i, String descriptor) {
        if (!(i instanceof ReferenceInstruction)) return false;
        Object r = ((ReferenceInstruction) i).getReference();
        return r instanceof TypeReference && descriptor.equals(((TypeReference) r).getType());
    }

    static boolean callsSuperOnCreate(Instruction i) {
        if (i.getOpcode() != Opcode.INVOKE_SUPER || !(i instanceof ReferenceInstruction)) return false;
        Object r = ((ReferenceInstruction) i).getReference();
        if (!(r instanceof MethodReference)) return false;
        MethodReference m = (MethodReference) r;
        return "Landroid/app/Application;".equals(m.getDefiningClass())
            && "onCreate".equals(m.getName()) && "V".equals(m.getReturnType())
            && m.getParameterTypes().isEmpty();
    }

    static Match findUnique(List<? extends ClassDef> classes) {
        List<Match> matches = new ArrayList<>();
        for (ClassDef c : classes) {
            if (!APPLICATION.equals(c.getType())) continue;
            for (Method m : c.getMethods()) {
                if (!"onCreate".equals(m.getName()) || !"V".equals(m.getReturnType())
                    || !m.getParameterTypes().isEmpty()) continue;
                List<Instruction> ins = instructions(m);
                if (ins.isEmpty() || !callsSuperOnCreate(ins.get(0))) continue;
                if (ins.stream().noneMatch(i -> string(i, MESSAGE))
                    || ins.stream().noneMatch(i -> string(i, "SHA-256"))) continue;
                // The verifier ends with: new-instance SecurityException; const-string MESSAGE;
                // invoke-direct <init>(String); throw. That throw is the only failure exit.
                int throwIndex = -1;
                for (int n = 3; n < ins.size(); n++) {
                    if (ins.get(n).getOpcode() != Opcode.THROW
                        || ins.get(n - 1).getOpcode() != Opcode.INVOKE_DIRECT
                        || !string(ins.get(n - 2), MESSAGE)
                        || ins.get(n - 3).getOpcode() != Opcode.NEW_INSTANCE
                        || !type(ins.get(n - 3), "Ljava/lang/SecurityException;")) continue;
                    int thrown = ((OneRegisterInstruction) ins.get(n)).getRegisterA();
                    if (thrown != ((OneRegisterInstruction) ins.get(n - 3)).getRegisterA()) continue;
                    if (throwIndex != -1) throw unsupported("Multiple SecurityException throws in the verifier");
                    throwIndex = n;
                }
                if (throwIndex == -1) continue;
                matches.add(new Match(m, throwIndex));
            }
        }
        if (matches.size() != 1) throw unsupported("Expected exactly one signature verifier; found " + matches.size());
        return matches.get(0);
    }

    static void apply(MutableMethod target, Match match) {
        Instruction thrown = instructions(target).get(match.throwIndex);
        if (thrown.getOpcode() != Opcode.THROW)
            throw unsupported("Signature verifier changed before patch execution");
        // Equal-width (one code unit) replacement: a failed verification returns cleanly
        // instead of throwing SecurityException. Every other instruction is preserved.
        target.getImplementation().replaceInstruction(match.throwIndex,
            new BuilderInstruction10x(Opcode.RETURN_VOID));
    }
}

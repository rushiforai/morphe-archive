package santodan.patches;

import app.morphe.patcher.patch.ApkFileType;
import app.morphe.patcher.patch.AppTarget;
import app.morphe.patcher.patch.BytecodePatch;
import app.morphe.patcher.patch.Compatibility;
import app.morphe.patcher.patch.PatchKt;
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22c;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.net.URI;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import kotlin.Unit;

/** Adds an opt-in aired/unwatched episode count to Nuvio's Continue Watching cards. */
public final class NuvioRemainingEpisodesPatch {
    public static final String NAME = "NuvioTV - Remaining episodes in Continue Watching";
    static final String PACKAGE = "com.nuvio.tv";
    static final String VERSION = "1.1.0-beta.2";
    static final String EXTENSION = "Lsoftware/santodan/extension/nuvioremaining/NuvioRemainingEpisodes;";

    private NuvioRemainingEpisodesPatch() {}

    @SuppressWarnings({"unchecked", "deprecation"})
    public static BytecodePatch getNuvioRemainingEpisodesPatch() {
        return PatchKt.bytecodePatch(NAME,
            "Adds a disabled-by-default Continue Watching setting that displays aired, unwatched episode counts for every tracking integration.",
            false, builder -> {
                builder.compatibleWith(new Compatibility(PACKAGE, "NuvioTV", null, ApkFileType.APK,
                    null, null, Collections.singletonList(
                        new AppTarget(VERSION, false, null)), false));
                builder.extendWith(NuvioRemainingEpisodesPatch::extensionStream);
                builder.execute(context -> {
                    String version = context.getPackageMetadata().getVersionName();
                    if (!PACKAGE.equals(context.getPackageMetadata().getPackageName())
                        || !VERSION.equals(version))
                        throw unsupported("Expected " + PACKAGE + " " + VERSION);
                    String state = "Lza/k3;";
                    hookNextUpModel(context.mutableClassDefBy("Lza/s8;"));
                    hookHomeState(context.mutableClassDefBy(state));
                    hookEpisodeSets(context.mutableClassDefBy("Lza/z4;"), state);
                    hookSettings(context.mutableClassDefBy("Lfb/t6;"), 0x7f1106a7);
                    hookCard(context.mutableClassDefBy("Lpa/q0;"), "Lfb/jk;");
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
    }

    static void hookHomeState(MutableClass owner) {
        MutableMethod target = unique(owner, "<init>", 22);
        int instance = parameterStart(target);
        if (instance < 0 || instance > 65535)
            throw unsupported("Home state constructor instance register changed");
        List<Instruction> ins = instructions(target);
        int returns = 0;
        for (int i = 0; i < ins.size(); i++) if (ins.get(i).getOpcode() == Opcode.RETURN_VOID) {
            target.getImplementation().addInstruction(i,
                new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, instance, 1,
                    method(EXTENSION, "registerState", Collections.singletonList("Ljava/lang/Object;"), "V")));
            returns++;
        }
        if (returns != 1) throw unsupported("Home state constructor layout changed");
    }

    static void hookNextUpModel(MutableClass owner) {
        MutableMethod target = unique(owner, "<init>", 26);
        List<Instruction> ins = instructions(target);
        int instance = parameterStart(target);
        if (instance < 0 || instance > 15)
            throw unsupported("NextUpInfo constructor instance register changed");
        int returns = 0;
        for (int i = 0; i < ins.size(); i++) if (ins.get(i).getOpcode() == Opcode.RETURN_VOID) {
            target.getImplementation().addInstruction(i,
                new BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, instance, 0, 0, 0, 0,
                    method(EXTENSION, "register", Collections.singletonList("Ljava/lang/Object;"), "V")));
            returns++;
        }
        if (returns != 1) throw unsupported("NextUpInfo constructor layout changed");
    }

    static void hookEpisodeSets(MutableClass owner, String stateType) {
        MutableMethod target = unique(owner, "g", 2);
        if (target.getImplementation().getRegisterCount() != 13)
            throw unsupported("Aired/watched reconciliation register layout changed");
        target.getImplementation().addInstruction(0,
            new BuilderInstruction22c(Opcode.IGET_OBJECT, 0, 11,
                new ImmutableFieldReference(stateType, "M0", "Ljava/util/Map;")));
        target.getImplementation().addInstruction(1,
            new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 0, 12, 0, 0, 0,
                method(EXTENSION, "update", List.of("Ljava/util/Map;", "Ljava/util/Map;"), "V")));
    }

    static void hookSettings(MutableClass owner, int showUnairedSub) {
        MutableMethod match = null;
        int insert = -1;
        int composer = -1;
        for (MutableMethod candidate : owner.getMethods()) {
            List<Instruction> ins = instructions(candidate);
            for (int i = 0; i < ins.size(); i++) {
                if (!(ins.get(i) instanceof NarrowLiteralInstruction)
                    || ((NarrowLiteralInstruction) ins.get(i)).getNarrowLiteral() != showUnairedSub) continue;
                int localComposer = -1;
                int localInsert = -1;
                for (int j = i + 1; j < Math.min(ins.size(), i + 45); j++) {
                    if (calls(ins.get(j), "Lt6/g;", "I") && ins.get(j) instanceof FiveRegisterInstruction)
                        localComposer = ((FiveRegisterInstruction) ins.get(j)).getRegisterD();
                    if (calls(ins.get(j), "Lfb/h3;", "t")) { localInsert = j + 1; break; }
                }
                if (localComposer >= 0 && localComposer <= 15 && localInsert >= 0) {
                    if (match != null) throw unsupported("Multiple Continue Watching settings anchors found");
                    match = candidate; insert = localInsert; composer = localComposer;
                }
            }
        }
        if (match == null) throw unsupported("Continue Watching settings anchor not found");
        match.getImplementation().addInstruction(insert,
            new BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, composer, 0, 0, 0, 0,
                method(EXTENSION, "renderSettings", Collections.singletonList("Ljava/lang/Object;"), "V")));
    }

    static void hookCard(MutableClass owner, String imageOwner) {
        MutableMethod target = unique(owner, "invoke", 3);
        List<Instruction> ins = instructions(target);
        int imageCall = -1;
        for (int i = 0; i < ins.size(); i++) if (calls(ins.get(i), imageOwner, "H")) {
            if (imageCall >= 0) throw unsupported("Multiple Continue Watching image anchors found");
            imageCall = i;
        }
        if (imageCall < 0 || target.getImplementation().getRegisterCount() != 61)
            throw unsupported("Continue Watching card layout changed");
        Instruction image = ins.get(imageCall);
        if (!(image instanceof RegisterRangeInstruction))
            throw unsupported("Continue Watching image call is no longer a range invocation");
        // The image helper's Composer is its twelfth parameter, 11 words after the start
        // of this static range invocation. Use Nuvio's actual live Composer
        // register instead of assuming that a lambda parameter still contains it.
        int composer = ((RegisterRangeInstruction) image).getStartRegister() + 11;
        target.getImplementation().addInstruction(imageCall + 1,
            new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 57, 1,
                method(EXTENSION, "prepareBadge", Collections.singletonList("Ljava/lang/Object;"), "V")));
        target.getImplementation().addInstruction(imageCall + 2,
            new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, composer, 1,
                method(EXTENSION, "renderPreparedBadge",
                    Collections.singletonList("Ljava/lang/Object;"), "V")));
    }

    static MutableMethod unique(MutableClass owner, String name, int parameters) {
        MutableMethod result = null;
        for (MutableMethod method : owner.getMethods()) {
            if (name.equals(method.getName()) && method.getParameterTypes().size() == parameters
                && method.getImplementation() != null) {
                if (result != null) throw unsupported("Multiple " + owner.getType() + "->" + name + " matches");
                result = method;
            }
        }
        if (result == null) throw unsupported(owner.getType() + "->" + name + " not found");
        return result;
    }

    static List<Instruction> instructions(MutableMethod method) {
        List<Instruction> result = new ArrayList<>();
        for (Instruction instruction : method.getImplementation().getInstructions()) result.add(instruction);
        return result;
    }

    static int parameterStart(MutableMethod method) {
        int words = 1; // All current callers are instance methods, including constructors.
        for (CharSequence type : method.getParameterTypes()) {
            char first = type.charAt(0);
            words += first == 'J' || first == 'D' ? 2 : 1;
        }
        return method.getImplementation().getRegisterCount() - words;
    }

    static boolean calls(Instruction instruction, String owner, String name) {
        if (!(instruction instanceof ReferenceInstruction)) return false;
        Object ref = ((ReferenceInstruction) instruction).getReference();
        return ref instanceof MethodReference && owner.equals(((MethodReference) ref).getDefiningClass())
            && name.equals(((MethodReference) ref).getName());
    }

    static ImmutableMethodReference method(String owner, String name, List<String> params, String result) {
        return new ImmutableMethodReference(owner, name, params, result);
    }

    static IllegalStateException unsupported(String reason) {
        return new IllegalStateException("Unsupported NuvioTV bytecode: " + reason
            + ". No fallback was applied. Use the original NuvioTV 1.1.0-beta.2 APK.");
    }

    static InputStream extensionStream() {
        String path = "extensions/nuvio-remaining-episodes.mpe";
        InputStream resource = NuvioRemainingEpisodesPatch.class.getClassLoader().getResourceAsStream(path);
        if (resource != null) return resource;
        try {
            URI source = NuvioRemainingEpisodesPatch.class.getProtectionDomain().getCodeSource().getLocation().toURI();
            try (ZipFile zip = new ZipFile(new File(source))) {
                ZipEntry entry = zip.getEntry(path);
                if (entry == null) throw new FileNotFoundException(path);
                try (InputStream input = zip.getInputStream(entry)) {
                    ByteArrayOutputStream output = new ByteArrayOutputStream();
                    byte[] buffer = new byte[8192]; int count;
                    while ((count = input.read(buffer)) >= 0) output.write(buffer, 0, count);
                    return new ByteArrayInputStream(output.toByteArray());
                }
            }
        } catch (Exception error) {
            throw new IllegalStateException("Cannot load bundled NuvioTV extension", error);
        }
    }
}

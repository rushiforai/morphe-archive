package santodan.patches;

import app.morphe.patcher.patch.ApkFileType;
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
            "Adds a disabled-by-default setting that displays aired, unwatched episode counts for every tracking integration. Controlled by Layout > Santodan-Patches on beta4 and beta5.",
            false, builder -> {
                builder.compatibleWith(new Compatibility(PACKAGE, "NuvioTV", null, ApkFileType.APK,
                    null, null, NuvioLayout.targets(), false));
                builder.dependsOn(NuvioSettingsMenuPatch.getMenuPatch());
                builder.extendWith(NuvioRemainingEpisodesPatch::extensionStream);
                builder.execute(context -> {
                    String version = context.getPackageMetadata().getVersionName();
                    validateTarget(context.getPackageMetadata().getPackageName(), version);
                    boolean beta4 = NuvioLayout.modern(version);
                    String state = beta4 ? NuvioLayout.current("Lla/z3;") : "Lza/k3;";
                    hookNextUpModel(context.mutableClassDefBy(beta4 ? NuvioLayout.current("Lla/aa;") : "Lza/s8;"));
                    hookEpisodeSets(context.mutableClassDefBy(beta4 ? NuvioLayout.current("Lla/t5;") : "Lza/z4;"), state);
                    if (!beta4) hookSettings(context.mutableClassDefBy("Lfb/t6;"), 0x7f1106a7);
                    hookCard(context.mutableClassDefBy(beta4 ? NuvioLayout.current("Lba/e2;") : "Lpa/q0;"),
                        beta4 ? "Lc7/a;" : "Lfb/jk;");
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
    }

    /** Validate the same versions advertised in compatibility metadata. */
    static void validateTarget(String packageName, String version) {
        if (!PACKAGE.equals(packageName)) throw unsupported("Expected package " + PACKAGE);
        NuvioLayout.use(version);
    }

    static void hookNextUpModel(MutableClass owner) {
        MutableMethod target = unique(owner, "<init>", NuvioLayout.current("Lla/aa;").equals(owner.getType()) ? 27 : 26);
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
                new ImmutableFieldReference(stateType, NuvioLayout.current("Lla/z3;").equals(stateType) ? "T0" : "M0", "Ljava/util/Map;")));
        target.getImplementation().addInstruction(1,
            new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 0, 12, 0, 0, 0,
                method(EXTENSION, "update", List.of("Ljava/util/Map;", "Ljava/util/Map;"), "V")));
    }

    static void hookSettings(MutableClass owner, int showUnairedSub) {
        boolean beta4 = NuvioLayout.current("Lsa/o3;").equals(owner.getType());
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
                    if (calls(ins.get(j), beta4 ? "Lc7/a;" : "Lt6/g;", beta4 ? "P" : "I") && ins.get(j) instanceof FiveRegisterInstruction)
                        localComposer = ((FiveRegisterInstruction) ins.get(j)).getRegisterD();
                    if (calls(ins.get(j), beta4 ? NuvioLayout.current("Lsa/eb;") : "Lfb/h3;", beta4 ? "m" : "t")) { localInsert = j + 1; break; }
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
        hookCard(owner, imageOwner, EXTENSION, "prepareBadge", "renderPreparedBadge");
    }

    static void hookCard(MutableClass owner, String imageOwner, String extension, String prepare, String render) {
        boolean beta4 = NuvioLayout.current("Lba/e2;").equals(owner.getType());
        MutableMethod target = unique(owner, "invoke", 3);
        List<Instruction> ins = instructions(target);
        int imageCall = -1;
        for (int i = 0; i < ins.size(); i++) if (calls(ins.get(i), imageOwner, beta4 ? "b" : "H")) {
            if (imageCall >= 0) throw unsupported("Multiple Continue Watching image anchors found");
            imageCall = i;
        }
        if (imageCall < 0 || target.getImplementation().getRegisterCount() != (beta4 ? 64 : 61))
            throw unsupported("Continue Watching card layout changed");
        Instruction image = ins.get(imageCall);
        if (!(image instanceof RegisterRangeInstruction))
            throw unsupported("Continue Watching image call is no longer a range invocation");
        // The image helper's Composer is its twelfth parameter, 11 words after the start
        // of this static range invocation. Use Nuvio's actual live Composer
        // register instead of assuming that a lambda parameter still contains it.
        int composer = ((RegisterRangeInstruction) image).getStartRegister() + 11;
        target.getImplementation().addInstruction(imageCall + 1,
            new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, parameterStart(target), 1,
                method(extension, prepare, Collections.singletonList("Ljava/lang/Object;"), "V")));
        target.getImplementation().addInstruction(imageCall + 2,
            new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, composer, 1,
                method(extension, render,
                    Collections.singletonList("Ljava/lang/Object;"), "V")));
    }

    static MutableMethod unique(MutableClass owner, String name, int parameters) {
        MutableMethod result = null;
        for (MutableMethod method : owner.getMethods()) {
            if (name.equals(method.getName()) && method.getParameterTypes().size() == parameters
                && method.getImplementation() != null) {
                // Beta4 has a 27-argument default-mask overload as well as the real
                // model constructor. Register only fully initialized model instances.
                if (NuvioLayout.current("Lla/aa;").equals(owner.getType()) && "<init>".equals(name)
                    && !"Lcom/nuvio/tv/domain/model/MDBListRatings;".contentEquals(
                        method.getParameterTypes().get(parameters - 1))) continue;
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
            + ". No fallback was applied. Use an original NuvioTV 1.1.0-beta.2, 1.1.0-beta.4, or 1.1.0-beta.5 APK.");
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

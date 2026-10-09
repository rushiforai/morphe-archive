package santodan.patches;

import app.morphe.patcher.patch.ApkFileType;
import app.morphe.patcher.patch.AppTarget;
import app.morphe.patcher.patch.BytecodePatch;
import app.morphe.patcher.patch.Compatibility;
import app.morphe.patcher.patch.PatchKt;
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
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

/** Adds independently configurable finale dates to library and collection posters. */
public final class NuvioFinaleDatesPatch {
    public static final String NAME = "NuvioTV - Finale dates in library and collections";
    static final String PACKAGE = "com.nuvio.tv";
    static final String VERSION = NuvioLayout.BETA4;
    static final String EXTENSION = "Lsoftware/santodan/extension/nuviofinale/NuvioFinaleDates;";

    private NuvioFinaleDatesPatch() {}

    @SuppressWarnings({"unchecked", "deprecation"})
    public static BytecodePatch getNuvioFinaleDatesPatch() {
        return PatchKt.bytecodePatch(NAME,
            "Adds separate disabled-by-default settings to show the latest scheduled episode date in library and collection posters.",
            false, builder -> {
                builder.compatibleWith(new Compatibility(PACKAGE, "NuvioTV", null, ApkFileType.APK,
                    null, null, NuvioLayout.modernTargets(), false));
                builder.dependsOn(NuvioSettingsMenuPatch.getMenuPatch());
                builder.extendWith(NuvioFinaleDatesPatch::extensionStream);
                builder.execute(context -> {
                    String version = context.getPackageMetadata().getVersionName();
                NuvioLayout.use(version);
                    if (!PACKAGE.equals(context.getPackageMetadata().getPackageName()) || (!NuvioLayout.BETA4.equals(version) && !NuvioLayout.BETA5.equals(version)))
                        throw unsupported("Expected " + PACKAGE + " " + VERSION);
                    hookItems(context.mutableClassDefBy(NuvioLayout.current("Lba/i1;")));
                    hookCard(context.mutableClassDefBy(NuvioLayout.current("Lba/n3;")));
                    hookCard(context.mutableClassDefBy("Lba/q1;"));
                    for (String type : List.of(NuvioLayout.current("Lba/n3;"), "Lba/q1;", NuvioLayout.current("Lba/o3;"), "Lba/s1;"))
                        hookContext(context.mutableClassDefBy(type));
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
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

    static void hookItems(MutableClass owner) { hookItems(owner, EXTENSION); }

    static void hookItems(MutableClass owner, String extension) {
        MutableMethod target = unique(owner, "invoke", 4);
        List<Instruction> ins = instructions(target);
        int matches = 0;
        for (int i = ins.size() - 1; i >= 0; i--) {
            String hook = calls(ins.get(i), NuvioLayout.current("Lba/s3;"), "p") ? "libraryItem"
                : calls(ins.get(i), NuvioLayout.current("Lba/a2;"), "a") ? "collectionItem" : null;
            if (hook == null) continue;
            if (!(ins.get(i) instanceof RegisterRangeInstruction)) throw unsupported("Item card invocation changed");
            int item = ((RegisterRangeInstruction) ins.get(i)).getStartRegister();
            target.getImplementation().addInstruction(i + 1, new BuilderInstruction35c(Opcode.INVOKE_STATIC,
                0, 0, 0, 0, 0, 0, method(extension, "exitContext", List.of(), "V")));
            target.getImplementation().addInstruction(i, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
                item, 1, method(extension, hook, List.of("Ljava/lang/Object;"), "V")));
            matches++;
        }
        if (matches != 2) throw unsupported("Library/collection card anchors changed");
    }

    static void hookContext(MutableClass owner) { hookContext(owner, EXTENSION); }

    static void hookContext(MutableClass owner, String extension) {
        int constructors = 0;
        boolean restart = NuvioLayout.current("Lba/o3;").equals(owner.getType()) || "Lba/s1;".equals(owner.getType());
        for (MutableMethod target : owner.getMethods()) {
            if (target.getImplementation() == null) continue;
            boolean constructor = "<init>".equals(target.getName());
            boolean invoke = restart && "invoke".equals(target.getName()) && target.getParameterTypes().size() == 2;
            if (!constructor && !invoke) continue;
            int instance = parameterStart(target);
            List<Instruction> ins = instructions(target);
            int returns = 0;
            for (int i = ins.size() - 1; i >= 0; i--) {
                if (ins.get(i).getOpcode() != (constructor ? Opcode.RETURN_VOID : Opcode.RETURN_OBJECT)) continue;
                returns++;
                target.getImplementation().addInstruction(i, constructor
                    ? new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, instance, 1,
                        method(extension, "captureContext", List.of("Ljava/lang/Object;"), "V"))
                    : new BuilderInstruction35c(Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0,
                        method(extension, "exitContext", List.of(), "V")));
            }
            if (returns != 1) throw unsupported("Context lambda return layout changed");
            if (constructor) constructors++;
            else target.getImplementation().addInstruction(0,
                new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, instance, 1,
                    method(extension, "enterContext", List.of("Ljava/lang/Object;"), "V")));
        }
        if (constructors != 1) throw unsupported("Context lambda constructor changed");
    }

    static void hookCard(MutableClass owner) { hookCard(owner, EXTENSION); }

    static void hookCard(MutableClass owner, String extension) {
        boolean library = NuvioLayout.current("Lba/n3;").equals(owner.getType());
        MutableMethod target = unique(owner, "invoke", 3);
        if (target.getImplementation().getRegisterCount() != (library ? 34 : 58))
            throw unsupported("Finale card register layout changed");
        List<Instruction> ins = instructions(target);
        List<Integer> images = new ArrayList<>();
        for (int i = 0; i < ins.size(); i++) if (calls(ins.get(i), "Lc7/a;", "b")) images.add(i);
        if (images.size() != (library ? 2 : 3)) throw unsupported("Finale card image anchors changed");
        // The third collection image is the logo; only badge the two poster branches.
        for (int n = 1; n >= 0; n--) {
            int index = images.get(n);
            if (!(ins.get(index) instanceof RegisterRangeInstruction)) throw unsupported("Image invocation changed");
            int composer = ((RegisterRangeInstruction) ins.get(index)).getStartRegister() + 11;
            target.getImplementation().addInstruction(index + 1,
                new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, parameterStart(target), 1,
                    method(extension, "prepareBadge", List.of("Ljava/lang/Object;"), "V")));
            target.getImplementation().addInstruction(index + 2,
                new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, composer, 1,
                    method(extension, "renderPreparedBadge", List.of("Ljava/lang/Object;"), "V")));
        }
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
            + ". No fallback was applied. Use an original supported NuvioTV APK.");
    }

    static InputStream extensionStream() {
        String path = "extensions/nuvio-finale-dates.mpe";
        InputStream resource = NuvioFinaleDatesPatch.class.getClassLoader().getResourceAsStream(path);
        if (resource != null) return resource;
        try {
            URI source = NuvioFinaleDatesPatch.class.getProtectionDomain().getCodeSource().getLocation().toURI();
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

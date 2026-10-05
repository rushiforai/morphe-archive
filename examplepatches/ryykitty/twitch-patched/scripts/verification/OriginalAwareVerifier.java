import app.morphe.patcher.dex.DexVerificationException;
import app.morphe.patcher.dex.SdkDexVerifier;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation;
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction30t;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation;
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.regex.Pattern;
import java.util.zip.ZipFile;


public final class OriginalAwareVerifier {
    private static final Pattern FINDING = Pattern.compile("^\\s*\\d+\\. (\\[[A-Z_]+].+)$");
    private static final Pattern HEADER = Pattern.compile("Cross-DEX class hierarchy verification found (\\d+) issue\\(s\\):");
    private static final Pattern TYPE = Pattern.compile("L[^\\s;,()\\[\\]<>]+;");

    private OriginalAwareVerifier() { }

    public static void main(String[] args) throws IOException {
        if (args.length != 4) throw new IllegalArgumentException("Expected original APK, output APK, SDK, audit directory.");
        Path run = Path.of(args[3]);
        Files.createDirectories(run);
        File original = extractDex(Path.of(args[0]), run.resolve("original"));
        File patched = extractDex(Path.of(args[1]), run.resolve("patched"));
        SdkDexVerifier verifier = new SdkDexVerifier(new File(args[2]), null);
        verifier.verifyApkFile(new File(args[1]));
        // Only hierarchy findings are eligible for comparison.
        Set<String> before = hierarchyFindings(verifier, original);
        Set<String> after = hierarchyFindings(verifier, patched);
        Files.write(run.resolve("original-findings.txt"), before);
        Files.write(run.resolve("patched-findings.txt"), after);
        Map<String, ClassDef> originalClasses = classes(original);
        Map<String, ClassDef> patchedClasses = classes(patched);
        Set<String> audited = new HashSet<>();
        for (String finding : after) {
            if (!before.contains(finding)) throw new IllegalStateException("New SDK finding: " + finding);
            var types = TYPE.matcher(finding);
            boolean hasType = false;
            while (types.find()) {
                hasType = true;
                requireUnchanged(types.group(), originalClasses, patchedClasses, audited);
            }
            if (!hasType) throw new IllegalStateException("Finding has no auditable type: " + finding);
        }
        Files.writeString(run.resolve("audit.txt"), "SDK per-DEX and APK checks: passed\n"
                + "Original unique hierarchy findings: " + before.size() + "\n"
                + "Output unique hierarchy findings: " + after.size() + "\n"
                + "New hierarchy findings: 0\nType contracts audited: " + audited.size() + "\n"
                + "Unqualified SDK hierarchy verification: " + (after.isEmpty() ? "passed" : "failed on original findings") + "\n"
                + "Device/ART verification: pending\n");
        System.out.println("Original-aware audit passed; " + after.size() + " original hierarchy findings retained. Device testing remains required.");
    }

    static Set<String> parseFindings(String message) {
        if (message == null) throw new IllegalStateException("Missing verification report.");
        String[] lines = message.split("\\R");
        var header = HEADER.matcher(lines[0]);
        if (!header.matches()) {
            throw new IllegalStateException("Unexpected verification failure: " + message);
        }
        Set<String> findings = new TreeSet<>();
        int parsed = 0;
        for (int index = 1; index < lines.length; index++) {
            if (lines[index].isBlank()) continue;
            var match = FINDING.matcher(lines[index]);
            if (!match.matches()) throw new IllegalStateException("Unrecognized SDK report line.");
            parsed++;
            findings.add(match.group(1).replaceAll(" \\((?:in )?classes(?:\\d+)?\\.dex\\)", ""));
        }
        if (findings.isEmpty() || parsed != Integer.parseInt(header.group(1))) {
            throw new IllegalStateException("Incomplete SDK hierarchy report.");
        }
        return findings;
    }

    static void requireUnchanged(String type, Map<String, ClassDef> original, Map<String, ClassDef> patched,
                                 Set<String> audited) throws IOException {
        if (!audited.add(type)) return;
        ClassDef before = original.get(type);
        ClassDef after = patched.get(type);
        if (before == null && after == null) return;
        if (before == null || after == null || !Arrays.equals(canonicalDex(before), canonicalDex(after))) {
            throw new IllegalStateException("Original finding refers to changed class " + type);
        }
        if (before.getSuperclass() != null) requireUnchanged(before.getSuperclass(), original, patched, audited);
        for (String iface : before.getInterfaces()) requireUnchanged(iface, original, patched, audited);
    }

    static byte[] canonicalDex(ClassDef type) throws IOException {
        // Re-intern to remove global pool indices and DEX placement.
        DexPool pool = new DexPool(Opcodes.forDexVersion(39));
        List<ImmutableMethod> methods = new java.util.ArrayList<>();
        for (Method method : type.getMethods()) {
            if (method.getImplementation() == null) {
                methods.add(ImmutableMethod.of(method));
                continue;
            }
            MutableMethodImplementation body = new MutableMethodImplementation(method.getImplementation());
            for (int index = 0; index < body.getInstructions().size(); index++) {
                var instruction = body.getInstructions().get(index);
                if (instruction.getOpcode() == Opcode.CONST_STRING_JUMBO) {
                    if (!(instruction instanceof OneRegisterInstruction register)
                            || !(instruction instanceof ReferenceInstruction reference)) {
                        throw new IllegalStateException("Malformed jumbo string instruction.");
                    }
                    body.replaceInstruction(index, new BuilderInstruction21c(Opcode.CONST_STRING,
                            register.getRegisterA(), reference.getReference()));
                } else if (instruction.getOpcode() == Opcode.GOTO || instruction.getOpcode() == Opcode.GOTO_16) {
                    if (!(instruction instanceof BuilderOffsetInstruction branch)) {
                        throw new IllegalStateException("Malformed goto instruction.");
                    }
                    body.replaceInstruction(index, new BuilderInstruction30t(Opcode.GOTO_32, branch.getTarget()));
                }
            }
            var implementation = new ImmutableMethodImplementation(body.getRegisterCount(), body.getInstructions(),
                    body.getTryBlocks(), List.of());
            methods.add(new ImmutableMethod(method.getDefiningClass(), method.getName(), method.getParameters(),
                    method.getReturnType(), method.getAccessFlags(), method.getAnnotations(),
                    method.getHiddenApiRestrictions(), implementation));
        }
        // Normalize pool-dependent encodings and branches; exclude debug positions.
        pool.internClass(new ImmutableClassDef(type.getType(), type.getAccessFlags(), type.getSuperclass(),
                type.getInterfaces(), type.getSourceFile(), type.getAnnotations(), type.getFields(), methods));
        MemoryDataStore output = new MemoryDataStore();
        try {
            pool.writeTo(output);
            return output.getData();
        } finally {
            output.close();
        }
    }

    private static File extractDex(Path apk, Path directory) throws IOException {
        Files.createDirectories(directory);
        try (ZipFile zip = new ZipFile(apk.toFile())) {
            var entries = zip.entries();
            int count = 0;
            while (entries.hasMoreElements()) {
                var entry = entries.nextElement();
                if (!entry.getName().matches("classes(?:\\d+)?\\.dex")) continue;
                try (var input = zip.getInputStream(entry)) {
                    Files.copy(input, directory.resolve(entry.getName()));
                }
                count++;
            }
            if (count == 0) throw new IllegalArgumentException("No base DEX in " + apk);
        }
        return directory.toFile();
    }

    private static List<File> dexFiles(File directory) {
        File[] files = directory.listFiles((dir, name) -> name.endsWith(".dex"));
        if (files == null || files.length == 0) throw new IllegalArgumentException("Missing DEX files.");
        return Arrays.stream(files).sorted().toList();
    }

    private static Set<String> hierarchyFindings(SdkDexVerifier verifier, File directory) {
        try {
            verifier.verifyDexDirectory(directory);
            return Set.of();
        } catch (DexVerificationException failure) {
            return parseFindings(failure.getMessage());
        }
    }

    private static Map<String, ClassDef> classes(File directory) throws IOException {
        Map<String, ClassDef> result = new HashMap<>();
        for (File dex : dexFiles(directory)) {
            for (ClassDef type : DexFileFactory.loadDexFile(dex, Opcodes.getDefault()).getClasses()) {
                if (result.put(type.getType(), type) != null) throw new IllegalStateException("Duplicate type " + type.getType());
            }
        }
        return result;
    }
}

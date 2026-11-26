import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Field;
import com.android.tools.smali.dexlib2.iface.Method;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * Resolves the generated GboardVersionBindings.kt targets against one Gboard APK and reports every
 * target that release does not contain.
 *
 * Re-deriving the bindings for a new Gboard build starts by knowing exactly which of the current
 * targets moved: a class descriptor that disappeared, a method that lost a parameter, a field whose
 * type changed. This tool answers that from the APK itself, so the answer is repeatable instead of a
 * throwaway script: the generated file is parsed the way it is written, and each target is looked up
 * as a declared member of its own class.
 *
 * Usage: java -cp "libs/morphe-cli.jar" tools/bindings/BindingAudit.java \
 *            src/main/kotlin/dev/jason/gboardpatches/patches/gboard/shared/generated/GboardVersionBindings.kt \
 *            <gboard.apk> [--known-missing <file>]
 *
 * A build that genuinely lacks some targets can be told so with --known-missing, a file naming them
 * one per line (blank lines and # comments ignored). Those entries are reported separately and do not
 * fail the run, so the audit can gate CI without demanding a re-derivation of every target a build
 * never had. Exits 1 when any other target is unresolved; 0 when every target resolves or is declared
 * missing; 2 on a usage or parse error.
 */
public final class BindingAudit {

    private enum Kind { METHOD, FIELD, TYPE }

    private record Target(
            String name,
            Kind kind,
            String classType,
            String memberName,
            List<String> parameterTypes,
            String returnType,
            String fieldType) {

        String descriptor() {
            return switch (kind) {
                case METHOD -> classType + "->" + memberName
                        + "(" + String.join("", parameterTypes) + ")" + returnType;
                case FIELD -> classType + "->" + memberName + ":" + fieldType;
                case TYPE -> classType;
            };
        }
    }

    private static final Pattern ENTRY = Pattern.compile(
            "^\\s*val\\s+`([^`]+)`\\s*=\\s*(GboardMethodTarget|GboardFieldTarget|GboardTypeTarget)\\((.*)$");
    private static final Pattern CONSTANT = Pattern.compile(
            "const val (\\w+) = \"([^\"]*)\"");

    private static final String USAGE =
            "usage: BindingAudit <GboardVersionBindings.kt> <gboard.apk> [--known-missing <file>]";

    public static void main(String[] args) throws Exception {
        List<String> positional = new ArrayList<>();
        Path knownMissingFile = null;
        for (int index = 0; index < args.length; index++) {
            if (args[index].equals("--known-missing")) {
                if (index + 1 >= args.length) {
                    System.err.println(USAGE);
                    System.exit(2);
                }
                knownMissingFile = Path.of(args[++index]);
            } else {
                positional.add(args[index]);
            }
        }
        if (positional.size() != 2) {
            System.err.println(USAGE);
            System.exit(2);
        }
        if (knownMissingFile != null && !Files.isRegularFile(knownMissingFile)) {
            System.err.println("error: known-missing file not found: " + knownMissingFile);
            System.exit(2);
        }
        Path bindingsFile = Path.of(positional.get(0));
        File apk = new File(positional.get(1));
        if (!Files.isRegularFile(bindingsFile)) {
            System.err.println("error: bindings file not found: " + bindingsFile);
            System.exit(2);
        }
        if (!apk.isFile()) {
            System.err.println("error: apk not found: " + apk);
            System.exit(2);
        }

        List<String> lines = Files.readAllLines(bindingsFile, StandardCharsets.UTF_8);
        Map<String, String> constants = new LinkedHashMap<>();
        for (String line : lines) {
            Matcher matcher = CONSTANT.matcher(line.trim());
            if (matcher.find()) constants.put(matcher.group(1), matcher.group(2));
        }
        List<Target> targets;
        try {
            targets = parseTargets(lines);
        } catch (IllegalStateException broken) {
            System.err.println("error: " + broken.getMessage());
            System.exit(2);
            return;
        }
        if (targets.isEmpty()) {
            System.err.println("error: " + bindingsFile + " declares no targets");
            System.exit(2);
        }

        Map<String, ClassDef> classes = loadClasses(apk);
        Set<String> knownMissing = knownMissingFile == null
                ? new LinkedHashSet<>()
                : readKnownMissing(knownMissingFile);

        List<Target> unresolved = new ArrayList<>();
        List<Target> expectedMissing = new ArrayList<>();
        Map<String, String> hints = new LinkedHashMap<>();
        Map<Kind, Integer> counts = new LinkedHashMap<>();
        counts.put(Kind.METHOD, 0);
        counts.put(Kind.FIELD, 0);
        counts.put(Kind.TYPE, 0);
        Set<String> owners = new LinkedHashSet<>();
        for (Target target : targets) {
            counts.merge(target.kind(), 1, Integer::sum);
            owners.add(target.classType());
            String hint = resolve(target, classes);
            if (hint != null) {
                if (knownMissing.contains(target.name())) {
                    expectedMissing.add(target);
                } else {
                    unresolved.add(target);
                }
                hints.put(target.name(), hint);
            }
        }

        String targetVersion = constants.getOrDefault("targetVersion", "unknown");
        String profileVersion = constants.getOrDefault("profileVersion", "unknown");
        System.out.println("bindings: " + bindingsFile);
        System.out.println("target:   " + targetVersion + " (profile " + profileVersion + ")");
        System.out.println("apk:      " + apk.getName());
        System.out.println("classes:  " + classes.size() + " in the apk, " + owners.size() + " referenced");
        System.out.println("targets:  " + targets.size()
                + " (" + counts.get(Kind.METHOD) + " methods, "
                + counts.get(Kind.FIELD) + " fields, "
                + counts.get(Kind.TYPE) + " types)");
        System.out.println();
        System.out.println("resolved:   " + (targets.size() - unresolved.size() - expectedMissing.size()));
        System.out.println("unresolved: " + unresolved.size());
        if (knownMissingFile != null) {
            System.out.println("known:      " + expectedMissing.size() + " declared in " + knownMissingFile);
        }

        for (Kind kind : Kind.values()) {
            for (Target target : unresolved) {
                if (target.kind() != kind) continue;
                System.out.println("  " + kind + " " + target.name() + ": " + target.descriptor()
                        + " (" + hints.get(target.name()) + ")");
            }
        }

        if (!expectedMissing.isEmpty()) {
            System.out.println();
            System.out.println("Declared missing, so not a failure:");
            for (Kind kind : Kind.values()) {
                for (Target target : expectedMissing) {
                    if (target.kind() != kind) continue;
                    System.out.println("  " + kind + " " + target.name() + ": " + target.descriptor()
                            + " (" + hints.get(target.name()) + ")");
                }
            }
        }

        // A declaration that no longer matches an unresolved target is not a failure on its own, but
        // it has stopped documenting anything, and the next real absence could hide behind it.
        Set<String> matched = new LinkedHashSet<>();
        for (Target target : expectedMissing) matched.add(target.name());
        List<String> stale = new ArrayList<>();
        for (String name : knownMissing) {
            if (!matched.contains(name)) stale.add(name);
        }
        if (!stale.isEmpty()) {
            System.out.println();
            System.out.println("warning: declared missing but no longer unresolved, remove from "
                    + knownMissingFile + ":");
            for (String name : stale) System.out.println("  " + name);
        }

        if (!unresolved.isEmpty()) {
            System.out.println();
            System.out.println("Re-derive the values above against " + apk.getName()
                    + " before pointing a target at it.");
            if (knownMissingFile != null) {
                System.out.println("If " + apk.getName() + " genuinely lacks them, declare them in "
                        + knownMissingFile + ".");
            }
            System.exit(1);
        }
    }

    /**
     * Reads the targets a build is known not to contain: one binding name per line, blank lines and
     * lines starting with # ignored. The file is the audit's only way to keep a real absence
     * documented, so anything not listed in it still has to resolve.
     */
    private static Set<String> readKnownMissing(Path file) throws IOException {
        Set<String> names = new LinkedHashSet<>();
        for (String raw : Files.readAllLines(file, StandardCharsets.UTF_8)) {
            String line = raw.trim();
            if (line.isEmpty() || line.startsWith("#")) continue;
            names.add(line);
        }
        return names;
    }

    /**
     * Reads the generated file the way the generator writes it: one {@code val `name` = ...} entry per
     * target, named arguments on their own lines, and the argument list for a method on a single line.
     * Anything else is a parse error rather than a silently skipped target, because a skipped target
     * would make a broken binding look resolved.
     */
    private static List<Target> parseTargets(List<String> lines) {
        List<Target> targets = new ArrayList<>();
        for (int index = 0; index < lines.size(); index++) {
            Matcher entry = ENTRY.matcher(lines.get(index));
            if (!entry.find()) continue;

            String name = entry.group(1);
            String type = entry.group(2);

            // A type target takes its descriptor inline and has no argument block to consume.
            if (type.equals("GboardTypeTarget")) {
                String classType = quoted(entry.group(3), name);
                if (classType == null || classType.isBlank()) {
                    throw new IllegalStateException("binding `" + name + "` has no class descriptor");
                }
                targets.add(new Target(name, Kind.TYPE, classType, null, List.of(), null, null));
                continue;
            }

            List<String> body = new ArrayList<>();
            body.add(entry.group(3));
            int cursor = index;
            while (!bodyCloses(body)) {
                cursor++;
                if (cursor >= lines.size()) {
                    throw new IllegalStateException("unterminated binding entry `" + name + "`");
                }
                body.add(lines.get(cursor));
            }
            index = cursor;

            String memberName = null;
            String returnType = null;
            String fieldType = null;
            List<String> parameterTypes = null;
            for (String raw : body) {
                String line = raw.trim();
                if (line.startsWith("name = ")) {
                    memberName = quoted(line.substring("name = ".length()), name);
                } else if (line.startsWith("returnType = ")) {
                    returnType = quoted(line.substring("returnType = ".length()), name);
                } else if (line.startsWith("type = ")) {
                    fieldType = quoted(line.substring("type = ".length()), name);
                } else if (line.startsWith("parameterTypes = ")) {
                    parameterTypes = quotedList(line.substring("parameterTypes = ".length()), name);
                }
            }

            if (type.equals("GboardMethodTarget")) {
                String owner = classTypeOf(body, name);
                checkPresent(name, "name", memberName);
                checkPresent(name, "parameterTypes", parameterTypes);
                checkPresent(name, "returnType", returnType);
                targets.add(new Target(name, Kind.METHOD, owner, memberName, parameterTypes, returnType, null));
            } else {
                String owner = classTypeOf(body, name);
                checkPresent(name, "name", memberName);
                checkPresent(name, "type", fieldType);
                targets.add(new Target(name, Kind.FIELD, owner, memberName, List.of(), null, fieldType));
            }
        }
        return targets;
    }

    private static String classTypeOf(List<String> body, String name) {
        for (String raw : body) {
            String line = raw.trim();
            if (line.startsWith("classType = ")) {
                String value = quoted(line.substring("classType = ".length()), name);
                if (value == null || value.isBlank()) {
                    throw new IllegalStateException("binding `" + name + "` has an empty classType");
                }
                return value;
            }
        }
        throw new IllegalStateException("binding `" + name + "` has no classType");
    }

    private static void checkPresent(String name, String key, Object value) {
        if (value == null) {
            throw new IllegalStateException("binding `" + name + "` has no " + key);
        }
    }

    /** True once the entry's argument list has closed on its own. */
    private static boolean bodyCloses(List<String> body) {
        String last = body.get(body.size() - 1).trim();
        return body.size() > 1 && last.equals(")");
    }

    /** Unwraps one Kotlin string literal, undoing the {@code ${'$'}} escape the generator emits. */
    private static String quoted(String text, String name) {
        int open = text.indexOf('"');
        int close = text.lastIndexOf('"');
        if (open < 0 || close <= open) {
            throw new IllegalStateException("binding `" + name + "` has an unreadable literal: " + text);
        }
        return text.substring(open + 1, close).replace("${'$'}", "$");
    }

    /** Parses {@code listOf("a", "b")} or {@code emptyList()} into its string literals. */
    private static List<String> quotedList(String text, String name) {
        if (text.startsWith("emptyList()")) return List.of();
        int open = text.indexOf("listOf(");
        if (open < 0) {
            throw new IllegalStateException("binding `" + name + "` has an unreadable parameterTypes: " + text);
        }
        List<String> values = new ArrayList<>();
        boolean inString = false;
        StringBuilder current = new StringBuilder();
        for (int index = open + "listOf(".length(); index < text.length(); index++) {
            char character = text.charAt(index);
            if (character == '"') {
                if (inString) {
                    values.add(current.toString().replace("${'$'}", "$"));
                    current.setLength(0);
                }
                inString = !inString;
            } else if (inString) {
                current.append(character);
            }
        }
        return values;
    }

    /**
     * Returns null when the target resolves, otherwise the reason it does not.
     *
     * Members are looked up as declared members of the target class, which is what the patches do:
     * a member inherited from another class is not patchable through this target, so reporting it as
     * resolved would hide the very drift this audit exists to find.
     */
    private static String resolve(Target target, Map<String, ClassDef> classes) {
        ClassDef owner = classes.get(target.classType());
        if (owner == null) return "class is not in this apk";
        if (target.kind() == Kind.TYPE) return null;

        if (target.kind() == Kind.FIELD) {
            List<String> sameName = new ArrayList<>();
            for (Field field : owner.getFields()) {
                if (!field.getName().equals(target.memberName())) continue;
                if (field.getType().equals(target.fieldType())) return null;
                sameName.add(field.getType());
            }
            return sameName.isEmpty()
                    ? "no field of that name in the class"
                    : "field exists with type " + String.join(", ", sameName);
        }

        List<String> sameName = new ArrayList<>();
        for (Method method : owner.getMethods()) {
            if (!method.getName().equals(target.memberName())) continue;
            String descriptor = "(" + String.join("", method.getParameterTypes()) + ")"
                    + method.getReturnType();
            if (method.getParameterTypes().equals(new ArrayList<CharSequence>(target.parameterTypes()))
                    && method.getReturnType().equals(target.returnType())) {
                return null;
            }
            sameName.add(descriptor);
        }
        return sameName.isEmpty()
                ? "no method of that name in the class"
                : "method exists as " + String.join(", ", sameName);
    }

    private static Map<String, ClassDef> loadClasses(File apk) throws IOException {
        Map<String, ClassDef> classes = new TreeMap<>();
        try (ZipFile zip = new ZipFile(apk)) {
            for (ZipEntry entry : java.util.Collections.list(zip.entries())) {
                if (!entry.getName().endsWith(".dex")) continue;
                try (InputStream stream = zip.getInputStream(entry)) {
                    byte[] bytes = stream.readAllBytes();
                    DexBackedDexFile dex = DexBackedDexFile.fromInputStream(
                            Opcodes.getDefault(), new java.io.ByteArrayInputStream(bytes));
                    for (ClassDef classDef : dex.getClasses()) {
                        classes.putIfAbsent(classDef.getType(), classDef);
                    }
                }
            }
        }
        return classes;
    }
}

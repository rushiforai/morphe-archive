import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.Locale;
import java.util.Set;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * Lists the methods that reference a string literal, from a Gboard APK.
 *
 * A flag name is only a name until something reads it. Finding the reader is the step that turns a
 * candidate string into an audited target: the release renames the class that holds the flag, but
 * the literal it compares against stays in the dex, so searching the literals finds the method and
 * the method's shape identifies the class.
 *
 * Usage: java -cp "libs/morphe-cli.jar" tools/bindings/StringRefs.java <gboard.apk> <substring> [--exact]
 *
 * Prints one line per distinct (method, literal) pair, ordered by class. Exits 0 when something
 * matched, 1 when nothing did, 2 on a usage or read error.
 */
public final class StringRefs {

    private static final String USAGE =
            "usage: StringRefs <gboard.apk> <substring> [--exact]";

    public static void main(String[] args) throws Exception {
        if (args.length < 2 || args.length > 3) {
            System.err.println(USAGE);
            System.exit(2);
        }
        File apk = new File(args[0]);
        if (!apk.isFile()) {
            System.err.println("error: APK not found: " + apk);
            System.exit(2);
        }
        String needle = args[1];
        boolean exact = args.length == 3 && args[2].equals("--exact");

        Set<String> hits = new LinkedHashSet<>();
        try (ZipFile zip = new ZipFile(apk)) {
            for (ZipEntry entry : Collections.list(zip.entries())) {
                if (!entry.getName().endsWith(".dex")) {
                    continue;
                }
                byte[] bytes;
                try (InputStream stream = zip.getInputStream(entry)) {
                    bytes = stream.readAllBytes();
                }
                DexBackedDexFile dex = DexBackedDexFile.fromInputStream(
                        Opcodes.getDefault(), new ByteArrayInputStream(bytes));
                for (ClassDef classDef : dex.getClasses()) {
                    for (Method method : classDef.getMethods()) {
                        if (method.getImplementation() == null) {
                            continue;
                        }
                        for (Instruction insn : method.getImplementation().getInstructions()) {
                            if (!(insn instanceof ReferenceInstruction reference)) {
                                continue;
                            }
                            if (!(reference.getReference() instanceof StringReference literal)) {
                                continue;
                            }
                            String value = literal.getString();
                            boolean matched = exact
                                    ? value.equals(needle)
                                    : value.toLowerCase(Locale.ROOT)
                                            .contains(needle.toLowerCase(Locale.ROOT));
                            if (matched) {
                                hits.add(descriptor(method) + "  \"" + value + "\"");
                            }
                        }
                    }
                }
            }
        }
        for (String hit : hits) {
            System.out.println(hit);
        }
        if (hits.isEmpty()) {
            System.err.println("no literal references " + (exact ? "exactly " : "") + "\"" + needle + "\"");
            System.exit(1);
        }
    }

    private static String descriptor(Method method) {
        StringBuilder descriptor = new StringBuilder();
        descriptor.append(method.getDefiningClass()).append("->").append(method.getName()).append("(");
        for (CharSequence parameter : method.getParameterTypes()) {
            descriptor.append(parameter);
        }
        return descriptor.append(")").append(method.getReturnType()).toString();
    }
}

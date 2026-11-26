import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * Lists the methods that read or write one field, from a Gboard APK.
 *
 * A flag definition is only a name until something consults it. The holder class is obfuscated and
 * the field is a single letter, so the only stable handle between releases is the pair (owner,
 * field) taken from that release's own constructor; this tool answers the next question, which
 * method actually gates behaviour on it.
 *
 * Usage: java -cp "libs/morphe-cli.jar" tools/bindings/FieldRefs.java <gboard.apk> '<class;>' [<field>]
 *
 * Without a field, every reference to any field of that class is printed. Exits 0 when something
 * matched, 1 when nothing did, 2 on a usage or read error.
 */
public final class FieldRefs {

    private static final String USAGE =
            "usage: FieldRefs <gboard.apk> '<class;>' [<field>]";

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
        String owner = args[1];
        String fieldName = args.length == 3 ? args[2] : null;

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
                            if (!(reference.getReference() instanceof FieldReference field)) {
                                continue;
                            }
                            if (!field.getDefiningClass().equals(owner)) {
                                continue;
                            }
                            if (fieldName != null && !field.getName().equals(fieldName)) {
                                continue;
                            }
                            hits.add(insn.getOpcode().name + " " + field.getDefiningClass()
                                    + "->" + field.getName() + "  in  " + descriptor(method));
                        }
                    }
                }
            }
        }
        for (String hit : hits) {
            System.out.println(hit);
        }
        if (hits.isEmpty()) {
            System.err.println("no field reference to " + owner
                    + (fieldName == null ? "" : "->" + fieldName));
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

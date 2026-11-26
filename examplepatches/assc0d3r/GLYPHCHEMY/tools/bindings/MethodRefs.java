import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * Lists the methods that call a given method owner, from a Gboard APK.
 *
 * A delegate indirection is invisible from the class that owns the field: the interesting method is
 * whichever caller forwards to the injected interface. Searching for the callee finds that forwarder
 * and its defining class, which is what a retarget needs.
 *
 * Usage: java -cp "libs/morphe-cli.jar" tools/bindings/MethodRefs.java <gboard.apk> '<owner;>' [<name>]
 *
 * Exits 0 when something matched, 1 when nothing did, 2 on a usage or read error.
 */
public final class MethodRefs {

    private static final String USAGE =
            "usage: MethodRefs <gboard.apk> '<owner;>' [<name>]";

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
        String targetName = args.length == 3 ? args[2] : null;

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
                            if (!(reference.getReference() instanceof MethodReference callee)) {
                                continue;
                            }
                            if (!callee.getDefiningClass().equals(owner)) {
                                continue;
                            }
                            if (targetName != null && !callee.getName().equals(targetName)) {
                                continue;
                            }
                            hits.add(callee.getDefiningClass() + "->" + callee.getName() + "("
                                    + String.join("", callee.getParameterTypes()) + ")"
                                    + callee.getReturnType()
                                    + "  called by  " + descriptor(method));
                        }
                    }
                }
            }
        }
        for (String hit : hits) {
            System.out.println(hit);
        }
        if (hits.isEmpty()) {
            System.err.println("no call to " + owner + (targetName == null ? "" : "->" + targetName));
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

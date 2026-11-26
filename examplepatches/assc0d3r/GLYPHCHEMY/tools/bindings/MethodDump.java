import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Field;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.util.Collections;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * Prints one class's declared members, or one method's instructions, from a Gboard APK.
 *
 * Re-deriving a binding means looking at a shape rather than a name: a release renames the class, so
 * the only way to find it again is to look for the member with the right parameters, register layout
 * or field types. This is that look-up, and it is also how an existing binding's assumptions are
 * confirmed - a patch that asserts "eleven registers and one Window.setLayout" has to be checkable
 * against the stock APK, not just against a previous build's output.
 *
 * Usage: java -cp "libs/morphe-cli.jar" tools/bindings/MethodDump.java <gboard.apk> '<class;>' [<method>]
 *
 * Without a method name, every field and method the class declares is listed with its descriptor and
 * access flags. With a method name, each matching overload prints its register count and instruction
 * list. Every dex file inside the APK is searched, and the class may live in any of them.
 *
 * Exits 0 when something matched, 1 when the class or method does not exist in that APK, and 2 on a
 * usage or read error.
 */
public final class MethodDump {

    private static final String USAGE =
            "usage: MethodDump <gboard.apk> '<class;>' [<method>]";

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
        String classType = args[1];
        String methodName = args.length == 3 ? args[2] : null;

        int matched = 0;
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
                    if (!classDef.getType().equals(classType)) {
                        continue;
                    }
                    matched += dumpClass(classDef, methodName);
                }
            }
        }
        if (matched == 0) {
            System.err.println("not found: " + classType + (methodName == null ? "" : "->" + methodName)
                    + " in " + apk.getName());
            System.exit(1);
        }
    }

    private static int dumpClass(ClassDef classDef, String methodName) {
        if (methodName == null) {
            System.out.println("class " + classDef.getType()
                    + " access=0x" + Integer.toHexString(classDef.getAccessFlags()));
            for (Field field : classDef.getFields()) {
                System.out.println("  field access=0x" + Integer.toHexString(field.getAccessFlags())
                        + " " + field.getType() + " " + field.getName());
            }
            for (Method method : classDef.getMethods()) {
                System.out.println("  method access=0x" + Integer.toHexString(method.getAccessFlags())
                        + " " + descriptor(method)
                        + " registers=" + registerCount(method));
            }
            return 1;
        }

        int printed = 0;
        for (Method method : classDef.getMethods()) {
            if (!method.getName().equals(methodName)) {
                continue;
            }
            System.out.println(descriptor(method) + " registers=" + registerCount(method)
                    + " access=0x" + Integer.toHexString(method.getAccessFlags()));
            int index = 0;
            for (Instruction insn : method.getImplementation().getInstructions()) {
                System.out.println("  " + index++ + ": " + format(insn));
            }
            printed++;
        }
        return printed;
    }

    private static String descriptor(Method method) {
        StringBuilder descriptor = new StringBuilder();
        descriptor.append(method.getDefiningClass()).append("->").append(method.getName()).append("(");
        for (CharSequence parameter : method.getParameterTypes()) {
            descriptor.append(parameter);
        }
        return descriptor.append(")").append(method.getReturnType()).toString();
    }

    private static int registerCount(Method method) {
        return method.getImplementation() == null ? 0 : method.getImplementation().getRegisterCount();
    }

    private static String format(Instruction insn) {
        StringBuilder line = new StringBuilder(insn.getOpcode().name);
        if (insn instanceof FiveRegisterInstruction five) {
            int count = five.getRegisterCount();
            int[] registers = {five.getRegisterC(), five.getRegisterD(), five.getRegisterE(),
                    five.getRegisterF(), five.getRegisterG()};
            line.append(" {");
            for (int slot = 0; slot < count; slot++) {
                line.append(slot == 0 ? "v" : ", v").append(registers[slot]);
            }
            line.append("}");
        } else if (insn instanceof RegisterRangeInstruction range) {
            line.append(" {v").append(range.getStartRegister())
                    .append(" .. v").append(range.getStartRegister() + range.getRegisterCount() - 1)
                    .append("}");
        } else if (insn instanceof TwoRegisterInstruction two) {
            line.append(" v").append(two.getRegisterA()).append(", v").append(two.getRegisterB());
        } else if (insn instanceof OneRegisterInstruction one) {
            line.append(" v").append(one.getRegisterA());
        }
        if (insn instanceof ReferenceInstruction reference) {
            line.append("  ").append(reference.getReference());
        } else if (insn instanceof NarrowLiteralInstruction literal) {
            line.append("  #").append(literal.getNarrowLiteral());
        } else if (insn instanceof WideLiteralInstruction literal) {
            line.append("  #").append(literal.getWideLiteral());
        }
        return line.toString();
    }
}

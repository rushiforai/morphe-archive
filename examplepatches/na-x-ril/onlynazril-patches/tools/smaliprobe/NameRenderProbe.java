import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.MethodImplementation;
import com.android.tools.smali.dexlib2.iface.MultiDexContainer;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.Reference;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import com.android.tools.smali.dexlib2.iface.reference.TypeReference;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * Register-level look at how a name is rendered, which DexKit alone cannot answer: its MethodData
 * stops at opcodes, and a hook needs to know which register holds the view and which holds the
 * text.
 *
 *   tools/smaliprobe/run.sh "<apk>" <class|scan:package> [method]
 *
 * Dumps one class's methods with their instructions, or scans a package for the methods that call
 * both User#getNickname and TextView#setText — the candidates for the comment name renderer.
 */
public class NameRenderProbe {
    private static final String NICKNAME =
            "Lcom/ss/android/ugc/aweme/profile/model/User;->getNickname()Ljava/lang/String;";
    private static final String SET_TEXT_CHAR_SEQUENCE =
            "Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V";
    private static final String SET_TEXT_STRING =
            "Landroid/widget/TextView;->setText(Ljava/lang/String;)V";

    /** Instructions printed either side of a call of interest. */
    private static final int WINDOW = 10;
    /** A method shorter than this is printed whole rather than in windows. */
    private static final int WHOLE_METHOD_LIMIT = 70;

    public static void main(String[] args) throws Exception {
        String apk = args[0];
        String what = args[1];
        String only = args.length > 2 ? args[2] : null;

        MultiDexContainer<? extends DexBackedDexFile> container =
                DexFileFactory.loadDexContainer(new File(apk), Opcodes.getDefault());
        System.out.println("apk=" + apk + "  dex entries=" + container.getDexEntryNames().size());

        if (what.startsWith("scan:")) {
            scan(container, what.substring("scan:".length()));
        } else {
            dump(container, what, only);
        }
    }

    /** Every method under [pkg] that reads the nickname and sets text, with the counts. */
    private static void scan(
            MultiDexContainer<? extends DexBackedDexFile> container, String pkg) throws Exception {
        String prefix = "L" + pkg.replace('.', '/');
        int methods = 0;
        for (String entryName : container.getDexEntryNames()) {
            DexBackedDexFile dex = container.getEntry(entryName).getDexFile();
            for (ClassDef classDef : dex.getClasses()) {
                if (!classDef.getType().startsWith(prefix)) continue;
                for (Method method : classDef.getMethods()) {
                    MethodImplementation impl = method.getImplementation();
                    if (impl == null) continue;
                    int nicknames = 0;
                    int setTexts = 0;
                    for (Instruction ins : impl.getInstructions()) {
                        String ref = referenceOf(ins);
                        if (ref == null) continue;
                        if (ref.equals(NICKNAME)) nicknames++;
                        else if (ref.equals(SET_TEXT_CHAR_SEQUENCE) || ref.equals(SET_TEXT_STRING)) {
                            setTexts++;
                        }
                    }
                    if (nicknames == 0 && setTexts == 0) continue;
                    methods++;
                    System.out.println("  " + classDef.getType() + "->" + method.getName()
                            + "(" + join(method.getParameterTypes()) + ")"
                            + method.getReturnType()
                            + "  nickname=" + nicknames + " setText=" + setTexts);
                    if (nicknames > 0 && setTexts > 0) {
                        System.out.println("      ^^^^ reads the nickname and sets text — candidate");
                    }
                }
            }
        }
        System.out.println("methods of interest: " + methods);
    }

    private static void dump(
            MultiDexContainer<? extends DexBackedDexFile> container, String className, String only)
            throws Exception {
        String descriptor = className.startsWith("L")
                ? className
                : "L" + className.replace('.', '/') + ";";
        for (String entryName : container.getDexEntryNames()) {
            DexBackedDexFile dex = container.getEntry(entryName).getDexFile();
            for (ClassDef classDef : dex.getClasses()) {
                if (!classDef.getType().equals(descriptor)) continue;
                System.out.println("\n### " + classDef.getType() + "  in " + entryName
                        + "  super=" + classDef.getSuperclass());
                System.out.println("  -- fields");
                classDef.getFields().forEach(f ->
                        System.out.println("     " + f.getType() + " " + f.getName()));
                System.out.println("  -- methods");
                for (Method method : classDef.getMethods()) {
                    if (only != null && !method.getName().equals(only)) continue;
                    describe(method);
                }
                return;
            }
        }
        System.out.println("class not found: " + descriptor);
    }

    private static void describe(Method method) {
        MethodImplementation impl = method.getImplementation();
        String head = method.getName() + "(" + join(method.getParameterTypes()) + ")"
                + method.getReturnType();
        if (impl == null) {
            System.out.println("    " + head + "   (no body)");
            return;
        }
        List<Instruction> instructions = new ArrayList<>();
        for (Instruction ins : impl.getInstructions()) instructions.add(ins);

        List<Integer> interesting = new ArrayList<>();
        for (int i = 0; i < instructions.size(); i++) {
            String ref = referenceOf(instructions.get(i));
            if (ref == null) continue;
            if (ref.equals(NICKNAME) || ref.equals(SET_TEXT_CHAR_SEQUENCE)
                    || ref.equals(SET_TEXT_STRING)) {
                interesting.add(i);
            }
        }
        System.out.println("\n    " + head + "   regs=" + impl.getRegisterCount()
                + " ops=" + instructions.size()
                + " hookPoints=" + interesting + "   [parameter sign: " + join(method.getParameterTypes()) + "]");

        if (instructions.size() <= WHOLE_METHOD_LIMIT) {
            for (int i = 0; i < instructions.size(); i++) {
                System.out.println("      " + String.format("%3d", i) + "  " + line(instructions.get(i)));
            }
            return;
        }
        boolean[] shown = new boolean[instructions.size()];
        for (int centre : interesting) {
            for (int i = Math.max(0, centre - WINDOW);
                 i < Math.min(instructions.size(), centre + WINDOW); i++) {
                shown[i] = true;
            }
            shown[centre] = true;
        }
        for (int i = 0; i < instructions.size(); i++) {
            if (!shown[i]) {
                System.out.println("      ...");
                // skip the run
                while (i < instructions.size() && !shown[i]) i++;
                i--;
                continue;
            }
            System.out.println("      " + String.format("%3d", i) + "  " + line(instructions.get(i)));
        }
    }

    private static String line(Instruction ins) {
        StringBuilder sb = new StringBuilder(ins.getOpcode().name);
        String registers = registersOf(ins);
        if (registers != null) sb.append(' ').append(registers);
        if (ins instanceof WideLiteralInstruction) {
            sb.append(" #").append(((WideLiteralInstruction) ins).getWideLiteral());
        } else if (ins instanceof NarrowLiteralInstruction) {
            sb.append(" #").append(((NarrowLiteralInstruction) ins).getNarrowLiteral());
        }
        if (ins instanceof ReferenceInstruction) {
            sb.append(", ").append(referenceText(((ReferenceInstruction) ins).getReference()));
        }
        if (ins instanceof OffsetInstruction) {
            sb.append(" ->").append(((OffsetInstruction) ins).getCodeOffset());
        }
        String ref = referenceOf(ins);
        if (ref != null && (ref.equals(NICKNAME) || ref.startsWith("Landroid/widget/TextView;->setText")
                || ref.startsWith("Landroid/widget/TextView;->append"))) {
            sb.append("        <== INTERESTING");
        }
        return sb.toString();
    }

    /** The four bits of a plain invoke reach v0..v15; a staged call is what a hook must not break. */
    private static String registersOf(Instruction ins) {
        if (ins instanceof RegisterRangeInstruction) {
            RegisterRangeInstruction range = (RegisterRangeInstruction) ins;
            int start = range.getStartRegister();
            int end = start + range.getRegisterCount() - 1;
            return "{v" + start + " .. v" + end + "}";
        }
        if (ins instanceof FiveRegisterInstruction) {
            FiveRegisterInstruction five = (FiveRegisterInstruction) ins;
            int[] all = {five.getRegisterC(), five.getRegisterD(), five.getRegisterE(),
                    five.getRegisterF(), five.getRegisterG()};
            StringBuilder sb = new StringBuilder("{");
            for (int i = 0; i < five.getRegisterCount(); i++) {
                if (i > 0) sb.append(", ");
                sb.append('v').append(all[i]);
            }
            return sb.append('}').toString();
        }
        if (ins instanceof ThreeRegisterInstruction) {
            ThreeRegisterInstruction three = (ThreeRegisterInstruction) ins;
            return "{v" + three.getRegisterA() + ", v" + three.getRegisterB()
                    + ", v" + three.getRegisterC() + "}";
        }
        if (ins instanceof TwoRegisterInstruction) {
            TwoRegisterInstruction two = (TwoRegisterInstruction) ins;
            return "{v" + two.getRegisterA() + ", v" + two.getRegisterB() + "}";
        }
        if (ins instanceof OneRegisterInstruction) {
            return "v" + ((OneRegisterInstruction) ins).getRegisterA();
        }
        return null;
    }

    private static String referenceOf(Instruction ins) {
        if (!(ins instanceof ReferenceInstruction)) return null;
        Reference ref = ((ReferenceInstruction) ins).getReference();
        if (!(ref instanceof MethodReference)) {
            return ref instanceof FieldReference
                    ? ((FieldReference) ref).getDefiningClass() + "->" + ((FieldReference) ref).getName()
                    : null;
        }
        MethodReference method = (MethodReference) ref;
        return method.getDefiningClass() + "->" + method.getName()
                + "(" + join(method.getParameterTypes()) + ")" + method.getReturnType();
    }

    private static String referenceText(Reference ref) {
        if (ref instanceof MethodReference) {
            MethodReference method = (MethodReference) ref;
            return method.getDefiningClass() + "->" + method.getName()
                    + "(" + join(method.getParameterTypes()) + ")" + method.getReturnType();
        }
        if (ref instanceof FieldReference) {
            FieldReference field = (FieldReference) ref;
            return field.getDefiningClass() + "->" + field.getName() + ":" + field.getType();
        }
        if (ref instanceof StringReference) {
            return '"' + ((StringReference) ref).getString() + '"';
        }
        if (ref instanceof TypeReference) {
            return ((TypeReference) ref).getType();
        }
        return String.valueOf(ref);
    }

    private static String join(Iterable<? extends CharSequence> parts) {
        StringBuilder sb = new StringBuilder();
        for (CharSequence part : parts) {
            if (sb.length() > 0) sb.append(',');
            sb.append(part);
        }
        return sb.toString();
    }
}

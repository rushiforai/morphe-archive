import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.Reference;

import java.io.File;
import java.nio.file.*;
import java.util.*;
import java.util.regex.*;

/**
 * Compares the code of two APKs, ignoring debug info and signing. Used to check that a BitChord
 * built from source compiles to the same classes as the official release, which is what makes
 * testing unreleased branch builds meaningful.
 *
 * <p>Usage: CompareDex official.apk rebuilt.apk [TelegramPatch.kt]
 *
 * <p>With the patch source given, the classes it hooks are checked separately. Exits 0 when every
 * hooked class is identical.
 */
public class CompareDex {
    public static void main(String[] args) throws Exception {
        Map<String, String> official = classes(new File(args[0]));
        Map<String, String> rebuilt = classes(new File(args[1]));
        Set<String> all = new TreeSet<>(official.keySet());
        all.addAll(rebuilt.keySet());
        List<String> differ = new ArrayList<>();
        for (String type : all)
            if (!Objects.equals(official.get(type), rebuilt.get(type))) differ.add(type);
        System.out.printf(
                "%d classes in the official APK, %d in the rebuilt one, %d differ.%n",
                official.size(), rebuilt.size(), differ.size());
        for (String type : differ.subList(0, Math.min(20, differ.size())))
            System.out.println(
                    "  differs: "
                            + type
                            + (official.containsKey(type) ? "" : " (only rebuilt)")
                            + (rebuilt.containsKey(type) ? "" : " (only official)"));
        if (args.length < 3) return;
        Set<String> hooked = new TreeSet<>();
        Matcher match =
                Pattern.compile("L(com/music/bitchord/[A-Za-z0-9_/$]+);")
                        .matcher(Files.readString(Path.of(args[2])).replace("\\$", "$"));
        while (match.find()) hooked.add("L" + match.group(1) + ";");
        List<String> hookedDiffer = new ArrayList<>();
        for (String type : hooked)
            if (official.containsKey(type)
                    && !Objects.equals(official.get(type), rebuilt.get(type)))
                hookedDiffer.add(type);
        System.out.printf(
                "%d host classes named by the patch, %d of them differ.%n",
                hooked.size(), hookedDiffer.size());
        for (String type : hookedDiffer) System.out.println("  hooked class differs: " + type);
        if (!hookedDiffer.isEmpty()) System.exit(1);
    }

    static Map<String, String> classes(File apk) throws Exception {
        Map<String, String> result = new HashMap<>();
        var container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault());
        for (String entry : container.getDexEntryNames()) {
            DexFile dex = container.getEntry(entry).getDexFile();
            for (ClassDef c : dex.getClasses()) result.put(c.getType(), describe(c));
        }
        return result;
    }

    static String describe(ClassDef c) {
        StringBuilder out = new StringBuilder();
        out.append(c.getAccessFlags())
                .append(' ')
                .append(c.getSuperclass())
                .append(c.getInterfaces())
                .append('\n');
        List<String> members = new ArrayList<>();
        for (Field f : c.getFields())
            members.add(
                    "field "
                            + f.getName()
                            + ':'
                            + f.getType()
                            + ' '
                            + f.getAccessFlags()
                            + " = "
                            + f.getInitialValue());
        for (Method m : c.getMethods()) {
            StringBuilder method = new StringBuilder("method ");
            method.append(m.getName())
                    .append(m.getParameterTypes())
                    .append(m.getReturnType())
                    .append(' ')
                    .append(m.getAccessFlags());
            MethodImplementation impl = m.getImplementation();
            if (impl != null) {
                method.append(" registers ").append(impl.getRegisterCount());
                for (Instruction i : impl.getInstructions()) {
                    method.append("\n  ").append(i.getOpcode().name);
                    if (i instanceof ReferenceInstruction) {
                        Reference r = ((ReferenceInstruction) i).getReference();
                        method.append(' ').append(r);
                    }
                    if (i instanceof NarrowLiteralInstruction)
                        method.append(" #")
                                .append(((NarrowLiteralInstruction) i).getNarrowLiteral());
                    else if (i instanceof WideLiteralInstruction)
                        method.append(" #").append(((WideLiteralInstruction) i).getWideLiteral());
                    if (i instanceof OffsetInstruction)
                        method.append(" @").append(((OffsetInstruction) i).getCodeOffset());
                    if (i instanceof OneRegisterInstruction)
                        method.append(" v").append(((OneRegisterInstruction) i).getRegisterA());
                    if (i instanceof TwoRegisterInstruction)
                        method.append(" v").append(((TwoRegisterInstruction) i).getRegisterB());
                    if (i instanceof ThreeRegisterInstruction)
                        method.append(" v").append(((ThreeRegisterInstruction) i).getRegisterC());
                    if (i instanceof FiveRegisterInstruction) {
                        FiveRegisterInstruction f = (FiveRegisterInstruction) i;
                        method.append(" {")
                                .append(f.getRegisterCount())
                                .append(':')
                                .append(f.getRegisterC())
                                .append(',')
                                .append(f.getRegisterD())
                                .append(',')
                                .append(f.getRegisterE())
                                .append(',')
                                .append(f.getRegisterF())
                                .append(',')
                                .append(f.getRegisterG())
                                .append('}');
                    }
                    if (i instanceof RegisterRangeInstruction) {
                        RegisterRangeInstruction r = (RegisterRangeInstruction) i;
                        method.append(" {")
                                .append(r.getStartRegister())
                                .append("..+")
                                .append(r.getRegisterCount())
                                .append('}');
                    }
                    if (i instanceof SwitchPayload)
                        for (SwitchElement e : ((SwitchPayload) i).getSwitchElements())
                            method.append(' ')
                                    .append(e.getKey())
                                    .append("->")
                                    .append(e.getOffset());
                }
                for (TryBlock<? extends ExceptionHandler> t : impl.getTryBlocks()) {
                    method.append("\n  try ")
                            .append(t.getStartCodeAddress())
                            .append('+')
                            .append(t.getCodeUnitCount());
                    for (ExceptionHandler h : t.getExceptionHandlers())
                        method.append(' ')
                                .append(h.getExceptionType())
                                .append("->")
                                .append(h.getHandlerCodeAddress());
                }
            }
            members.add(method.toString());
        }
        Collections.sort(members);
        for (String member : members) out.append(member).append('\n');
        return out.toString();
    }
}

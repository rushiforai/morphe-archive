import java.io.File;
import java.util.Set;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
class DexInspect {
    public static void main(String[] args) throws Exception {
        var container = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        var classes = Set.of(java.util.Arrays.copyOfRange(args, 1, args.length));
        for (var entry : container.getDexEntryNames()) for (var type : container.getEntry(entry).getDexFile().getClasses()) {
            if (!classes.contains(type.getType().substring(1, type.getType().length() - 1))) continue;
            System.out.println(type.getType());
            for (var method : type.getMethods()) {
                System.out.println("  " + method);
                if (method.getImplementation() == null) continue;
                System.out.println("    registers=" + method.getImplementation().getRegisterCount());
                var i = 0;
                for (var insn : method.getImplementation().getInstructions()) {
                    System.out.printf("%5d %s %s%s%s%s%n", i, insn.getOpcode(), registers(insn),
                        insn instanceof OffsetInstruction branch ? "offset=" + branch.getCodeOffset() + " " : "",
                        insn instanceof WideLiteralInstruction literal ? "literal=0x" + Long.toHexString(literal.getWideLiteral()) + " " : "",
                        insn instanceof ReferenceInstruction ref ? ref.getReference() : "");
                    i++;
                }
            }
        }
    }

    private static String registers(Instruction instruction) {
        if (instruction instanceof RegisterRangeInstruction range) {
            return "v" + range.getStartRegister() + " count=" + range.getRegisterCount() + " ";
        }
        if (instruction instanceof FiveRegisterInstruction call) {
            int[] values = {call.getRegisterC(), call.getRegisterD(), call.getRegisterE(), call.getRegisterF(), call.getRegisterG()};
            return java.util.Arrays.toString(java.util.Arrays.copyOf(values, call.getRegisterCount())) + " ";
        }
        if (instruction instanceof TwoRegisterInstruction pair) return "v" + pair.getRegisterA() + ",v" + pair.getRegisterB() + " ";
        if (instruction instanceof OneRegisterInstruction single) return "v" + single.getRegisterA() + " ";
        return "";
    }
}

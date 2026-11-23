import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;
import java.util.*;

/**
 * GuardScan apk : reports generated Shapes.HIDE_* guards whose register is later consumed as a
 * reference, including by the block a branch jumps to.
 *
 * The verifier only reports these when the class is loaded, so this scans the patched DEX instead.
 * Linear within a block, and it follows the single branch that consumes the guard (if-eqz).
 */
public class GuardScan {
    static boolean isGuard(Instruction ins) {
        if (ins.getOpcode() != Opcode.SGET_BOOLEAN) return false;
        String ref = ((ReferenceInstruction) ins).getReference().toString();
        return ref.startsWith("Lorg/ungoogled/ui/Shapes;->HIDE_");
    }

    static boolean readsReference(Instruction ins, int r) {
        switch (ins.getOpcode()) {
            case IGET_OBJECT: case IGET_BOOLEAN: case IGET: case IGET_WIDE: case IGET_SHORT: case IGET_BYTE: case IGET_CHAR:
            case IPUT_OBJECT: case IPUT_BOOLEAN: case IPUT: case IPUT_WIDE: case IPUT_SHORT: case IPUT_BYTE: case IPUT_CHAR:
            case AGET_OBJECT: case AGET_BOOLEAN: case AGET: case AGET_WIDE: case AGET_SHORT: case AGET_BYTE: case AGET_CHAR:
            case APUT_OBJECT: case APUT_BOOLEAN: case APUT: case APUT_WIDE: case APUT_SHORT: case APUT_BYTE: case APUT_CHAR:
            case ARRAY_LENGTH: case INSTANCE_OF:
                return ((TwoRegisterInstruction) ins).getRegisterB() == r;
            case CHECK_CAST: case RETURN_OBJECT: case THROW: case MONITOR_ENTER: case MONITOR_EXIT:
                return ((OneRegisterInstruction) ins).getRegisterA() == r;
            case MOVE_OBJECT: case MOVE_OBJECT_FROM16: case MOVE_OBJECT_16:
                return ((TwoRegisterInstruction) ins).getRegisterB() == r;
            default:
                if (ins instanceof RegisterRangeInstruction) {
                    RegisterRangeInstruction rr = (RegisterRangeInstruction) ins;
                    if (!ins.getOpcode().name().startsWith("INVOKE_")) return false;
                    MethodReference mr = (MethodReference) ((ReferenceInstruction) ins).getReference();
                    boolean isStatic = ins.getOpcode() == Opcode.INVOKE_STATIC_RANGE;
                    int slot = 0;
                    if (!isStatic) {
                        if (r == rr.getStartRegister()) return true;
                        slot = 1;
                    }
                    List<? extends CharSequence> params = mr.getParameterTypes();
                    for (int i = slot; i < rr.getRegisterCount() && i - slot < params.size(); i++) {
                        String t = params.get(i - slot).toString();
                        if ((t.startsWith("L") || t.startsWith("[")) && rr.getStartRegister() + i == r) return true;
                    }
                    return false;
                }
                if (ins.getOpcode().name().startsWith("INVOKE_") && ins instanceof FiveRegisterInstruction) {
                    FiveRegisterInstruction f = (FiveRegisterInstruction) ins;
                    int[] regs = {f.getRegisterC(), f.getRegisterD(), f.getRegisterE(), f.getRegisterF(), f.getRegisterG()};
                    MethodReference mr = (MethodReference) ((ReferenceInstruction) ins).getReference();
                    boolean isStatic = ins.getOpcode() == Opcode.INVOKE_STATIC;
                    int slot = 0;
                    if (!isStatic) {
                        if (regs[0] == r) return true;
                        slot = 1;
                    }
                    List<? extends CharSequence> params = mr.getParameterTypes();
                    for (int i = slot; i < f.getRegisterCount() && i - slot < params.size(); i++) {
                        if (r != regs[i]) continue;
                        String t = params.get(i - slot).toString();
                        if (t.startsWith("L") || t.startsWith("[")) return true;
                    }
                }
                return false;
        }
    }

    static boolean writes(Instruction ins, int r) {
        switch (ins.getOpcode()) {
            case MOVE_RESULT: case MOVE_RESULT_OBJECT: case MOVE_RESULT_WIDE:
            case CONST_4: case CONST_16: case CONST: case CONST_HIGH16: case CONST_WIDE_16: case CONST_WIDE_32:
            case CONST_WIDE: case CONST_WIDE_HIGH16: case CONST_STRING: case CONST_STRING_JUMBO: case CONST_CLASS:
            case NEW_INSTANCE: case NEW_ARRAY:
            case SGET: case SGET_WIDE: case SGET_OBJECT: case SGET_BOOLEAN: case SGET_BYTE: case SGET_CHAR: case SGET_SHORT:
            case IGET: case IGET_WIDE: case IGET_OBJECT: case IGET_BOOLEAN: case IGET_BYTE: case IGET_CHAR: case IGET_SHORT:
            case ARRAY_LENGTH: case INSTANCE_OF: case CHECK_CAST:
            case CMPL_FLOAT: case CMPG_FLOAT: case CMPL_DOUBLE: case CMPG_DOUBLE: case CMP_LONG:
            case ADD_INT: case SUB_INT: case MUL_INT: case DIV_INT: case REM_INT: case AND_INT: case OR_INT: case XOR_INT:
            case SHL_INT: case SHR_INT: case USHR_INT: case ADD_LONG: case SUB_LONG: case MUL_LONG: case DIV_LONG:
            case ADD_FLOAT: case SUB_FLOAT: case MUL_FLOAT: case DIV_FLOAT: case REM_FLOAT:
            case ADD_DOUBLE: case SUB_DOUBLE: case MUL_DOUBLE: case DIV_DOUBLE: case REM_DOUBLE:
            case NEG_INT: case NOT_INT: case NEG_LONG: case NOT_LONG: case NEG_FLOAT: case NEG_DOUBLE:
            case INT_TO_LONG: case INT_TO_FLOAT: case INT_TO_DOUBLE: case LONG_TO_INT: case LONG_TO_FLOAT: case LONG_TO_DOUBLE:
            case FLOAT_TO_INT: case FLOAT_TO_LONG: case FLOAT_TO_DOUBLE: case DOUBLE_TO_INT: case DOUBLE_TO_LONG: case DOUBLE_TO_FLOAT:
            case INT_TO_BYTE: case INT_TO_CHAR: case INT_TO_SHORT: case ADD_INT_LIT16: case RSUB_INT:
            case MUL_INT_LIT16: case DIV_INT_LIT16: case REM_INT_LIT16: case AND_INT_LIT16: case OR_INT_LIT16: case XOR_INT_LIT16:
            case ADD_INT_LIT8: case RSUB_INT_LIT8: case MUL_INT_LIT8: case DIV_INT_LIT8: case REM_INT_LIT8:
            case AND_INT_LIT8: case OR_INT_LIT8: case XOR_INT_LIT8: case SHL_INT_LIT8: case SHR_INT_LIT8: case USHR_INT_LIT8:
            case MOVE: case MOVE_FROM16: case MOVE_16: case MOVE_OBJECT: case MOVE_OBJECT_FROM16: case MOVE_OBJECT_16:
            case MOVE_WIDE: case MOVE_WIDE_FROM16: case MOVE_WIDE_16:
                return ((OneRegisterInstruction) ins).getRegisterA() == r;
            default:
                return false;
        }
    }

    static String where(Method m) { return m.toString(); }

    public static void main(String[] a) throws Exception {
        var c = DexFileFactory.loadDexContainer(new File(a[0]), Opcodes.getDefault());
        int methods = 0, guards = 0, bugs = 0;
        for (String d : c.getDexEntryNames()) {
            for (ClassDef cd : c.getEntry(d).getDexFile().getClasses()) {
                for (Method m : cd.getMethods()) {
                    MethodImplementation body = m.getImplementation();
                    if (body == null) continue;
                    methods++;
                    List<Instruction> ins = new ArrayList<>();
                    int[] at = null;
                    for (Instruction i : body.getInstructions()) ins.add(i);
                    at = new int[ins.size()];
                    int cu = 0;
                    for (int i = 0; i < ins.size(); i++) { at[i] = cu; cu += ins.get(i).getCodeUnits(); }
                    for (int i = 0; i < ins.size(); i++) {
                        if (!isGuard(ins.get(i))) continue;
                        guards++;
                        int r = ((OneRegisterInstruction) ins.get(i)).getRegisterA();
                        boolean reported = false;
                        // 1) straight-line use before the register is rewritten
                        for (int j = i + 1; j < Math.min(ins.size(), i + 60); j++) {
                            Instruction next = ins.get(j);
                            if (writes(next, r)) break;
                            if (readsReference(next, r)) {
                                bugs++; reported = true;
                                System.out.println("BUG(line) " + where(m) + "  guard@" + i + " reg=v" + r + "  read@" + j + " " + next.getOpcode());
                                break;
                            }
                        }
                        if (reported) continue;
                        // 2) the branch that consumes the guard hands its state to the target block
                        Instruction branch = ins.get(Math.min(i + 1, ins.size() - 1));
                        if (!(branch instanceof OffsetInstruction)) continue;
                        int targetAddr = at[i + 1] + ((OffsetInstruction) branch).getCodeOffset();
                        for (int k = 0; k < ins.size(); k++) {
                            if (at[k] != targetAddr) continue;
                            if (readsReference(ins.get(k), r)) {
                                bugs++;
                                System.out.println("BUG(branch) " + where(m) + "  guard@" + i + " reg=v" + r + "  target@" + k + " " + ins.get(k).getOpcode());
                            }
                            break;
                        }
                    }
                }
            }
        }
        System.out.println("methods=" + methods + " guards=" + guards + " bugs=" + bugs);
    }
}

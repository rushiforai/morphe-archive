import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;

import java.io.File;
import java.util.*;

/** Checks branch, switch and try/catch targets in every DEX method. Not a full ART verifier. */
public final class VerifyDexControlFlow {
    static long methods, instructions, branches, cases, handlers;
    static final List<String> errors = new ArrayList<>();

    static void require(boolean ok, String message) {
        if (!ok) errors.add(message);
    }

    static boolean executable(Instruction instruction) {
        return instruction != null && !(instruction instanceof PayloadInstruction);
    }

    static void verify(Method method) {
        MethodImplementation implementation = method.getImplementation();
        if (implementation == null) return;
        methods++;
        Map<Integer, Instruction> code = new LinkedHashMap<>();
        int end = 0;
        for (Instruction instruction : implementation.getInstructions()) {
            code.put(end, instruction);
            end += instruction.getCodeUnits();
            instructions++;
        }
        String owner = method.toString();
        for (var entry : code.entrySet()) {
            int pc = entry.getKey();
            Instruction instruction = entry.getValue();
            if (instruction instanceof PayloadInstruction)
                require(
                        (pc & 1) == 0,
                        owner + ": unaligned payload at 0x" + Integer.toHexString(pc));
            if (!(instruction instanceof OffsetInstruction offset)) continue;
            int target = pc + offset.getCodeOffset();
            Instruction destination = code.get(target);
            String at =
                    owner
                            + ": 0x"
                            + Integer.toHexString(pc)
                            + " -> 0x"
                            + Integer.toHexString(target);
            if (instruction.getOpcode() == Opcode.PACKED_SWITCH
                    || instruction.getOpcode() == Opcode.SPARSE_SWITCH) {
                boolean correctKind =
                        instruction.getOpcode() == Opcode.PACKED_SWITCH
                                ? destination != null
                                        && destination.getOpcode() == Opcode.PACKED_SWITCH_PAYLOAD
                                : destination != null
                                        && destination.getOpcode() == Opcode.SPARSE_SWITCH_PAYLOAD;
                require(correctKind, at + " does not address its switch payload");
                if (destination instanceof SwitchPayload payload)
                    for (SwitchElement element : payload.getSwitchElements()) {
                        int caseTarget = pc + element.getOffset();
                        cases++;
                        require(
                                executable(code.get(caseTarget)),
                                at
                                        + ": switch case -> 0x"
                                        + Integer.toHexString(caseTarget)
                                        + " is not an instruction");
                    }
            } else if (instruction.getOpcode() == Opcode.FILL_ARRAY_DATA) {
                require(
                        destination != null && destination.getOpcode() == Opcode.ARRAY_PAYLOAD,
                        at + " does not address array data");
            } else {
                branches++;
                require(executable(destination), at + " is not an executable instruction boundary");
                if (destination != null)
                    require(
                            destination.getOpcode() != Opcode.MOVE_RESULT
                                    && destination.getOpcode() != Opcode.MOVE_RESULT_OBJECT
                                    && destination.getOpcode() != Opcode.MOVE_RESULT_WIDE
                                    && destination.getOpcode() != Opcode.MOVE_EXCEPTION,
                            at + " jumps into a result/exception instruction");
            }
        }
        for (TryBlock<? extends ExceptionHandler> block : implementation.getTryBlocks()) {
            require(
                    executable(code.get(block.getStartCodeAddress())),
                    owner + ": invalid try start");
            int stop = block.getStartCodeAddress() + block.getCodeUnitCount();
            require(
                    stop <= end && (stop == end || code.containsKey(stop)),
                    owner + ": invalid try end");
            for (ExceptionHandler handler : block.getExceptionHandlers()) {
                handlers++;
                require(
                        executable(code.get(handler.getHandlerCodeAddress())),
                        owner + ": invalid exception handler");
            }
        }
    }

    public static void main(String[] args) throws Exception {
        var container = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        for (String entry : container.getDexEntryNames())
            for (ClassDef cls : container.getEntry(entry).getDexFile().getClasses())
                for (Method method : cls.getMethods()) verify(method);
        if (!errors.isEmpty()) {
            errors.stream().limit(30).forEach(System.err::println);
            throw new AssertionError(errors.size() + " invalid DEX control-flow targets");
        }
        System.out.printf(
                "PASS: %,d method bodies, %,d instructions, %,d branches, %,d switch cases and %,d"
                        + " exception handlers; DEX targets/alignment valid.%n",
                methods, instructions, branches, cases, handlers);
    }
}

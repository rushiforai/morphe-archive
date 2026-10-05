import java.io.File;
import java.util.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;

/** Run against a patched APK, using morphe.jar on the classpath. */
public final class PaidHooksDexTest {
    static void check(Method method) {
        MethodImplementation implementation = method.getImplementation();
        List<Instruction> code = new ArrayList<>();
        Map<Integer, Integer> positions = new HashMap<>();
        int address = 0;
        for (Instruction instruction : implementation.getInstructions()) {
            positions.put(address, code.size()); code.add(instruction); address += instruction.getCodeUnits();
        }
        int[] addresses = new int[code.size()];
        for (Map.Entry<Integer, Integer> entry : positions.entrySet()) addresses[entry.getValue()] = entry.getKey();
        ArrayDeque<int[]> queue = new ArrayDeque<>(); Set<String> visited = new HashSet<>();
        queue.add(new int[]{0, 0});
        for (TryBlock<? extends ExceptionHandler> block : implementation.getTryBlocks())
            for (ExceptionHandler handler : block.getExceptionHandlers()) queue.add(new int[]{positions.get(handler.getHandlerCodeAddress()), 0});
        int returns = 0;
        while (!queue.isEmpty()) {
            int[] state = queue.remove(); int index = state[0]; boolean bound = state[1] != 0;
            if (index < 0 || index >= code.size() || !visited.add(index + ":" + bound)) continue;
            Instruction instruction = code.get(index); Opcode opcode = instruction.getOpcode();
            Reference ref = instruction instanceof ReferenceInstruction ? ((ReferenceInstruction)instruction).getReference() : null;
            if (ref instanceof MethodReference) {
                MethodReference call = (MethodReference)ref;
                if (call.getDefiningClass().equals("Le/e/a/PaidVideos;") && call.getName().equals("bindAdapter")) bound = true;
            }
            if (opcode == Opcode.RETURN_OBJECT) {
                if (!bound) throw new AssertionError("List return at DEX address " + addresses[index] + " can bypass paid-label binding");
                returns++; continue;
            }
            if (opcode == Opcode.THROW) continue;
            if (opcode.name().startsWith("GOTO") || opcode.name().startsWith("IF_")) {
                Integer target = positions.get(addresses[index] + ((OffsetInstruction)instruction).getCodeOffset());
                if (target == null) throw new AssertionError("Invalid branch target");
                queue.add(new int[]{target, bound ? 1 : 0});
                if (opcode.name().startsWith("GOTO")) continue;
            }
            queue.add(new int[]{index + 1, bound ? 1 : 0});
        }
        if (returns != 3) throw new AssertionError("Unexpected reachable list returns: " + returns);
    }
    public static void main(String[] args) throws Exception {
        MultiDexContainer<? extends DexFile> dex = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        for (String entry : dex.getDexEntryNames()) for (ClassDef cls : dex.getEntry(entry).getDexFile().getClasses())
            if (cls.getType().equals("Le/e/a/b0;")) for (Method method : cls.getMethods()) if (method.getName().equals("getView")) {
                check(method); System.out.println("All initial, reused and exception-path list returns pass paid-label binding"); return;
            }
        throw new AssertionError("Video list adapter not found");
    }
}

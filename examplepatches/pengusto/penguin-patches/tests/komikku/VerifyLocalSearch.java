// SPDX-License-Identifier: GPL-3.0-only
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import java.io.File;
import java.util.*;

/** All instructions/incoming edges must survive; only the null edge may change. */
class VerifyLocalSearch {
    static Method method(String apk) throws Exception {
        var dex = DexFileFactory.loadDexContainer(new File(apk), Opcodes.getDefault());
        for (var name : dex.getDexEntryNames()) for (var c : dex.getEntry(name).getDexFile().getClasses())
            if (c.getType().equals("Leu/kanade/tachiyomi/ui/library/LibraryScreenModel;"))
                for (var m : c.getMethods()) if (m.getName().equals("filterManga")) return m;
        throw new AssertionError("Missing library predicate");
    }
    static Map<String,String> fields(Instruction ins) throws Exception {
        var result = new TreeMap<String,String>();
        for (var m : ins.getClass().getMethods()) if (m.getName().startsWith("get") && !m.getName().equals("getClass") && m.getParameterCount() == 0) {
            m.setAccessible(true); result.put(m.getName(), String.valueOf(m.invoke(ins)));
        }
        return result;
    }
    public static void main(String[] args) throws Exception {
        var before = new ArrayList<Instruction>(); method(args[0]).getImplementation().getInstructions().forEach(before::add);
        var after = new ArrayList<Instruction>(); method(args[1]).getImplementation().getInstructions().forEach(after::add);
        if (before.size() != after.size()) throw new AssertionError("Instruction count changed");
        int address = 0, guardAddress = 0, continuation = 0;
        for (int i = 0; i < before.size(); i++) {
            if (i == 239) guardAddress = address;
            if (i == 243) continuation = address;
            var left = fields(before.get(i)); var right = fields(after.get(i));
            if (i == 239) {left.remove("getCodeOffset"); right.remove("getCodeOffset");}
            if (!left.equals(right)) throw new AssertionError("Unexpected instruction/branch change at " + i + ": " + left + " / " + right);
            address += before.get(i).getCodeUnits();
        }
        var guard = after.get(239);
        if (guard.getOpcode() != Opcode.IF_EQZ || ((OneRegisterInstruction)guard).getRegisterA() != 5 ||
            guardAddress + ((OffsetInstruction)guard).getCodeOffset() != continuation) throw new AssertionError("Wrong null continuation");
        int incoming = 0; address = 0;
        for (var ins : before) {
            if (ins instanceof OffsetInstruction branch && address + branch.getCodeOffset() == guardAddress) incoming++;
            address += ins.getCodeUnits();
        }
        if (incoming < 2) throw new AssertionError("Missing regression's incoming branches");
        System.out.println("PASS: " + before.size() + " predicate instructions preserved; " + incoming + " incoming branches still reach the guard; only its null edge changes");
    }
}

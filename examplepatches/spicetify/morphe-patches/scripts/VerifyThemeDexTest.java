import java.util.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class VerifyThemeDexTest {
    enum Change { NONE, MISSING, REGISTER, RESULT, COLOR, DUPLICATE }

    @Test void acceptsEveryHook() { VerifyThemeDex.verify(palette(Change.NONE), true); }

    @Test void rejectsBrokenHooks() {
        for (var change : Change.values()) if (change != Change.NONE) {
            assertThrows(AssertionError.class, () -> VerifyThemeDex.verify(palette(change), true), change.name());
        }
    }

    @Test void rejectsHooksWhenNotSelected() {
        assertThrows(AssertionError.class, () -> VerifyThemeDex.verify(palette(Change.NONE), false));
    }

    @Test void acceptsStockPaletteWhenNotSelected() {
        VerifyThemeDex.verify(new ImmutableClassDef("Lp/fdu;", 1, "Ljava/lang/Object;", List.of(), null,
                Set.of(), List.of(), List.of()), false);
    }

    ImmutableClassDef palette(Change change) {
        var map = new ImmutableMethodReference("Lapp/spicetify/extension/spotify/theme/EncorePalette;", "map", List.of("J"), "J");
        var code = new ArrayList<Instruction>();
        var colors = new ArrayList<>(new TreeSet<>(VerifyThemeDex.COLORS));
        if (change == Change.DUPLICATE) colors.add(colors.get(0));
        for (int i = 0; i < colors.size(); i++) {
            long color = change == Change.COLOR && i == 0 ? 0xFF000000L : colors.get(i);
            code.add(new ImmutableInstruction51l(Opcode.CONST_WIDE, 2, color));
            if (change == Change.MISSING && i == 0) continue;
            code.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, change == Change.REGISTER && i == 0 ? 4 : 2, 2, map));
            code.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_WIDE, change == Change.RESULT && i == 0 ? 4 : 2));
        }
        code.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
        var method = new ImmutableMethod("Lp/fdu;", "<clinit>", List.of(), "V", 8, Set.of(), Set.of(),
                new ImmutableMethodImplementation(6, code, List.of(), List.of()));
        return new ImmutableClassDef("Lp/fdu;", 1, "Ljava/lang/Object;", List.of(), null,
                Set.of(), List.of(), List.of(method));
    }
}

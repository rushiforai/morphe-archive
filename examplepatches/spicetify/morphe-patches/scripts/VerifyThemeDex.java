import java.io.File;
import java.util.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;

class VerifyThemeDex {
    static final String MAP = "Lapp/spicetify/extension/spotify/theme/EncorePalette;->map(J)J";
    static final Set<Long> COLORS = Set.of(0xFF121212L, 0xFF1F1F1FL, 0xFF2A2A2AL, 0xFF191919L, 0xFF282828L,
            0xFF1ED760L, 0xFF3BE477L, 0xFF1ABC54L);

    static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    static String reference(Instruction instruction) {
        return instruction instanceof ReferenceInstruction ref ? ref.getReference().toString() : "";
    }

    /** Every stock theme constant in a palette initializer must be remapped in place, right after it is loaded. */
    static void verify(ClassDef palette, boolean enabled) {
        require(palette != null, "Missing Encore palette");
        Set<Long> constants = new HashSet<>();
        Set<Long> hooked = new HashSet<>();
        for (var method : palette.getMethods()) {
            if (method.getImplementation() == null) continue;
            var code = new ArrayList<Instruction>();
            method.getImplementation().getInstructions().forEach(code::add);
            for (int i = 0; i < code.size(); i++) {
                if (code.get(i).getOpcode() == Opcode.CONST_WIDE && method.getName().equals("<clinit>")
                        && COLORS.contains(((WideLiteralInstruction) code.get(i)).getWideLiteral())) {
                    require(constants.add(((WideLiteralInstruction) code.get(i)).getWideLiteral()), "Repeated palette constant");
                }
                if (!reference(code.get(i)).equals(MAP)) continue;
                require(enabled && method.getName().equals("<clinit>") && i >= 1 && i + 1 < code.size()
                        && code.get(i - 1).getOpcode() == Opcode.CONST_WIDE
                        && code.get(i).getOpcode() == Opcode.INVOKE_STATIC_RANGE
                        && code.get(i + 1).getOpcode() == Opcode.MOVE_RESULT_WIDE, "Malformed palette hook");
                int register = ((OneRegisterInstruction) code.get(i - 1)).getRegisterA();
                var call = (RegisterRangeInstruction) code.get(i);
                require(call.getStartRegister() == register && call.getRegisterCount() == 2
                        && ((OneRegisterInstruction) code.get(i + 1)).getRegisterA() == register,
                        "Palette hook must remap its own constant");
                long color = ((WideLiteralInstruction) code.get(i - 1)).getWideLiteral();
                require(COLORS.contains(color) && hooked.add(color), "Unexpected palette constant 0x" + Long.toHexString(color));
            }
        }
        require(enabled ? !constants.isEmpty() && hooked.equals(constants) : hooked.isEmpty(),
                "Missing or unexpected palette hooks in " + palette.getType());
    }

    public static void main(String[] args) throws Exception {
        require(args.length == 3 && Set.of("0", "1").contains(args[1]),
                "Usage: VerifyThemeDex.java PATCHED THEME_ENABLED PALETTE_PROPERTIES");
        var pinned = new Properties();
        try (var input = new java.io.FileInputStream(args[2])) { pinned.load(input); }
        var PALETTES = new TreeSet<>(pinned.stringPropertyNames());
        require(!PALETTES.isEmpty(), "No pinned palettes in " + args[2]);
        var dex = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.forApi(35));
        Map<String, ClassDef> palettes = new HashMap<>();
        for (var entry : dex.getDexEntryNames()) for (var cls : dex.getEntry(entry).getDexFile().getClasses()) {
            if (PALETTES.contains(cls.getType())) palettes.put(cls.getType(), cls);
        }
        for (var type : PALETTES) verify(palettes.get(type), args[1].equals("1"));
        System.out.println("Theme palette verified: selected=" + args[1].equals("1"));
    }
}

import java.io.File;
import java.util.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;

/** Checks the theme patch's Compose hooks and the tables it hands the extension. */
class VerifyThemeDex {
    static final String THEME = "Lapp/spicetify/extension/spotify/theme/";
    static final String PALETTE = THEME + "ComposeTheme;->palette(Ljava/lang/Object;)Ljava/lang/Object;";
    static final String PRIMITIVES = THEME + "ComposeTheme;->primitives(Ljava/lang/Object;)V";
    static final String SURFACE = THEME + "ComposeTheme;->surface(J)J";
    static final String SCRIM = THEME + "ComposeTheme;->scrimAlpha(F)F";
    static final String ICON = THEME + "ComposeTheme;->iconTint(J)J";
    static final String COLOR = "Lp/iae1;->g(J)J";
    static final String DARK_PALETTE = "Lp/iwt;->a:Lp/avt;";
    static final String RAW_COLORS = "Lp/rut;->a:Lp/jua;";
    /** Each hook's method, as owner->name, and the field its value comes from or goes to. */
    static final Map<String, String> PALETTE_SITES = Map.of("Lp/vcu;->a", DARK_PALETTE, "Lp/p6s;->invoke", DARK_PALETTE);
    static final Map<String, String> PRIMITIVE_SITES = Map.of("Lp/rut;-><clinit>", RAW_COLORS);
    static final Map<String, String> SURFACE_SITES = Map.of("Lp/pz01;-><clinit>", "Lp/pz01;->a:J", "Lp/t5s0;-><clinit>", "Lp/t5s0;->b:J");
    static final long STOCK_SURFACE = 0xFF282828L;
    /** The header scrim, whose top and bottom alphas, parameters 1 and 2, pass through scrimAlpha first. */
    static final String SCRIM_SITE = "Lp/kse1;->j";
    /** Encore's icon draw, whose tint, parameter 3, passes through iconTint first. */
    static final String ICON_SITE = "Lp/c9e1;->b";

    static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    static String reference(Instruction instruction) {
        return instruction instanceof ReferenceInstruction ref ? ref.getReference().toString() : "";
    }

    static int register(Instruction instruction) {
        return instruction instanceof OneRegisterInstruction one ? one.getRegisterA() : -1;
    }

    static boolean is(Instruction instruction, Opcode opcode, int register, String reference) {
        return instruction.getOpcode() == opcode && register(instruction) == register
                && (reference == null || reference(instruction).equals(reference));
    }

    /** The register of a static method's parameter {@code index}, or -1 when it isn't of {@code type}. */
    static int parameter(Method method, int index, String type) {
        var types = method.getParameterTypes();
        if (index >= types.size() || !types.get(index).toString().equals(type)) return -1;
        int register = method.getImplementation().getRegisterCount();
        for (int i = types.size() - 1; i >= index; i--) register -= wide(types.get(i)) ? 2 : 1;
        return register;
    }

    static boolean wide(CharSequence type) {
        return type.toString().equals("J") || type.toString().equals("D");
    }

    /** A static call in the range form whose {@code count} arguments start at {@code register}. */
    static boolean range(Instruction instruction, int register, int count) {
        return instruction instanceof RegisterRangeInstruction call && instruction.getOpcode() == Opcode.INVOKE_STATIC_RANGE
                && call.getStartRegister() == register && call.getRegisterCount() == count;
    }

    static List<Instruction> code(Method method) {
        var code = new ArrayList<Instruction>();
        if (method.getImplementation() != null) method.getImplementation().getInstructions().forEach(code::add);
        return code;
    }

    /** The method's only instruction that loads a string, which must then be returned; null for any other shape. */
    static String constant(Map<String, ClassDef> classes, String type, String name) {
        var owner = classes.get(type);
        if (owner == null) return null;
        for (var method : owner.getMethods()) {
            if (!method.getName().equals(name)) continue;
            var code = code(method);
            boolean loaded = code.size() == 2 && (code.get(0).getOpcode() == Opcode.CONST_STRING
                    || code.get(0).getOpcode() == Opcode.CONST_STRING_JUMBO) && code.get(1).getOpcode() == Opcode.RETURN_OBJECT;
            require(loaded, "Theme table method " + type + "->" + name + " changed shape");
            return reference(code.get(0));
        }
        throw new AssertionError("Missing theme table method " + type + "->" + name);
    }

    /**
     * With Theme colors selected, the default dark palette passes through ComposeTheme right after both
     * of its reads, the raw colors right after their store, and the two #282828 surfaces right before
     * theirs; the header scrim's alphas and Encore's icon tint pass through it before their methods use
     * them; the extension holds the role and Compose tables. Otherwise there are no hooks and no tables.
     */
    static void verify(Collection<ClassDef> definitions, boolean enabled) {
        Map<String, ClassDef> classes = new HashMap<>();
        for (var definition : definitions) classes.put(definition.getType(), definition);
        Map<String, Integer> palette = new HashMap<>();
        Map<String, Integer> primitives = new HashMap<>();
        Map<String, Integer> surfaces = new HashMap<>();
        Set<Integer> scrims = new HashSet<>();
        Set<Integer> icons = new HashSet<>();
        for (var definition : definitions) for (var method : definition.getMethods()) {
            var code = code(method);
            String site = definition.getType() + "->" + method.getName();
            for (int i = 0; i < code.size(); i++) {
                String called = reference(code.get(i));
                if (called.equals(PALETTE)) {
                    require(PALETTE_SITES.containsKey(site) && palette.merge(site, 1, Integer::sum) == 1, "Unexpected palette hook in " + site);
                    int value = register(code.get(Math.max(i - 1, 0)));
                    require(i >= 1 && i + 2 < code.size() && is(code.get(i - 1), Opcode.SGET_OBJECT, value, PALETTE_SITES.get(site))
                            && range(code.get(i), value, 1) && is(code.get(i + 1), Opcode.MOVE_RESULT_OBJECT, value, null)
                            && is(code.get(i + 2), Opcode.CHECK_CAST, value, "Lp/avt;"), "Malformed palette hook in " + site);
                } else if (called.equals(PRIMITIVES)) {
                    require(PRIMITIVE_SITES.containsKey(site) && primitives.merge(site, 1, Integer::sum) == 1, "Unexpected raw color hook in " + site);
                    int value = register(code.get(Math.max(i - 1, 0)));
                    require(i >= 1 && is(code.get(i - 1), Opcode.SPUT_OBJECT, value, PRIMITIVE_SITES.get(site))
                            && range(code.get(i), value, 1), "Malformed raw color hook in " + site);
                } else if (called.equals(SURFACE)) {
                    require(SURFACE_SITES.containsKey(site) && surfaces.merge(site, 1, Integer::sum) == 1, "Unexpected surface hook in " + site);
                    int value = register(code.get(Math.max(i - 3, 0)));
                    require(i >= 3 && i + 2 < code.size() && code.get(i - 3).getOpcode() == Opcode.CONST_WIDE
                            && ((WideLiteralInstruction) code.get(i - 3)).getWideLiteral() == STOCK_SURFACE
                            && code.get(i - 2) instanceof FiveRegisterInstruction color && reference(color).equals(COLOR)
                            && color.getRegisterCount() == 2 && color.getRegisterC() == value
                            && is(code.get(i - 1), Opcode.MOVE_RESULT_WIDE, value, null) && range(code.get(i), value, 2)
                            && is(code.get(i + 1), Opcode.MOVE_RESULT_WIDE, value, null)
                            && is(code.get(i + 2), Opcode.SPUT_WIDE, value, SURFACE_SITES.get(site)), "Malformed surface hook in " + site);
                } else if (called.equals(SCRIM)) {
                    require(site.equals(SCRIM_SITE), "Unexpected scrim hook in " + site);
                    scrims.add(i);
                    int alpha = parameter(method, i == 0 ? 1 : 2, "F");
                    require(alpha >= 0 && range(code.get(i), alpha, 1) && i + 1 < code.size()
                            && is(code.get(i + 1), Opcode.MOVE_RESULT, alpha, null), "Malformed scrim hook in " + site);
                } else if (called.equals(ICON)) {
                    require(site.equals(ICON_SITE), "Unexpected icon tint hook in " + site);
                    icons.add(i);
                    int tint = parameter(method, 3, "J");
                    require(tint >= 0 && range(code.get(i), tint, 2) && i + 1 < code.size()
                            && is(code.get(i + 1), Opcode.MOVE_RESULT_WIDE, tint, null), "Malformed icon tint hook in " + site);
                }
            }
        }
        String roles = constant(classes, THEME + "ThemeRoleMap;", "encoded");
        String compose = constant(classes, THEME + "ComposeTheme;", "table");
        if (enabled) {
            require(palette.keySet().equals(PALETTE_SITES.keySet()), "Missing palette hooks: " + palette.keySet());
            require(primitives.keySet().equals(PRIMITIVE_SITES.keySet()), "Missing raw color hook");
            require(surfaces.keySet().equals(SURFACE_SITES.keySet()), "Missing surface hooks: " + surfaces.keySet());
            require(scrims.equals(Set.of(0, 2)), "Scrim hooks must open " + SCRIM_SITE + ", found at " + scrims);
            require(icons.equals(Set.of(0)), "The icon tint hook must open " + ICON_SITE + ", found at " + icons);
            require(roles != null && roles.startsWith("main:"), "Theme role table was not injected");
            require(compose != null && compose.split(";", -1).length == 2 && !compose.startsWith(";") && !compose.endsWith(";"),
                    "Compose color table was not injected");
        } else {
            require(palette.isEmpty() && primitives.isEmpty() && surfaces.isEmpty() && scrims.isEmpty() && icons.isEmpty(),
                    "Theme hooks without Theme colors");
            require((roles == null || roles.isEmpty()) && (compose == null || compose.isEmpty()), "Theme tables without Theme colors");
        }
    }

    public static void main(String[] args) throws Exception {
        require(args.length == 2 && Set.of("0", "1").contains(args[1]), "Usage: VerifyThemeDex.java PATCHED THEME_ENABLED");
        var dex = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.forApi(35));
        List<ClassDef> classes = new ArrayList<>();
        for (var entry : dex.getDexEntryNames()) classes.addAll(dex.getEntry(entry).getDexFile().getClasses());
        verify(classes, args[1].equals("1"));
        System.out.println("Theme hooks verified: selected=" + args[1].equals("1"));
    }
}

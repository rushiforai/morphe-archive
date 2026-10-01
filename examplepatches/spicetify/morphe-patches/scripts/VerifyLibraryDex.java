import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;

/** Checks the Your Library, chip, navigation and player hooks of the server-files patch in a patched APK. */
class VerifyLibraryDex {
    static final String ROWS = "Lapp/spicetify/extension/spotify/localserver/LibraryRows;";
    static final String PLAYBACK = "Lapp/spicetify/extension/spotify/localserver/ServerPlayback;";
    static final String OBSERVABLE = "Lio/reactivex/rxjava3/core/Observable;";
    static final String ARTWORK = "Lapp/spicetify/extension/spotify/localserver/ServerArtwork;";

    enum After { EARLY_RETURN_OBJECT, RETURN_SAME, REPLACE_ARGUMENT, EARLY_RETURN_VOID, NOTHING }

    /** One expected call from a Spotify method into the extension. */
    record Hook(String caller, String method, List<String> parameters, String owner, String name,
            List<String> hookParameters, String hookResult, After after, int argument) {
        String key() { return caller + "->" + method + parameters + " calls " + name; }
    }

    static final List<Hook> HOOKS = List.of(
        new Hook("Lp/ub21;", "z", List.of("Lp/z770;"), ROWS, "begin", List.of("Ljava/lang/Object;"), OBSERVABLE, After.EARLY_RETURN_OBJECT, -1),
        new Hook("Lp/ub21;", "z", List.of("Lp/z770;"), ROWS, "page", List.of(OBSERVABLE), OBSERVABLE, After.RETURN_SAME, 0),
        new Hook("Lp/aey;", "<init>", List.of("Ljava/util/List;", "Ljava/util/List;", "I", "I", "Z", "Z"), ROWS, "chipRow",
            List.of("Ljava/util/List;", "Ljava/util/List;"), "Ljava/util/List;", After.REPLACE_ARGUMENT, 1),
        new Hook("Lp/igy;", "a", List.of("Lp/y1j;"), ROWS, "description", List.of("Ljava/lang/Object;"), "Ljava/lang/String;", After.EARLY_RETURN_OBJECT, -1),
        new Hook("Lp/igy;", "b", List.of("Lp/y1j;"), ROWS, "label", List.of("Ljava/lang/Object;"), "Ljava/lang/String;", After.EARLY_RETURN_OBJECT, -1),
        new Hook("Lp/ldy;", "b", List.of("Ljava/util/List;"), ROWS, "remembered", List.of("Ljava/util/List;"), "Ljava/util/List;", After.REPLACE_ARGUMENT, 0),
        new Hook("Lp/s4h0;", "b", List.of("Ljava/lang/String;", "Lp/mb40;", "Landroid/os/Bundle;"), ROWS, "open",
            List.of("Ljava/lang/Object;", "Ljava/lang/String;"), "Ljava/lang/String;", After.EARLY_RETURN_VOID, 1),
        new Hook("Lp/s4h0;", "g", List.of("Ljava/lang/String;"), ROWS, "open",
            List.of("Ljava/lang/Object;", "Ljava/lang/String;"), "Ljava/lang/String;", After.EARLY_RETURN_VOID, 1),
        new Hook("Lcom/spotify/imageloader/localfileimage/LocalFileImageLoader;", "loadImage", List.of("Ljava/lang/String;"), ARTWORK, "bytes",
            List.of("Ljava/lang/String;"), "[B", After.EARLY_RETURN_OBJECT, -1),
        new Hook("Lp/s2w;", "<init>", List.of("Lp/wrj;", "Lp/lm90;", "Z", "Ljava/util/List;"), PLAYBACK, "setPlayer",
            List.of("Ljava/lang/Object;"), "V", After.NOTHING, -1));

    static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    /** Registers passed to an invoke, in order. */
    static List<Integer> registers(Instruction instruction) {
        List<Integer> result = new ArrayList<>();
        if (instruction instanceof RegisterRangeInstruction range) {
            for (int i = 0; i < range.getRegisterCount(); i++) result.add(range.getStartRegister() + i);
        } else if (instruction instanceof FiveRegisterInstruction five) {
            int[] all = {five.getRegisterC(), five.getRegisterD(), five.getRegisterE(), five.getRegisterF(), five.getRegisterG()};
            for (int i = 0; i < five.getRegisterCount(); i++) result.add(all[i]);
        }
        return result;
    }

    static int register(Instruction instruction) {
        return ((OneRegisterInstruction) instruction).getRegisterA();
    }

    public static void main(String[] args) throws Exception {
        require(args.length == 2 && List.of("0", "1").contains(args[1]), "Usage: VerifyLibraryDex.java APK SERVER_FILES_PATCH_ENABLED");
        boolean enabled = args[1].equals("1");
        Map<String, Integer> found = new HashMap<>();
        var dex = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.forApi(35));
        for (var entry : dex.getDexEntryNames()) for (var cls : dex.getEntry(entry).getDexFile().getClasses()) {
            if (cls.getType().startsWith("Lapp/spicetify/")) continue;
            for (var method : cls.getMethods()) {
                if (method.getImplementation() == null) continue;
                var code = new ArrayList<Instruction>();
                method.getImplementation().getInstructions().forEach(code::add);
                for (int index = 0; index < code.size(); index++) {
                    if (!(code.get(index) instanceof ReferenceInstruction ref) || !(ref.getReference() instanceof MethodReference target)
                            || !(target.getDefiningClass().equals(ROWS) || target.getDefiningClass().equals(PLAYBACK)
                            || target.getDefiningClass().equals(ARTWORK))) continue;
                    Hook hook = null;
                    for (Hook candidate : HOOKS) {
                        if (candidate.caller.equals(cls.getType()) && candidate.method.equals(method.getName())
                                && candidate.parameters.equals(method.getParameterTypes()) && candidate.name.equals(target.getName())) hook = candidate;
                    }
                    require(hook != null, "Unexpected server-files hook " + target.getName() + " in " + cls.getType() + "->" + method.getName());
                    require(target.getDefiningClass().equals(hook.owner) && target.getParameterTypes().equals(hook.hookParameters)
                            && target.getReturnType().equals(hook.hookResult), "Wrong hook signature: " + hook.key());
                    List<Integer> passed = registers(code.get(index));
                    require(passed.size() == hook.hookParameters.size(), "Wrong hook arguments: " + hook.key());
                    if (hook.after != After.NOTHING) {
                        require(index + 1 < code.size() && code.get(index + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT, "Hook result is dropped: " + hook.key());
                        int result = register(code.get(index + 1));
                        switch (hook.after) {
                            case EARLY_RETURN_OBJECT -> require(index + 3 < code.size()
                                    && code.get(index + 2).getOpcode() == Opcode.IF_EQZ && register(code.get(index + 2)) == result
                                    && code.get(index + 3).getOpcode() == Opcode.RETURN_OBJECT && register(code.get(index + 3)) == result,
                                    "Hook must return its non-null result: " + hook.key());
                            case RETURN_SAME -> require(passed.get(hook.argument) == result && index + 2 < code.size()
                                    && code.get(index + 2).getOpcode() == Opcode.RETURN_OBJECT && register(code.get(index + 2)) == result,
                                    "Hook must return the wrapped value: " + hook.key());
                            case REPLACE_ARGUMENT -> require(passed.get(hook.argument) == result,
                                    "Hook must replace the argument it received: " + hook.key());
                            case EARLY_RETURN_VOID -> require(passed.get(hook.argument) == result && index + 3 < code.size()
                                    && code.get(index + 2).getOpcode() == Opcode.IF_NEZ && register(code.get(index + 2)) == result
                                    && code.get(index + 3).getOpcode() == Opcode.RETURN_VOID,
                                    "Hook must fall through only for URIs it returns: " + hook.key());
                            default -> { }
                        }
                    }
                    found.merge(hook.key(), 1, Integer::sum);
                }
            }
        }
        for (Hook hook : HOOKS) {
            int count = found.getOrDefault(hook.key(), 0);
            require(count == (enabled ? 1 : 0), "Expected " + (enabled ? 1 : 0) + " call(s) for " + hook.key() + ", found " + count);
        }
        System.out.println("Server library hooks verified: " + found.size() + " hook(s), selected=" + enabled);
    }
}

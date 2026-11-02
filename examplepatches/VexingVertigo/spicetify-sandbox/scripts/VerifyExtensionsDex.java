import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.formatter.DexFormatter;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;

/**
 * Checks the Spicetify extensions patch's hooks in a patched APK, or that none are there without it. Pin
 * shortcuts on Home brings the player bridge hook alone, since its picker reads Your Library through it.
 */
class VerifyExtensionsDex {
    static final String EXTENSIONS = "Lapp/spicetify/extension/spotify/extensions/";
    static final String BRIDGE = EXTENSIONS + "PlayerBridge;";
    static final String SERVICE = "Lcom/spotify/cosmos/sharedcosmosrouterservice/SharedCosmosRouterService;";
    static final String MENU_BRIDGE = EXTENSIONS + "nativebridge/MenuBridge;";
    static final String CHIP_BRIDGE = EXTENSIONS + "nativebridge/HomeChipBridge;";
    static final String INSTALLED = "Lapp/spicetify/extension/spotify/settings/InstalledPatches;";
    static final String NOW_PLAYING_SHUFFLE = EXTENSIONS + "NowPlayingShuffle;";
    static final String PLAYLIST_MENU_PROVIDER = EXTENSIONS + "nativebridge/PlaylistMenuProvider;";
    static final String HIDE_PODCASTS = EXTENSIONS + "HidePodcasts;";

    /**
     * A Hide podcasts hook: its filter's parameter and result, the Spotify method it sits in, the register
     * it filters (-1 for that method's last, its last parameter), and what it follows (null: nothing, it
     * comes first).
     */
    record Filter(String parameter, String result, String caller, int argument, String after) {}

    static final Map<String, Filter> FILTERS = Map.of(
        "hideHomeSection", new Filter("Ljava/lang/Object;", "Z",
            "Lp/mz1;->g0(Lcom/spotify/casita/v1/resolved/Section;)Lp/n920;", -1, null),
        "filterHomeItems", new Filter("Ljava/util/List;", "Ljava/util/List;",
            "Lcom/spotify/casita/v1/resolved/Provided;->getItemsList()Ljava/util/List;", 0,
            "Lcom/spotify/casita/v1/resolved/Provided;->items_:Lp/ih40;"),
        "filterHomeChips", new Filter("Ljava/util/List;", "Ljava/util/List;",
            "Lp/xqw;->a(Ljava/util/List;)Ljava/util/ArrayList;", -1, null),
        "hideSearchEntity", new Filter("Ljava/lang/Object;", "Z",
            "Lp/bzw0;->b(Lcom/spotify/searchview/proto/Entity;)Lp/onu;", -1, null),
        "filterSearchChips", new Filter("Ljava/util/ArrayList;", "Ljava/util/ArrayList;",
            "Lp/ipy;-><init>(Ljava/util/ArrayList;)V", -1, "Ljava/lang/Object;-><init>()V"),
        "filterLibraryChips", new Filter("Ljava/util/List;", "Ljava/util/List;",
            "Lp/b90;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", 8,
            "Lp/k770;->a(ZZLspotify/your_library/esperanto/proto/YourLibraryResponseHeader;Ljava/util/List;Ljava/util/List;)Ljava/util/List;"));

    static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    static boolean calls(Instruction instruction, String owner, String name) {
        return instruction instanceof ReferenceInstruction ref && ref.getReference() instanceof MethodReference m
            && m.getDefiningClass().equals(owner) && m.getName().equals(name);
    }

    static List<Instruction> code(Method method) {
        var code = new ArrayList<Instruction>();
        method.getImplementation().getInstructions().forEach(code::add);
        return code;
    }

    public static void main(String[] args) throws Exception {
        require(args.length == 3 && List.of("0", "1").contains(args[1]) && List.of("0", "1").contains(args[2]),
                "Usage: VerifyExtensionsDex.java APK EXTENSIONS_PATCH_ENABLED HOME_PINS_PATCH_ENABLED");
        boolean enabled = args[1].equals("1");
        boolean bridge = enabled || args[2].equals("1");
        Map<String, ClassDef> classes = new HashMap<>();
        var dex = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.forApi(35));
        for (var entry : dex.getDexEntryNames()) {
            for (var definition : dex.getEntry(entry).getDexFile().getClasses()) classes.put(definition.getType(), definition);
        }
        int bridgeHooks = 0, trackHooks = 0, artistHooks = 0, chipsHooks = 0, tapHooks = 0, shuffleHooks = 0,
                providersHooks = 0;
        Map<String, Integer> filterHooks = new HashMap<>();
        for (var definition : classes.values()) {
            // Hooks sit in Spotify's classes. The extension's own, such as its settings, may call any of these.
            if (definition.getType().startsWith("Lapp/spicetify/")) continue;
            for (var method : definition.getMethods()) {
                if (method.getImplementation() == null) continue;
                var code = code(method);
                for (int index = 0; index < code.size(); index++) {
                    if (calls(code.get(index), BRIDGE, "onCosmos")) {
                        bridgeHooks++;
                        verifyBridgeHook(definition, method, code, index);
                    } else if (calls(code.get(index), MENU_BRIDGE, "track")) {
                        trackHooks++;
                        verifyMenuHook(definition, method, code, index, "Lp/b9p0;", 11);
                    } else if (calls(code.get(index), MENU_BRIDGE, "artist")) {
                        artistHooks++;
                        verifyMenuHook(definition, method, code, index, "Lp/lr5;", 1);
                    } else if (calls(code.get(index), CHIP_BRIDGE, "chips")) {
                        chipsHooks++;
                        verifyChipsHook(definition, method, code, index);
                    } else if (calls(code.get(index), CHIP_BRIDGE, "onTap")) {
                        tapHooks++;
                        verifyTapHook(definition, method, code, index);
                    } else if (calls(code.get(index), NOW_PLAYING_SHUFFLE, "onButton")) {
                        shuffleHooks++;
                        verifyShuffleHook(definition, method, code, index);
                    } else if (calls(code.get(index), PLAYLIST_MENU_PROVIDER, "providers")) {
                        providersHooks++;
                        verifyProvidersHook(definition, method, code, index);
                    } else if (code.get(index) instanceof ReferenceInstruction ref && ref.getReference() instanceof MethodReference m
                            && m.getDefiningClass().equals(HIDE_PODCASTS)) {
                        filterHooks.merge(m.getName(), 1, Integer::sum);
                        verifyFilterHook(method, code, index, m);
                    }
                }
            }
        }
        int expected = enabled ? 1 : 0;
        require(bridgeHooks == (bridge ? 1 : 0) && trackHooks == expected && artistHooks == expected
                && chipsHooks == expected && tapHooks == expected && shuffleHooks == expected
                && providersHooks == expected,
                "Unexpected hook counts: player bridge " + bridgeHooks + ", track menu " + trackHooks
                        + ", artist menu " + artistHooks + ", Home chips " + chipsHooks + ", Home chip tap " + tapHooks
                        + ", Now Playing shuffle " + shuffleHooks + ", playlist menu " + providersHooks);
        verifyCapability(classes.get(INSTALLED), enabled);
        for (var name : FILTERS.keySet()) {
            require(filterHooks.getOrDefault(name, 0) == expected, "Unexpected Hide podcasts hook count: " + name
                    + " " + filterHooks.getOrDefault(name, 0));
        }
        if (bridge) requireTarget(classes, BRIDGE, "onCosmos", List.of("Ljava/lang/Object;"), "V");
        if (enabled) {
            requireTarget(classes, MENU_BRIDGE, "track", List.of("Ljava/util/List;", "Ljava/lang/Object;"), "Ljava/util/List;");
            requireTarget(classes, MENU_BRIDGE, "artist", List.of("Ljava/util/List;", "Ljava/lang/Object;"), "Ljava/util/List;");
            requireTarget(classes, CHIP_BRIDGE, "chips", List.of("Ljava/util/List;"), "Ljava/util/List;");
            requireTarget(classes, CHIP_BRIDGE, "onTap", List.of("Ljava/lang/String;"), "Z");
            requireTarget(classes, NOW_PLAYING_SHUFFLE, "onButton", List.of("Landroid/view/View;"), "V");
            requireTarget(classes, PLAYLIST_MENU_PROVIDER, "providers", List.of("Ljava/util/List;"), "Ljava/util/List;");
            FILTERS.forEach((name, filter) -> requireTarget(classes, HIDE_PODCASTS, name, List.of(filter.parameter()), filter.result()));
        }
        int filters = filterHooks.values().stream().mapToInt(Integer::intValue).sum();
        System.out.println("Spicetify extensions verified: "
                + (bridgeHooks + trackHooks + artistHooks + chipsHooks + tapHooks + shuffleHooks + providersHooks + filters)
                + " hook(s), selected=" + enabled);
    }

    /**
     * The extension's InstalledPatches.extensions() answers whether the patch is in: true only with
     * it. An APK without the settings patch has no extension classes at all.
     */
    static void verifyCapability(ClassDef installed, boolean enabled) {
        Method capability = null;
        if (installed != null) for (var m : installed.getMethods()) {
            if (m.getName().equals("extensions") && m.getParameterTypes().isEmpty() && m.getReturnType().equals("Z")) capability = m;
        }
        if (capability == null) {
            require(!enabled, "Missing the extensions capability");
            return;
        }
        var code = code(capability);
        require(AccessFlags.PUBLIC.isSet(capability.getAccessFlags()) && AccessFlags.STATIC.isSet(capability.getAccessFlags())
                && code.size() == 2 && code.get(0).getOpcode() == Opcode.CONST_4
                && ((NarrowLiteralInstruction) code.get(0)).getNarrowLiteral() == (enabled ? 1 : 0)
                && code.get(1).getOpcode() == Opcode.RETURN
                && ((OneRegisterInstruction) code.get(0)).getRegisterA() == ((OneRegisterInstruction) code.get(1)).getRegisterA(),
                "Extensions capability does not match patch selection");
    }

    /** Spotify calls each hook's target, so it must be a public static method with a body. */
    static void requireTarget(Map<String, ClassDef> classes, String owner, String name, List<String> parameters, String result) {
        boolean found = false;
        if (classes.containsKey(owner)) for (var m : classes.get(owner).getMethods()) {
            found |= m.getName().equals(name) && m.getParameterTypes().equals(parameters) && m.getReturnType().equals(result)
                    && AccessFlags.PUBLIC.isSet(m.getAccessFlags()) && AccessFlags.STATIC.isSet(m.getAccessFlags())
                    && m.getImplementation() != null;
        }
        require(found, "Hook target " + owner + "->" + name + " must be a public static method with a body");
    }

    /**
     * P1 to P6 hand Hide podcasts what Spotify is about to use. P1 and P4 come first and return null when
     * the filter drops the Home section or search result; every caller skips null. The others filter a
     * list right after Spotify makes or receives it, and put the filtered list back in the same register.
     */
    static void verifyFilterHook(Method method, List<Instruction> code, int index, MethodReference target) {
        String name = target.getName();
        Filter filter = FILTERS.get(name);
        require(filter != null && filter.caller().equals(DexFormatter.INSTANCE.getMethodDescriptor(method)),
                "Hide podcasts hook " + name + " is outside " + (filter == null ? "the six it has" : filter.caller()));
        require(target.getParameterTypes().equals(List.of(filter.parameter())) && target.getReturnType().equals(filter.result()),
                "Hide podcasts hook " + name + " calls the wrong signature");
        int argument = filter.argument() < 0 ? method.getImplementation().getRegisterCount() - 1 : filter.argument();
        require(onlyRegister(code.get(index)) == argument, "Hide podcasts hook " + name + " must pass v" + argument);
        if (filter.after() == null) {
            require(index == 0, "Hide podcasts hook " + name + " must come first");
        } else {
            int before = index - 1;
            if (before >= 0 && code.get(before).getOpcode() == Opcode.MOVE_RESULT_OBJECT
                    && ((OneRegisterInstruction) code.get(before)).getRegisterA() == argument) before--;
            require(before >= 0 && code.get(before) instanceof ReferenceInstruction ref
                    && ref.getReference().toString().equals(filter.after()),
                    "Hide podcasts hook " + name + " must follow " + filter.after());
        }
        if (filter.result().equals("Z")) {
            require(index + 4 < code.size() && code.get(index + 1).getOpcode() == Opcode.MOVE_RESULT
                    && code.get(index + 2).getOpcode() == Opcode.IF_EQZ && ((OffsetInstruction) code.get(index + 2)).getCodeOffset() == 4
                    && code.get(index + 3).getOpcode() == Opcode.CONST_4
                    && ((NarrowLiteralInstruction) code.get(index + 3)).getNarrowLiteral() == 0
                    && code.get(index + 4).getOpcode() == Opcode.RETURN_OBJECT
                    && sameRegister(code.subList(index + 1, index + 5)),
                    "Hide podcasts hook " + name + " must return null only when its filter says so");
        } else {
            require(index + 1 < code.size() && code.get(index + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT
                    && ((OneRegisterInstruction) code.get(index + 1)).getRegisterA() == argument,
                    "Hide podcasts hook " + name + "'s list must replace v" + argument);
        }
    }

    /** The only register an invoke passes, or -1. */
    static int onlyRegister(Instruction call) {
        if (call.getOpcode() == Opcode.INVOKE_STATIC && call instanceof FiveRegisterInstruction five
                && five.getRegisterCount() == 1) return five.getRegisterC();
        if (call.getOpcode() == Opcode.INVOKE_STATIC_RANGE && call instanceof RegisterRangeInstruction range
                && range.getRegisterCount() == 1) return range.getStartRegister();
        return -1;
    }

    /** Whether each of [instructions] names the same first register: the gate's result. */
    static boolean sameRegister(List<Instruction> instructions) {
        int register = ((OneRegisterInstruction) instructions.get(0)).getRegisterA();
        return instructions.stream().allMatch(i -> ((OneRegisterInstruction) i).getRegisterA() == register);
    }

    /**
     * T1 and T2 hand a context menu's frozen item list, v0, and the menu's row to the menu bridge, and put
     * its answer back in v0 right before the menu model is built from it. The track menu's row is v11; the
     * artist menu's is v22, which T2 moves to v1 first.
     */
    static void verifyMenuHook(ClassDef owner, Method method, List<Instruction> code, int index, String menu, int row) {
        require(owner.getType().equals(menu) && method.getName().equals("apply")
                && method.getParameterTypes().equals(List.of("Ljava/lang/Object;")),
                "Menu hook is outside " + menu + "->apply");
        require(code.get(index).getOpcode() == Opcode.INVOKE_STATIC
                && code.get(index) instanceof FiveRegisterInstruction call
                && call.getRegisterCount() == 2 && call.getRegisterC() == 0 && call.getRegisterD() == row,
                "Menu hook must pass the frozen list v0 and the menu's row");
        int frozen = index - 1;
        if (row == 1) {
            require(frozen >= 0 && code.get(frozen).getOpcode() == Opcode.MOVE_OBJECT_FROM16
                    && code.get(frozen) instanceof TwoRegisterInstruction move
                    && move.getRegisterA() == 1 && move.getRegisterB() == 22,
                    "Artist menu hook must move the artist from v22 to v1");
            frozen--;
        }
        require(frozen >= 1 && code.get(frozen).getOpcode() == Opcode.MOVE_RESULT_OBJECT
                && ((OneRegisterInstruction) code.get(frozen)).getRegisterA() == 0
                && calls(code.get(frozen - 1), "Lp/qte;", "J"),
                "Menu hook must follow the frozen item list");
        require(index + 2 < code.size() && code.get(index + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT
                && ((OneRegisterInstruction) code.get(index + 1)).getRegisterA() == 0
                && code.get(index + 2).getOpcode() == Opcode.NEW_INSTANCE
                && ((OneRegisterInstruction) code.get(index + 2)).getRegisterA() == 1
                && ((ReferenceInstruction) code.get(index + 2)).getReference().toString().equals("Lp/krj;"),
                "Menu hook's list must become the menu model's");
    }

    /**
     * A hands Home's chips, which Lp/xqw;->a has just rewritten into v1, to the chip bridge and puts its
     * answer back in v1, right before Home copies them into the new ArrayList it keeps.
     */
    static void verifyChipsHook(ClassDef owner, Method method, List<Instruction> code, int index) {
        require(owner.getType().equals("Lp/qrl;") && method.getName().equals("invokeSuspend")
                && method.getParameterTypes().equals(List.of("Ljava/lang/Object;")),
                "Home chips hook is outside Lp/qrl;->invokeSuspend");
        require(code.get(index).getOpcode() == Opcode.INVOKE_STATIC
                && code.get(index) instanceof FiveRegisterInstruction call
                && call.getRegisterCount() == 1 && call.getRegisterC() == 1,
                "Home chips hook must pass the chips in v1");
        require(index >= 2 && code.get(index - 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT
                && ((OneRegisterInstruction) code.get(index - 1)).getRegisterA() == 1
                && calls(code.get(index - 2), "Lp/xqw;", "a"),
                "Home chips hook must follow Spotify's rewrite of the chips");
        require(index + 2 < code.size() && code.get(index + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT
                && ((OneRegisterInstruction) code.get(index + 1)).getRegisterA() == 1
                && code.get(index + 2).getOpcode() == Opcode.NEW_INSTANCE
                && ((OneRegisterInstruction) code.get(index + 2)).getRegisterA() == 2
                && ((ReferenceInstruction) code.get(index + 2)).getReference().toString().equals("Ljava/util/ArrayList;"),
                "Home chips hook's list must become the copy Home keeps");
    }

    /**
     * B hands a chip tap's id, v1, to the chip bridge right after Home built the tap's Lp/q8w; from it. A true
     * answer skips to the case's return-object v13; otherwise the tap goes on to Home's loop, Lp/bay;->invoke.
     */
    static void verifyTapHook(ClassDef owner, Method method, List<Instruction> code, int index) {
        require(owner.getType().equals("Lp/a4v;") && method.getName().equals("invoke")
                && method.getParameterTypes().equals(List.of("Ljava/lang/Object;", "Ljava/lang/Object;")),
                "Home chip tap hook is outside Lp/a4v;->invoke");
        require(code.get(index).getOpcode() == Opcode.INVOKE_STATIC
                && code.get(index) instanceof FiveRegisterInstruction call
                && call.getRegisterCount() == 1 && call.getRegisterC() == 1,
                "Home chip tap hook must pass the chip's id in v1");
        require(index >= 1 && calls(code.get(index - 1), "Lp/q8w;", "<init>")
                && code.get(index - 1) instanceof FiveRegisterInstruction event
                && event.getRegisterCount() == 2 && event.getRegisterD() == 1,
                "Home chip tap hook must follow the tap's event, built from the chip's id");
        require(index + 3 < code.size() && code.get(index + 1).getOpcode() == Opcode.MOVE_RESULT
                && ((OneRegisterInstruction) code.get(index + 1)).getRegisterA() == 1
                && code.get(index + 2).getOpcode() == Opcode.IF_NEZ
                && ((OneRegisterInstruction) code.get(index + 2)).getRegisterA() == 1
                && calls(code.get(index + 3), "Lp/bay;", "invoke"),
                "Home chip tap hook must branch on its answer right before the tap goes to Home's loop");
        int skip = branchTarget(code, index + 2);
        require(skip >= 0 && code.get(skip).getOpcode() == Opcode.RETURN_OBJECT
                && ((OneRegisterInstruction) code.get(skip)).getRegisterA() == 13,
                "Home chip tap hook must skip to the case's return");
    }

    /**
     * N1 hands Now Playing's shuffle button, which its constructor has just stored from v2 into field i, to
     * NowPlayingShuffle right before the constructor returns.
     */
    static void verifyShuffleHook(ClassDef owner, Method method, List<Instruction> code, int index) {
        require(owner.getType().equals("Lp/xkp;") && method.getName().equals("<init>")
                && method.getParameterTypes().equals(List.of("Landroid/content/Context;")),
                "Now Playing shuffle hook is outside Lp/xkp;'s constructor");
        require(code.get(index).getOpcode() == Opcode.INVOKE_STATIC
                && code.get(index) instanceof FiveRegisterInstruction call
                && call.getRegisterCount() == 1 && call.getRegisterC() == 2,
                "Now Playing shuffle hook must pass the button in v2");
        require(index >= 1 && code.get(index - 1).getOpcode() == Opcode.IPUT_OBJECT
                && code.get(index - 1) instanceof TwoRegisterInstruction store
                && store.getRegisterA() == 2 && store.getRegisterB() == 4
                && ((ReferenceInstruction) store).getReference().toString()
                    .equals("Lp/xkp;->i:Landroidx/appcompat/widget/AppCompatImageButton;"),
                "Now Playing shuffle hook must follow the store of the button");
        require(index + 1 < code.size() && code.get(index + 1).getOpcode() == Opcode.RETURN_VOID,
                "Now Playing shuffle hook must sit right before the constructor's return");
    }

    /**
     * M1 hands the list menu's item providers, v4, to the playlist menu provider and puts its answer back in v4
     * right before Lp/sv70;'s constructor stores them in its field d.
     */
    static void verifyProvidersHook(ClassDef owner, Method method, List<Instruction> code, int index) {
        require(owner.getType().equals("Lp/sv70;") && method.getName().equals("<init>")
                && method.getParameterTypes().equals(
                    List.of("Lp/y3w0;", "Lp/vz1;", "Ljava/util/List;", "Ljava/util/List;", "Lp/a94;")),
                "Playlist menu hook is outside Lp/sv70;'s constructor");
        require(code.get(index).getOpcode() == Opcode.INVOKE_STATIC
                && code.get(index) instanceof FiveRegisterInstruction call
                && call.getRegisterCount() == 1 && call.getRegisterC() == 4,
                "Playlist menu hook must pass the item providers in v4");
        require(index + 2 < code.size() && code.get(index + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT
                && ((OneRegisterInstruction) code.get(index + 1)).getRegisterA() == 4
                && code.get(index + 2).getOpcode() == Opcode.IPUT_OBJECT
                && code.get(index + 2) instanceof TwoRegisterInstruction store
                && store.getRegisterA() == 4 && store.getRegisterB() == 0
                && ((ReferenceInstruction) store).getReference().toString().equals("Lp/sv70;->d:Ljava/util/List;"),
                "Playlist menu hook's providers must be the ones the menu stores");
    }

    /** The index of the instruction that branch {@code index} jumps to, or -1 when no instruction starts there. */
    static int branchTarget(List<Instruction> code, int index) {
        int address = 0;
        for (int i = 0; i < index; i++) address += code.get(i).getCodeUnits();
        int target = address + ((OffsetInstruction) code.get(index)).getCodeOffset();
        address = 0;
        for (int i = 0; i < code.size(); i++) {
            if (address == target) return i;
            address += code.get(i).getCodeUnits();
        }
        return -1;
    }

    /**
     * H1 passes the new service, p0, to the bridge right before its constructor returns, once the native
     * router takes requests.
     */
    static void verifyBridgeHook(ClassDef owner, Method method, List<Instruction> code, int index) {
        require(owner.getType().equals(SERVICE) && method.getName().equals("<init>")
                && method.getParameterTypes().size() == 2
                && method.getParameterTypes().get(1).equals("Lcom/spotify/cosmos/servicebasedrouter/RemoteNativeRouter;"),
                "Player bridge hook is outside SharedCosmosRouterService's constructor");
        int self = method.getImplementation().getRegisterCount() - 3;
        require(code.get(index).getOpcode() == Opcode.INVOKE_STATIC_RANGE
                && code.get(index) instanceof RegisterRangeInstruction call
                && call.getRegisterCount() == 1 && call.getStartRegister() == self
                && ((MethodReference) ((ReferenceInstruction) call).getReference()).getParameterTypes()
                    .equals(List.of("Ljava/lang/Object;")),
                "Player bridge hook must pass the service");
        require(index >= 1 && calls(code.get(index - 1), "Lcom/spotify/cosmos/cosmosimpl/NativeRouter;", "initializeScheduling")
                && index + 1 < code.size() && code.get(index + 1).getOpcode() == Opcode.RETURN_VOID,
                "Player bridge hook must sit between initializeScheduling and the constructor's return");
    }
}

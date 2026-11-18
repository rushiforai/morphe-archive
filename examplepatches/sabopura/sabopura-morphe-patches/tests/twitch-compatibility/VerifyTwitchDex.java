import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;
import java.util.*;

class VerifyTwitchDex {
    public static void main(String[] args) throws Exception {
        String root = "Lio/github/sabopura/morphe/extension/twitch/";
        var dex = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        Map<String,ClassDef> classes = new HashMap<>();
        for (String name : dex.getDexEntryNames())
            for (ClassDef cls : dex.getEntry(name).getDexFile().getClasses()) classes.put(cls.getType(), cls);
        Map<String,Integer> hooks = new TreeMap<>();
        for (ClassDef cls : classes.values()) {
            if (cls.getType().startsWith("Ltv/orange/")) throw new AssertionError("Original mod classes found");
            if (cls.getType().startsWith(root)) continue;
            for (Method method : cls.getMethods()) {
                if (method.getImplementation() == null) continue;
                for (Instruction instruction : method.getImplementation().getInstructions()) {
                    if (instruction instanceof ReferenceInstruction reference
                            && reference.getReference() instanceof MethodReference target
                            && target.getDefiningClass().startsWith(root)) {
                        String key = target.getDefiningClass().substring(root.length()) + "->" + target.getName();
                        hooks.merge(key, 1, Integer::sum);
                    }
                }
            }
        }
        for (var hook : hooks.entrySet()) System.out.println("HOOK " + hook);
        require(hooks.getOrDefault("chat/ChatEnhancements;->bind", 0) == 1, "one live row hook, right after setText");
        require(hooks.getOrDefault("chat/ChatEnhancements;->bindVod", 0) == 1, "VOD row after its text");
        require(hooks.getOrDefault("TwitchRuntime;->initialize", 0) >= 1, "extension startup hook");
        for (String name : List.of("onPlay", "onRelease", "onVod", "commentTime"))
            require(hooks.getOrDefault("player/PlayerTools;->" + name, 0) >= 1, "player hook " + name);
        require(hooks.getOrDefault("player/LiveProxy;->rewrite", 0) >= 1, "manifest hook");
        for (String name : List.of("chatWidth", "miniNativeSize"))
            require(hooks.getOrDefault("player/LayoutTools;->" + name, 0) == 1, "layout hook " + name);
        for (String name : List.of("filter", "fullCards"))
            require(hooks.getOrDefault("chat/FeedFilters;->" + name, 0) == 1, "following hook " + name);
        require(hooks.getOrDefault("app/Recaps;->feedEntry", 0) == 1, "feed recap entry hook");
        // 30.7.2 has the feed's recap cards only; the recap shelves came later, with this shelf item.
        int shelves = classes.containsKey("Ltv/twitch/android/shared/viewer/pub/FeedItem$StreamRecapsShelfItem;") ? 1 : 0;
        for (String name : List.of("channelShelf", "feedShelfSwitch"))
            require(hooks.getOrDefault("app/Recaps;->" + name, 0) == shelves, "recap shelf hook " + name);
        require(hooks.getOrDefault("danmaku/LiveChat;->onMessage", 0) >= 1, "live chat message hook");
        require(hooks.getOrDefault("danmaku/TwitchDanmaku;->onPlayerState", 0) == 1, "danmaku pause hook");
        require(hooks.getOrDefault("points/AutoClaimPoints;->onViewState", 0) == 1, "points eligibility wrapper");
        require(hooks.getOrDefault("notifications/FirebaseHeaders;->add", 0) + hooks.getOrDefault("notifications/FirebaseHeaders;->set", 0) >= 1, "scoped Firebase headers");
        int bridges = 0;
        for (String bridge : List.of("chat/RowAccess;", "chat/VodRowAccess;", "chat/FeedAccess;", "points/PointsAccess;", "danmaku/MessageAccess;")) {
            ClassDef cls = classes.get(root + bridge);
            require(cls != null, bridge);
            for (Method method : cls.getMethods()) {
                if (method.getName().equals("<init>")) continue;
                boolean found = false;
                for (Instruction instruction : method.getImplementation().getInstructions()) {
                    if ((method.getName().equals("isHeader") || method.getName().equals("isEnabled")) && instruction.getOpcode() == Opcode.INSTANCE_OF) {
                        found = true;
                        System.out.println("BRIDGE " + method.getName() + " => typed instance-of");
                    }
                    if (instruction.getOpcode() == Opcode.IGET_OBJECT && instruction instanceof ReferenceInstruction r
                            && r.getReference() instanceof FieldReference field) {
                        found = true;
                        ClassDef owner = classes.get(field.getDefiningClass());
                        boolean accessible = false;
                        for (Field f : owner.getFields()) if (f.getName().equals(field.getName()) && f.getType().equals(field.getType()))
                            accessible = AccessFlags.PUBLIC.isSet(f.getAccessFlags());
                        require(accessible, "public bridge field " + field);
                        System.out.println("BRIDGE " + method.getName() + " => " + field);
                    }
                }
                require(found, "unreplaced bridge " + method);
                if (bridge.equals("points/PointsAccess;") && method.getName().equals("claimBonus")) {
                    int calls = 0;
                    for (Instruction i : method.getImplementation().getInstructions())
                        if (i.getOpcode() == Opcode.INVOKE_INTERFACE && i instanceof ReferenceInstruction r
                                && r.getReference() instanceof MethodReference target) {
                            require(target.getReturnType().equals("V") && target.getParameterTypes().size() == 2
                                    && target.getParameterTypes().get(0).toString().equals("Ljava/lang/String;")
                                    && target.getParameterTypes().get(1).toString().equals("Ltv/twitch/android/shared/one/chat/pub/ChatModeMetadata;"), "native bonus signature");
                            ClassDef owner = classes.get(target.getDefiningClass());
                            require(owner != null && AccessFlags.PUBLIC.isSet(owner.getAccessFlags())
                                    && AccessFlags.INTERFACE.isSet(owner.getAccessFlags()), "native public points interface");
                            calls++;
                        }
                    require(calls == 1, "one native bonus submission");
                }
                bridges++;
            }
        }
        require(bridges == 29, "29 typed access bridges");
        verifyLatestContracts(classes, args[2], root);
        int loginMethods = 0;
        boolean loginExpected = args.length > 1 && args[1].equals("login");
        for (ClassDef cls : classes.values()) for (Method method : cls.getMethods()) {
            if (method.getDefiningClass().startsWith(root) || method.getImplementation() == null) continue;
            var code = new ArrayList<Instruction>();
            method.getImplementation().getInstructions().forEach(code::add);
            boolean setup = code.stream().anyMatch(i -> i instanceof ReferenceInstruction r &&
                r.getReference() instanceof StringReference s && s.getString().equals("play_integrity_setup_begin"));
            if (!setup) continue;
            loginMethods++;
            boolean skipped = code.get(0).getOpcode() == Opcode.SGET_OBJECT && code.get(1).getOpcode() == Opcode.RETURN_OBJECT;
            require(skipped == loginExpected, "optional login selection");
            if (skipped) {
                FieldReference singleton = (FieldReference)((ReferenceInstruction)code.get(0)).getReference();
                ClassDef unit = classes.get(singleton.getType());
                boolean nativeUnit = false;
                for (Method m : unit.getMethods()) if (m.getImplementation() != null)
                    for (Instruction i : m.getImplementation().getInstructions())
                        if (i instanceof ReferenceInstruction r && r.getReference() instanceof StringReference s && s.getString().equals("kotlin.Unit")) nativeUnit = true;
                require(nativeUnit, "native Kotlin Unit completion");
            }
        }
        require(loginMethods == 1, "single attestation setup");
        System.out.println("LOGIN optionalEnabled=" + loginExpected);
        // Hide options: Twitch's chat highlight filter asks the extension about additions right
        // after its cast, returns FALSE for a dropped event, and otherwise goes on with its own
        // next instruction (never back into the hook, which would loop forever).
        int highlightHooks = 0;
        for (ClassDef cls : classes.values()) for (Method method : cls.getMethods()) {
            if (method.getDefiningClass().startsWith(root) || method.getImplementation() == null) continue;
            var code = new ArrayList<Instruction>();
            method.getImplementation().getInstructions().forEach(code::add);
            for (int i = 0; i < code.size(); i++) {
                if (!(code.get(i) instanceof ReferenceInstruction r) || !r.getReference().toString().equals(
                        root + "chat/ViewCustomization;->keepHighlight(Ljava/lang/Object;)Z")) continue;
                require(i >= 5 && code.get(i - 5).getOpcode() == Opcode.CHECK_CAST
                        && code.get(i - 4).getOpcode() == Opcode.INSTANCE_OF && code.get(i - 3).getOpcode() == Opcode.IF_NEZ
                        && code.get(i - 2).getOpcode() == Opcode.INSTANCE_OF && code.get(i - 1).getOpcode() == Opcode.IF_EQZ
                        && code.get(i + 1).getOpcode() == Opcode.MOVE_RESULT && code.get(i + 2).getOpcode() == Opcode.IF_NEZ
                        && code.get(i + 3).getOpcode() == Opcode.SGET_OBJECT && code.get(i + 4).getOpcode() == Opcode.RETURN_OBJECT,
                        "highlight filter hook shape");
                require(target(code, i - 3) == i && target(code, i - 1) == i + 5 && target(code, i + 2) == i + 5,
                        "highlight filter hook continues with Twitch's code (" + target(code, i - 3) + ", "
                                + target(code, i - 1) + ", " + target(code, i + 2) + " for " + i + ")");
                require(code.stream().anyMatch(x -> x instanceof ReferenceInstruction v
                        && v.getReference().toString().equals("Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;")), "hook sits in the filter");
                highlightHooks++;
            }
        }
        require(highlightHooks == 1, "one community highlight filter hook");
        System.out.println("HIGHLIGHTS filterHooks=" + highlightHooks);
        // Hide the unfollow heart: the player's button list goes through the extension first.
        int buttonHooks = 0;
        for (ClassDef cls : classes.values()) for (Method method : cls.getMethods()) {
            if (!method.getName().equals("<init>") || method.getImplementation() == null) continue;
            var code = method.getImplementation().getInstructions().iterator();
            Instruction first = code.next();
            if (first instanceof ReferenceInstruction r && r.getReference().toString().equals(
                    root + "chat/ViewCustomization;->metadataButtons(Ljava/util/List;)Ljava/util/List;")) {
                // Twitch must keep what the extension answers: a read-only list comes back as a copy.
                require(code.hasNext() && code.next().getOpcode().name.equals("move-result-object"),
                        "the player button list hook keeps the returned list");
                buttonHooks++;
            }
        }
        require(buttonHooks == 1, "one player button list hook");
        System.out.println("BUTTONS listHooks=" + buttonHooks);
        // No autoplay after videos, and the sleep timer's "when this video ends": Twitch asks the
        // extension before it creates the state that shows the next video. A yes jumps to just
        // behind the call that takes that state, and the question only borrows the state's register.
        int nextVideoHooks = 0;
        for (ClassDef cls : classes.values()) for (Method method : cls.getMethods()) {
            if (method.getDefiningClass().startsWith(root) || method.getImplementation() == null) continue;
            var code = code(method);
            for (int i = 0; i < code.size(); i++) {
                if (!(code.get(i) instanceof ReferenceInstruction r) || !r.getReference().toString().equals(
                        root + "player/VodEnd;->keepEnded()Z")) continue;
                require(i + 3 < code.size() && code.get(i + 1).getOpcode() == Opcode.MOVE_RESULT
                        && code.get(i + 2).getOpcode() == Opcode.IF_NEZ && code.get(i + 3).getOpcode() == Opcode.NEW_INSTANCE,
                        "next video hook shape");
                int state = ((OneRegisterInstruction) code.get(i + 3)).getRegisterA();
                require(((OneRegisterInstruction) code.get(i + 1)).getRegisterA() == state
                        && ((OneRegisterInstruction) code.get(i + 2)).getRegisterA() == state, "next video hook borrows the state's register");
                ClassDef shown = classes.get(((ReferenceInstruction) code.get(i + 3)).getReference().toString());
                require(shown != null && code(shown, "toString").stream().anyMatch(x -> x instanceof ReferenceInstruction v
                        && v.getReference() instanceof StringReference s && s.getString().equals("RecommendationShown(recommendation=")),
                        "next video hook guards the state that shows the next video");
                int past = target(code, i + 2);
                require(!code.get(past).getOpcode().name.startsWith("move-result"), "next video hook does not land on a move-result");
                boolean takesState = false;
                if (past > i + 4 && code.get(past - 1) instanceof FiveRegisterInstruction call) {
                    int[] registers = {call.getRegisterC(), call.getRegisterD(), call.getRegisterE(), call.getRegisterF(), call.getRegisterG()};
                    for (int n = 0; n < call.getRegisterCount(); n++) takesState |= registers[n] == state;
                }
                require(takesState, "next video hook skips to just behind the call that takes the state (" + past + " for " + i + ")");
                for (int n = i + 3; n < past; n++)
                    require(!(code.get(n) instanceof OffsetInstruction) && code.get(n).getOpcode().canContinue(), "next video hook skips straight code");
                nextVideoHooks++;
            }
        }
        require(nextVideoHooks == 1, "one next video hook");
        System.out.println("NEXT VIDEO hooks=" + nextVideoHooks);
        verifyBackClose(classes, root);
        verifyPipShrink(classes, root);
        verifyNewHomeFeed(classes, root);
        System.out.println("PASS dexFiles=" + dex.getDexEntryNames().size() + " classes=" + classes.size() + " bridges=" + bridges);
    }
    /**
     * Back closes the player: one hook, right after a shrink of the player screen whose result it reads
     * into a register of its own, and a close bridge that makes one public call with three public
     * fields of that screen.
     */
    static void verifyBackClose(Map<String,ClassDef> classes, String root) {
        String owner = root + "player/PlayerClose;";
        int hooks = 0;
        for (ClassDef cls : classes.values()) for (Method method : cls.getMethods()) {
            if (cls.getType().startsWith(root) || method.getImplementation() == null) continue;
            var code = code(method);
            for (int n = 0; n < code.size(); n++) {
                if (!(code.get(n) instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference target
                        && target.getDefiningClass().equals(owner))) continue;
                require(target.getName().equals("afterBack") && n >= 2 && code.get(n) instanceof FiveRegisterInstruction, "back hook call");
                var hook = (FiveRegisterInstruction) code.get(n);
                require(code.get(n - 1).getOpcode() == Opcode.MOVE_RESULT
                        && ((OneRegisterInstruction) code.get(n - 1)).getRegisterA() == hook.getRegisterD()
                        && hook.getRegisterC() != hook.getRegisterD(), "back hook reads the result into its own register");
                require(code.get(n - 2).getOpcode() == Opcode.INVOKE_VIRTUAL && code.get(n - 2) instanceof FiveRegisterInstruction shrink
                        && shrink.getRegisterC() == hook.getRegisterC()
                        && ((MethodReference) ((ReferenceInstruction) shrink).getReference()).getReturnType().equals("Z"),
                        "back hook follows the player screen's shrink");
                hooks++;
            }
        }
        require(hooks == 1, "one back-closes-player hook");
        Set<String> screens = new HashSet<>();
        int fields = 0, calls = 0;
        for (Method method : classes.get(owner).getMethods()) {
            if (!method.getName().equals("close")) continue;
            for (Instruction i : method.getImplementation().getInstructions()) {
                if (i.getOpcode() == Opcode.IGET_OBJECT && ((ReferenceInstruction) i).getReference() instanceof FieldReference field) {
                    ClassDef screen = classes.get(field.getDefiningClass());
                    boolean open = false;
                    for (Field f : screen.getFields()) if (f.getName().equals(field.getName()) && f.getType().equals(field.getType()))
                        open = AccessFlags.PUBLIC.isSet(f.getAccessFlags()) && AccessFlags.PUBLIC.isSet(screen.getAccessFlags());
                    require(open, "public player screen field " + field);
                    screens.add(field.getDefiningClass());
                    fields++;
                }
                if (i.getOpcode() == Opcode.INVOKE_VIRTUAL && ((ReferenceInstruction) i).getReference() instanceof MethodReference target) {
                    ClassDef router = classes.get(target.getDefiningClass());
                    boolean open = false;
                    for (Method m : router.getMethods()) if (m.getName().equals(target.getName()) && m.getParameterTypes().equals(target.getParameterTypes()))
                        open = AccessFlags.PUBLIC.isSet(m.getAccessFlags()) && AccessFlags.PUBLIC.isSet(router.getAccessFlags());
                    require(open && target.getReturnType().equals("V") && target.getParameterTypes().size() == 2, "public player close call " + target);
                    System.out.println("BACKCLOSE " + target);
                    calls++;
                }
            }
        }
        require(fields == 3 && screens.size() == 1 && calls == 1, "close bridge: three fields of the player screen and one call");
    }

    /**
     * Shrink after picture-in-picture: the player screen reports a shrink other screens ask for right after
     * reading its presenter, and its picture-in-picture listener asks the extension right after handing the
     * change to the presenter, then shrinks that presenter from BUTTON_TAP or skips exactly that.
     */
    static void verifyPipShrink(Map<String,ClassDef> classes, String root) {
        String owner = root + "player/PipShrink;";
        int asked = 0, changed = 0;
        for (ClassDef cls : classes.values()) for (Method method : cls.getMethods()) {
            if (cls.getType().startsWith(root) || method.getImplementation() == null) continue;
            var code = code(method);
            for (int n = 0; n < code.size(); n++) {
                if (!(code.get(n) instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference target
                        && target.getDefiningClass().equals(owner))) continue;
                var hook = (FiveRegisterInstruction) code.get(n);
                if (target.getName().equals("asked")) {
                    require(cls.getType().equals("Ltv/twitch/android/feature/theatre/TheatreModeFragment;") && n >= 1
                            && code.get(n - 1).getOpcode() == Opcode.IGET_OBJECT
                            && ((TwoRegisterInstruction) code.get(n - 1)).getRegisterA() == hook.getRegisterC(),
                            "shrink request hook follows the player screen's read of its presenter");
                    asked++;
                    continue;
                }
                require(target.getName().equals("changed") && n >= 2 && n + 5 < code.size()
                        && code.get(n - 2).getOpcode() == Opcode.IGET_OBJECT
                        && ((TwoRegisterInstruction) code.get(n - 2)).getRegisterB() == hook.getRegisterC()
                        && ((TwoRegisterInstruction) code.get(n - 2)).getRegisterA() != hook.getRegisterC()
                        && code.get(n - 1).getOpcode() == Opcode.INVOKE_INTERFACE
                        && ((MethodReference) ((ReferenceInstruction) code.get(n - 1)).getReference()).getName().equals("onPictureInPictureModeChanged")
                        && ((FiveRegisterInstruction) code.get(n - 1)).getRegisterD() == hook.getRegisterD(),
                        "picture-in-picture hook follows the hand-over to the presenter, with the same flag and the presenter intact");
                int scratch = ((OneRegisterInstruction) code.get(n + 1)).getRegisterA();
                require(code.get(n + 1).getOpcode() == Opcode.MOVE_RESULT && code.get(n + 2).getOpcode() == Opcode.IF_EQZ
                        && ((OneRegisterInstruction) code.get(n + 2)).getRegisterA() == scratch
                        && code.get(n + 3).getOpcode() == Opcode.SGET_OBJECT && ((OneRegisterInstruction) code.get(n + 3)).getRegisterA() == scratch
                        && ((FieldReference) ((ReferenceInstruction) code.get(n + 3)).getReference()).getName().equals("BUTTON_TAP")
                        && code.get(n + 4).getOpcode() == Opcode.INVOKE_VIRTUAL
                        && ((FiveRegisterInstruction) code.get(n + 4)).getRegisterC() == hook.getRegisterC()
                        && ((FiveRegisterInstruction) code.get(n + 4)).getRegisterD() == scratch
                        && target(code, n + 2) == n + 5, "picture-in-picture hook shrinks the presenter from BUTTON_TAP or skips just that");
                changed++;
            }
        }
        require(asked == 1 && changed == 1, "one shrink request hook and one picture-in-picture hook");
        System.out.println("PIP SHRINK asked=" + asked + " changed=" + changed);
    }

    /**
     * The React Native home's responses: where that home exists, the handler BlobModule gives the network
     * module asks the extension before anything else, and goes on with the body the extension answers.
     */
    static void verifyNewHomeFeed(Map<String,ClassDef> classes, String root) {
        String hook = root + "app/NewHomeFeed;->rewrite([B)[B";
        boolean home = classes.containsKey("Ltv/twitch/android/feature/discovery/feed/rn/feed/DiscoveryFeedRNFragment$NavResolver;");
        String handler = null;
        ClassDef blobModule = classes.get("Lcom/facebook/react/modules/blob/BlobModule;");
        if (blobModule != null) for (Field field : blobModule.getFields())
            if (field.getName().equals("networkingResponseHandler")) handler = field.getType();
        int hooks = 0;
        for (ClassDef cls : classes.values()) for (Method method : cls.getMethods()) {
            if (cls.getType().startsWith(root) || method.getImplementation() == null) continue;
            var code = code(method);
            for (int n = 0; n < code.size(); n++) {
                if (!(code.get(n) instanceof ReferenceInstruction r && r.getReference().toString().equals(hook))) continue;
                int body = method.getImplementation().getRegisterCount() - 1;
                require(cls.getType().equals(handler) && n == 0 && method.getParameterTypes().toString().equals("[[B]")
                        && method.getReturnType().equals("Lcom/facebook/react/bridge/WritableMap;"),
                        "new home hook opens the blob response handler's method");
                require(((FiveRegisterInstruction) code.get(0)).getRegisterC() == body
                        && code.get(1).getOpcode() == Opcode.MOVE_RESULT_OBJECT
                        && ((OneRegisterInstruction) code.get(1)).getRegisterA() == body,
                        "new home hook puts its answer where the body was");
                hooks++;
            }
        }
        require(hooks == (home ? 1 : 0), "one new home hook where the React Native home exists, found " + hooks);
        System.out.println("NEW HOME hooks=" + hooks);
    }

    /** The index a branch at [index] jumps to. */
    static int target(List<Instruction> code, int index) {
        int[] offsets = new int[code.size()];
        for (int i = 1; i < code.size(); i++) offsets[i] = offsets[i - 1] + code.get(i - 1).getCodeUnits();
        int to = offsets[index] + ((OffsetInstruction) code.get(index)).getCodeOffset();
        for (int i = 0; i < code.size(); i++) if (offsets[i] == to) return i;
        return -1;
    }

    static List<Instruction> code(Method method) {
        var result = new ArrayList<Instruction>();
        method.getImplementation().getInstructions().forEach(result::add);
        return result;
    }
    /** The code of the methods of [cls] called [name]. */
    static List<Instruction> code(ClassDef cls, String name) {
        var result = new ArrayList<Instruction>();
        for (Method method : cls.getMethods())
            if (method.getName().equals(name) && method.getImplementation() != null) result.addAll(code(method));
        return result;
    }
    static List<String> normalized(Method method) {
        var instructions = code(method);
        var indices = new HashMap<Integer,Integer>();
        int address = 0;
        for (int n = 0; n < instructions.size(); n++) {
            indices.put(address, n); address += instructions.get(n).getCodeUnits();
        }
        indices.put(address, instructions.size());
        var result = new ArrayList<String>();
        address = 0;
        for (Instruction i : instructions) {
            String s = i.getOpcode() == Opcode.CONST_STRING_JUMBO ? "CONST_STRING" : i.getOpcode().toString();
            if (i instanceof ThreeRegisterInstruction r) s += ":" + r.getRegisterA()+","+r.getRegisterB()+","+r.getRegisterC();
            else if (i instanceof TwoRegisterInstruction r) s += ":"+r.getRegisterA()+","+r.getRegisterB();
            else if (i instanceof OneRegisterInstruction r) s += ":"+r.getRegisterA();
            if (i instanceof FiveRegisterInstruction r) {
                int[] registers = {r.getRegisterC(),r.getRegisterD(),r.getRegisterE(),r.getRegisterF(),r.getRegisterG()};
                s += ":" + Arrays.toString(Arrays.copyOf(registers, r.getRegisterCount()));
            }
            if (i instanceof RegisterRangeInstruction r) s += ":"+r.getStartRegister()+".."+r.getRegisterCount();
            if (i instanceof WideLiteralInstruction l) s += ":literal="+l.getWideLiteral();
            if (i instanceof ReferenceInstruction r) s += ":ref="+r.getReference();
            if (i instanceof OffsetInstruction b) s += ":target="+indices.get(address+b.getCodeOffset());
            require(!(i instanceof SwitchPayload) && !(i instanceof com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload), "extend comparison for payload");
            result.add(s); address += i.getCodeUnits();
        }
        for (TryBlock<? extends ExceptionHandler> block : method.getImplementation().getTryBlocks()) {
            String s = "TRY:"+indices.get(block.getStartCodeAddress())+".."+indices.get(block.getStartCodeAddress()+block.getCodeUnitCount());
            for (ExceptionHandler handler : block.getExceptionHandlers()) s += ":"+handler.getExceptionType()+"@"+indices.get(handler.getHandlerCodeAddress());
            result.add(s);
        }
        return result;
    }
    static void verifyLatestContracts(Map<String,ClassDef> classes, String originalPath, String root) throws Exception {
        var original = DexFileFactory.loadDexContainer(new File(originalPath), Opcodes.getDefault());
        Map<String,ClassDef> originalClasses = new HashMap<>();
        for (String name : original.getDexEntryNames())
            for (ClassDef cls : original.getEntry(name).getDexFile().getClasses()) originalClasses.put(cls.getType(),cls);
        int wrappers = 0, widths = 0, keys = 0, rows = 0;
        for (ClassDef cls : classes.values()) for (Method method : cls.getMethods()) {
            if (method.getDefiningClass().startsWith(root) || method.getImplementation() == null) continue;
            var instructions = code(method);
            for (int index = 0; index < instructions.size(); index++) {
                Instruction i = instructions.get(index);
                if (!(i instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference target)) continue;
                if (target.getDefiningClass().equals(root+"chat/ChatEnhancements;") && target.getName().equals("bind")) {
                    rows++;
                    Method before=null;
                    for(Method m : originalClasses.get(cls.getType()).getMethods())
                        if(m.getName().equals(method.getName()) && m.getParameterTypes().equals(method.getParameterTypes())) before=m;
                    require(before!=null,"native chat binder exists");
                    require(instructions.get(index-1) instanceof ReferenceInstruction set && set.getReference().toString().equals(
                            "Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V"),"chat callback directly after the row's setText");
                    int first=method.getImplementation().getRegisterCount()-3;
                    for(int n=0;n<index;n++) if(instructions.get(n).getOpcode().setsRegister() && instructions.get(n) instanceof OneRegisterInstruction reg)
                        require(reg.getRegisterA()!=first && reg.getRegisterA()!=first+1,"row and model registers intact before the callback");
                }
                if (target.getDefiningClass().equals(root+"points/AutoClaimPoints;") && target.getName().equals("onViewState")) {
                    wrappers++;
                    require(instructions.size() == 4 && method.getImplementation().getRegisterCount() == 4, "minimal points wrapper");
                    require(instructions.get(0).getOpcode()==Opcode.INVOKE_DIRECT && index==2, "native renderer runs before callback");
                    var render = (FiveRegisterInstruction)instructions.get(0);
                    var callback = (FiveRegisterInstruction)i;
                    require(render.getRegisterC()==2 && render.getRegisterD()==3 && callback.getRegisterC()==0 && callback.getRegisterD()==2, "receiver and native result isolated from scratch registers");
                    require(instructions.get(1).getOpcode()==Opcode.MOVE_RESULT_OBJECT && ((OneRegisterInstruction)instructions.get(1)).getRegisterA()==0 &&
                            instructions.get(3).getOpcode()==Opcode.RETURN_OBJECT && ((OneRegisterInstruction)instructions.get(3)).getRegisterA()==0, "unaltered native result returned");
                    var nativeRef = (MethodReference)((ReferenceInstruction)instructions.get(0)).getReference();
                    Method helper = null, before = null;
                    for (Method m : cls.getMethods()) if (m.getName().equals(nativeRef.getName())) helper=m;
                    for (Method m : originalClasses.get(cls.getType()).getMethods())
                        if (m.getName().equals(method.getName()) && m.getParameterTypes().equals(method.getParameterTypes()) && m.getReturnType().equals(method.getReturnType())) before=m;
                    require(helper!=null && before!=null && AccessFlags.PRIVATE.isSet(helper.getAccessFlags()), "private native renderer retained");
                    require(helper.getImplementation().getRegisterCount()==before.getImplementation().getRegisterCount() && normalized(helper).equals(normalized(before)), "native eligibility body and branches preserved");
                }
                if (target.getDefiningClass().equals(root+"player/LayoutTools;") && target.getName().equals("chatWidth")) {
                    widths++;
                    var parameters = method.getParameterTypes();
                    int start = method.getImplementation().getRegisterCount()-2;
                    int view = start+parameters.indexOf("Landroid/view/View;"), percent=start+parameters.indexOf("I");
                    require(AccessFlags.STATIC.isSet(method.getAccessFlags()) && parameters.size()==2, "width helper signature");
                    if (i instanceof FiveRegisterInstruction f) require(f.getRegisterC()==view && f.getRegisterD()==percent, "reordered width registers");
                    else { var range=(RegisterRangeInstruction)i; require(range.getStartRegister()==view && range.getRegisterCount()==2 && percent==view+1,"width range registers"); }
                    require(instructions.get(index+1).getOpcode()==Opcode.MOVE_RESULT && ((OneRegisterInstruction)instructions.get(index+1)).getRegisterA()==percent, "width writes percentage parameter");
                }
                if (target.getDefiningClass().equals(root+"chat/ChatEnhancements;") && target.getName().equals("onChannelJoin")) {
                    // The hook sits at the start of Twitch's channel join, which takes the channel's ID (a Tuid from
                    // 31.9.0, an int before), its name and one more value. A Tuid is handed over as it is; an int
                    // is boxed into a String first.
                    keys++;
                    var parameters = method.getParameterTypes().stream().map(Object::toString).toList();
                    require(!AccessFlags.STATIC.isSet(method.getAccessFlags()) && parameters.size()==3
                            && parameters.contains("Ljava/lang/String;"), "channel join signature");
                    boolean typed=parameters.contains("Ltv/twitch/android/models/Tuid;");
                    boolean boxed=instructions.subList(0,index).stream().anyMatch(x -> x instanceof ReferenceInstruction ref && ref.getReference().toString().equals("Ljava/lang/String;->valueOf(I)Ljava/lang/String;"));
                    require(typed!=boxed && (typed || parameters.contains("I")),"channel ID handed over in its own form");
                    require(i instanceof FiveRegisterInstruction f && f.getRegisterCount()==2 && f.getRegisterC()==1 && f.getRegisterD()==0,
                            "channel join callback reads the scratch registers");
                }
            }
        }
        Method userId=null;
        for (Method m : classes.get(root+"chat/RowAccess;").getMethods()) if(m.getName().equals("userId")) userId=m;
        var userCode=code(userId);
        FieldReference id=(FieldReference)((ReferenceInstruction)userCode.get(1)).getReference();
        boolean typed=id.getType().endsWith("/Tuid;");
        require(!typed || (userCode.get(2).getOpcode()==Opcode.IF_EQZ && ((ReferenceInstruction)userCode.get(3)).getReference().toString().equals("Ltv/twitch/android/models/Tuid;->toString()Ljava/lang/String;")), "nullable author Tuid conversion");
        if (typed) {
            // A null branch must not merge a Tuid register with the converted String.
            // Class loading and package compile alone can miss this lazy ART VerifyError.
            require(userCode.size()==8 && userCode.get(4).getOpcode()==Opcode.MOVE_RESULT_OBJECT
                && userCode.get(5).getOpcode()==Opcode.RETURN_OBJECT
                && userCode.get(6).getOpcode()==Opcode.CONST_4
                && ((NarrowLiteralInstruction)userCode.get(6)).getNarrowLiteral()==0
                && userCode.get(7).getOpcode()==Opcode.RETURN_OBJECT, "separate String and explicit null return paths");
            int distance=0;
            for(int n=2;n<6;n++) distance+=userCode.get(n).getCodeUnits();
            require(((OffsetInstruction)userCode.get(2)).getCodeOffset()==distance, "null branch targets explicit zero");
            int register=((OneRegisterInstruction)userCode.get(2)).getRegisterA();
            for(int n=4;n<8;n++) require(((OneRegisterInstruction)userCode.get(n)).getRegisterA()==register,"author return register");
        }
        require(wrappers==1 && widths==1 && keys==1 && rows>0,"unique latest compatibility hooks");
        System.out.println("CONTRACTS nativeEligibilityPreserved=true widthArgumentsCorrect=true typedChannelAndAuthorIds="+typed);
    }
    static void require(boolean condition, String detail) { if (!condition) throw new AssertionError(detail); }
}

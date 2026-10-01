import java.io.File;
import java.nio.ByteBuffer;
import java.util.*;
import java.util.zip.ZipFile;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;

class VerifyAdsDex {
    static final String HELPER = "Lapp/spicetify/extension/spotify/ads/BrandAds;";
    static final String PLAYER_HELPER = "Lapp/spicetify/extension/spotify/ads/PlayerAdCards;";
    static final String INSTALLED = "Lapp/spicetify/extension/spotify/settings/InstalledPatches;";
    static final Map<String, String> CALLERS = Map.of("Lp/jb20;", "invoke", "Lp/vot;", "g", "Lp/x7v0;", "a");
    static final List<String> MODELS = List.of("Lp/ih40;",
            "Lcom/spotify/casita/v1/resolved/Section;", "Lcom/spotify/browsita/v1/resolved/Section;",
            "Lcom/spotify/casita/v1/resolved/HomeStructure;", "Lcom/spotify/browsita/v1/resolved/BrowseStructure;");
    static final List<String> PLAYER_MODELS = List.of("Lcom/spotify/scrollsita/v1/Section;", "Lp/uti0;", "Lp/v7r;", "Lp/yit;");

    static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    static Map<String, ClassDef> load(String path) throws Exception {
        var classes = new HashMap<String, ClassDef>();
        var dex = DexFileFactory.loadDexContainer(new File(path), Opcodes.forApi(35));
        for (var entry : dex.getDexEntryNames()) for (var cls : dex.getEntry(entry).getDexFile().getClasses()) {
            require(classes.put(cls.getType(), cls) == null, "Duplicate class: " + cls.getType());
        }
        return classes;
    }

    static byte[] canonical(ClassDef definition) throws Exception {
        require(definition != null, "Missing expected class");
        var pool = new DexPool(Opcodes.forApi(35));
        pool.internClass(definition);
        var output = new MemoryDataStore();
        try {
            pool.writeTo(output);
            return output.getData();
        } finally {
            output.close();
        }
    }

    static String reference(Instruction instruction) {
        return instruction instanceof ReferenceInstruction ref ? ref.getReference().toString() : "";
    }

    static void verifyHooks(Collection<? extends ClassDef> classes, boolean enabled) {
        var seen = new HashSet<String>();
        int capabilities = 0;
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null) continue;
            var code = new ArrayList<Instruction>();
            method.getImplementation().getInstructions().forEach(code::add);
            if (cls.getType().equals(INSTALLED) && method.getName().equals("hideBrandAds")) {
                capabilities++;
                require(method.getParameterTypes().isEmpty() && method.getReturnType().equals("Z")
                        && AccessFlags.PUBLIC.isSet(method.getAccessFlags()) && AccessFlags.STATIC.isSet(method.getAccessFlags())
                        && code.size() == 2 && code.get(0).getOpcode() == Opcode.CONST_4
                        && ((NarrowLiteralInstruction) code.get(0)).getNarrowLiteral() == (enabled ? 1 : 0)
                        && code.get(1).getOpcode() == Opcode.RETURN
                        && ((OneRegisterInstruction) code.get(0)).getRegisterA() == ((OneRegisterInstruction) code.get(1)).getRegisterA(),
                        "Brand-ad capability differs from patch selection");
            }
            for (int index = 0; index < code.size(); index++) {
                if (!(code.get(index) instanceof ReferenceInstruction ref)
                        || !(ref.getReference() instanceof MethodReference target)
                        || !target.getDefiningClass().equals(HELPER) || cls.getType().equals(HELPER)) continue;
                require(enabled && method.getName().equals(CALLERS.get(cls.getType())) && seen.add(cls.getType()),
                        "Unexpected or duplicate brand-ad caller");
                boolean browse = cls.getType().equals("Lp/x7v0;");
                String getter = browse ? "Lcom/spotify/browsita/v1/resolved/BrowseStructure;->o()Lp/ih40;"
                        : "Lcom/spotify/casita/v1/resolved/HomeStructure;->p()Lp/ih40;";
                require(index >= 2 && index + 1 < code.size()
                        && code.get(index - 2).getOpcode() == Opcode.INVOKE_VIRTUAL
                        && reference(code.get(index - 2)).equals(getter)
                        && code.get(index - 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT,
                        "Brand-ad hook must follow the native section getter");
                int register = ((OneRegisterInstruction) code.get(index - 1)).getRegisterA();
                require(target.getName().equals(browse ? "browse" : "home")
                        && target.getParameterTypes().equals(List.of("Ljava/util/List;"))
                        && target.getReturnType().equals("Ljava/util/List;")
                        && code.get(index).getOpcode() == Opcode.INVOKE_STATIC_RANGE
                        && code.get(index) instanceof RegisterRangeInstruction call
                        && call.getRegisterCount() == 1 && call.getStartRegister() == register
                        && code.get(index + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT
                        && ((OneRegisterInstruction) code.get(index + 1)).getRegisterA() == register,
                        "Brand-ad hook must preserve the section list register and filter type");
                int iterator = index + (cls.getType().equals("Lp/jb20;") ? 5 : 4);
                require(iterator < code.size() && code.get(iterator).getOpcode() == Opcode.INVOKE_INTERFACE
                        && reference(code.get(iterator)).equals("Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;")
                        && code.get(iterator) instanceof FiveRegisterInstruction call
                        && call.getRegisterCount() == 1 && call.getRegisterC() == register,
                        "Filtered list must reach the native iterator");
            }
        }
        require(seen.equals(enabled ? CALLERS.keySet() : Set.of()), "Missing brand-ad hooks");
        require(enabled ? capabilities == 1 : capabilities <= 1, "Missing or duplicate brand-ad capability");
    }

    static void verifyPlayerHooks(Collection<? extends ClassDef> classes, boolean enabled) {
        int hooks = 0;
        int embeddedHooks = 0;
        int capabilities = 0;
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null) continue;
            var code = new ArrayList<Instruction>();
            method.getImplementation().getInstructions().forEach(code::add);
            if (cls.getType().equals(INSTALLED) && method.getName().equals("hidePlayerAdCards")) {
                capabilities++;
                require(method.getParameterTypes().isEmpty() && method.getReturnType().equals("Z")
                        && AccessFlags.PUBLIC.isSet(method.getAccessFlags()) && AccessFlags.STATIC.isSet(method.getAccessFlags())
                        && code.size() == 2 && code.get(0).getOpcode() == Opcode.CONST_4
                        && ((NarrowLiteralInstruction) code.get(0)).getNarrowLiteral() == (enabled ? 1 : 0)
                        && code.get(1).getOpcode() == Opcode.RETURN
                        && ((OneRegisterInstruction) code.get(0)).getRegisterA() == ((OneRegisterInstruction) code.get(1)).getRegisterA(),
                        "Player-ad capability differs from patch selection");
            }
            for (int index = 0; index < code.size(); index++) {
                if (!(code.get(index) instanceof ReferenceInstruction ref)
                        || !(ref.getReference() instanceof MethodReference target)
                        || !target.getDefiningClass().equals(PLAYER_HELPER) || cls.getType().equals(PLAYER_HELPER)) continue;
                if (target.getName().equals("showEmbeddedAd")) {
                    embeddedHooks++;
                    require(enabled && isEmbeddedAdGuard(cls, method, code, index), "Embedded-ad hook must guard the Now Playing embedded-ad predicate");
                    continue;
                }
                hooks++;
                require(enabled && cls.getType().equals("Lp/ja31;") && method.getName().equals("invoke")
                        && method.getParameterTypes().equals(List.of("Ljava/lang/Object;"))
                        && reference(code.get(index)).equals(PLAYER_HELPER + "->showImageBrandAd(Z)Z")
                        && index >= 2 && index + 3 < code.size()
                        && code.get(index - 2).getOpcode() == Opcode.INVOKE_VIRTUAL
                        && reference(code.get(index - 2)).equals("Lcom/spotify/scrollsita/v1/Section;->o0()Z")
                        && code.get(index - 1).getOpcode() == Opcode.MOVE_RESULT
                        && code.get(index).getOpcode() == Opcode.INVOKE_STATIC_RANGE
                        && code.get(index) instanceof RegisterRangeInstruction call
                        && call.getRegisterCount() == 1
                        && call.getStartRegister() == ((OneRegisterInstruction) code.get(index - 1)).getRegisterA()
                        && code.get(index + 1).getOpcode() == Opcode.MOVE_RESULT
                        && ((OneRegisterInstruction) code.get(index + 1)).getRegisterA() == call.getStartRegister()
                        && code.get(index + 3).getOpcode() == Opcode.IF_EQZ
                        && ((OneRegisterInstruction) code.get(index + 3)).getRegisterA() == call.getStartRegister(),
                        "Player-ad hook must feed the image-brand-ad null branch");
            }
        }
        require(hooks == (enabled ? 1 : 0), "Missing or duplicate player-ad hook");
        require(embeddedHooks == (enabled ? 1 : 0), "Missing or duplicate embedded-ad hook");
        require(enabled ? capabilities == 1 : capabilities <= 1, "Missing or duplicate player-ad capability");
    }

    static boolean isEmbeddedAdGuard(ClassDef cls, Method method, List<Instruction> code, int index) {
        if (!cls.getType().equals("Lp/onq;") || !method.getName().equals("z") || !method.getReturnType().equals("Z")
                || !method.getParameterTypes().equals(List.of("Lcom/spotify/player/model/ContextTrack;"))
                || index != 0 || code.size() < 6) return false;
        if (code.get(0).getOpcode() != Opcode.INVOKE_STATIC || ((FiveRegisterInstruction) code.get(0)).getRegisterCount() != 0
                || !reference(code.get(0)).equals(PLAYER_HELPER + "->showEmbeddedAd()Z")) return false;
        if (code.get(1).getOpcode() != Opcode.MOVE_RESULT || code.get(2).getOpcode() != Opcode.IF_NEZ
                || code.get(3).getOpcode() != Opcode.CONST_4 || code.get(4).getOpcode() != Opcode.RETURN) return false;
        int register = ((OneRegisterInstruction) code.get(1)).getRegisterA();
        for (int i = 2; i <= 4; i++) if (((OneRegisterInstruction) code.get(i)).getRegisterA() != register) return false;
        if (((NarrowLiteralInstruction) code.get(3)).getNarrowLiteral() != 0) return false;
        int guardUnits = 0;
        for (int i = 2; i < 5; i++) guardUnits += code.get(i).getCodeUnits();
        int parameters = AccessFlags.STATIC.isSet(method.getAccessFlags()) ? 0 : 1;
        for (var type : method.getParameterTypes()) parameters += type.equals("J") || type.equals("D") ? 2 : 1;
        return register < method.getImplementation().getRegisterCount() - parameters
                && ((OffsetInstruction) code.get(2)).getCodeOffset() == guardUnits
                && code.get(5).getOpcode() == Opcode.IGET_OBJECT
                && ((TwoRegisterInstruction) code.get(5)).getRegisterA() == register
                && reference(code.get(5)).equals("Lp/onq;->b:Ljava/lang/Object;");
    }

    static Method embeddedAdPredicate(ClassDef definition) {
        require(definition != null, "Missing Lp/onq;");
        for (var method : definition.getMethods()) {
            if (method.getName().equals("z") && method.getReturnType().equals("Z")
                    && method.getParameterTypes().equals(List.of("Lcom/spotify/player/model/ContextTrack;"))) return method;
        }
        throw new AssertionError("Missing embedded-ad predicate");
    }

    static List<String> describe(Iterable<? extends Instruction> instructions) {
        var lines = new ArrayList<String>();
        for (var instruction : instructions) {
            var line = new StringBuilder(instruction.getOpcode().name);
            if (instruction instanceof OneRegisterInstruction i) line.append(" a=").append(i.getRegisterA());
            if (instruction instanceof TwoRegisterInstruction i) line.append(" b=").append(i.getRegisterB());
            if (instruction instanceof ThreeRegisterInstruction i) line.append(" c=").append(i.getRegisterC());
            if (instruction instanceof FiveRegisterInstruction i) line.append(" regs=").append(List.of(i.getRegisterCount(),
                    i.getRegisterC(), i.getRegisterD(), i.getRegisterE(), i.getRegisterF(), i.getRegisterG()));
            if (instruction instanceof RegisterRangeInstruction i) line.append(" range=").append(i.getStartRegister()).append('+').append(i.getRegisterCount());
            if (instruction instanceof WideLiteralInstruction i) line.append(" literal=").append(i.getWideLiteral());
            if (instruction instanceof OffsetInstruction i) line.append(" offset=").append(i.getCodeOffset());
            line.append(' ').append(reference(instruction));
            lines.add(line.toString());
        }
        return lines;
    }

    static void verifyEmbeddedAdBody(Map<String, ClassDef> stock, Map<String, ClassDef> patched, boolean enabled) {
        var original = describe(embeddedAdPredicate(stock.get("Lp/onq;")).getImplementation().getInstructions());
        var current = describe(embeddedAdPredicate(patched.get("Lp/onq;")).getImplementation().getInstructions());
        require(current.subList(enabled ? 5 : 0, current.size()).equals(original), "Embedded-ad predicate body changed");
    }

    static void verifyHelper(Map<String, ClassDef> patched, ZipFile bundle, String type, boolean enabled) throws Exception {
        if (!patched.containsKey(type)) {
            require(!enabled, "Missing ad helper: " + type);
            return;
        }
        var entry = bundle.getEntry("extensions/spotify.mpe");
        require(entry != null, "Bundle lacks the extension");
        try (var input = bundle.getInputStream(entry)) {
            var dex = new DexBackedDexFile(Opcodes.forApi(35), ByteBuffer.wrap(input.readAllBytes()));
            var expected = dex.getClasses().stream().filter(c -> c.getType().equals(type)).findFirst().orElseThrow();
            require(Arrays.equals(canonical(expected), canonical(patched.get(type))), "Ad helper differs from bundle: " + type);
        }
    }

    public static void main(String[] args) throws Exception {
        require(args.length == 5 && Set.of("0", "1").contains(args[3]) && Set.of("0", "1").contains(args[4]),
                "Usage: VerifyAdsDex.java STOCK PATCHED BUNDLE BRAND_ADS_ENABLED PLAYER_ADS_ENABLED");
        var stock = load(args[0]);
        var patched = load(args[1]);
        boolean enabled = args[3].equals("1");
        boolean playerEnabled = args[4].equals("1");
        verifyHooks(patched.values(), enabled);
        verifyPlayerHooks(patched.values(), playerEnabled);
        for (var type : MODELS) require(Arrays.equals(canonical(stock.get(type)), canonical(patched.get(type))),
                "Brand-ad model or protobuf list changed: " + type);
        verifyEmbeddedAdBody(stock, patched, playerEnabled);
        for (var type : PLAYER_MODELS) require(Arrays.equals(canonical(stock.get(type)), canonical(patched.get(type))),
                "Player-ad model changed: " + type);
        try (var bundle = new ZipFile(args[2])) {
            verifyHelper(patched, bundle, HELPER, enabled);
            verifyHelper(patched, bundle, PLAYER_HELPER, playerEnabled);
        }
        System.out.println("Brand ads verified: selected=" + enabled + ", player ads=" + playerEnabled
                + ", native models unchanged");
    }
}

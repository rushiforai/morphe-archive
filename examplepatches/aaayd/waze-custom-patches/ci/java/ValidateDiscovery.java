import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import local.wazemaps.ThemeColoursKt;
import local.wazemaps.WazeBindingsKt;
import local.wazemaps.ReportIconAssetsKt;
import java.util.*;

/** Semantic fixtures: compiler layout variations must not change which setting is patched. */
public class ValidateDiscovery {
    static final String FIELD = "CONFIG_VALUE_MOODS_BETA_ENABLED";
    static final String CONFIG = "Lfixture/BooleanConfig;";
    static void require(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }
    static void rejected(Runnable action, String message) {
        try { action.run(); }
        catch (Exception expected) {
            if (expected instanceof app.morphe.patcher.patch.PatchException) return;
            throw new AssertionError("Unexpected fixture failure", expected);
        }
        throw new AssertionError(message);
    }
    static ImmutableMethod gate(List<Instruction> instructions) {
        return new ImmutableMethod("Lfixture/MoodScreen;", "loadRows", List.of(), "V", 1, Set.of(), Set.of(),
            new ImmutableMethodImplementation(12, instructions, List.of(), List.of()));
    }
    static List<Instruction> prefix(boolean overwrite) {
        List<Instruction> code = new ArrayList<>();
        code.add(new ImmutableInstruction21c(Opcode.SGET_OBJECT, 2,
            new ImmutableFieldReference("Lcom/waze/config/ConfigValues;", FIELD, CONFIG)));
        code.add(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 7, 2));
        for (int i = 0; i < 30; i++) code.add(new ImmutableInstruction10x(Opcode.NOP));
        if (overwrite) code.add(new ImmutableInstruction11n(Opcode.CONST_4, 7, 0));
        return code;
    }
    static void gates() {
        for (boolean boxed : new boolean[] {false, true}) for (boolean range : new boolean[] {false, true}) {
            var code = prefix(false);
            var ref = boxed ? new ImmutableMethodReference(CONFIG, "read", List.of(), "Ljava/lang/Boolean;") :
                new ImmutableMethodReference("Lcom/waze/ConfigManager;", "readBool", List.of(CONFIG), "Z");
            code.add(range ? new ImmutableInstruction3rc(Opcode.INVOKE_VIRTUAL_RANGE, boxed ? 7 : 6, boxed ? 1 : 2, ref) :
                new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, boxed ? 1 : 2, boxed ? 7 : 6, 7, 0, 0, 0, ref));
            if (boxed) {
                code.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 8));
                code.add(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 9, 8));
                code.add(new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 9, 0, 0, 0, 0,
                    new ImmutableMethodReference("Ljava/lang/Boolean;", "booleanValue", List.of(), "Z")));
            }
            int result = code.size();
            code.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT, 4));
            code.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
            var found = WazeBindingsKt.booleanConfigResult(gate(code), FIELD);
            require(found.getFirst() == result && found.getSecond() == 4, "Wrong boolean result for boxed=" + boxed + " range=" + range);
        }
        var unrelated = prefix(true);
        unrelated.add(new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 6, 7, 0, 0, 0,
            new ImmutableMethodReference("Lcom/waze/ConfigManager;", "readBool", List.of(CONFIG), "Z")));
        unrelated.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT, 4));
        unrelated.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
        rejected(() -> WazeBindingsKt.booleanConfigResult(gate(unrelated), FIELD), "Accepted overwritten config register");
        var branch = prefix(false);
        branch.add(new ImmutableInstruction10t(Opcode.GOTO, 1));
        branch.addAll(unrelated.subList(33, unrelated.size()));
        rejected(() -> WazeBindingsKt.booleanConfigResult(gate(branch), FIELD), "Traced through unproven control flow");
    }
    static void palettes() {
        String source = "local Palette = {map_background = rgb ( 0xFFFFFF ), labels=rgb(0xAAAAAA)}\nColors = {General = {map_background=Palette.map_background}}\n";
        var palette = Map.of("map_background", "000000", "labels", "BBBBBB", "ad_labels_color", "CCCCCC");
        var colors = Map.of("General.map_background", "000000", "AdPinBusinessName.labels_color", "CCCCCC");
        String result = ThemeColoursKt.recolorSkin(source, palette, colors);
        require(result.contains("map_background = rgb(0x000000)") && result.contains("labels=rgb(0xBBBBBB)"), "Compact Lua palette was not recoloured");
        require(result.contains("Colors.General.map_background = rgb(0x000000)") && !result.contains("Colors.AdPinBusinessName"), "Optional table handling changed output");
        rejected(() -> ThemeColoursKt.recolorSkin(source.replace("map_background = rgb ( 0xFFFFFF )", "map_background = other()"), palette, colors), "Accepted changed core colour expression");
        rejected(() -> ThemeColoursKt.recolorSkin(source.replace("labels=rgb(0xAAAAAA)", "labels=rgb(0xAAAAAA), labels=rgb(0xAAAAAA)"), palette, colors), "Accepted duplicate palette key");
        rejected(() -> ThemeColoursKt.recolorSkin(source.replace("General = {map_background=Palette.map_background}", "General = invalid"), palette, colors), "Treated malformed table as optional");
    }
    static ImmutableMethod helper(String name, List<String> parameters, String result, List<Instruction> code) {
        return new ImmutableMethod("Lfixture/RenamedResources;", name,
            parameters.stream().map(p -> new ImmutableMethodParameter(p, Set.of(), null)).toList(), result, 9,
            Set.of(), Set.of(), new ImmutableMethodImplementation(8, code, List.of(), List.of()));
    }
    static Instruction invoke(ImmutableMethod method) {
        return new ImmutableInstruction35c(Opcode.INVOKE_STATIC, method.getParameterTypes().size(), 0, 0, 0, 0, 0, method);
    }
    static void resourceChains() {
        var end = new ImmutableInstruction10x(Opcode.RETURN_VOID);
        var extraction = helper("x", List.of("Z"), "V", List.of(end));
        var wrapper = helper("y", List.of("Z"), "V", List.of(invoke(extraction), end));
        var direct = helper("a", List.of(), "V", List.of(invoke(extraction), end));
        var indirect = helper("b", List.of(), "V", List.of(invoke(wrapper), end));
        var methods = List.<com.android.tools.smali.dexlib2.iface.Method>of(extraction, wrapper, direct, indirect);
        require(WazeBindingsKt.reachesResourceExtraction(direct, extraction, methods), "Direct extraction lost");
        require(WazeBindingsKt.reachesResourceExtraction(indirect, extraction, methods), "Synchronous wrapper not followed");
        require(!WazeBindingsKt.reachesResourceExtraction(indirect, extraction, List.of(extraction, indirect)), "Missing helper accepted");
        var cycleRef = new ImmutableMethodReference(extraction.getDefiningClass(), "loop", List.of("Z"), "V");
        var cycle = helper("loop", List.of("Z"), "V", List.of(new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 1, 0, 0, 0, 0, 0, cycleRef), end));
        require(!WazeBindingsKt.reachesResourceExtraction(cycle, extraction, List.of(cycle, extraction)), "Cycle accepted");
        var async = helper("async", List.of(), "V", List.of(new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 0, 1, 0, 0, 0,
            new ImmutableMethodReference("Landroid/os/Handler;", "post", List.of("Ljava/lang/Runnable;"), "Z")), end));
        require(!WazeBindingsKt.reachesResourceExtraction(async, extraction, methods), "Async dispatch treated as extraction completion");
        var open = new ImmutableMethodReference("Landroid/content/res/AssetManager;", "open", List.of("Ljava/lang/String;"), "Ljava/io/InputStream;");
        var leaf = helper("leaf", List.of("Ljava/lang/String;"), "Ljava/io/InputStream;", List.of(new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 0, 1, 0, 0, 0, open)));
        var entry = helper("entry", List.of("Ljava/lang/String;"), "Ljava/io/InputStream;", List.of(invoke(leaf)));
        require(WazeBindingsKt.reachesAssetOpen(entry, List.of(entry, leaf)), "Delegated asset stream lost");
        require(!WazeBindingsKt.reachesAssetOpen(entry, List.of(entry)), "Unresolved asset stream accepted");
        var path = new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference("res/skins/default/"));
        var concat = new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 0, 1, 0, 0, 0,
            new ImmutableMethodReference("Ljava/lang/String;", "concat", List.of("Ljava/lang/String;"), "Ljava/lang/String;"));
        var modern = helper("modern", List.of("Ljava/lang/String;"), "Ljava/io/InputStream;",
            List.of(path, concat, new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 0, 1, 0, 0, 0, open)));
        var old = helper("old", List.of("Ljava/lang/String;"), "Ljava/io/InputStream;", List.of(path, invoke(leaf)));
        var encoded = helper("encoded", List.of("Ljava/lang/String;"), "Ljava/io/InputStream;", List.of(path, concat, invoke(leaf)));
        require(WazeBindingsKt.isSkinAssetLoader(modern, List.of(modern)), "Direct loader path concatenation rejected");
        require(WazeBindingsKt.isSkinAssetLoader(old, List.of(old, leaf)), "Old delegated loader rejected");
        require(!WazeBindingsKt.isSkinAssetLoader(encoded, List.of(encoded, leaf)), "Encoded directory accepted as bare skin filename");
    }
    static byte[] png(int width) {
        var bytes = new byte[33];
        System.arraycopy(new byte[]{(byte)137,80,78,71,13,10,26,10}, 0, bytes, 0, 8);
        var buffer = java.nio.ByteBuffer.wrap(bytes);
        buffer.putInt(8,13); buffer.putInt(12,0x49484452); buffer.putInt(16,width); buffer.putInt(20,32);
        return bytes;
    }
    static void iconCompatibility() {
        require(ReportIconAssetsKt.reportIconMismatch(png(32), png(32)) == null, "Matching icon rejected");
        require(ReportIconAssetsKt.reportIconMismatch(null, png(32)).contains("not present"), "Missing icon has no warning");
        require(ReportIconAssetsKt.reportIconMismatch(png(32), null).contains("replacement missing"), "Missing replacement has no fallback");
        require(ReportIconAssetsKt.reportIconMismatch(png(32), png(64)).contains("canvas mismatch"), "Wrong canvas accepted");
        require(ReportIconAssetsKt.reportIconMismatch(png(32), new byte[33]).contains("invalid replacement"), "Bad PNG accepted");
        var paths = new ArrayList<String>();
        for (var family : List.of("hazard", "camera", "accident")) for (int i=0;i<10;i++) paths.add("icon_"+family+i+".png");
        ReportIconAssetsKt.validateReportIconCoverage(paths);
        rejected(() -> ReportIconAssetsKt.validateReportIconCoverage(List.of("morphe_hazard.png")), "Aliases hid missing original schema");
        rejected(() -> ReportIconAssetsKt.validateReportIconCoverage(paths.subList(0,10)), "Broken schema accepted");
    }
    static void badgeOverloads() {
        for (var parameters : List.of(List.of("Ljava/lang/String;"),
                List.of("Landroid/content/res/Resources;", "Ljava/lang/String;"),
                List.of("Ljava/lang/String;", "Landroid/content/res/Resources;"))) {
            var code = List.<Instruction>of(
                new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference("_ui.png")),
                new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 0, 0, 0, 0, 0,
                    new ImmutableMethodReference("Ljava/lang/Integer;", "intValue", List.of(), "I")),
                new ImmutableInstruction35c(Opcode.INVOKE_STATIC, parameters.size(), 0, 1, 0, 0, 0,
                    new ImmutableMethodReference("Lfixture/Artwork;", "renamed", parameters, "Landroid/graphics/drawable/Drawable;")));
            var method = new ImmutableMethod("Lfixture/RenamedMoodOwner;", "renamedBadge",
                List.of(new ImmutableMethodParameter("Landroid/content/Context;", Set.of(), null)),
                "Landroid/graphics/drawable/Drawable;", 1, Set.of(), Set.of(),
                new ImmutableMethodImplementation(6, code, List.of(), List.of()));
            require(WazeBindingsKt.isBadgeRenderer(method), "Badge artwork overload not recognised: " + parameters);
        }
    }
    public static void main(String[] args) {
        gates(); palettes(); resourceChains(); iconCompatibility(); badgeOverloads();
        System.out.println("PASS discovery: config data flow, optional palettes, direct/delegated skin loaders, synchronous extraction, renamed badge overloads and individual icon mismatch warnings; rejects cycles, async paths, missing helpers and broken icon coverage");
    }
}

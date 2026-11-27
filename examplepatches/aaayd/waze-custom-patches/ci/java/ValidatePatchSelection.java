import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import com.reandroid.arsc.chunk.xml.*;
import java.io.*;
import java.security.MessageDigest;
import java.util.*;
import java.util.zip.ZipFile;

/** Inspect actual patched APKs, including independent selections and the full build. */
public class ValidatePatchSelection {
    static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
    static ResXmlElement named(ResXmlElement parent, String tag, String name) {
        if (parent == null) return null;
        var elements = parent.getElements(tag);
        while (elements.hasNext()) {
            var element = (ResXmlElement) elements.next();
            if (name.equals(AndroidManifestBlock.getAndroidNameValue(element))) return element;
        }
        return null;
    }
    static Method method(Map<String, ClassDef> classes, String type, String name, String parameter) {
        for (var method : classes.get(type).getMethods())
            if (method.getName().equals(name) && method.getParameterTypes().size() == 1 &&
                    parameter.contentEquals(method.getParameterTypes().get(0))) return method;
        throw new AssertionError("Missing method " + type + name);
    }
    static boolean calls(Instruction instruction, String type, String name) {
        if (!(instruction instanceof ReferenceInstruction)) return false;
        var reference = ((ReferenceInstruction) instruction).getReference();
        return reference instanceof MethodReference && ((MethodReference) reference).getDefiningClass().equals(type)
            && ((MethodReference) reference).getName().equals(name);
    }
    static List<Method> methods(Map<String, ClassDef> classes) {
        List<Method> result = new ArrayList<>();
        for (var type : classes.values()) if (!type.getType().startsWith("Llocal/wazemaps/"))
            for (var method : type.getMethods()) if (method.getImplementation() != null) result.add(method);
        return result;
    }
    static Set<String> strings(Method method) {
        Set<String> result = new HashSet<>();
        if (method.getImplementation() != null) for (var instruction : method.getImplementation().getInstructions()) {
            if (instruction instanceof ReferenceInstruction && ((ReferenceInstruction) instruction).getReference() instanceof StringReference)
                result.add(((StringReference) ((ReferenceInstruction) instruction).getReference()).getString());
        }
        return result;
    }
    static String configType(Map<String, ClassDef> classes, String field) {
        for (var value : classes.get("Lcom/waze/config/ConfigValues;").getFields()) if (value.getName().equals(field)) return value.getType();
        throw new AssertionError("Config field missing: " + field);
    }
    static Method only(List<Method> methods, String label) {
        require(methods.size() == 1, label + " candidates: " + methods.size());
        return methods.get(0);
    }
    static boolean delegatesToAbstract(Method method, Map<String, ClassDef> classes) {
        for (var instruction : method.getImplementation().getInstructions()) if (instruction instanceof ReferenceInstruction) {
            var ref = ((ReferenceInstruction) instruction).getReference();
            if (ref instanceof MethodReference && ((MethodReference) ref).getDefiningClass().equals(method.getDefiningClass()))
                for (var target : classes.get(method.getDefiningClass()).getMethods())
                    if (target.equals(ref) && target.getReturnType().equals("Landroid/view/View;") && AccessFlags.ABSTRACT.isSet(target.getAccessFlags())) return true;
        }
        return false;
    }
    static Method methodWithoutArguments(Map<String, ClassDef> classes, String type, String name) {
        List<Method> candidates = new ArrayList<>();
        for (var method : classes.get(type).getMethods()) if (method.getName().equals(name) && method.getParameterTypes().isEmpty()) candidates.add(method);
        return only(candidates, type + name);
    }
    static List<MethodReference> methodCalls(Method method) {
        List<MethodReference> refs = new ArrayList<>();
        if (method.getImplementation() != null) for (var instruction : method.getImplementation().getInstructions())
            if (instruction instanceof ReferenceInstruction && ((ReferenceInstruction) instruction).getReference() instanceof MethodReference)
                refs.add((MethodReference) ((ReferenceInstruction) instruction).getReference());
        return refs;
    }
    static boolean writesIntegerField(Method method) {
        for (var instruction : method.getImplementation().getInstructions()) if (instruction.getOpcode() == Opcode.IPUT) return true;
        return false;
    }
    static boolean inflates(Method method, Map<String, ClassDef> classes, Set<Method> seen) {
        if (!seen.add(method)) return false;
        for (var ref : methodCalls(method)) {
            if (ref.getDefiningClass().equals("Landroid/view/LayoutInflater;") && ref.getName().equals("inflate")) return true;
            if (ref.getDefiningClass().equals(method.getDefiningClass()))
                for (var target : classes.get(ref.getDefiningClass()).getMethods()) if (target.equals(ref) && inflates(target, classes, seen)) return true;
        }
        return false;
    }
    static void bindings(Map<String, ClassDef> classes, String extension, boolean context, boolean rows) {
        Set<String> actual = new HashSet<>();
        for (var type : classes.values()) if (type.getType().equals(extension) || type.getType().startsWith(extension.replace(";", "$")))
            for (var method : type.getMethods()) actual.addAll(strings(method));
        if (context) {
            Method prepare = only(methods(classes).stream().filter(m -> strings(m).contains("Resources extraction unnecessary")).toList(), "resource preparation");
            Method bridge = methodWithoutArguments(classes, extension, "application");
            List<MethodReference> prepareCalls = methodCalls(prepare);
            var firstCall = methodCalls(bridge).get(0);
            require(prepareCalls.contains(firstCall), "Application bridge does not use Waze's actual context provider");
            require(firstCall.getParameterTypes().isEmpty() || firstCall.getParameterTypes().toString().equals("[Ljava/lang/Class;]"), "Unsupported application bridge arguments");
            require(firstCall.getReturnType().startsWith("L"), "Application bridge must return an object");
            boolean returned = false;
            for (var instruction : bridge.getImplementation().getInstructions()) {
                if (instruction.getOpcode() == Opcode.RETURN_OBJECT) { returned = true; break; }
                if (instruction instanceof ReferenceInstruction && ((ReferenceInstruction) instruction).getReference() instanceof MethodReference)
                    require(((ReferenceInstruction) instruction).getReference().equals(firstCall), "Application bridge uses an unverified method before returning");
            }
            require(returned, "Application bridge has no return");
        }
        if (rows) {
            List<Method> setters = new ArrayList<>();
            for (var method : classes.get("Lcom/waze/settings/tree/views/WazeSettingsView;").getMethods()) if (method.getImplementation() != null && (method.getReturnType().equals("V") || method.getReturnType().equals("Lcom/waze/settings/tree/views/WazeSettingsView;"))) {
                List<MethodReference> calls = new ArrayList<>();
                for (var instruction : method.getImplementation().getInstructions()) if (instruction instanceof ReferenceInstruction && ((ReferenceInstruction) instruction).getReference() instanceof MethodReference)
                    calls.add((MethodReference) ((ReferenceInstruction) instruction).getReference());
                boolean text = method.getParameterTypes().toString().equals("[Ljava/lang/String;]") &&
                    ((calls.stream().filter(c -> c.getName().equals("setText") && c.getParameterTypes().toString().equals("[Ljava/lang/CharSequence;]")).count() == 1 && calls.stream().noneMatch(c -> Set.of("setVisibility", "getHint").contains(c.getName()))) || calls.stream().anyMatch(c -> c.getName().equals("getHint")));
                boolean style = method.getParameterTypes().toString().equals("[I]") && writesIntegerField(method) && inflates(method, classes, new HashSet<>());
                if (text || style) setters.add(method);
            }
            require(setters.size() == 3, "Settings setter structure changed");
            for (var setter : setters) require(actual.contains(setter.getName()), "Runtime settings method was not rebound: " + extension + setter.getName());
        }
    }
    public static void main(String[] args) throws Exception {
        File apk = new File(args[0]);
        boolean themes = Boolean.parseBoolean(args[1]), icons = Boolean.parseBoolean(args[2]), auto = Boolean.parseBoolean(args[3]), alerts = Boolean.parseBoolean(args[4]);
        int originalCode = Integer.parseInt(args[6]);
        boolean camera = Boolean.parseBoolean(args[5]);
        String prefix = "Llocal/wazemaps/themes/";
        Map<String, ClassDef> classes = new HashMap<>();
        var dex = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault());
        for (var entry : dex.getDexEntryNames()) for (var type : dex.getEntry(entry).getDexFile().getClasses())
            require(classes.put(type.getType(), type) == null, "Duplicate class " + type.getType());
        require(classes.containsKey(prefix + "ThemeSelector;") == themes, "Theme class selection");
        require(classes.containsKey(prefix + "IconPack;") == icons, "Icon class selection");
        String badgeType = "Llocal/wazemaps/badges/BadgeSelector;";
        int badgeHooks = 0;
        for (var method : methods(classes)) {
            boolean resumed = false;
            int activity = method.getImplementation().getRegisterCount() - 1;
            for (var instruction : method.getImplementation().getInstructions()) {
                if ((instruction.getOpcode() == Opcode.INVOKE_SUPER || instruction.getOpcode() == Opcode.INVOKE_SUPER_RANGE) &&
                        ((MethodReference) ((ReferenceInstruction) instruction).getReference()).getName().equals("onResume")) resumed = true;
                if (calls(instruction, badgeType, "install")) {
                    require(method.getName().equals("onResume") && method.getParameterTypes().isEmpty() && resumed,
                        "Badge controls must be installed after superclass resume");
                    require(instruction instanceof RegisterRangeInstruction && ((RegisterRangeInstruction) instruction).getStartRegister() == activity,
                        "Badge hook must receive the Activity");
                    badgeHooks++;
                }
                if (resumed && instruction.getOpcode().setsRegister() && instruction instanceof OneRegisterInstruction &&
                        ((OneRegisterInstruction) instruction).getRegisterA() == activity) resumed = false;
            }
        }
        require(badgeHooks == (classes.containsKey(badgeType) ? 1 : 0), "Badge lifecycle hook selection");
        for (String name : List.of("CompanionInstaller", "CompanionSetupActivity", "CompanionApkProvider", "AndroidAutoSettings"))
            require(classes.containsKey(prefix + name + ";") == auto, "Android Auto class selection: " + name);
        var launch = method(classes, "Lcom/waze/MainActivity;", "onCreate", "Landroid/os/Bundle;");
        int attach = 0, index = 0;
        for (var instruction : launch.getImplementation().getInstructions()) {
            if (calls(instruction, prefix + "CompanionInstaller;", "attach")) {
                require(index == 0 && instruction instanceof RegisterRangeInstruction, "Startup hook must use Activity at entry");
                var range = (RegisterRangeInstruction) instruction;
                require(range.getRegisterCount() == 1 && range.getStartRegister() == launch.getImplementation().getRegisterCount() - 2,
                    "Startup hook does not use p0");
                attach++;
            }
            index++;
        }
        require(attach == (auto ? 1 : 0), "Unexpected startup hook count");
        if (themes || icons) {
            var prepare = only(methods(classes).stream().filter(m -> strings(m).contains("Resources extraction unnecessary")).toList(), "resource preparation");
            var reset = only(methods(classes).stream().filter(m -> m.getDefiningClass().equals(prepare.getDefiningClass()) &&
                m.getParameterTypes().isEmpty() && m.getReturnType().equals("V") && strings(m).contains("version") &&
                methodCalls(m).stream().anyMatch(c -> c.getDefiningClass().equals("Ljava/io/File;") && c.getName().equals("delete"))).toList(), "resource reset");
            for (var hook : List.of(prepare, reset)) {
                var instructions = new ArrayList<Instruction>(); hook.getImplementation().getInstructions().forEach(instructions::add);
                int count = (themes ? 1 : 0) + (icons ? 1 : 0);
                for (int i=0;i<instructions.size();i++) if (instructions.get(i).getOpcode() == Opcode.RETURN_VOID) {
                    require(i >= count, "Unhooked resource completion");
                    var previous = instructions.subList(i-count,i);
                    require(previous.stream().anyMatch(ins -> calls(ins, prefix+"ThemeSelector;", "prepare")) == themes, "Theme completion hook missing");
                    require(previous.stream().anyMatch(ins -> calls(ins, prefix+"IconPack;", "prepare")) == icons, "Icon completion hook missing");
                }
            }
        }
        if (icons) {
            var loader = only(methods(classes).stream().filter(m -> methodCalls(m).stream().anyMatch(c ->
                c.getDefiningClass().equals(prefix+"IconPack;") && c.getName().equals("open"))).toList(), "icon stream hook");
            require(loader.getParameterTypes().toString().equals("[Ljava/lang/String;]"), "Wrong icon filename signature");
            var first = loader.getImplementation().getInstructions().iterator().next();
            require(first instanceof RegisterRangeInstruction && calls(first,prefix+"IconPack;","open") &&
                ((RegisterRangeInstruction)first).getStartRegister() == loader.getImplementation().getRegisterCount()-1,
                "Icon hook does not receive filename at method entry");
        }
        var render = only(methods(classes).stream().filter(m -> m.getReturnType().equals("Landroid/view/View;") &&
            m.getParameterTypes().size() == 1 && strings(m).contains("page") && delegatesToAbstract(m, classes)).toList(), "settings renderer");
        int exits = 0, themeRows = 0, iconRows = 0, autoRows = 0, alertRows = 0;
        for (var instruction : render.getImplementation().getInstructions()) {
            if (instruction.getOpcode() == Opcode.RETURN_OBJECT) exits++;
            if (calls(instruction, prefix + "ThemeSelector;", "decorate")) themeRows++;
            if (calls(instruction, prefix + "IconPack;", "decorate")) iconRows++;
            if (calls(instruction, prefix + "AndroidAutoSettings;", "decorate")) autoRows++;
            if (calls(instruction, "Llocal/wazemaps/alerts/AlertDistance;", "decorate")) alertRows++;
        }
        require(exits > 0 && themeRows == (themes ? exits : 0) && iconRows == (icons ? exits : 0) && autoRows == (auto ? exits : 0) && alertRows == (alerts ? exits : 0), "Settings hook selection mismatch");
        String alertType = "Llocal/wazemaps/alerts/AlertDistance;";
        require(classes.containsKey(alertType) == alerts, "Alert extension selection mismatch");
        for (String[] feature : new String[][] {
                {alertType, configType(classes, "CONFIG_VALUE_ANDROID_AUTO_HEADS_UP_DISTANCE"), String.valueOf(alerts)},
                {"Llocal/wazemaps/alerts/CameraSound;", configType(classes, "CONFIG_VALUE_ALERTS_PLAY_SPEED_CAMERA_SOUND_BELOW_SPEED_LIMIT"), String.valueOf(camera)}}) {
            boolean enabled = Boolean.parseBoolean(feature[2]);
            require(classes.containsKey(feature[0]) == enabled, "Config extension selection mismatch: " + feature[0]);
            int getterHooks = 0, startupHooks = 0, syncHooks = 0;
            for (var method : classes.get(feature[1]).getMethods()) if (method.getImplementation() != null) {
                for (var instruction : method.getImplementation().getInstructions())
                    if (calls(instruction, feature[0], "override")) getterHooks++;
            }
            for (var method : classes.get("Lcom/waze/NativeManager;").getMethods()) if (method.getName().equals("onlineInit")) {
                boolean ready = false, appStart = false;
                for (var instruction : method.getImplementation().getInstructions()) {
                    if (instruction.getOpcode() == Opcode.SPUT_BOOLEAN) {
                        var field = (FieldReference) ((ReferenceInstruction) instruction).getReference();
                        if (field.getDefiningClass().equals("Lcom/waze/NativeManager;") && field.getName().equals("sAppStarted")) ready = true;
                    }
                    if (calls(instruction, "Lcom/waze/NativeManager;", "AppStartNTV")) appStart = true;
                    if (calls(instruction, feature[0], "applySaved")) {
                        require(ready && !appStart, "Config hook must follow native ready and precede app start");
                        startupHooks++;
                    }
                }
            }
            for (var method : classes.get("Lcom/waze/ConfigManager;").getMethods()) if (method.getName().equals("onConfigSyncedFromServer") || method.getName().equals("onConfigSynced")) {
                for (var instruction : method.getImplementation().getInstructions())
                    if (calls(instruction, feature[0], "scheduleApply")) syncHooks++;
            }
            require(getterHooks == (enabled ? 1 : 0) && startupHooks == (enabled ? 1 : 0) && syncHooks == (enabled ? 1 : 0), "Config hook selection mismatch: " + feature[0]);
            if (enabled) {
                Set<String> literals = new HashSet<>();
                for (var type : classes.values()) if (type.getType().equals(feature[0]) || type.getType().startsWith(feature[0].replace(";", "$")))
                    for (var method : type.getMethods()) literals.addAll(strings(method));
                String nativeGetter = feature[0].equals(alertType) ? "getConfigValueLongNTV" : "getConfigValueBoolNTV";
                int bindings = 0;
                for (var method : classes.get("Lcom/waze/ConfigManager;").getMethods()) if (method.getImplementation() != null &&
                        method.getParameterTypes().toString().equals("[" + feature[1] + "]")) {
                    List<Instruction> instructions = new ArrayList<>();
                    method.getImplementation().getInstructions().forEach(instructions::add);
                    for (int i = 2; i < instructions.size(); i++) if (calls(instructions.get(i), "Lcom/waze/ConfigManager;", nativeGetter)) {
                        var id = (MethodReference) ((ReferenceInstruction) instructions.get(i - 2)).getReference();
                        require(literals.contains(id.getName()), "Config identifier reflection was not rebound: " + feature[0]);
                        bindings++;
                    }
                }
                require(bindings == 1, "Expected one native config identifier binding");
            }
        }
        if (themes) bindings(classes, prefix + "ThemeSelector;", true, true);
        if (icons) bindings(classes, prefix + "IconPack;", true, true);
        if (alerts) bindings(classes, alertType, true, true);
        if (auto) bindings(classes, prefix + "AndroidAutoSettings;", false, true);
        try (var zip = new ZipFile(apk)) {
            var asset = zip.getEntry("assets/morphe/installer/waze-aa-installer.apk");
            require((asset != null) == auto, "Installer asset selection mismatch");
            if (auto) {
                byte[] hash = MessageDigest.getInstance("SHA-256").digest(zip.getInputStream(asset).readAllBytes());
                require(HexFormat.of().formatHex(hash).equals("e5d442454418efd4ff438b3ed3f6bfa5a3aee78f52616625cb25ce0ec8855b48"), "Installer checksum mismatch");
            }
            require((zip.getEntry("assets/morphe/iconpacks/paths.txt") != null) == icons, "Icon pack asset selection mismatch");
            if (icons) {
                require(zip.getEntry("assets/morphe/compatibility/icon-pack.txt") != null, "Icon compatibility report missing");
                require(zip.getEntry("assets/morphe/iconpacks/fallback-paths.txt") != null, "Stock fallback manifest missing");
                String paths = new String(zip.getInputStream(zip.getEntry("assets/morphe/iconpacks/paths.txt")).readAllBytes(), java.nio.charset.StandardCharsets.UTF_8);
                for (String path : paths.split("\\n")) {
                    var stock = zip.getEntry("assets/res/skins/default/"+path);
                    var custom = zip.getEntry("assets/morphe/iconpacks/google_maps/"+path);
                    require(stock != null && custom != null, "Manifest includes unavailable icon: "+path);
                    var originalImage = javax.imageio.ImageIO.read(zip.getInputStream(stock));
                    var customImage = javax.imageio.ImageIO.read(zip.getInputStream(custom));
                    require(originalImage != null && customImage != null && originalImage.getWidth() == customImage.getWidth() &&
                        originalImage.getHeight() == customImage.getHeight(), "Manifest includes incompatible icon: "+path);
                }
            }
            require((zip.getEntry("assets/morphe/themes/oled/skin_values.day.lua") != null) == themes, "Theme asset selection mismatch");
            var manifest = AndroidManifestBlock.load(zip.getInputStream(zip.getEntry("AndroidManifest.xml")));
            require(manifest.getVersionCode() == Math.max(1030752, originalCode + 20), "Manifest version edits did not compose");
            require(manifest.getUsesPermissions().contains("android.permission.REQUEST_INSTALL_PACKAGES") == auto, "Install permission selection mismatch");
            for (String[] component : new String[][] {{"activity", "CompanionSetupActivity"}, {"provider", "CompanionApkProvider"}}) {
                var element = named(manifest.getApplicationElement(), component[0], "local.wazemaps.themes." + component[1]);
                require((element != null) == auto, "Manifest component selection: " + component[1]);
                if (auto) require(element.searchAttributeByResourceId(0x01010010).getData() == 0, "Companion component is exported");
            }
            var query = named(manifest.getManifestElement().getElement("queries"), "package", "local.waze.aainstaller");
            require((query != null) == auto, "Companion query selection mismatch");
        }
        System.out.println("PASS actual APK: themes=" + themes + ", icons=" + icons + ", Android Auto=" + auto + ", alerts=" + alerts + ", camera sound=" + camera + "; isolated classes, assets, permissions, components, startup and settings hooks");
    }
}

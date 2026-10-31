import java.io.File;
import java.nio.file.*;
import java.util.*;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import com.android.tools.smali.dexlib2.iface.value.*;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation;

/** Checks actual APK output and all unrelated methods, not just patch source. */
class RemoteAtvDexCheck {
    static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
    static Map<String,ClassDef> classes(String file) throws Exception {
        var result = new TreeMap<String,ClassDef>();
        var apk = DexFileFactory.loadDexContainer(new File(file), null);
        for (var name : apk.getDexEntryNames()) if (name.matches("classes\\d*\\.dex"))
            for (var cls : apk.getEntry(name).getDexFile().getClasses())
            require(result.put(cls.getType(), cls) == null, "Duplicate class");
        return result;
    }
    static Map<String,List<Object>> fields(ClassDef cls, boolean table) {
        var result = new TreeMap<String,List<Object>>();
        for (var field : cls.getFields()) result.put(field.toString(), Arrays.asList(field.getAccessFlags(),
            field.getAnnotations(), table ? null : fieldValue(field.getInitialValue())));
        return result;
    }
    static Object fieldValue(EncodedValue v) {
        // DexPool may omit trailing encoded defaults; the VM initializes them identically.
        if (v == null || v instanceof NullEncodedValue ||
            v instanceof BooleanEncodedValue x && !x.getValue() ||
            v instanceof ByteEncodedValue x && x.getValue() == 0 ||
            v instanceof ShortEncodedValue x && x.getValue() == 0 ||
            v instanceof CharEncodedValue x && x.getValue() == 0 ||
            v instanceof IntEncodedValue x && x.getValue() == 0 ||
            v instanceof LongEncodedValue x && x.getValue() == 0 ||
            v instanceof FloatEncodedValue x && Float.floatToRawIntBits(x.getValue()) == 0 ||
            v instanceof DoubleEncodedValue x && Double.doubleToRawLongBits(x.getValue()) == 0) return null;
        return v;
    }
    public static void main(String[] args) throws Exception {
        var stock = classes(args[0]); var output = classes(args[1]);
        var expected = new TreeSet<>(stock.keySet());
        expected.removeIf(n -> n.startsWith("Lcom/pairip/"));
        var helpers = output.keySet().stream().filter(n -> n.startsWith("Lapp/badfella/extension/remoteatv/")).toList();
        require(helpers.size() >= 1 && helpers.size() <= 5 && helpers.contains("Lapp/badfella/extension/remoteatv/AdFreeStatus;"), "Status extension missing");
        expected.addAll(helpers);
        require(output.keySet().equals(expected), "Unexpected class removal/addition");
        var tables = new TreeMap<String,Map<String,String>>();
        for (var line : Files.readAllLines(Path.of(args[2]))) {
            var row = line.split("\t", -1);
            tables.computeIfAbsent(row[0], k -> new TreeMap<>()).put(row[1],
                new String(Base64.getDecoder().decode(row[2]), java.nio.charset.StandardCharsets.UTF_8));
        }
        int edited = 0, unchanged = 0, values = 0, virtualized = 0;
        for (var name : output.keySet()) {
            if (helpers.contains(name)) continue;
            var before = stock.get(name); var after = output.get(name);
            require(before.getAccessFlags() == after.getAccessFlags() &&
                Objects.equals(before.getSuperclass(), after.getSuperclass()) &&
                before.getInterfaces().equals(after.getInterfaces()) &&
                before.getAnnotations().equals(after.getAnnotations()), "Class header changed: " + name);
            require(fields(before, tables.containsKey(name)).equals(fields(after, tables.containsKey(name))),
                "Field metadata changed: " + name);
            if (tables.containsKey(name)) for (var field : after.getFields()) {
                require(field.getInitialValue() instanceof StringEncodedValue, "Uninitialized string");
                require(((StringEncodedValue)field.getInitialValue()).getValue().equals(tables.get(name).get(field.getName())),
                    "Wrong restored string"); values++;
            }
            var methods = new TreeMap<String,Method>();
            for (var m : before.getMethods()) methods.put(DexInventory.id(m), m);
            int count = 0;
            for (var m : after.getMethods()) {
                count++; var old = methods.get(DexInventory.id(m));
                require(old != null && old.getAccessFlags() == m.getAccessFlags() && old.getAnnotations().equals(m.getAnnotations()),
                    "Method metadata changed");
                boolean vm = DexInventory.calls(old).stream().anyMatch(c -> c.startsWith("Lcom/pairip/VMRunner;->invoke("));
                boolean startup = m.getName().equals("<clinit>") && Set.of("Landroid/app/AppComponentFactory;",
                    "Landroidx/core/app/CoreComponentFactory;").contains(name);
                String ads = "Lcom/google/android/gms/ads/";
                boolean sdk = (name.equals(ads + "MobileAds;") && Set.of("initialize", "getInitializationStatus").contains(m.getName())) ||
                    (Set.of(ads + "interstitial/InterstitialAd;", ads + "rewarded/RewardedAd;",
                        ads + "rewardedinterstitial/RewardedInterstitialAd;", ads + "appopen/AppOpenAd;").contains(name) &&
                        m.getParameterTypes().size() == 4) ||
                    (name.equals(ads + "BaseAdView;") && m.getParameterTypes().equals(List.of(ads + "AdRequest;"))) ||
                    (name.equals(ads + "AdLoader;") && m.getName().equals("a")) ||
                    (name.equals(ads + "AdLoader$Builder;") && m.getParameterTypes().equals(List.of(ads + "AdListener;"))) ||
                    (name.equals(ads + "identifier/AdvertisingIdClient;") && m.getName().equals("getAdvertisingIdInfo"));
                boolean same = DexInventory.describe(old, Set.of()).equals(DexInventory.describe(m, Set.of()));
                boolean ui = name.equals("Lm8/c;") && m.getName().equals("onPostResume") && m.getParameterTypes().isEmpty();
                boolean bannerUi = name.equals("LE8/b;") && m.getName().equals("d") &&
                    m.getParameterTypes().equals(List.of("Ljava/util/HashMap;"));
                if (bannerUi) {
                    var instructions = new ArrayList<com.android.tools.smali.dexlib2.iface.instruction.Instruction>();
                    m.getImplementation().getInstructions().forEach(instructions::add);
                    require(instructions.get(instructions.size() - 2) instanceof ReferenceInstruction r && r.getReference().toString().equals(
                        "Lapp/badfella/extension/remoteatv/AdFreeStatus;->hideBanner(Ljava/util/HashMap;)V"), "Banner hook missing");
                    require(old.getImplementation().getTryBlocks().isEmpty() && m.getImplementation().getTryBlocks().isEmpty(), "Unexpected banner hook handlers");
                    instructions.remove(instructions.size() - 2);
                    var restored = new ImmutableMethod(m.getDefiningClass(), m.getName(), m.getParameters(), m.getReturnType(),
                        m.getAccessFlags(), m.getAnnotations(), m.getHiddenApiRestrictions(), new ImmutableMethodImplementation(
                        m.getImplementation().getRegisterCount(), instructions, List.of(), List.of()));
                    var originalConfig = DexInventory.describe(old, Set.of());
                    var restoredConfig = DexInventory.describe(restored, Set.of());
                    originalConfig.put("params", old.getParameterTypes().stream().map(Object::toString).toList());
                    restoredConfig.put("params", restored.getParameterTypes().stream().map(Object::toString).toList());
                    require(originalConfig.equals(restoredConfig), "Other config code changed");
                }
                if (ui) {
                    var instructions = new ArrayList<com.android.tools.smali.dexlib2.iface.instruction.Instruction>();
                    m.getImplementation().getInstructions().forEach(instructions::add);
                    require(instructions.get(0) instanceof ReferenceInstruction r && r.getReference().toString().equals(
                        "Lapp/badfella/extension/remoteatv/AdFreeStatus;->install(Landroid/app/Activity;)V"), "Status hook missing");
                    require(old.getImplementation().getTryBlocks().isEmpty() && m.getImplementation().getTryBlocks().isEmpty(), "Unexpected status hook exception handlers");
                    var restored = new ImmutableMethod(m.getDefiningClass(), m.getName(), m.getParameters(), m.getReturnType(),
                        m.getAccessFlags(), m.getAnnotations(), m.getHiddenApiRestrictions(), new ImmutableMethodImplementation(
                        m.getImplementation().getRegisterCount(), instructions.subList(1, instructions.size()), List.of(), List.of()));
                    require(DexInventory.describe(old, Set.of()).equals(DexInventory.describe(restored, Set.of())), "Other resume code changed");
                }
                if (vm || startup || sdk || ui || bannerUi) { require(!same, "Patch not applied: " + DexInventory.id(m)); edited++; }
                else { require(same, "Unrelated method changed: " + DexInventory.id(m)); unchanged++; }
                if (vm) virtualized++;
                if (m.getImplementation() != null) for (var instruction : m.getImplementation().getInstructions())
                    if (instruction instanceof ReferenceInstruction r && !(r.getReference() instanceof StringReference))
                        require(!r.getReference().toString().contains("Lcom/pairip/"), "Dangling PairIP reference");
            }
            require(count == methods.size(), "Method removed");
        }
        require(edited == 35 && virtualized == 20 && values == 1443 && tables.size() == 32, "Inventory drift");
        System.out.println("PASS: 35 method edits including status and banner hooks, 1443 restored strings, no dangling PairIP instructions; " + unchanged + " unrelated methods unchanged");
    }
}

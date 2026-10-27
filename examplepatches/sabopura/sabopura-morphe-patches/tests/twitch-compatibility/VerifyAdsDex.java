import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;
import java.util.*;

/** Checks the DEX wiring of the Block ads patch in a patched APK (analysed on 31.5.2; declared for 31.6.0 and 31.7.0). */
class VerifyAdsDex {
    public static void main(String[] args) throws Exception {
        String ads = "Lio/github/sabopura/morphe/extension/twitch/ads/";
        var dex = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        Map<String, ClassDef> classes = new HashMap<>();
        for (String name : dex.getDexEntryNames())
            for (ClassDef cls : dex.getEntry(name).getDexFile().getClasses()) classes.put(cls.getType(), cls);
        Map<String, Integer> hooks = new TreeMap<>();
        Map<String, Set<String>> sites = new TreeMap<>();
        for (ClassDef cls : classes.values()) {
            if (cls.getType().startsWith("Lio/github/sabopura/morphe/")) continue;
            for (Method method : cls.getMethods()) {
                if (method.getImplementation() == null) continue;
                for (Instruction instruction : method.getImplementation().getInstructions()) {
                    if (instruction instanceof ReferenceInstruction reference
                            && reference.getReference() instanceof MethodReference target
                            && target.getDefiningClass().startsWith(ads)) {
                        String key = target.getDefiningClass().substring(ads.length()) + "->" + target.getName();
                        hooks.merge(key, 1, Integer::sum);
                        sites.computeIfAbsent(key, k -> new TreeSet<>()).add(cls.getType() + "->" + method.getName());
                    }
                }
            }
        }
        for (var hook : hooks.entrySet()) System.out.println("HOOK " + hook + " " + sites.get(hook.getKey()));
        exactly(hooks, "AdBlock;->initialize", 1);
        exactly(hooks, "AdBlock;->allowClientAds", 1);
        exactly(hooks, "AdBlock;->service", 1);
        exactly(hooks, "AdBlock;->enabled", 1);
        exactly(hooks, "AdBlock;->answerReactRequest", 1);
        exactly(hooks, "AdBlock;->dropReactCue", 1);
        require(hooks.getOrDefault("AdBlock;->allowPictureByPicture", 0) >= 1, "picture-by-picture check");
        exactly(hooks, "AdBlock;->onPlayerAdEvent", 2);
        exactly(hooks, "AdFreeHttpClient;->wrap", 1);

        ClassDef adBlock = classes.get(ads + "AdBlock;");
        boolean bridged = false;
        for (Method m : adBlock.getMethods()) {
            if (!m.getName().equals("single")) continue;
            for (Instruction i : m.getImplementation().getInstructions())
                if (i instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference t
                        && t.getDefiningClass().equals("Lio/reactivex/u;")) bridged = true;
        }
        require(bridged, "Single.just bridge installed");
        for (String type : List.of("ReadCallback", "StreamConsumer")) {
            ClassDef c = classes.get("Lcom/amazonaws/ivs/net/" + type + ";");
            require(c != null && AccessFlags.PUBLIC.isSet(c.getAccessFlags()), type + " is public");
        }
        // The "patch settings" row in Twitch's own settings screen.
        String entry = "Lio/github/sabopura/morphe/extension/twitch/ui/SettingsEntry;";
        Map<String, String> entryHooks = Map.of(
                "Ltv/twitch/android/settings/main/MainSettingsFragmentV2;", "wrap",
                "Ltv/twitch/android/shared/settings/BaseSettingsFragment;", "wrapIfMain");
        for (var hook : entryHooks.entrySet()) {
            boolean found = false;
            for (Method m : classes.get(hook.getKey()).getMethods()) {
                if (!m.getName().equals("onCreateView") || m.getImplementation() == null) continue;
                for (Instruction i : m.getImplementation().getInstructions())
                    if (i instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference t
                            && t.getDefiningClass().equals(entry) && t.getName().equals(hook.getValue())) found = true;
            }
            require(found, "settings entry hook in " + hook.getKey());
        }
        // Live streams open in the native player screen (31.x; absent in 30.7.2).
        ClassDef route = classes.get("Ltv/twitch/android/feature/discovery/feed/rn/theatre/RNTheatreRouteDecisionKt;");
        if (route != null) {
            boolean forced = false;
            for (Method m : route.getMethods()) {
                if (!m.getName().equals("rnTheatreRouteDecision")) continue;
                Instruction first = m.getImplementation().getInstructions().iterator().next();
                forced = first instanceof ReferenceInstruction r && r.getReference() instanceof FieldReference f
                        && f.getName().equals("RefuseUltralightOff");
            }
            require(forced, "streams open in the native player screen");
        }
        System.out.println("OK: Block ads wiring verified");
    }

    static void exactly(Map<String, Integer> hooks, String key, int count) {
        require(hooks.getOrDefault(key, 0) == count, key + " expected " + count + " got " + hooks.getOrDefault(key, 0));
    }

    static void require(boolean ok, String message) {
        if (!ok) throw new AssertionError(message);
        System.out.println("PASS " + message);
    }
}

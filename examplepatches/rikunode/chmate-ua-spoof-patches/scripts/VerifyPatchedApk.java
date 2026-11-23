import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.nio.ByteBuffer;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * Static check of a patched ChMate 226 APK (Haiagaru 1.46.0 + ChMate UA Spoof).
 *
 * Usage: java -cp dexlib2.jar;guava.jar scripts/VerifyPatchedApk.java <both.apk> [<haiagaru-only.apk>]
 *
 * Verifies hook placement/order and, if a Haiagaru-only APK is given, that every Haiagaru hook
 * call count is identical in both (our patch removes or reorders none of them).
 */
public class VerifyPatchedApk {
    static final String UA = "Lapp/morphe/extension/chmateuaspoof/UaSpoof;";
    static final String SETTINGS = "Lapp/morphe/extension/chmateuaspoof/UaSpoofSettings;";
    static final String H_UA = "Lapp/morphe/extension/chmate/ViewingUserAgent;";
    static final String H_AUTH = "Lapp/morphe/extension/chmate/ReadingAuth;";
    static int failures = 0;

    static Map<String, ClassDef> load(String apk) throws Exception {
        Map<String, ClassDef> classes = new HashMap<>();
        try (ZipFile zip = new ZipFile(apk)) {
            for (Enumeration<? extends ZipEntry> e = zip.entries(); e.hasMoreElements(); ) {
                ZipEntry entry = e.nextElement();
                String n = entry.getName();
                if (!n.startsWith("classes") || !n.endsWith(".dex") || n.contains("/")) continue;
                byte[] bytes = zip.getInputStream(entry).readAllBytes();
                for (ClassDef c : new DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(bytes)).getClasses())
                    classes.put(c.getType(), c);
            }
        }
        return classes;
    }

    static String call(Instruction i) {
        if (!(i instanceof ReferenceInstruction)) return null;
        Object r = ((ReferenceInstruction) i).getReference();
        return r instanceof MethodReference ? r.toString() : null;
    }

    /** Opcode (+ method reference) sequence of a method, independent of offsets. Branch widths
     *  (goto/goto16/goto32) and alignment NOPs are normalized, as inserting code may change them. */
    static List<String> code(Map<String, ClassDef> classes, String type, String name) {
        List<String> out = new ArrayList<>();
        ClassDef c = classes.get(type);
        if (c == null) return out;
        for (Method m : c.getMethods())
            if (m.getName().equals(name) && m.getImplementation() != null)
                for (Instruction i : m.getImplementation().getInstructions()) {
                    if (i.getOpcode() == Opcode.NOP) continue;
                    String ref = call(i), op = i.getOpcode().name().startsWith("GOTO") ? "GOTO" : i.getOpcode().name();
                    out.add(op + (ref == null ? "" : " " + ref));
                }
        return out;
    }

    static void check(boolean ok, String what) {
        System.out.println((ok ? "PASS " : "FAIL ") + what);
        if (!ok) failures++;
    }

    /** Counts calls into the given extension class, per target method name, outside extensions. */
    static Map<String, Integer> hookCounts(Map<String, ClassDef> classes, String owner) {
        Map<String, Integer> counts = new TreeMap<>();
        for (ClassDef c : classes.values()) {
            if (c.getType().startsWith("Lapp/morphe/extension/")) continue;
            for (Method m : c.getMethods()) {
                if (m.getImplementation() == null) continue;
                for (Instruction i : m.getImplementation().getInstructions()) {
                    String ref = call(i);
                    if (ref != null && ref.startsWith(owner + "->"))
                        counts.merge(ref.substring(owner.length() + 2), 1, Integer::sum);
                }
            }
        }
        return counts;
    }

    public static void main(String[] args) throws Exception {
        Map<String, ClassDef> both = load(args[0]);

        // 1. Request constructors: Haiagaru prepareRequest, then ours, then return-void.
        ClassDef request = both.get("Lo/zzdA;");
        int ctorOk = 0, ctors = 0;
        for (Method m : request.getMethods()) {
            if (!m.getName().equals("<init>") || m.getImplementation() == null) continue;
            ctors++;
            List<Instruction> code = new ArrayList<>();
            m.getImplementation().getInstructions().forEach(code::add);
            boolean ok = true;
            int returns = 0;
            for (int i = 0; i < code.size(); i++) {
                if (code.get(i).getOpcode() != Opcode.RETURN_VOID) continue;
                returns++;
                ok &= i >= 2 && (H_UA + "->prepareRequest(Ljava/lang/Object;)V").equals(call(code.get(i - 2)))
                        && (UA + "->prepareRequest(Ljava/lang/Object;)V").equals(call(code.get(i - 1)));
            }
            if (ok && returns > 0) ctorOk++;
        }
        check(ctors == 3 && ctorOk == 3, "o.zzdA: all 3 constructors run Haiagaru prepareRequest, then UA Spoof, then return");

        // 2. java.net boundaries: Haiagaru prepare -> ours -> original connect-like call, same receiver.
        int ours = 0, ordered = 0;
        for (ClassDef c : both.values()) {
            if (c.getType().startsWith("Lapp/morphe/extension/")) continue;
            for (Method m : c.getMethods()) {
                if (m.getImplementation() == null) continue;
                List<Instruction> code = new ArrayList<>();
                m.getImplementation().getInstructions().forEach(code::add);
                for (int i = 0; i < code.size(); i++) {
                    if (!(UA + "->prepare(Ljava/net/URLConnection;)V").equals(call(code.get(i)))) continue;
                    ours++;
                    String before = i > 0 ? call(code.get(i - 1)) : null;
                    String after = i + 1 < code.size() ? call(code.get(i + 1)) : null;
                    if ((H_UA + "->prepare(Ljava/net/URLConnection;)V").equals(before) && after != null
                            && after.matches("Ljava(x)?/net/(ssl/)?(Https|Http)?URLConnection;->(connect|getInputStream|getOutputStream|getResponseCode)\\(\\).*"))
                        ordered++;
                }
            }
        }
        Map<String, Integer> haiagaruBoth = hookCounts(both, H_UA);
        int haiagaruPrepare = haiagaruBoth.getOrDefault("prepare(Ljava/net/URLConnection;)V", 0);
        check(ours > 0 && ours == ordered && ours == haiagaruPrepare,
                "java.net: " + ours + " UA Spoof prepare calls, all directly after Haiagaru prepare (" + haiagaruPrepare + ") and before the native call");

        // 3. WebView UA setters: exactly the two native call sites, Haiagaru challenge hooks intact.
        Map<String, Integer> settingsCalls = hookCounts(both, SETTINGS);
        check(settingsCalls.getOrDefault("setUserAgentString(Landroid/webkit/WebSettings;Ljava/lang/String;)V", 0) == 2,
                "WebView: 2 native setUserAgentString calls routed through UA Spoof");
        Map<String, Integer> auth = hookCounts(both, H_AUTH);
        check(auth.getOrDefault("loadChallenge(Landroid/webkit/WebView;Ljava/lang/String;)V", 0) == 1
                        && auth.getOrDefault("challengeFinished(Landroid/webkit/WebView;Ljava/lang/String;)V", 0) == 1,
                "Haiagaru ReadingAuth loadChallenge/challengeFinished hooks still present (1/1)");
        int nativeSetUa = 0;
        for (String t : List.of("Lo/isOpenJSSEPreferred;", "Lo/TTLandingPageActivity7;"))
            for (Method m : both.get(t).getMethods())
                if (m.getImplementation() != null)
                    for (Instruction i : m.getImplementation().getInstructions())
                        if ("Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V".equals(call(i))) nativeSetUa++;
        check(nativeSetUa == 0, "WebView: no direct native setUserAgentString left in the two bound classes");

        // 4. Startup: our init is the first instruction of Application.attachBaseContext.
        Method attach = null;
        for (Method m : both.get("Ljp/syoboi/a2chMate/RoidonApp;").getMethods())
            if (m.getName().equals("attachBaseContext")) attach = m;
        Instruction first = attach.getImplementation().getInstructions().iterator().next();
        check((SETTINGS + "->init(Landroid/content/Context;)V").equals(call(first)), "Startup: UaSpoofSettings.init is first in RoidonApp.attachBaseContext");

        // 5. Extension classes present.
        for (String t : List.of(UA, SETTINGS, "Lapp/morphe/extension/chmateuaspoof/UaSpoofRules;",
                "Lapp/morphe/extension/chmateuaspoof/UaSpoofActivity;", H_UA, H_AUTH))
            check(both.containsKey(t), "class present: " + t);

        // 6. Haiagaru hook counts unchanged versus Haiagaru-only build.
        if (args.length > 1) {
            Map<String, ClassDef> base = load(args[1]);
            for (String owner : List.of(H_UA, H_AUTH)) {
                Map<String, Integer> a = hookCounts(base, owner), b = hookCounts(both, owner);
                check(a.equals(b), "Haiagaru hooks identical to Haiagaru-only APK for " + owner + " " + b);
            }
            check(!base.containsKey(UA) && hookCounts(base, UA).isEmpty(), "Haiagaru-only APK has no UA Spoof code");

            // 7. Haiagaru settings entry (v0.2.0): only our calls were added to the two methods.
            String entry = "Lapp/morphe/extension/chmateuaspoof/UaSpoofHaiagaruEntry;";
            String groups = entry + "->groups(Ljava/util/List;)Ljava/util/List;";
            String category = entry + "->category(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/LinearLayout;";
            List<String> g0 = code(base, "Lapp/morphe/extension/chmate/HaiagaruSettingsActivityKt;", "settingsGroups");
            List<String> g1 = code(both, "Lapp/morphe/extension/chmate/HaiagaruSettingsActivityKt;", "settingsGroups");
            List<String> c0 = code(base, "Lapp/morphe/extension/chmate/Haiagaru;", "settingsCategory");
            List<String> c1 = code(both, "Lapp/morphe/extension/chmate/Haiagaru;", "settingsCategory");
            List<String> expectG = new ArrayList<>();
            for (String i : g0) {
                if (i.equals("RETURN_OBJECT")) { expectG.add("INVOKE_STATIC_RANGE " + groups); expectG.add("MOVE_RESULT_OBJECT"); }
                expectG.add(i);
            }
            check(!g0.isEmpty() && g1.equals(expectG), "Settings top: settingsGroups unchanged except UaSpoofHaiagaruEntry.groups before each return (" + g0.size() + " -> " + g1.size() + ")");
            List<String> expectC = new ArrayList<>(List.of("INVOKE_STATIC_RANGE " + category, "MOVE_RESULT_OBJECT", "IF_EQZ", "RETURN_OBJECT"));
            expectC.addAll(c0);
            check(!c0.isEmpty() && c1.equals(expectC), "Settings category: settingsCategory unchanged after a 4-instruction UaSpoofHaiagaruEntry.category prefix (" + c0.size() + " -> " + c1.size() + ")");
            check(both.containsKey(entry) && !base.containsKey(entry), "UaSpoofHaiagaruEntry present only in the combined APK");
        }
        System.out.println(failures == 0 ? "ALL CHECKS PASSED" : failures + " CHECK(S) FAILED");
        System.exit(failures == 0 ? 0 : 1);
    }
}

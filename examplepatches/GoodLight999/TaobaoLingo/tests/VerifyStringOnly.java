import java.io.*;
import java.util.*;
import java.util.zip.*;
import java.nio.file.*;
import java.security.*;
import com.android.apksig.ApkVerifier;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;

/**
 * Verify that the STRIP_SAFE English resource strings APK changes exactly one
 * original DEX method and retains the other 595,517 implemented methods.
 * Compile against the Morphe Desktop 1.18.1 all-in-one JAR (dexlib2/apksig).
 * Input APKs are local/private and MUST NOT be committed.
 */
public class VerifyStringOnly {
    static final String TARGET = "Lcom/alibaba/ability/localization/Localization;->q(I)Ljava/lang/String;";
    static final String SHA = "3e709717a60fdeeb59354df60fb6cf279ffb023c01e095e16bccfbad75f683dd";
    static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }
    static String sha(byte[] bytes) throws Exception {
        return HexFormat.of().formatHex(MessageDigest.getInstance("SHA-256").digest(bytes));
    }
    record MethodCode(List<String> instructions, int regs, int tries) {}
    static Map<String, MethodCode> methods(ZipFile apk) throws Exception {
        Map<String, MethodCode> found = new HashMap<>(650000);
        for (var entry : Collections.list(apk.entries())) {
            if (!entry.getName().matches("classes(\\d*)\\.dex")) continue;
            var d = DexBackedDexFile.fromInputStream(
                Opcodes.getDefault(), new BufferedInputStream(apk.getInputStream(entry)));
            for (var cl : d.getClasses()) for (var m : cl.getMethods()) {
                var body = m.getImplementation();
                if (body == null) continue;
                String name = cl.getType() + "->" + m.getName() +
                    "(" + String.join("", m.getParameterTypes()) + ")" + m.getReturnType();
                List<String> list = new ArrayList<>();
                for (Instruction i : body.getInstructions()) {
                    String text = i.getOpcode().name;
                    if (i instanceof ReferenceInstruction)
                        text += " " + ((ReferenceInstruction) i).getReference();
                    list.add(text);
                }
                check(found.put(name, new MethodCode(list, body.getRegisterCount(),
                    body.getTryBlocks().size())) == null, "Duplicate method: " + name);
            }
        }
        return found;
    }
    public static void main(String[] args) throws Exception {
        check(args.length == 2, "Usage: VerifyStringOnly original.apk candidate.apk");
        check(sha(Files.readAllBytes(Path.of(args[0]))).equals(SHA), "Unexpected source APK SHA-256");
        try (var before = new ZipFile(args[0]); var after = new ZipFile(args[1])) {
            var a = methods(before); var b = methods(after);
            check(a.size() == 595518, "Source method count not as expected");
            check(a.keySet().equals(b.keySet()), "Changed method set or duplicate signatures");
            List<String> changed = new ArrayList<>();
            for (var method : a.entrySet())
                if (!method.getValue().instructions.equals(b.get(method.getKey()).instructions))
                    changed.add(method.getKey());
            check(changed.equals(List.of(TARGET)), "Unexpected changed method(s): " + changed);
            var old = a.get(TARGET); var now = b.get(TARGET);
            check(old.regs == now.regs && old.tries == now.tries, "Register or try/catch changed");
            check(now.instructions.size() == old.instructions.size() + 19, "Wrong instruction delta");
            check(now.instructions.subList(19, now.instructions.size()).equals(old.instructions),
                "Original localized method was modified");
            check(now.instructions.get(10).contains("Locale;->ENGLISH"), "English locale not loaded");
            check(now.instructions.get(12).contains("createConfigurationContext"),
                "Isolated resources context not used");
            for (var name : List.of(
                "Lcom/alibaba/ability/localization/Localization;->h()Lcom/alibaba/ability/localization/constants/Language;",
                "Lcom/alibaba/ability/localization/LocalizationManager;->d()Ljava/util/Locale;",
                "Lcom/alibaba/ability/localization/LocalizationManager;->i(Landroid/content/Context;Lcom/alibaba/ability/localization/constants/Language;)V"
            )) check(a.get(name).instructions.equals(b.get(name).instructions), "Unwanted locale modification: " + name);
            for (var entry : Collections.list(before.entries())) {
                var name = entry.getName();
                if (name.matches("classes(\\d*)\\.dex") || name.startsWith("META-INF/") ||
                        entry.isDirectory()) continue;
                var e = after.getEntry(name);
                check(e != null && entry.getSize() == e.getSize() && entry.getCrc() == e.getCrc(),
                    "Non-DEX payload modified: " + name);
            }
        }
        var result = new ApkVerifier.Builder(new File(args[1])).build().verify();
        check(result.isVerified(), "APK signature invalid: " + result.getErrors());
        check(result.isVerifiedUsingV2Scheme() && result.isVerifiedUsingV3Scheme(), "Missing v2/v3 APK signature");
        System.out.println("PASS: exactly one of 595,518 DEX methods changed (Localization.q)");
        System.out.println("PASS: original app locale/network/edition getters and all non-DEX payloads unchanged");
        System.out.println("PASS: signed APK v2/v3 (signature is NOT original Taobao signing certificate)");
    }
}

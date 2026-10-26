import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.zip.*;
import com.android.apksig.ApkVerifier;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;

/** Standalone test using dexlib2/apksig in Morphe Desktop 1.18.1. */
public final class VerifyJapanPicker {
    private static final String TARGET =
        "Lcom/taobao/android/editionswitcher/api/EditionApi$1;->onSuccess(" +
        "ILmtopsdk/mtop/domain/MtopResponse;Lmtopsdk/mtop/domain/BaseOutDo;Ljava/lang/Object;)V";
    static void check(boolean ok, String message) {
        if (!ok) throw new AssertionError(message);
    }
    record Code(long crc, int registers, int tryBlocks) {}

    static Map<String, Code> readMethods(ZipFile zip) throws Exception {
        Map<String, Code> methods = new HashMap<>(650000);
        for (ZipEntry entry : Collections.list(zip.entries())) {
            if (!entry.getName().matches("classes(\\d*)\\.dex")) continue;
            var dex = DexBackedDexFile.fromInputStream(
                Opcodes.getDefault(), new BufferedInputStream(zip.getInputStream(entry)));
            for (ClassDef cls : dex.getClasses()) for (Method method : cls.getMethods()) {
                var implementation = method.getImplementation();
                if (implementation == null) continue;
                String name = cls.getType() + "->" + method.getName() + "(" +
                    String.join("", method.getParameterTypes()) + ")" + method.getReturnType();
                CRC32 checksum = new CRC32();
                for (Instruction instruction : implementation.getInstructions()) {
                    String signature = instruction.getOpcode().name;
                    if (instruction instanceof ReferenceInstruction value)
                        signature += " " + value.getReference();
                    if (instruction instanceof OneRegisterInstruction value)
                        signature += " A=" + value.getRegisterA();
                    if (instruction instanceof TwoRegisterInstruction value)
                        signature += " B=" + value.getRegisterB();
                    if (instruction instanceof ThreeRegisterInstruction value)
                        signature += " C=" + value.getRegisterC();
                    byte[] bytes = signature.getBytes(StandardCharsets.UTF_8);
                    checksum.update(bytes, 0, bytes.length);
                    checksum.update(0);
                }
                check(methods.put(name, new Code(checksum.getValue(),
                    implementation.getRegisterCount(), implementation.getTryBlocks().size())) == null,
                    "Duplicate method: " + name);
            }
        }
        return methods;
    }

    public static void main(String[] args) throws Exception {
        check(args.length == 2, "Usage: VerifyJapanPicker original.apk candidate.apk");
        try (ZipFile original = new ZipFile(args[0]); ZipFile modified = new ZipFile(args[1])) {
            var before = readMethods(original);
            var after = readMethods(modified);
            check(before.size() == 595518, "Wrong original method count: " + before.size());
            check(before.keySet().equals(after.keySet()), "Method set differs");
            List<String> changed = new ArrayList<>();
            for (var item : before.entrySet()) {
                if (item.getValue().crc() != after.get(item.getKey()).crc())
                    changed.add(item.getKey());
            }
            check(changed.equals(List.of(TARGET)), "Unexpected changed methods: " + changed);
            check(before.get(TARGET).registers() == after.get(TARGET).registers(),
                "Register count changed");
            check(before.get(TARGET).tryBlocks() == after.get(TARGET).tryBlocks(),
                "Exception handler count changed");

            for (ZipEntry entry : Collections.list(original.entries())) {
                String name = entry.getName();
                if (name.matches("classes(\\d*)\\.dex") ||
                    name.startsWith("META-INF/") || entry.isDirectory() ||
                    name.equals("assets/boarding/data.json")) continue;
                ZipEntry candidate = modified.getEntry(name);
                check(candidate != null &&
                    entry.getCrc() == candidate.getCrc() &&
                    entry.getSize() == candidate.getSize(),
                    "Unexpected non-DEX change: " + name);
            }
        }
        var result = new ApkVerifier.Builder(new File(args[1])).build().verify();
        check(result.isVerified() && result.isVerifiedUsingV2Scheme()
                && result.isVerifiedUsingV3Scheme(),
              "Rebuilt APK signature invalid: " + result.getErrors());
        System.out.println("PASS: 595,518 method definitions retained; only EditionApi$1.onSuccess changed");
        System.out.println("PASS: all unrelated APK payload CRCs match");
        System.out.println("PASS: v2/v3 signature valid; it is NOT the original Taobao certificate");
    }
}

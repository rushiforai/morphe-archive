package santodan.patches;

import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import java.io.*;
import java.util.*;
import java.util.zip.ZipFile;
import software.santodan.nuvio.NuvioNative;

/** Audits the actual delivered APK, including reflection strings ordinary invoke checks cannot resolve. */
public final class VerifyNuvioMetadataApk {
    public static void main(String[] args) throws Exception {
        Map<String, ClassDef> classes = new HashMap<>();
        Set<String> definitions = new HashSet<>(), strings = new HashSet<>();
        Map<String,Integer> hooks = new TreeMap<>();
        try (ZipFile zip = new ZipFile(args[0])) {
            for (var entry : Collections.list(zip.entries())) if (entry.getName().matches("classes\\d*\\.dex"))
                try (var input = new BufferedInputStream(zip.getInputStream(entry))) {
                    for (var c : DexBackedDexFile.fromInputStream(null,input).getClasses()) {
                        if (classes.put(c.getType(),c) != null) throw new AssertionError("Duplicate APK class");
                        for (var f : c.getFields()) definitions.add(f.toString());
                        for (var m : c.getMethods()) {
                            definitions.add(m.toString());
                            if (m.getImplementation() == null) continue;
                            for (var ins : m.getImplementation().getInstructions()) {
                                if (!(ins instanceof ReferenceInstruction)) continue;
                                var ref = ((ReferenceInstruction)ins).getReference();
                                if (c.getType().startsWith("Lsoftware/santodan/extension/nuviometadata/") && ref instanceof StringReference)
                                    strings.add(((StringReference)ref).getString());
                                String value = ref.toString();
                                if (!c.getType().startsWith("Lsoftware/") && value.startsWith(NuvioMetadataAddonPatch.EXT + "->"))
                                    hooks.merge(value,1,Integer::sum);
                            }
                        }
                    }
                }
        }
        for (String ref : List.of(NuvioNative.REF_METADATA_INIT,NuvioNative.REF_METADATA_ALL,NuvioNative.REF_METADATA_PRIMARY,
                NuvioNative.REF_METADATA_CARD,NuvioNative.REF_METADATA_HERO,NuvioNative.REF_METADATA_LIBRARY_EFFECT))
            if (!definitions.contains(ref) || !strings.contains(ref)) throw new AssertionError("Missing delivered reflection binding " + ref);
        if (hooks.values().stream().mapToInt(Integer::intValue).sum() != 18) throw new AssertionError("Incomplete metadata hooks " + hooks);
        for (String ref : hooks.keySet()) if (!definitions.contains(ref)) throw new AssertionError("Unresolved delivered hook " + ref);
        if (!definitions.contains(NuvioMetadataAddonPatch.SETTINGS + "->registerComponent(Ljava/lang/Object;)V")) throw new AssertionError("Missing settings registration");
        System.out.println("PASS: delivered APK contains all eighteen metadata hooks and shared full reflection bindings resolve against its actual native classes");
    }
}

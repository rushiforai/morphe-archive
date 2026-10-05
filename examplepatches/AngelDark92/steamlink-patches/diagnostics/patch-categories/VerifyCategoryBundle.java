import java.io.*;
import java.util.*;
import java.util.zip.*;
import app.morphe.patcher.patch.PatchKt;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;

class VerifyCategoryBundle {
    public static void main(String[] args) throws Exception {
        var bundle = new File(args[0]);
        var patches = PatchKt.loadPatchesFromJar(Set.of(bundle));
        var counts = new TreeMap<String,Integer>();
        int defaults = 0;
        for (var patch : patches) {
            if (patch.getName() == null || patch.getCategory() == null) throw new AssertionError("Ungrouped patch");
            counts.merge(patch.getCategory(), 1, Integer::sum);
            if (patch.getDefault()) defaults++;
        }
        var expected = Map.of("Recommended sets",5,"Image quality",2,"Tracking & audio",6,
            "Startup & permissions",4,"App & device identity",2,"Advanced XR compatibility",7,"Experiments",3);
        if (!counts.equals(expected) || defaults != 5) throw new AssertionError(counts.toString());
        try (var zip = new ZipFile(bundle)) {
            var helpers = Map.of(
                "extension.mpe",Set.of("Lorg/libsdl/app/GxrSdlBridge;"),
                "minimal-extension.mpe",Set.of("Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;",
                    "Lcom/valvesoftware/steamlink/GxrOverlayBridge;","Lcom/valvesoftware/steamlink/GxrResolutionProbe;"),
                "battery-extension.mpe",Set.of("Lcom/valvesoftware/steamlink/GxrBatterySettings;"));
            for (var entry : helpers.entrySet()) {
                try (var input = new BufferedInputStream(zip.getInputStream(zip.getEntry("extensions/"+entry.getKey())))) {
                    var dex = DexBackedDexFile.fromInputStream(Opcodes.forApi(33),input);
                    var types = new HashSet<String>();
                    for (var cls : dex.getClasses()) types.add(cls.getType());
                    if (!types.equals(entry.getValue())) throw new AssertionError(types.toString());
                    System.out.println(entry.getKey()+": decoded expected helper classes "+types.size());
                }
            }
        }
        System.out.println("Final archive: "+patches.size()+" patches; 5 default bundles; categories "+counts);
    }
}

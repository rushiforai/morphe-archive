import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import java.nio.file.*;
import tw.maps.MethodFingerprint;

public class InspectMethods {
    public static void main(String[] args) throws Exception {
        for (String name : new String[]{"classes", "classes2", "classes3", "classes4"}) {
            var dex = new DexBackedDexFile(null, Files.readAllBytes(Path.of("analysis/dex/" + name + ".dex")));
            for (var c : dex.getClasses()) {
                if (!java.util.Set.of("Lbtxk;", "Lqxa;", "Ltql;", "Lplq;", "Lckbl;", "Lqvv;").contains(c.getType())) continue;
                for (var m : c.getMethods()) {
                    if (!(c.getType().equals("Lbtxk;") && m.getName().equals("h")) && !(c.getType().equals("Lqxa;") && m.getName().equals("b"))
                        && !(c.getType().equals("Ltql;") && java.util.Set.of("d", "t").contains(m.getName()))
                        && !(java.util.Set.of("Lplq;", "Lckbl;", "Lqvv;").contains(c.getType()) && m.getName().equals("<clinit>"))) continue;
                    System.out.println(m + " " + MethodFingerprint.sha256(m));
                    Path out = Path.of("analysis/fingerprints");
                    Files.createDirectories(out);
                    Files.writeString(out.resolve(c.getType().substring(1,c.getType().length()-1) + "_" + m.getName().replace('<','_').replace('>','_') + ".txt"), MethodFingerprint.canonical(m));
                }
            }
        }
    }
}

import app.morphe.patcher.PackageMetadata;
import app.template.patches.coffeebusiness.CoffeeProfiles;
import java.util.*;
import java.util.zip.GZIPInputStream;

/** Checks target selection, mode-specific resources and the shared Firebase DEX. */
public class VerifyCoffeeProfiles {
    static void check(boolean ok, String message) { if (!ok) throw new AssertionError(message); }
    public static void main(String[] args) throws Exception {
        var profiles = CoffeeProfiles.INSTANCE;
        byte[] firebase;
        try (var in = CoffeeProfiles.class.getResourceAsStream("/" + profiles.getFirebaseResource())) {
            check(in != null, "Missing shared Firebase extension");
            firebase = in.readAllBytes();
        }
        var seen = new HashSet<String>();
        for (var profile : profiles.getProfiles()) {
            var metadata = new PackageMetadata("com.tapblaze.coffeebusiness", profile.getVersion(), profile.getVersionCode(), null);
            check(profiles.forPackage(metadata) == profile, "Wrong initialization selected");
            check(seen.add(profile.getVersion()+"/"+profile.getVersionCode()), "Duplicate target");
            if (profile.getProtectedInitialization()) for (String name : List.of("libunity.so.delta.gz", "libil2cpp.so.delta.gz")) {
                try (var in = new GZIPInputStream(profile.resource(name))) {
                    byte[] header = in.readNBytes(68);
                    check(header.length == 68 && Arrays.equals(Arrays.copyOf(header,4), new byte[]{'P','Z','B','2'}), "Invalid native identity");
                    check(!Arrays.equals(Arrays.copyOfRange(header,4,36), Arrays.copyOfRange(header,36,68)), "Empty native reconstruction");
                }
            }
            if (profile.getProtectedInitialization()) for (String name : List.of("strings.tsv.gz", "sdk-receivers.dex", "startup-methods.dex"))
                try (var in = profile.resource(name)) { check(in.read() != -1, "Empty protected resource"); }
            for (String name : List.of("firebase-app.dex", "asset-packs.tsv.gz"))
                try (var in = profile.resource(name)) { check(in.read() != -1, "Empty resource"); }
            try (var in = profile.resource("firebase-app.dex")) {
                check(Arrays.equals(firebase, in.readAllBytes()), "Profile Firebase differs from the loaded extension");
            }
            System.out.println("PASS "+profile.getVersion()+" / "+profile.getVersionCode());
        }
        for (var metadata : List.of(
                new PackageMetadata("com.tapblaze.coffeebusiness", "1.25.1", "1397", null),
                new PackageMetadata("com.tapblaze.coffeebusiness", "1.26.0", "1454", null),
                new PackageMetadata("com.tapblaze.coffeebusiness", "99.0.0", "9999", null),
                new PackageMetadata("other.package", "1.25.1", "1454", null))) {
            try { profiles.forPackage(metadata); throw new AssertionError("Mismatched manifest accepted"); }
            catch (Exception expected) { check(expected instanceof app.morphe.patcher.patch.PatchException && expected.getMessage().contains(metadata.getVersionName()), "Missing diagnosis"); }
        }
        System.out.println("PASS mismatched package/version/code rejected");
    }
}

import app.morphe.patcher.PackageMetadata;
import app.template.patches.pizzabusiness.PizzaProfiles;
import java.util.*;
import java.util.zip.GZIPInputStream;

/** Verify packaged profile selection and initialization identities without an APK. */
public class VerifyPizzaProfiles {
    static void check(boolean ok, String message) { if (!ok) throw new AssertionError(message); }
    public static void main(String[] args) throws Exception {
        var profiles = PizzaProfiles.INSTANCE;
        var targets = new HashSet<String>();
        for (var profile : profiles.getProfiles()) {
            var metadata = new PackageMetadata("com.tapblaze.pizzabusiness", profile.getVersion(), profile.getVersionCode(), null);
            check(profiles.forPackage(metadata) == profile, "Manifest selected the wrong initialization profile");
            check(targets.add(profile.getVersion()+"/"+profile.getVersionCode()), "Duplicate manifest target");
            byte[] previousOutput = null;
            var nativeResources = profile.getProtectedInitialization()
                ? List.of("arm64-init.delta.gz", "funds-store.delta.gz") : List.of("funds-store.delta.gz");
            for (String name : nativeResources) {
                try (var in = new GZIPInputStream(profile.resource(name))) {
                    byte[] header = in.readNBytes(68);
                    check(header.length == 68 && Arrays.equals(Arrays.copyOf(header,4), new byte[]{'P','Z','B','2'}), "Invalid packaged native delta");
                    if (previousOutput != null) check(Arrays.equals(previousOutput, Arrays.copyOfRange(header,4,36)), "Visibility repair does not consume the reconstructed library");
                    else if (!profile.getProtectedInitialization()) check(HexFormat.of().formatHex(Arrays.copyOfRange(header,4,36)).equals(profile.getNativeSha256()), "Visibility repair does not consume the verified original library");
                    previousOutput = Arrays.copyOfRange(header,36,68);
                }
            }
            if (profile.getProtectedInitialization())
                for (String name : List.of("strings.tsv.gz", "sdk-receivers.dex")) try (var in = profile.resource(name)) { check(in.read() != -1, "Empty initialization resource"); }
            else check(profile.getStartupProgram() == null, "Unprotected input must retain its original startup");
            var variantInputs = new HashSet<String>();
            for (String name : profile.getUpdateNoticeDeltas()) try (var in = new GZIPInputStream(profile.resource(name))) {
                byte[] header = in.readNBytes(68);
                check(header.length == 68 && Arrays.equals(Arrays.copyOf(header,4), new byte[]{'P','Z','B','2'}), "Invalid notice variant");
                check(variantInputs.add(HexFormat.of().formatHex(Arrays.copyOfRange(header,4,36))), "Ambiguous notice native input");
            }
            System.out.println("PASS: "+profile.getVersion()+" ("+profile.getVersionCode()+") selects its matching bootstrap/visibility/SDK resources");
        }
        for (var metadata : List.of(
                new PackageMetadata("com.tapblaze.pizzabusiness", "5.58.0", "2277", null),
                new PackageMetadata("com.tapblaze.pizzabusiness", "5.59.2", "2322", null),
                new PackageMetadata("com.tapblaze.pizzabusiness", "99.0.0", "9900", null),
                new PackageMetadata("other.package", "5.58.0", "2301", null))) {
            try { profiles.forPackage(metadata); throw new AssertionError("Unknown or mismatched manifest accepted"); }
            catch (Exception expected) { check(expected instanceof app.morphe.patcher.patch.PatchException && expected.getMessage().contains(metadata.getVersionName()), "Missing target diagnosis"); }
        }
        System.out.println("PASS: unknown package/version/code produces a specific diagnosis instead of selecting another build");
    }
}

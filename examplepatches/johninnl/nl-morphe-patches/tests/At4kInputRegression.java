import java.io.File;
import java.lang.reflect.*;
import java.nio.file.Files;
import java.security.cert.X509Certificate;
import java.util.*;
import app.morphe.patcher.*;
import app.morphe.patcher.patch.*;
import com.reandroid.apk.ApkModule;

/** Run the shipped original-input guard with the real original and re-signed output. */
class At4kInputRegression extends OriginalInputRegression {
    static void refused(Throwing action) throws Exception {
        boolean rejected = false;
        try { action.run(); } catch (IllegalStateException expected) { rejected = true; }
        check(rejected, "unsupported input rejected");
    }
    static PackageMetadata read(File file) throws Exception {
        try (ApkModule apk = ApkModule.loadApkFile(file)) {
            var manifest = apk.getAndroidManifest();
            return new PackageMetadata(manifest.getPackageName(), manifest.getVersionName(),
                String.valueOf(manifest.getVersionCode()), apk.getApkSignatureBlock());
        }
    }

    public static void main(String[] args) throws Exception {
        File originalFile = new File(args[1]);
        PackageMetadata original = read(originalFile), resigned = read(new File(args[2]));
        Set<Patch<?>> patches = new PatchLoader.Jar(Set.of(new File(args[0])));
        var named = patches.stream().filter(p -> p.getName() != null && p.getCompatibility() != null &&
            p.getCompatibility().stream().anyMatch(c -> c.getPackageName().equals("com.overdevs.at4k"))).toList();
        check(named.size() == 1 && named.getFirst().getName().equals("Unlock Premium"), "one AT4K premium control; no obsolete DRM control");
        Patch<?> premium = named.getFirst();
        ResourcePatch guard = (ResourcePatch) premium.getDependencies().stream().filter(p -> p instanceof ResourcePatch).findFirst().orElseThrow();
        List<X509Certificate> trusted = original.getSigningCertificates().values().stream().flatMap(Collection::stream).distinct().toList();
        List<X509Certificate> untrusted = resigned.getSigningCertificates().values().stream().flatMap(Collection::stream).distinct().toList();
        check(!trusted.isEmpty() && !untrusted.isEmpty() && Collections.disjoint(trusted, untrusted), "real distinct input and output signers");
        var mixed = new ArrayList<>(trusted); mixed.addAll(untrusted);
        String pkg = "com.overdevs.at4k", version = "1.2", build = "19";
        PackageMetadata[] invalid = {
            metadata(original, "wrong.package", version, build, trusted),
            metadata(original, pkg, "0.99", "12", trusted),
            metadata(original, pkg, version, "18", trusted),
            new PackageMetadata(pkg, version, build, null),
            metadata(original, pkg, version, build, untrusted),
            metadata(original, pkg, version, build, mixed),
        };
        try (ResourcePatchContext context = new ResourcePatchContext(config(originalFile, new File(args[3]), "at4k-guard"))) {
            var manifest = context.get("AndroidManifest.xml", false).toPath();
            Files.createDirectories(manifest.getParent());
            String xml = "<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\"><uses-sdk android:minSdkVersion=\"27\"/></manifest>";
            Files.writeString(manifest, xml);
            guard.execute(context);
            check(Files.readString(manifest).equals(xml), "original accepted without mutation");
            Field field = ResourcePatchContext.class.getDeclaredField("packageMetadata"); field.setAccessible(true);
            for (PackageMetadata bad : invalid) {
                field.set(context, bad);
                refused(() -> guard.execute(context));
                check(Files.readString(manifest).equals(xml), "rejected input unchanged");
            }
            field.set(context, original);
            for (String sdk : List.of("<uses-sdk android:minSdkVersion=\"26\"/>", "")) {
                Files.writeString(manifest, "<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\">" + sdk + "</manifest>");
                refused(() -> guard.execute(context));
            }
        }
        System.out.println("PASS: AT4K production input guard assertions=" + checks);
    }
}

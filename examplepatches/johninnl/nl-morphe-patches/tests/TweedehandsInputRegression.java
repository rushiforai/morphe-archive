import java.io.File;
import java.lang.reflect.*;
import java.nio.file.Files;
import java.security.cert.X509Certificate;
import java.util.*;
import java.util.stream.Collectors;
import app.morphe.patcher.*;
import app.morphe.patcher.patch.*;
import com.reandroid.apk.ApkModule;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import app.morphe.patcher.util.PatchClasses;
import app.morphe.patcher.resource.ResourceMode;

/** Exercise the actual resource preflight using genuine publisher certificates. */
class TweedehandsInputRegression extends OriginalInputRegression {
    static PackageMetadata read(File file) throws Exception {
        try (ApkModule apk = ApkModule.loadApkFile(file)) {
            var m = apk.getAndroidManifest();
            return new PackageMetadata(m.getPackageName(), m.getVersionName(),
                String.valueOf(m.getVersionCode()), apk.getApkSignatureBlock());
        }
    }
    public static void main(String[] args) throws Exception {
        File originalFile = new File(args[1]), scratch = new File(args[3]);
        PackageMetadata original = read(originalFile), other = read(new File(args[2]));
        var patches = new PatchLoader.Jar(Set.of(new File(args[0])));
        Field execution = Patch.class.getDeclaredField("executeBlock");
        execution.setAccessible(true);
        ClassLoader loader = execution.get(patches.stream().filter(p -> p.getName() != null)
            .findFirst().orElseThrow()).getClass().getClassLoader();
        Class<?> app = null;
        try { app = loader.loadClass("patches.tweedehands.CompatibilityKt"); }
        catch (ClassNotFoundException absent) { }
        check(app != null, "Belgian production input guard exists");
        ResourcePatch guard = (ResourcePatch) app.getDeclaredMethod("getOriginalInput").invoke(null);
        var controls = patches.stream().filter(p -> p.getName() != null && p.getCompatibility() != null &&
            p.getCompatibility().stream().anyMatch(c -> c.getPackageName().equals("be.tweedehands.m"))).toList();
        check(controls.size() == 4, "four Belgian privacy controls loaded");
        for (Patch<?> control : controls) {
            check(control.getDefault(), "Belgian control defaults on: " + control.getName());
            check(closure(control).contains(guard), "Belgian preflight required by " + control.getName());
        }
        List<X509Certificate> trusted = original.getSigningCertificates().values().stream()
            .flatMap(Collection::stream).distinct().toList();
        List<X509Certificate> untrusted = other.getSigningCertificates().values().stream()
            .flatMap(Collection::stream).distinct().toList();
        check(!trusted.isEmpty() && !untrusted.isEmpty() && Collections.disjoint(trusted, untrusted),
            "genuine disjoint publisher certificates");
        List<X509Certificate> mixed = new ArrayList<>(trusted);
        mixed.addAll(untrusted);
        String pkg = "be.tweedehands.m", version = "16.19.0", code = "633464";
        File complete = new File(args[4]);
        try (ResourcePatchContext context = new ResourcePatchContext(config(complete, scratch, "guard"))) {
            context.decodeResources$morphe_patcher(ResourceMode.FULL);
            var manifest = context.get("AndroidManifest.xml", false).toPath();
            Files.createDirectories(manifest.getParent());
            String feature = "<application><meta-data android:name=\"com.android.dynamic.apk.fused.modules\" android:value=\"alertscentercompose\"/></application>";
            String xml = "<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\"><uses-sdk android:minSdkVersion=\"32\" android:targetSdkVersion=\"37\"/>" + feature + "</manifest>";
            Files.writeString(manifest, xml);
            guard.execute(context);
            check(Files.readString(manifest).equals(xml), "Belgian original accepted without mutation");
            Field field = ResourcePatchContext.class.getDeclaredField("packageMetadata");
            field.setAccessible(true);
            PackageMetadata[] invalid = {
                metadata(original, "nl.marktplaats.android", version, code, trusted),
                metadata(original, pkg, "0.0.0", code, trusted),
                metadata(original, pkg, version, "1", trusted),
                new PackageMetadata(pkg, version, code, null),
                metadata(original, pkg, version, code, untrusted),
                metadata(original, pkg, version, code, mixed), other
            };
            for (int i = 0; i < invalid.length; i++) {
                field.set(context, invalid[i]);
                boolean refused = false;
                try { guard.execute(context); } catch (IllegalStateException expected) { refused = true; }
                check(refused, "reject invalid Belgian metadata " + i);
                check(Files.readString(manifest).equals(xml), "rejected metadata leaves original unchanged");
            }
            field.set(context, original);
            for (String bad : List.of(xml.replace(feature, ""), xml.replace("alertscentercompose", "other"),
                    xml.replace("minSdkVersion=\"32\"", "minSdkVersion=\"26\""),
                    xml.replace("targetSdkVersion=\"37\"", "targetSdkVersion=\"36\""))) {
                Files.writeString(manifest, bad);
                boolean refused = false;
                try { guard.execute(context); } catch (IllegalStateException expected) { refused = true; }
                check(refused, "reject incomplete feature or unaudited SDK");
                check(Files.readString(manifest).equals(bad), "rejected manifest unchanged");
            }
        }
        // Simulate a split merger that retains trusted base metadata while an
        // ABI/density payload is omitted or changed. The actual resource guard
        // must reject the payload before touching the manifest.
        for (String fixture : List.of("missing-arm64.apk", "missing-armv7.apk",
                                      "missing-density.apk", "changed-native.apk")) {
            File bad = new File(args[6], fixture);
            try (ResourcePatchContext context = new ResourcePatchContext(config(bad, scratch, fixture))) {
                context.decodeResources$morphe_patcher(ResourceMode.FULL);
                Field field = ResourcePatchContext.class.getDeclaredField("packageMetadata");
                field.setAccessible(true);
                field.set(context, original);
                var manifest = context.get("AndroidManifest.xml", false).toPath();
                Files.createDirectories(manifest.getParent());
                String xml = "<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\"><uses-sdk android:minSdkVersion=\"32\" android:targetSdkVersion=\"37\"/><application><meta-data android:name=\"com.android.dynamic.apk.fused.modules\" android:value=\"alertscentercompose\"/></application></manifest>";
                Files.writeString(manifest, xml);
                boolean refused = false;
                try { guard.execute(context); } catch (IllegalStateException expected) { refused = true; }
                check(refused, "production rejects incomplete or changed payload: " + fixture);
                check(Files.readString(manifest).equals(xml), "payload rejection leaves manifest unchanged");
            }
        }
        Method getter = null;
        try { getter = app.getDeclaredMethod("getOriginalFeature"); }
        catch (NoSuchMethodException absent) { }
        check(getter != null, "production Notifications declaration guard exists");
        BytecodePatch featureGuard = (BytecodePatch) getter.invoke(null);
        var container = DexFileFactory.loadDexContainer(new File(args[5]), Opcodes.getDefault());
        Set<ClassDef> feature = new LinkedHashSet<>();
        for (String name : container.getDexEntryNames())
            feature.addAll(container.getEntry(name).getDexFile().getClasses());
        String activity = "Lcom/horizon/android/feature/alertscompose/MyAlertsActivityCompose;";
        try (BytecodePatchContext context = new BytecodePatchContext(config(complete, scratch, "feature"), original)) {
            context.setPatchClasses$morphe_patcher(new PatchClasses(feature));
            featureGuard.execute(context);
            check(true, "complete genuine Notifications feature accepted");
            var missing = feature.stream().filter(c -> !c.getType().equals(activity)).collect(Collectors.toSet());
            check(missing.size() + 1 == feature.size(), "genuine feature activity located");
            context.setPatchClasses$morphe_patcher(new PatchClasses(missing));
            boolean refused = false;
            try { featureGuard.execute(context); } catch (IllegalStateException expected) { refused = true; }
            check(refused, "fused metadata cannot replace actual Notifications code");
        }
        for (Patch<?> control : controls)
            check(closure(control).contains(featureGuard), "declaration preflight required by " + control.getName());
    }
}

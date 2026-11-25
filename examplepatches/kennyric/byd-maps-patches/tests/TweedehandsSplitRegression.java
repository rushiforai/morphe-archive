import java.io.File;
import java.lang.reflect.*;
import java.nio.file.*;
import java.util.*;
import java.util.zip.*;
import app.morphe.patcher.apk.ApkMerger;
import app.morphe.patcher.patch.*;
import app.morphe.patcher.resource.ResourceMode;

/** Genuine split admission and corruption checks against the built production guard. */
class TweedehandsSplitRegression extends OriginalInputRegression {
    static ResourcePatch guard;
    static File scratch;

    static void accept(File input, String name) throws Exception {
        try (var context = new ResourcePatchContext(config(input, scratch, name))) {
            context.decodeResources$morphe_patcher(ResourceMode.FULL);
            guard.execute(context);
        }
        check(true, "accept " + name);
    }

    static void rejectPayload(File input, String name, java.util.function.Predicate<String> omit,
                              boolean corrupt) throws Exception {
        File changed = new File(scratch, name + ".apk");
        try (var source = new ZipFile(input); var output = new ZipOutputStream(Files.newOutputStream(changed.toPath()))) {
            for (var entry : Collections.list(source.entries())) {
                if (omit.test(entry.getName())) continue;
                byte[] bytes = source.getInputStream(entry).readAllBytes();
                if (corrupt && entry.getName().endsWith("libsigner.so")) bytes[0] ^= 1;
                output.putNextEntry(new ZipEntry(entry.getName()));
                output.write(bytes);
                output.closeEntry();
            }
        }
        try (var context = new ResourcePatchContext(config(changed, scratch, name))) {
            context.decodeResources$morphe_patcher(ResourceMode.FULL);
            // ZIP mutation drops signing blocks; retain independently read publisher
            // metadata so this checks payload validation rather than signature rejection.
            var metadata = ResourcePatchContext.class.getDeclaredField("packageMetadata");
            metadata.setAccessible(true);
            try (var original = new ResourcePatchContext(config(input, scratch, name + "-metadata"))) {
                metadata.set(context, original.decodeResources$morphe_patcher(ResourceMode.FULL));
            }
            var manifest = context.get("AndroidManifest.xml", false).toPath();
            byte[] before = Files.readAllBytes(manifest);
            boolean refused = false;
            try { guard.execute(context); } catch (IllegalStateException expected) { refused = true; }
            check(refused, "reject " + name);
            check(Arrays.equals(before, Files.readAllBytes(manifest)), "rejection preserves manifest: " + name);
        }
    }

    public static void main(String[] args) throws Exception {
        scratch = new File(args[2]);
        scratch.mkdirs();
        var patches = new PatchLoader.Jar(Set.of(new File(args[0])));
        var control = patches.stream().filter(p -> "Disable ThreatMetrix".equals(p.getName()) &&
            p.getCompatibility().stream().anyMatch(c -> c.getPackageName().equals("be.tweedehands.m")))
            .findFirst().orElseThrow();
        var execute = Patch.class.getDeclaredField("executeBlock");
        execute.setAccessible(true);
        var loader = execute.get(control).getClass().getClassLoader();
        guard = (ResourcePatch) loader.loadClass("patches.tweedehands.CompatibilityKt")
            .getDeclaredMethod("getOriginalInput").invoke(null);
        File merged = new File(scratch, "merged.apk");
        new ApkMerger().merge(new File(args[1]), merged, true, null, true, null, false);
        accept(merged, "genuine-arm64-xhdpi-xxhdpi");
        // Manager 2.3.0 merges without renaming resource directories. Unlike
        // Desktop, its APK still uses e.g. drawable-xhdpi-v4 and anydpi-v21.
        File manager = new File(scratch, "manager.apk");
        new ApkMerger().merge(new File(args[1]), manager, false, null, false, null, false);
        accept(manager, "manager-preserved-resource-paths");
        rejectPayload(manager, "manager-partial-density",
            n -> n.endsWith("/abc_ab_share_pack_mtrl_alpha.9.png"), false);
        rejectPayload(merged, "no-native", n -> n.startsWith("lib/"), false);
        rejectPayload(merged, "partial-native", n -> n.endsWith("libsigner.so"), false);
        rejectPayload(merged, "changed-native", n -> false, true);
        rejectPayload(merged, "no-density", n -> n.startsWith("res/drawable-") &&
            (n.contains("xhdpi") || n.contains("anydpi")), false);
        rejectPayload(merged, "partial-density", n -> n.endsWith("/abc_ab_share_pack_mtrl_alpha.9.png"), false);
        // Each applicable density can be used on its own; the second density
        // in the reported input must not conceal a partial first density.
        for (String density : List.of("xhdpi", "xxhdpi")) {
            File selected = new File(scratch, density + ".apks");
            try (var source = new ZipFile(args[1]); var output = new ZipOutputStream(Files.newOutputStream(selected.toPath()))) {
                for (var entry : Collections.list(source.entries())) {
                    if (entry.getName().startsWith("config.") && !entry.getName().contains("arm64") &&
                        !entry.getName().equals("config." + density + ".apk")) continue;
                    output.putNextEntry(new ZipEntry(entry.getName()));
                    output.write(source.getInputStream(entry).readAllBytes());
                    output.closeEntry();
                }
            }
            File single = new File(scratch, density + ".apk");
            new ApkMerger().merge(selected, single, true, null, true, null, false);
            accept(single, "genuine-arm64-" + density);
            rejectPayload(single, density + "-partial-density",
                n -> n.endsWith("/abc_ab_share_pack_mtrl_alpha.9.png"), false);
        }
        if (args.length > 3) {
            File full = new File(scratch, "full.apk");
            new ApkMerger().merge(new File(args[3]), full, true, null, true, null, false);
            accept(full, "legacy-both-abis-all-densities");
        }
        System.out.println("SUCCESS applicable-split regression assertions=" + checks);
    }
}

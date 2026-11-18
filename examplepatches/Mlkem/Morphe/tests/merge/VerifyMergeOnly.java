import app.morphe.patcher.Patcher;
import app.morphe.patcher.PatcherConfig;
import app.morphe.patcher.PatcherResult;
import app.morphe.patcher.apk.ApkUtils;
import app.morphe.patcher.dex.BytecodeMode;
import app.morphe.patcher.dex.NoOpDexVerifier;
import app.morphe.patcher.patch.Patch;
import app.morphe.patcher.patch.PatchKt;
import app.morphe.patcher.patch.PatchLoader;
import app.morphe.patcher.patch.PatchResult;
import app.morphe.patcher.patch.RawResourcePatch;
import app.morphe.patcher.resource.ResourceMode;
import com.android.apksig.ApkVerifier;
import com.reandroid.apk.ApkBundle;
import com.reandroid.apk.ApkModule;
import com.reandroid.archive.ByteInputSource;
import com.reandroid.archive.ZipEntryMap;
import com.reandroid.arsc.chunk.PackageBlock;
import com.reandroid.arsc.chunk.TableBlock;
import com.reandroid.arsc.chunk.xml.AndroidManifestBlock;
import com.reandroid.arsc.chunk.xml.ResXmlElement;
import com.reandroid.arsc.chunk.xml.ResXmlAttribute;
import com.reandroid.arsc.value.ResConfig;
import com.reandroid.arsc.value.ValueType;
import kotlin.Unit;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlinx.coroutines.BuildersKt;
import kotlinx.coroutines.flow.FlowCollector;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.HexFormat;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.jar.JarFile;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

/** Real Morphe JVM/ARSCLib verification, not an Android installation test. */
public final class VerifyMergeOnly {
    private static final String PACKAGE = "ca.mikem.mergeonly.fixture";
    private static final List<String> passed = new ArrayList<>();

    private static void check(boolean condition, String description) {
        if (!condition) throw new AssertionError(description);
        passed.add(description);
        System.out.println("PASS: " + description);
    }

    public static void main(String[] args) throws Exception {
        Path mpp = Path.of(args[0]).toAbsolutePath();
        Path root = Path.of(args[1]).toAbsolutePath();
        Path fixtureDex = Path.of(args[2]).toAbsolutePath();
        Files.createDirectories(root);
        long start = System.nanoTime();
        try {
            run(mpp, root, fixtureDex);
            String json = "{\n  \"status\": \"passed\",\n"
                + "  \"patch_file\": " + quote(mpp.getFileName().toString()) + ",\n"
                + "  \"runtime\": \"Official morphe-desktop 1.19.1 / morphe-patcher 2.0.1\",\n"
                + "  \"java\": " + quote(System.getProperty("java.version")) + ",\n"
                + "  \"elapsed_seconds\": " + ((System.nanoTime()-start)/1_000_000_000.0) + ",\n"
                + "  \"checks\": " + strings(passed) + ",\n"
                + "  \"limitations\": [\"No Android runtime was available: Manager DEX loading, UI import, device installation and app launch were not exercised.\",\"The generated split fixture validates the merger library, patcher and signing, not every third-party XAPK.\",\"The patch does not install separate OBB game data.\"]\n}\n";
            Files.writeString(root.resolve("report.json"), json);
            System.out.println("SUCCESS: " + passed.size() + " checks; report.json written.");
        } catch (Throwable failure) {
            Files.writeString(root.resolve("report.json"), "{\n  \"status\": \"failed\",\n  \"error\": "
                + quote(failure.toString()) + ",\n  \"checks_completed\": " + strings(passed) + "\n}\n");
            throw failure;
        }
    }

    private static void run(Path mpp, Path root, Path fixtureDex) throws Exception {
        try (JarFile jar = new JarFile(mpp.toFile())) {
            check(jar.getJarEntry("classes.dex") != null && jar.getJarEntry("classes.dex").getSize() > 0,
                "MPP contains nonempty Android DEX");
            check(jar.stream().anyMatch(e -> e.getName().endsWith(".class")), "MPP contains JVM class files");
            check(jar.getManifest() != null, "MPP has a readable manifest");
            check(jar.stream().noneMatch(e -> e.getName().startsWith("app/morphe/patcher/")
                    || e.getName().startsWith("kotlin/")), "MPP excludes Morphe and Kotlin runtime classes");
        }

        PatchLoader.Jar loader = PatchKt.loadPatchesFromJar(Set.of(mpp.toFile()));
        check(loader.size() == 1, "Real Morphe loader discovers exactly one patch");
        Patch<?> patch = loader.iterator().next();
        check(patch instanceof RawResourcePatch, "Patch is RawResourcePatch");
        check("Merge XAPK only".equals(patch.getName()), "Patch has expected display name");
        check(patch.getCompatibility() == null, "Patch is universal");
        check(!patch.getDefault(), "Patch is opt-in by default");
        check(patch.getDependencies().isEmpty(), "Patch has no dependencies");
        check(patch.getOptions().isEmpty(), "Patch has no options");
        check(patch.getAvailability() == null, "Patch has no forced availability resolver");

        Path fixtures = Files.createDirectories(root.resolve("fixtures"));
        byte[] dex = Files.readAllBytes(fixtureDex);
        check(dex.length > 112 && new String(dex, 0, 4, StandardCharsets.US_ASCII).equals("dex\n"),
            "Fixture uses a genuine independently compiled DEX");
        createModule(fixtures.resolve("base.apk"), false, dex);
        createModule(fixtures.resolve("split_config.de.apk"), true, dex);
        Path xapk = fixtures.resolve("fixture.xapk");
        try (ZipOutputStream zip = new ZipOutputStream(Files.newOutputStream(xapk))) {
            for (String file : new String[]{"base.apk", "split_config.de.apk"}) {
                zip.putNextEntry(new ZipEntry(file));
                Files.copy(fixtures.resolve(file), zip);
                zip.closeEntry();
            }
        }
        Path extracted = Files.createDirectories(fixtures.resolve("extracted"));
        try (ZipFile zip = new ZipFile(xapk.toFile())) {
            for (ZipEntry entry : java.util.Collections.list(zip.entries())) {
                check(!entry.getName().contains("/") && entry.getName().endsWith(".apk"),
                    "XAPK contains root APK module " + entry.getName());
                try (var stream = zip.getInputStream(entry)) {
                    Files.copy(stream, extracted.resolve(entry.getName()), StandardCopyOption.REPLACE_EXISTING);
                }
            }
        }

        Path mergedPath = fixtures.resolve("merged.apk");
        try (ApkBundle bundle = new ApkBundle()) {
            bundle.loadApkDirectory(extracted.toFile(), false);
            check(bundle.getApkModuleList().size() == 2, "ARSCLib loads both XAPK modules");
            try (ApkModule merged = bundle.mergeModules(false)) {
                merged.createApkFileWriter(mergedPath.toFile()).write();
            }
        }
        verifyContent(mergedPath, dex, "merged fixture");

        Path plainOutput = root.resolve("base-noop.apk");
        applyNoop(fixtures.resolve("base.apk"), plainOutput, mpp, root.resolve("plain-work"));
        compareEntries(fixtures.resolve("base.apk"), plainOutput, "Standalone no-op preserves all app-entry bytes");

        Path output = root.resolve("merged-noop.apk");
        applyNoop(mergedPath, output, mpp, root.resolve("merged-work"));
        compareEntries(mergedPath, output, "No-op preserves all merged app-entry bytes");
        verifyContent(output, dex, "patched merged fixture");

        Path signed = root.resolve("merged-noop-signed.apk");
        ApkUtils.KeyStoreDetails key = new ApkUtils.KeyStoreDetails(
            root.resolve("verification-only.keystore").toFile(), "fixture-only", "fixture", "fixture-only");
        ApkUtils.INSTANCE.signApk(output.toFile(), signed.toFile(), "Merge-only verification", key, 23);
        ApkVerifier.Result sig = new ApkVerifier.Builder(signed.toFile()).build().verify();
        check(sig.isVerified(), "Signed APK passes ApkVerifier: " + sig.getErrors());
        check(sig.getSignerCertificates().size() == 1, "Signed APK has one verification signer");
        compareEntries(output, signed, "Signing preserves all app-entry bytes");
        verifyContent(signed, dex, "signed merged fixture");
    }

    private static void applyNoop(Path input, Path output, Path mpp, Path work) throws Exception {
        Files.createDirectories(work);
        PatcherConfig config = new PatcherConfig(input.toFile(), work.resolve("temp").toFile(), Set.of(),
            BytecodeMode.STRIP_FAST, NoOpDexVerifier.INSTANCE, work.resolve("workspace").toFile(), "2.0.1", false);
        try (Patcher patcher = new Patcher(config)) {
            Patch<?> p = PatchKt.loadPatchesFromJar(Set.of(mpp.toFile())).iterator().next();
            patcher.plusAssign(Set.of(p));
            check(config.getResourceMode$morphe_patcher() == ResourceMode.RAW_ONLY,
                input.getFileName() + " uses RAW_ONLY resources");
            check(config.getBytecodeMode$morphe_patcher() == BytecodeMode.NONE,
                input.getFileName() + " skips bytecode decoding/rewrite");
            List<PatchResult> events = new ArrayList<>();
            FlowCollector<PatchResult> collector = (value, continuation) -> {
                events.add(value);
                if (value.getException() != null) throw new IllegalStateException("Patch failed", value.getException());
                return Unit.INSTANCE;
            };
            BuildersKt.<Unit>runBlocking(EmptyCoroutineContext.INSTANCE,
                (scope, continuation) -> patcher.invoke().collect(collector, continuation));
            check(events.size() == 1 && events.get(0).getException() == null,
                input.getFileName() + " executes exactly one successful patch");
            PatcherResult result = patcher.get();
            check(result.getDexFiles().isEmpty(), input.getFileName() + " generates no replacement DEX");
            check(result.getResources().getResourcesApk() == null,
                input.getFileName() + " generates no compiled resource APK");
            check(result.getResources().getOtherResources() == null ||
                    directoryHasNoFiles(result.getResources().getOtherResources().toPath()),
                input.getFileName() + " generates no resource changes");
            check(result.getResources().getDeleteResources().isEmpty(), input.getFileName() + " requests no deletions");
            Files.copy(input, output, StandardCopyOption.REPLACE_EXISTING);
            ApkUtils.INSTANCE.applyTo(result, output.toFile());
        }
    }

    private static boolean directoryHasNoFiles(Path dir) throws Exception {
        try (var files = Files.walk(dir)) { return files.noneMatch(Files::isRegularFile); }
    }

    private static void createModule(Path file, boolean split, byte[] dex) throws Exception {
        TableBlock table = new TableBlock();
        PackageBlock pkg = table.newPackage(0x7f, PACKAGE);
        var hello = pkg.getOrCreateTypeBlock(split ? "-de" : "", "string").getOrCreateEntry(0);
        hello.setValueAsString(split ? "Hallo" : "Hello");
        hello.setName("hello");
        if (!split) {
            var baseOnly = pkg.getOrCreateTypeBlock("", "string").getOrCreateEntry(1);
            baseOnly.setValueAsString("Only in base");
            baseOnly.setName("base_only");
        }
        table.refreshFull();
        AndroidManifestBlock manifest = new AndroidManifestBlock();
        ResXmlElement document = manifest.getDocumentElement();
        document.setName("manifest");
        rawStringAttribute(document, "package", PACKAGE);
        document.getOrCreateAndroidAttribute("versionCode", 0x0101021b).setTypeAndData(ValueType.DEC, 1);
        document.getOrCreateAndroidAttribute("versionName", 0x0101021c).setValueAsString("1.0");
        ResXmlElement usesSdk = document.getOrCreateElement("uses-sdk");
        usesSdk.getOrCreateAndroidAttribute("minSdkVersion", 0x0101020c).setTypeAndData(ValueType.DEC, 23);
        usesSdk.getOrCreateAndroidAttribute("targetSdkVersion", 0x01010270).setTypeAndData(ValueType.DEC, 34);
        if (split) {
            rawStringAttribute(document, "split", "config.de");
            manifest.getOrCreateApplicationElement().getOrCreateAndroidAttribute("hasCode", 0x0101000c)
                .setValueAsBoolean(false);
        } else manifest.getOrCreateApplicationElement().getOrCreateAndroidAttribute("label", 0x01010001)
            .setValueAsString("Merge-only fixture");
        manifest.refresh();
        try (ApkModule module = new ApkModule(split ? "split_config.de" : "base", new ZipEntryMap())) {
            module.setLoadDefaultFramework(false);
            module.add(new ByteInputSource(manifest.getBytes(), AndroidManifestBlock.FILE_NAME));
            module.add(new ByteInputSource(table.getBytes(), TableBlock.FILE_NAME));
            module.add(new ByteInputSource((split ? "SPLIT-PROBE" : "BASE-PROBE").getBytes(StandardCharsets.UTF_8),
                split ? "assets/split-probe.txt" : "assets/base-probe.txt"));
            if (!split) {
                module.add(new ByteInputSource(dex, "classes.dex"));
                module.getUncompressedFiles().addPath("classes.dex");
            }
            module.getUncompressedFiles().addPath("resources.arsc");
            module.createApkFileWriter(file.toFile()).write();
        }
    }

    private static void rawStringAttribute(ResXmlElement element, String name, String value) {
        ResXmlAttribute attribute = element.getOrCreateAndroidAttribute(name, 0);
        attribute.setNamespaceReference(-1);
        attribute.setValueAsString(value);
    }

    private static void verifyContent(Path apk, byte[] originalDex, String label) throws Exception {
        try (ApkModule module = ApkModule.loadApkFile(apk.toFile())) {
            check(PACKAGE.equals(module.getPackageName()), label + " preserves package name");
            check(module.getVersionCode() == 1 && "1.0".equals(module.getAndroidManifest().getVersionName()),
                label + " preserves version");
            check(!module.getAndroidManifest().isSplit(), label + " has no split requirement");
            PackageBlock pkg = module.getTableBlock().pickOne();
            check("Hello".equals(pkg.getSpecTypePair("string").getTypeBlock(ResConfig.parse(""))
                    .getEntry("hello").getResValue().getValueAsString()),
                label + " preserves base resource");
            check("Hallo".equals(pkg.getSpecTypePair("string").getTypeBlock(ResConfig.parse("-de"))
                    .getEntry("hello").getResValue().getValueAsString()),
                label + " includes German split resource");
            check("Only in base".equals(pkg.getSpecTypePair("string").getTypeBlock(ResConfig.parse(""))
                    .getEntry("base_only").getResValue().getValueAsString()),
                label + " preserves base-only resource");
        }
        try (ZipFile zip = new ZipFile(apk.toFile())) {
            check(Arrays.equals(originalDex, read(zip, "classes.dex")), label + " preserves fixture DEX bytes");
            check("BASE-PROBE".equals(new String(read(zip, "assets/base-probe.txt"), StandardCharsets.UTF_8)),
                label + " preserves base asset");
            check("SPLIT-PROBE".equals(new String(read(zip, "assets/split-probe.txt"), StandardCharsets.UTF_8)),
                label + " preserves split asset");
        }
    }

    private static byte[] read(ZipFile zip, String name) throws Exception {
        ZipEntry entry = zip.getEntry(name);
        if (entry == null) throw new AssertionError("Missing APK entry: " + name);
        try (var stream = zip.getInputStream(entry)) { return stream.readAllBytes(); }
    }

    private static Map<String,String> hashes(Path file) throws Exception {
        Map<String,String> result = new TreeMap<>();
        try (ZipFile zip = new ZipFile(file.toFile())) {
            for (ZipEntry e : java.util.Collections.list(zip.entries())) {
                if (e.isDirectory() || e.getName().matches("(?i)META-INF/(MANIFEST\\.MF|[^/]+\\.(SF|RSA|DSA|EC)|SIG-[^/]*)")) continue;
                result.put(e.getName(), sha(read(zip, e.getName())));
            }
        }
        return result;
    }

    private static void compareEntries(Path before, Path after, String label) throws Exception {
        Map<String,String> a = hashes(before), b = hashes(after);
        check(a.equals(b), label + " (" + a.size() + " entries)");
    }
    private static String sha(byte[] bytes) throws Exception {
        return HexFormat.of().formatHex(MessageDigest.getInstance("SHA-256").digest(bytes));
    }
    private static String quote(String s) {
        return "\"" + s.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "\\r") + "\"";
    }
    private static String strings(List<String> values) {
        return "[" + values.stream().map(VerifyMergeOnly::quote).collect(java.util.stream.Collectors.joining(", ")) + "]";
    }
}

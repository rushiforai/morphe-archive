package dev.jason.gboardpatches.extension.customtheme;

import android.content.Context;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

@RunWith(RobolectricTestRunner.class)
public final class GboardCustomThemePreviewRepositoryTest {
    private static final String PREFIX = "gboard-custom-themes/previews/";

    private Context context;
    private File previewRoot;

    @Before
    public void setUp() {
        context = RuntimeEnvironment.getApplication();
        previewRoot = new File(context.getFilesDir(), "custom-theme-gallery/previews");
        deleteRecursively(previewRoot);
    }

    @After
    public void tearDown() {
        deleteRecursively(previewRoot);
    }

    @Test
    public void releaseCoordinatesArePinnedToPublicRepository() {
        Assert.assertEquals("v1", GboardCustomThemePreviewRepository.VERSION);
        Assert.assertEquals(
                "https://github.com/jasonwu1994/Gboard-patches/releases/download/"
                        + "custom-theme-previews-v1/custom-theme-previews-v1.zip",
                GboardCustomThemePreviewRepository.URL);
        Assert.assertEquals(
                "368af5064b2e8ed62800417efd6fa015d12c74a94553002823eade85d8213ee9",
                GboardCustomThemePreviewRepository.SHA256);
    }

    @Test
    public void installedBundleMustMatchManifestCountBytesAndVersion() throws Exception {
        byte[] preview = "preview".getBytes(StandardCharsets.UTF_8);
        File file = writeInstalledBundle("pack/theme.jpg", preview);

        Assert.assertTrue(GboardCustomThemePreviewRepository.isInstalled(context));
        Assert.assertEquals(file.getCanonicalFile(),
                GboardCustomThemePreviewRepository.resolve(context,
                        PREFIX + "pack/theme.jpg").getCanonicalFile());

        Assert.assertTrue(file.delete());
        Assert.assertFalse(GboardCustomThemePreviewRepository.isInstalled(context));
        Assert.assertNull(GboardCustomThemePreviewRepository.resolve(context,
                PREFIX + "pack/theme.jpg"));
    }

    @Test
    public void installedBundleRejectsUnexpectedOrTamperedFiles() throws Exception {
        byte[] preview = "preview".getBytes(StandardCharsets.UTF_8);
        File file = writeInstalledBundle("pack/theme.jpg", preview);
        Files.write(new File(file.getParentFile(), "extra.jpg").toPath(), preview);
        Assert.assertFalse(GboardCustomThemePreviewRepository.isInstalled(context));

        deleteRecursively(previewRoot);
        file = writeInstalledBundle("pack/theme.jpg", preview);
        Files.write(file.toPath(), "different-size".getBytes(StandardCharsets.UTF_8));
        Assert.assertFalse(GboardCustomThemePreviewRepository.isInstalled(context));
    }

    @Test
    public void installedBundleRejectsWrongVersion() throws Exception {
        File preview = writeInstalledBundle(
                "pack/theme.jpg", "preview".getBytes(StandardCharsets.UTF_8));
        File manifest = new File(preview.getParentFile().getParentFile().getParentFile(),
                "manifest.json");
        Files.write(manifest.toPath(), manifest(1, 7L).replace("\"v1\"", "\"v2\"")
                .getBytes(StandardCharsets.UTF_8));
        Assert.assertFalse(GboardCustomThemePreviewRepository.isInstalled(context));
    }

    @Test
    public void installedBundleRequiresEveryIndexedPath() throws Exception {
        File preview = writeInstalledBundle(
                "pack/theme.jpg", "preview".getBytes(StandardCharsets.UTF_8));
        File replacement = new File(preview.getParentFile(), "other.jpg");
        Assert.assertTrue(preview.renameTo(replacement));
        Assert.assertFalse(GboardCustomThemePreviewRepository.isInstalled(context));
    }

    @Test
    public void resolveRejectsTraversalAndNonPreviewAssets() throws Exception {
        writeInstalledBundle("pack/theme.jpg", "preview".getBytes(StandardCharsets.UTF_8));
        Assert.assertTrue(GboardCustomThemePreviewRepository.isInstalled(context));
        Assert.assertNull(GboardCustomThemePreviewRepository.resolve(context,
                PREFIX + "../manifest.json"));
        Assert.assertNull(GboardCustomThemePreviewRepository.resolve(context,
                "gboard-custom-themes/catalog.json"));
    }

    @Test
    public void validArchiveAtomicallyReplacesInstalledBundle() throws Exception {
        writeInstalledBundle("old/old.jpg", "old".getBytes(StandardCharsets.UTF_8));
        File archive = createArchive(singlePreview("new/new.jpg", "new-preview"));

        GboardCustomThemePreviewRepository.installVerifiedArchive(context, archive);

        Assert.assertTrue(GboardCustomThemePreviewRepository.isInstalled(context));
        Assert.assertNull(GboardCustomThemePreviewRepository.resolve(context,
                PREFIX + "old/old.jpg"));
        File installed = GboardCustomThemePreviewRepository.resolve(context,
                PREFIX + "new/new.jpg");
        Assert.assertNotNull(installed);
        Assert.assertEquals("new-preview", readUtf8(installed));
        Assert.assertFalse(new File(previewRoot, "v1.old").exists());
        Assert.assertFalse(new File(previewRoot, ".staging-v1").exists());
    }

    @Test
    public void successfulInstallPrunesOnlyOlderNumericVersionDirectories() throws Exception {
        File older = directoryWithSentinel("v0");
        File newer = directoryWithSentinel("v2");
        File unrelated = directoryWithSentinel("preview-backup");
        File stagingLike = directoryWithSentinel(".staging-v0");
        File oldLike = directoryWithSentinel("v0.old");
        File archiveLike = new File(previewRoot, "v0.zip.part");
        Files.write(archiveLike.toPath(), "archive".getBytes(StandardCharsets.UTF_8));
        File archive = createArchive(singlePreview("new/new.jpg", "new-preview"));

        GboardCustomThemePreviewRepository.installVerifiedArchive(context, archive);

        Assert.assertFalse(older.exists());
        Assert.assertTrue(new File(previewRoot, "v1").isDirectory());
        Assert.assertTrue(new File(newer, "sentinel").isFile());
        Assert.assertTrue(new File(unrelated, "sentinel").isFile());
        Assert.assertTrue(new File(stagingLike, "sentinel").isFile());
        Assert.assertTrue(new File(oldLike, "sentinel").isFile());
        Assert.assertTrue(archiveLike.isFile());
    }

    @Test
    public void publishedV1ArchiveMatchesRuntimeInstallerContract() throws Exception {
        File archive = new File("../../release-assets/custom-theme-previews/v1/"
                + "custom-theme-previews-v1.zip");
        Assert.assertTrue("Published preview archive is missing", archive.isFile());

        GboardCustomThemePreviewRepository.installVerifiedArchive(context, archive);

        Assert.assertTrue(GboardCustomThemePreviewRepository.isInstalled(context));
        Assert.assertNotNull(GboardCustomThemePreviewRepository.resolve(context,
                PREFIX + "3D_ThemePack/3D_Black-07207cbdcb5f.jpg"));
    }

    @Test
    public void rejectedArchivePreservesPreviouslyInstalledBundle() throws Exception {
        writeInstalledBundle("old/old.jpg", "old".getBytes(StandardCharsets.UTF_8));
        File archive = new File(previewRoot, "unsafe.zip");
        Map<String, byte[]> entries = singlePreview("safe.jpg", "safe");
        entries.put("../escaped.jpg", "escape".getBytes(StandardCharsets.UTF_8));
        writeZip(archive, entries, manifest(1, 4L));

        assertInstallFails(archive);

        Assert.assertTrue(GboardCustomThemePreviewRepository.isInstalled(context));
        Assert.assertNotNull(GboardCustomThemePreviewRepository.resolve(context,
                PREFIX + "old/old.jpg"));
        Assert.assertFalse(new File(previewRoot.getParentFile(), "escaped.jpg").exists());
        Assert.assertFalse(new File(previewRoot, ".staging-v1").exists());
    }

    @Test
    public void archiveRejectsManifestMismatch() throws Exception {
        File archive = new File(previewRoot, "mismatch.zip");
        Map<String, byte[]> previews = singlePreview("pack/theme.jpg", "preview");
        writeZip(archive, previews, manifest(2, 7L));
        assertInstallFails(archive);
        Assert.assertFalse(new File(previewRoot, "v1").exists());
    }

    @Test
    public void archiveRejectsEntryCountBeyondLimit() throws Exception {
        File archive = new File(previewRoot, "too-many.zip");
        Map<String, byte[]> previews = new LinkedHashMap<String, byte[]>();
        for (int index = 0; index < 600; index++) {
            previews.put("previews/pack/" + index + ".jpg", new byte[] {1});
        }
        writeZip(archive, previews, manifest(600, 600L));
        assertInstallFails(archive);
        Assert.assertFalse(new File(previewRoot, "v1").exists());
    }

    @Test
    public void archiveRejectsOversizedEntry() throws Exception {
        File archive = new File(previewRoot, "oversized.zip");
        byte[] oversized = new byte[1024 * 1024 + 1];
        Map<String, byte[]> previews = new LinkedHashMap<String, byte[]>();
        previews.put("previews/pack/large.jpg", oversized);
        writeZip(archive, previews, manifest(1, oversized.length));
        assertInstallFails(archive);
        Assert.assertFalse(new File(previewRoot, "v1").exists());
    }

    private File writeInstalledBundle(String relative, byte[] bytes) throws Exception {
        File version = new File(previewRoot, "v1");
        File preview = new File(version, "previews/" + relative);
        Assert.assertTrue(preview.getParentFile().mkdirs());
        Files.write(preview.toPath(), bytes);
        Files.write(new File(version, "manifest.json").toPath(),
                manifest(1, bytes.length).getBytes(StandardCharsets.UTF_8));
        File index = new File(version, "preview-index.txt");
        Files.write(index.toPath(), (bytes.length + "\tpreviews/" + relative + "\n")
                .getBytes(StandardCharsets.UTF_8));
        Files.write(new File(version, ".complete").toPath(),
                (sha256(index) + "\n").getBytes(StandardCharsets.UTF_8));
        return preview;
    }

    private File createArchive(Map<String, byte[]> previews) throws Exception {
        File archive = new File(previewRoot, "valid.zip");
        long bytes = 0L;
        for (byte[] value : previews.values()) bytes += value.length;
        writeZip(archive, previews, manifest(previews.size(), bytes));
        return archive;
    }

    private File directoryWithSentinel(String name) throws Exception {
        File directory = new File(previewRoot, name);
        Assert.assertTrue(directory.mkdirs());
        Files.write(new File(directory, "sentinel").toPath(),
                name.getBytes(StandardCharsets.UTF_8));
        return directory;
    }

    private static Map<String, byte[]> singlePreview(String relative, String contents) {
        Map<String, byte[]> entries = new LinkedHashMap<String, byte[]>();
        entries.put("previews/" + relative, contents.getBytes(StandardCharsets.UTF_8));
        return entries;
    }

    private static void writeZip(File archive, Map<String, byte[]> entries, String manifest)
            throws Exception {
        File parent = archive.getParentFile();
        if (!parent.isDirectory()) Assert.assertTrue(parent.mkdirs());
        try (ZipOutputStream output = new ZipOutputStream(new FileOutputStream(archive))) {
            output.putNextEntry(new ZipEntry("manifest.json"));
            output.write(manifest.getBytes(StandardCharsets.UTF_8));
            output.closeEntry();
            for (Map.Entry<String, byte[]> entry : entries.entrySet()) {
                output.putNextEntry(new ZipEntry(entry.getKey()));
                output.write(entry.getValue());
                output.closeEntry();
            }
        }
    }

    private static String manifest(int count, long bytes) {
        return "{\"schemaVersion\":1,\"bundleVersion\":\"v1\","
                + "\"sha256\":\"" + GboardCustomThemePreviewRepository.SHA256 + "\","
                + "\"previewCount\":" + count + ","
                + "\"totalUncompressedBytes\":" + bytes + "}";
    }

    private void assertInstallFails(File archive) throws Exception {
        try {
            GboardCustomThemePreviewRepository.installVerifiedArchive(context, archive);
            Assert.fail("Expected preview archive rejection");
        } catch (IOException expected) {
            // Expected validation failure.
        }
    }

    private static String readUtf8(File file) throws Exception {
        byte[] bytes = new byte[(int) file.length()];
        try (FileInputStream input = new FileInputStream(file)) {
            int offset = 0;
            while (offset < bytes.length) {
                int read = input.read(bytes, offset, bytes.length - offset);
                if (read < 0) break;
                offset += read;
            }
        }
        return new String(bytes, StandardCharsets.UTF_8);
    }

    private static String sha256(File file) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        try (FileInputStream input = new FileInputStream(file)) {
            byte[] buffer = new byte[8192];
            int read;
            while ((read = input.read(buffer)) >= 0) {
                if (read > 0) digest.update(buffer, 0, read);
            }
        }
        StringBuilder value = new StringBuilder(64);
        for (byte current : digest.digest()) {
            value.append(String.format(java.util.Locale.US, "%02x", current & 0xff));
        }
        return value.toString();
    }

    private static void deleteRecursively(File file) {
        if (file == null || !file.exists()) return;
        File[] children = file.listFiles();
        if (children != null) for (File child : children) deleteRecursively(child);
        file.delete();
    }
}

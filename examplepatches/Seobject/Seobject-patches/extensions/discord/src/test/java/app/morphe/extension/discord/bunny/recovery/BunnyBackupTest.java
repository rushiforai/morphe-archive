package app.morphe.extension.discord.bunny.recovery;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.Collections;
import java.util.Set;

import static org.junit.Assert.*;

public final class BunnyBackupTest {
    @Rule public final TemporaryFolder temporary = new TemporaryFolder();

    @Test public void roundTripIsVersionedDeterministicAndExcludesExecutableOrSecretData() throws Exception {
        File root = temporary.newFolder("pyoncord");
        write(root, "loader.json", "{\"customLoadUrl\":{\"enabled\":false},\"token\":\"discord-secret\"}");
        write(root, "plugins/settings.json", "{\"example\":{\"enabled\":true,\"password\":\"secret\"}}");
        write(root, "vd_mmkv/VENDETTA_PLUGINS", "{\"https://plugins.example/\":{\"enabled\":true,\"js\":\"throw new Error('execute')\",\"manifest\":{\"name\":\"Example\"}}}");
        File font = new File(root, "downloads/fonts/Pack/font.ttf");
        assertTrue(font.getParentFile().mkdirs());
        Files.write(font.toPath(), new byte[]{0, 1, 0, 0, 1});

        JSONObject first = BunnyBackup.create(root, "test");
        JSONObject second = BunnyBackup.create(root, "test");
        assertEquals(BunnyBackup.FORMAT, first.getString("format"));
        assertEquals(BunnyBackup.SCHEMA_VERSION, first.getInt("schemaVersion"));
        assertEquals(first.getJSONObject("contents").getJSONArray("entries").toString(),
                second.getJSONObject("contents").getJSONArray("entries").toString());

        String serialized = first.toString();
        assertFalse(serialized.contains("discord-secret"));
        assertFalse(serialized.contains("execute"));
        assertFalse(serialized.contains("password"));
        BunnyBackup.Validated validated = BunnyBackup.validateAndMigrate(serialized.getBytes(StandardCharsets.UTF_8));
        assertFalse(validated.entries.isEmpty());
    }

    @Test public void corruptionAndUnsafePathsAreRejectedBeforeRestore() throws Exception {
        File root = temporary.newFolder("corrupt");
        write(root, "plugins/settings.json", "{\"example\":{\"enabled\":true}}");
        JSONObject backup = BunnyBackup.create(root, "test");
        JSONArray entries = backup.getJSONObject("contents").getJSONArray("entries");
        entries.getJSONObject(0).put("data", "{\"changed\":true}");
        JSONObject corrupt = backup;
        assertThrows(Exception.class, () -> BunnyBackup.validateAndMigrate(corrupt.toString().getBytes(StandardCharsets.UTF_8)));

        backup = BunnyBackup.create(root, "test");
        backup.getJSONObject("contents").getJSONArray("entries").getJSONObject(0).put("path", "../escape.json");
        JSONObject unsafe = backup;
        assertThrows(Exception.class, () -> BunnyBackup.validateAndMigrate(unsafe.toString().getBytes(StandardCharsets.UTF_8)));
    }

    @Test public void syntheticV0MigratesThroughCentralChain() throws Exception {
        File root = temporary.newFolder("legacy");
        write(root, "plugins/settings.json", "{}");
        JSONObject legacy = BunnyBackup.create(root, "test");
        legacy.put("schemaVersion", 0);
        legacy.remove("createdWithBunnyVersion");
        BunnyBackup.Validated migrated = BunnyBackup.validateAndMigrate(legacy.toString().getBytes(StandardCharsets.UTF_8));
        assertEquals(1, migrated.root.getInt("schemaVersion"));
        assertEquals("legacy", migrated.root.getString("createdWithBunnyVersion"));
    }

    @Test public void selectedCategoriesFilterBeforeSerialization() throws Exception {
        File root = temporary.newFolder("selected");
        write(root, "loader.json", "{\"customLoadUrl\":{\"enabled\":false}}");
        write(root, "plugins/settings.json", "{\"example\":{\"enabled\":true}}");
        write(root, "current-theme.json", "{\"id\":\"example\"}");
        File font = new File(root, "downloads/fonts/Pack/font.ttf");
        assertTrue(font.getParentFile().mkdirs());
        Files.write(font.toPath(), new byte[]{0, 1, 0, 0, 1});

        JSONObject pluginsOnly = BunnyBackup.create(
                root,
                "test",
                Collections.singleton(BunnyBackup.CATEGORY_PLUGINS)
        );
        JSONArray entries = pluginsOnly.getJSONObject("contents").getJSONArray("entries");
        assertEquals(1, entries.length());
        assertEquals("plugins/settings.json", entries.getJSONObject(0).getString("path"));
        assertEquals(1, pluginsOnly.getJSONObject("contents")
                .getJSONObject("categories").getInt("plugins"));

        Set<String> selected = BunnyBackup.parseCategories("plugins,themes");
        assertEquals(2, selected.size());
        assertTrue(selected.contains(BunnyBackup.CATEGORY_PLUGINS));
        assertTrue(selected.contains(BunnyBackup.CATEGORY_THEMES));
        assertThrows(Exception.class, () -> BunnyBackup.parseCategories("plugins,credentials"));
    }

    @Test public void archivesPastLegacy64MbRemainBoundedButSupported() throws Exception {
        long pastLegacyLimit = 64L * 1024L * 1024L + 1L;
        BunnyBackup.requirePortableSize(pastLegacyLimit);
        BunnyBackup.requireImportSize(pastLegacyLimit);

        assertThrows(IOException.class,
                () -> BunnyBackup.requirePortableSize(BunnyBackup.MAX_PORTABLE_BYTES + 1L));
        assertThrows(IOException.class,
                () -> BunnyBackup.requireImportSize(BunnyBackup.MAX_IMPORT_BYTES + 1L));
    }

    private static void write(File root, String relative, String value) throws Exception {
        File file = new File(root, relative);
        assertTrue(file.getParentFile().isDirectory() || file.getParentFile().mkdirs());
        Files.write(file.toPath(), value.getBytes(StandardCharsets.UTF_8));
    }
}

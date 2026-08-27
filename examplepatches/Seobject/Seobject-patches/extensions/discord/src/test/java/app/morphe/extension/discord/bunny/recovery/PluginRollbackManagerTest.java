package app.morphe.extension.discord.bunny.recovery;

import org.json.JSONObject;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;

import static org.junit.Assert.*;

public final class PluginRollbackManagerTest {
    @Rule public final TemporaryFolder temporary = new TemporaryFolder();

    @Test public void modernPluginRetainsOnePreviousManifestAndScript() throws Exception {
        File files = temporary.newFolder("files");
        File root = new File(files, "pyoncord");
        write(root, "plugins/manifests/example.json", "{\"version\":\"1\"}");
        write(root, "plugins/scripts/example.js", "old-code");
        PluginRollbackManager manager = new PluginRollbackManager(root, new RecoveryStore(root));
        assertTrue(manager.preserve("example", "modern"));
        write(root, "plugins/manifests/example.json", "{\"version\":\"2\"}");
        write(root, "plugins/scripts/example.js", "new-code");
        restoreIgnoringAndroidLogStub(manager, "example");
        assertEquals("{\"version\":\"1\"}", read(root, "plugins/manifests/example.json"));
        assertEquals("old-code", read(root, "plugins/scripts/example.js"));
    }

    @Test public void vendettaPluginRetainsPreviousEmbeddedEntry() throws Exception {
        File files = temporary.newFolder("vendetta-files");
        File root = new File(files, "pyoncord");
        String id = "https://plugins.example/";
        write(root, "vd_mmkv/VENDETTA_PLUGINS", new JSONObject().put(id,
                new JSONObject().put("enabled", true).put("js", "old-code").put("manifest", new JSONObject().put("hash", "old"))).toString());
        PluginRollbackManager manager = new PluginRollbackManager(root, new RecoveryStore(root));
        assertTrue(manager.preserve(id, "vendetta"));
        write(root, "vd_mmkv/VENDETTA_PLUGINS", new JSONObject().put(id,
                new JSONObject().put("enabled", true).put("js", "new-code").put("manifest", new JSONObject().put("hash", "new"))).toString());
        restoreIgnoringAndroidLogStub(manager, id);
        JSONObject restored = new JSONObject(read(root, "vd_mmkv/VENDETTA_PLUGINS")).getJSONObject(id);
        assertEquals("old-code", restored.getString("js"));
        assertEquals("old", restored.getJSONObject("manifest").getString("hash"));
    }

    private static void restoreIgnoringAndroidLogStub(PluginRollbackManager manager, String id) throws Exception {
        try { manager.restore(id); }
        catch (RuntimeException error) { if (!"Stub!".equals(error.getMessage())) throw error; }
    }

    private static void write(File root, String path, String value) throws Exception {
        File file = new File(root, path);
        assertTrue(file.getParentFile().isDirectory() || file.getParentFile().mkdirs());
        Files.write(file.toPath(), value.getBytes(StandardCharsets.UTF_8));
    }

    private static String read(File root, String path) throws Exception {
        return new String(Files.readAllBytes(new File(root, path).toPath()), StandardCharsets.UTF_8);
    }
}

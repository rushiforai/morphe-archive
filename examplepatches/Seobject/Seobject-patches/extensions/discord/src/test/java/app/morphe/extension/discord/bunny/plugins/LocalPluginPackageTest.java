package app.morphe.extension.discord.bunny.plugins;

import org.json.JSONArray;
import org.json.JSONObject;

import java.nio.charset.StandardCharsets;

import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.fail;

public final class LocalPluginPackageTest {
    @Test
    public void validSpec3PackagePreservesManifestAndScript() throws Exception {
        JSONObject root = packageWith(
                baseManifest(),
                "const loaded = false; export default {};",
                new JSONObject().put(
                        "repository",
                        "https://github.com/example/example-plugin"
                )
        );

        LocalPluginPackage parsed =
                LocalPluginPackage.parse(bytes(root));

        assertEquals("example.plugin", parsed.id());
        assertEquals(
                "const loaded = false; export default {};",
                parsed.script()
        );
        assertEquals(
                "https://github.com/example/example-plugin",
                parsed.projectRepository()
        );

        JSONObject storedManifest =
                new JSONObject(parsed.manifestJson());

        assertEquals(
                "example.plugin",
                storedManifest.getString("id")
        );
        assertEquals(3, storedManifest.getInt("spec"));
        assertEquals(
                "plugin",
                storedManifest.getString("type")
        );
    }

    @Test
    public void validPackageDoesNotRequireProjectRepository()
            throws Exception {
        JSONObject root = packageWith(
                baseManifest(),
                "export default {};",
                null
        );

        LocalPluginPackage parsed =
                LocalPluginPackage.parse(bytes(root));

        assertNull(parsed.projectRepository());
    }

    @Test
    public void rejectsWrongManifestSpec() throws Exception {
        JSONObject manifest = baseManifest();
        manifest.put("spec", 2);

        expectInvalid(
                packageWith(
                        manifest,
                        "export default {};",
                        null
                )
        );
    }

    @Test
    public void rejectsNonPluginManifest() throws Exception {
        JSONObject manifest = baseManifest();
        manifest.put("type", "theme");

        expectInvalid(
                packageWith(
                        manifest,
                        "export default {};",
                        null
                )
        );
    }

    @Test
    public void rejectsUnsafeStableId() throws Exception {
        JSONObject manifest = baseManifest();
        manifest.put("id", "../escape");

        expectInvalid(
                packageWith(
                        manifest,
                        "export default {};",
                        null
                )
        );
    }

    @Test
    public void rejectsRemoteRuntimeFieldsFromLocalFile()
            throws Exception {
        JSONObject manifest = baseManifest();
        manifest.put(
                "parentRepository",
                "https://plugins.example/"
        );

        expectInvalid(
                packageWith(
                        manifest,
                        "export default {};",
                        null
                )
        );

        manifest = baseManifest();
        manifest.put(
                "jsPath",
                "plugins/scripts/other.js"
        );

        expectInvalid(
                packageWith(
                        manifest,
                        "export default {};",
                        null
                )
        );
    }

    @Test
    public void rejectsNonHttpsProjectRepository()
            throws Exception {
        expectInvalid(
                packageWith(
                        baseManifest(),
                        "export default {};",
                        new JSONObject().put(
                                "repository",
                                "http://plugins.example/"
                        )
                )
        );
    }

    @Test
    public void rejectsMissingOrEmptyScript() throws Exception {
        JSONObject root = packageWith(
                baseManifest(),
                "",
                null
        );

        expectInvalid(root);

        root.remove("script");
        expectInvalid(root);
    }

    @Test
    public void rejectsMalformedAuthorMetadata() throws Exception {
        JSONObject manifest = baseManifest();

        manifest.getJSONObject("display").put(
                "authors",
                new JSONArray().put(
                        new JSONObject().put("id", "123")
                )
        );

        expectInvalid(
                packageWith(
                        manifest,
                        "export default {};",
                        null
                )
        );
    }

    private static JSONObject baseManifest() throws Exception {
        return new JSONObject()
                .put("id", "example.plugin")
                .put("spec", 3)
                .put("version", "1.2.3")
                .put("type", "plugin")
                .put(
                        "display",
                        new JSONObject()
                                .put("name", "Example Plugin")
                                .put(
                                        "description",
                                        "Parser verification plugin"
                                )
                                .put(
                                        "authors",
                                        new JSONArray().put(
                                                new JSONObject()
                                                        .put(
                                                                "name",
                                                                "Example"
                                                        )
                                                        .put(
                                                                "id",
                                                                "123"
                                                        )
                                        )
                                )
                )
                .put("main", "index.js");
    }

    private static JSONObject packageWith(
            JSONObject manifest,
            String script,
            JSONObject provenance
    ) throws Exception {
        JSONObject root = new JSONObject()
                .put(
                        "format",
                        LocalPluginPackage.FORMAT
                )
                .put(
                        "formatVersion",
                        LocalPluginPackage.FORMAT_VERSION
                )
                .put("manifest", manifest);

        if (script != null) {
            root.put("script", script);
        }

        if (provenance != null) {
            root.put("provenance", provenance);
        }

        return root;
    }

    private static byte[] bytes(JSONObject root) {
        return root.toString().getBytes(
                StandardCharsets.UTF_8
        );
    }

    private static void expectInvalid(JSONObject root) {
        try {
            LocalPluginPackage.parse(bytes(root));
            fail("Expected local plugin package validation to fail");
        } catch (IllegalArgumentException expected) {
            // Expected validation failure.
        }
    }
}
package app.template.extension.zalo.buglog;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.junit.Test;

public class PatchTest {
    /** The patch sources, relative to this module (Gradle runs unit tests from the module directory). */
    private static final File PATCH_SOURCES = new File("../../patches/src/main/kotlin/app/template/patches/zalo");
    private static final Pattern PATCH_NAME = Pattern.compile(
        "(?:bytecodePatch|resourcePatch|rawResourcePatch)\\(\\s*name\\s*=\\s*\"([^\"]+)\"");

    static String kebab(String name) {
        return name.toLowerCase(Locale.ROOT).replaceAll("[^a-z0-9]+", "-").replaceAll("^-|-$", "");
    }

    @Test
    public void idsAreUniqueKebabCase() {
        Set<String> ids = new HashSet<>();
        for (Patch patch : Patch.values()) {
            assertTrue(patch.id, patch.id.matches("[a-z0-9]+(-[a-z0-9]+)*"));
            assertTrue("duplicate " + patch.id, ids.add(patch.id));
            assertEquals(patch.id.toUpperCase(Locale.ROOT).replace('-', '_'), patch.name());
        }
    }

    @Test
    public void everyNamedPatchHasAConstantAndViceVersa() throws IOException {
        File[] sources = PATCH_SOURCES.listFiles((dir, name) -> name.endsWith(".kt"));
        assertNotNull("patch sources not found at " + PATCH_SOURCES.getAbsolutePath(), sources);
        Set<String> fromSources = new TreeSet<>();
        for (File source : sources) {
            Matcher matcher = PATCH_NAME.matcher(new String(Files.readAllBytes(source.toPath()), StandardCharsets.UTF_8));
            while (matcher.find()) fromSources.add(kebab(matcher.group(1)));
        }
        assertTrue("no patch names found", fromSources.size() > 10);
        Set<String> fromEnum = new TreeSet<>();
        for (Patch patch : Patch.values()) {
            if (patch != Patch.CORE) fromEnum.add(patch.id);
        }
        assertEquals(fromSources, fromEnum);
    }

    @Test
    public void everyPatchHasABreadcrumb() throws ReflectiveOperationException {
        for (Patch patch : Patch.values()) {
            if (patch == Patch.CORE) continue;
            String[] parts = patch.id.split("-");
            StringBuilder name = new StringBuilder(parts[0]);
            for (int index = 1; index < parts.length; index++) {
                name.append(Character.toUpperCase(parts[index].charAt(0))).append(parts[index].substring(1));
            }
            Method method = Hits.class.getMethod(name.toString());
            assertTrue(Modifier.isStatic(method.getModifiers()));
            assertEquals(void.class, method.getReturnType());
        }
    }

    @Test
    public void ownerLookup() {
        assertEquals(Patch.KEEP_RECALLED_MESSAGES, Patch.ownerOf("app.template.extension.zalo.chat.RecalledMessages", "x"));
        assertEquals(Patch.HIDE_TEXT_TYPING, Patch.ownerOf("app.template.extension.zalo.chat.ChatOptions", "isTypingHidden"));
        assertEquals(Patch.CORE, Patch.ownerOf("app.template.extension.zalo.chat.ChatOptions", "unknown"));
        assertEquals(Patch.CALL_RECORDING, Patch.ownerOf("app.template.extension.zalo.call.RecordingSaver$Job", "run"));
        assertEquals(Patch.BUG_LOG, Patch.ownerOf("app.template.extension.zalo.buglog.NezumiLog", "i"));
        assertEquals(Patch.CORE, Patch.ownerOf("app.template.extension.zalo.settings.NezumiSettingsPage", "show"));
        assertEquals(null, Patch.ownerOf("com.zing.zalo.MainApplication", "onCreate"));
        assertEquals(Patch.SAVE_MEDIA, Patch.byId("save-media"));
    }
}

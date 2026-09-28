/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Stream;

import app.morphe.extension.shared.SettingsContextRule;

/**
 * Every patch turns on its own settings switch. A patch flips its {@code SettingsStatus} flag with
 * {@code enableStatus(name)} when it applies, and the extension reads that flag by the family's
 * status method. Nothing tied the two together, so a typo in one would leave the patch applied and
 * its switch reading "not patched" in the settings screen. Read from the patch sources, the way the
 * README check reads the catalog.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PatchStatusWiringTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final Pattern NAME = Pattern.compile("(?m)^\\s*name\\s*=\\s*\"([^\"]+)\"");
    private static final Pattern STATUS = Pattern.compile("enableStatus\\(\"([^\"]+)\"\\)");

    @Test
    public void eachPatchEnablesItsOwnFamilysSwitch() throws IOException {
        Map<String, List<String>> statusesByPatch = statusCallsByPatchName();

        for (PatchFamily family : PatchFamily.values()) {
            List<String> calls = statusesByPatch.get(family.patchName);
            assertNotNull("no patch source declares the name \"" + family.patchName + "\"", calls);
            assertEquals("\"" + family.patchName + "\" doesn't turn on exactly its own switch",
                    java.util.Collections.singletonList(family.statusMethod), calls);
        }
    }

    @Test
    public void everyEnabledSwitchBelongsToAFamily() throws IOException {
        TreeSet<String> known = new TreeSet<>();
        for (PatchFamily family : PatchFamily.values()) known.add(family.statusMethod);

        for (Map.Entry<String, List<String>> patch : statusCallsByPatchName().entrySet()) {
            for (String status : patch.getValue()) {
                assertTrue("\"" + patch.getKey() + "\" turns on \"" + status + "\", which no family reads",
                        known.contains(status));
            }
        }
    }

    /** Each patch source's declared patch name, with the enableStatus names the same file passes. */
    private static Map<String, List<String>> statusCallsByPatchName() throws IOException {
        Path sources = repositoryRoot().toPath().resolve("patches/src/main/kotlin");
        Map<String, List<String>> result = new HashMap<>();
        List<Path> files = new ArrayList<>();
        try (Stream<Path> walk = Files.walk(sources)) {
            walk.filter(p -> p.toString().endsWith("Patch.kt")).forEach(files::add);
        }
        assertTrue("no patch sources under " + sources, files.size() > 10);

        for (Path file : files) {
            String text = new String(Files.readAllBytes(file), StandardCharsets.UTF_8);
            Matcher names = NAME.matcher(text);
            if (!names.find()) continue;
            String name = names.group(1);
            List<String> statuses = new ArrayList<>();
            Matcher status = STATUS.matcher(text);
            while (status.find()) {
                if (!statuses.contains(status.group(1))) statuses.add(status.group(1));
            }
            if (!statuses.isEmpty()) result.put(name, statuses);
        }
        return result;
    }

    /** The checkout's root, found from wherever Gradle runs the test by its patches-list.json. */
    private static File repositoryRoot() {
        for (File dir = new File("").getAbsoluteFile(); dir != null; dir = dir.getParentFile()) {
            if (new File(dir, "patches-list.json").isFile()) return dir;
        }
        throw new AssertionError("no patches-list.json above " + new File("").getAbsolutePath());
    }
}

/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.hushthreads.settings;

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

    /** A patch declaration's opening, up to the bracket its arguments start at. */
    private static final Pattern DECLARATION = Pattern.compile("\\b(?:bytecodePatch|resourcePatch|rawResourcePatch)\\s*\\(");
    /** The name argument, as a literal or as a constant of the same file. */
    private static final Pattern NAME = Pattern.compile("\\bname\\s*=\\s*(?:\"([^\"]+)\"|([A-Za-z_][A-Za-z0-9_]*))");
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
        assertTrue("fewer patch sources under " + sources + " than families: " + files,
                files.size() >= PatchFamily.values().length);

        for (Path file : files) {
            String text = new String(Files.readAllBytes(file), StandardCharsets.UTF_8);
            List<String> names = declaredNames(text);
            assertTrue(file + " declares " + names.size() + " named patches, so its switches can't be told apart",
                    names.size() <= 1);
            if (names.isEmpty()) continue;
            String name = names.get(0);
            List<String> statuses = new ArrayList<>();
            Matcher status = STATUS.matcher(text);
            while (status.find()) {
                if (!statuses.contains(status.group(1))) statuses.add(status.group(1));
            }
            if (!statuses.isEmpty()) result.put(name, statuses);
        }
        return result;
    }

    /**
     * The name each patch declaration in {@code text} passes, read from inside the call's own
     * brackets so a fingerprint's {@code name =} can't stand in for it. A name given as a constant
     * is looked up in the same file's {@code const val}.
     */
    private static List<String> declaredNames(String text) {
        List<String> names = new ArrayList<>();
        Matcher declaration = DECLARATION.matcher(text);
        while (declaration.find()) {
            String arguments = bracketed(text, declaration.end() - 1);
            Matcher name = NAME.matcher(arguments);
            if (!name.find()) continue;
            if (name.group(1) != null) {
                names.add(name.group(1));
                continue;
            }
            Matcher constant = Pattern.compile("\\bconst\\s+val\\s+" + Pattern.quote(name.group(2)) + "\\s*=\\s*\"([^\"]+)\"")
                    .matcher(text);
            assertTrue("a patch is named by " + name.group(2) + ", which is no const val of the same file", constant.find());
            names.add(constant.group(1));
        }
        return names;
    }

    /** The text inside the bracket that opens at {@code open}, skipping brackets inside string literals. */
    private static String bracketed(String text, int open) {
        int depth = 0;
        boolean inString = false;
        for (int i = open; i < text.length(); i++) {
            char c = text.charAt(i);
            if (inString) {
                if (c == '\\') i++;
                else if (c == '"') inString = false;
            } else if (c == '"') {
                inString = true;
            } else if (c == '(') {
                depth++;
            } else if (c == ')' && --depth == 0) {
                return text.substring(open + 1, i);
            }
        }
        throw new AssertionError("no closing bracket for the declaration at " + open);
    }

    /** The checkout's root, found from wherever Gradle runs the test by its patches-list.json. */
    private static File repositoryRoot() {
        for (File dir = new File("").getAbsoluteFile(); dir != null; dir = dir.getParentFile()) {
            if (new File(dir, "patches-list.json").isFile()) return dir;
        }
        throw new AssertionError("no patches-list.json above " + new File("").getAbsolutePath());
    }
}

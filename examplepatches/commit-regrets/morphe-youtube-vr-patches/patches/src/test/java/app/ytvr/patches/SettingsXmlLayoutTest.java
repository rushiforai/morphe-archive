package app.ytvr.patches;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.fail;

import app.morphe.patcher.patch.PatchException;
import app.ytvr.patches.sponsorblock.SettingsXmlKt;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.xml.parsers.DocumentBuilderFactory;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

/**
 * Runs the *real* compiled {@code SettingsXmlKt.restructureSettingsXmls} against a decoded
 * {@code res} directory in the shape the patcher's decoder produces. Ported from the build/probe
 * {@code SettingsXmlLayoutCheck} harness so it runs on every build. (It is Java rather than Kotlin
 * because the Morphe plugin does not put the main output on the test <em>Kotlin</em> compilation's
 * classpath, and the function is {@code internal}.)
 *
 * <p>The function takes the decoded {@code res} directories since 2026-10-30: Morphe patcher 2.x
 * hosts that decode resources <em>on request</em> (Desktop 2.x) hold nothing under the decode tree
 * until a resource patch asks for it, so the old search that derived the tree from the bytecode
 * patch's {@code fileWorkspace} found nothing there and threw on a real Desktop 2.x run. The
 * discovery moved into {@code patchSettingsPatch} (a resource patch whose {@code decode(**)} is
 * the sanctioned trigger); what is tested here is everything that survives it -- the edits and
 * their idempotence, against the directory shape the decoder actually writes:
 * {@code <decode tree>/resources/package_<n>/res/...}.</p>
 */
public final class SettingsXmlLayoutTest {

    /** The mined dead-framework xml id; {@code public.xml} in the fixture maps it to prefs_screen. */
    private static final int SB_SCREEN_XML_ID = 0x7f0e0001;

    private static final List<String> CATEGORIES = Arrays.asList(
            "sponsor", "selfpromo", "interaction", "intro", "outro",
            "poi_highlight", "preview", "hook", "filler", "music_offtopic");

    @TempDir
    public File tempDir;

    @Test
    public void restructuresADecodedResDirectory() throws Exception {
        File resDir = buildDecodedTree(new File(tempDir, "decode/resources/package_1"));

        SettingsXmlKt.restructureSettingsXmls(List.of(resDir), SB_SCREEN_XML_ID, behaviours());
        assertRestructured(resDir, "decoded-res");
    }

    @Test
    public void missingFilesNameTheDirectoriesSearched() throws Exception {
        // A decoded res directory that holds none of the settings files -- what a decode of the
        // wrong app would look like. The diagnosis must say what was missing and where it looked,
        // which is what made the original Manager failure diagnosable at all.
        File resDir = new File(tempDir, "decode/resources/package_1/res");
        assertTrue(resDir.mkdirs() || resDir.isDirectory(), "res directory created");

        try {
            SettingsXmlKt.restructureSettingsXmls(List.of(resDir), SB_SCREEN_XML_ID, behaviours());
            fail("a res directory without the settings files must throw");
        } catch (Exception thrown) {
            assertTrue(thrown instanceof PatchException,
                    "expected PatchException, got " + thrown.getClass().getName());
            String message = thrown.getMessage() == null ? "" : thrown.getMessage();
            assertTrue(message.contains("no settings preferences XML in any of"),
                    "the message must lead with the settings-XML diagnosis: " + message);
            assertTrue(message.contains("looked for settings_prefs.xml, panel2_settings_prefs.xml"),
                    "the message must keep the looked-for names: " + message);
            assertTrue(message.contains(resDir.getAbsolutePath()),
                    "the message must name the directory that was searched: " + message);
        }
    }

    // --- the decoded-tree fixture ---------------------------------------------------------------

    /**
     * Writes {@code <tempRoot>/res/...}, the shape the patcher's decoder produces under
     * {@code apk/resources/package_<n>/}, with the resource files this function edits. Returns the
     * {@code res} directory.
     */
    private static File buildDecodedTree(File tempRoot) throws IOException {
        File res = new File(tempRoot, "res");
        writeXml(new File(res, "xml"), "settings_prefs.xml", preferenceScreen(
                "<Preference android:key=\"ytvr_mod_old_flat_row\" android:title=\"Old flat row\" />\n"
                        + "    <Preference android:key=\"developer_settings\" android:title=\"Developer\" />"));
        writeXml(new File(res, "xml"), "panel2_settings_prefs.xml", preferenceScreen(
                "<Preference android:key=\"ytvr_mod_old_flat_row\" android:title=\"Old flat row\" />\n"
                        + "    <Preference android:key=\"some_other_row\" android:title=\"Other\" />"));
        writeXml(new File(res, "xml"), "developer_settings_prefs.xml", preferenceScreen(
                "<Preference android:key=\"dead_developer_row\" android:title=\"Dead\" />"));
        writeXml(new File(res, "xml"), "prefs_screen.xml", preferenceScreen(
                "<Preference android:key=\"dead_framework_row\" android:title=\"Dead\" />"));
        writeXml(new File(res, "values"), "public.xml",
                "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                        + "<resources>\n"
                        + "    <public type=\"xml\" name=\"prefs_screen\" id=\"0x7f0e0001\" />\n"
                        + "    <public type=\"xml\" name=\"settings_prefs\" id=\"0x7f0e0002\" />\n"
                        + "</resources>\n");
        writeXml(new File(res, "values"), "arrays.xml",
                "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                        + "<resources>\n"
                        + "    <string-array name=\"some_existing_array\"><item>a</item></string-array>\n"
                        + "</resources>\n");
        writeXml(new File(res, "xml"), "deprecated_settings_holder_fragment.xml",
                "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                        + "<RelativeLayout xmlns:android=\"http://schemas.android.com/apk/res/android\">\n"
                        + "    <LinearLayout android:id=\"@+id/back_button_container\"\n"
                        + "        android:layout_centerHorizontal=\"true\" />\n"
                        + "</RelativeLayout>\n");
        return res;
    }

    private static String preferenceScreen(String rows) {
        return "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                + "<PreferenceScreen xmlns:android=\"http://schemas.android.com/apk/res/android\">\n"
                + "    " + rows + "\n"
                + "</PreferenceScreen>\n";
    }

    private static void writeXml(File dir, String name, String content) throws IOException {
        dir.mkdirs();
        Files.write(dir.toPath().resolve(name), content.getBytes(StandardCharsets.UTF_8));
    }

    private static Map<String, String> behaviours() {
        Map<String, String> behaviours = new LinkedHashMap<>();
        behaviours.put("sponsor", "skip-once");
        behaviours.put("selfpromo", "seekbar-only");
        behaviours.put("interaction", "seekbar-only");
        behaviours.put("intro", "seekbar-only");
        behaviours.put("outro", "seekbar-only");
        behaviours.put("poi_highlight", "seekbar-only");
        behaviours.put("preview", "ignore");
        behaviours.put("hook", "ignore");
        behaviours.put("filler", "ignore");
        behaviours.put("music_offtopic", "seekbar-only");
        return behaviours;
    }

    // --- assertions -----------------------------------------------------------------------------

    private static void assertRestructured(File res, String label) throws Exception {
        for (String main : new String[] {"settings_prefs.xml", "panel2_settings_prefs.xml"}) {
            Element root = root(new File(res, "xml/" + main));
            Element first = firstElementChild(root);
            assertTrue(first != null && "Preference".equals(first.getTagName())
                            && "ytvr_mod_settings".equals(first.getAttribute("android:key"))
                            && "Patch settings".equals(first.getAttribute("android:title")),
                    label + ": " + main + " must lead with the Patch settings row");
            assertFalse(keys(root).contains("ytvr_mod_old_flat_row"),
                    label + ": " + main + " must drop the old flat ytvr_mod_ row");
            if ("settings_prefs.xml".equals(main)) {
                assertTrue(keys(root).contains("developer_settings"),
                        label + ": " + main + " must keep the app's own developer_settings row");
            }
        }

        Element hub = root(new File(res, "xml/developer_settings_prefs.xml"));
        List<String> hubKeys = keys(hub);
        assertTrue(hubKeys.contains("ytvr_mod_sb_screen") && hubKeys.contains("ytvr_mod_verbose_logging"),
                label + ": the hub must be filled with both rows");
        assertFalse(hubKeys.contains("dead_developer_row"),
                label + ": the hub must replace the dead row");
        assertEquals("false", attributeOf(hub, "ytvr_mod_verbose_logging", "android:defaultValue"),
                label + ": the hub's verbose switch must default to false");

        Element sb = root(new File(res, "xml/prefs_screen.xml"));
        List<String> sbKeys = keys(sb);
        assertTrue(sbKeys.contains("ytvr_mod_sb_enabled"),
                label + ": the SponsorBlock screen needs the master switch");
        for (String category : CATEGORIES) {
            assertTrue(sbKeys.contains("ytvr_mod_sb_behaviour_" + category),
                    label + ": the SponsorBlock screen needs the " + category + " picker");
        }
        assertTrue(sbKeys.contains("ytvr_mod_sb_stats") && sbKeys.contains("ytvr_mod_sb_min_duration"),
                label + ": the SponsorBlock screen keeps the display-only rows");
        assertFalse(sbKeys.contains("dead_framework_row"),
                label + ": the dead row must be replaced");
        assertEquals("@array/ytvr_sb_behaviour_entries",
                attributeOf(sb, "ytvr_mod_sb_behaviour_sponsor", "android:entries"),
                label + ": the sponsor picker must use the generic behaviour array");
        assertEquals("@array/ytvr_sb_highlight_entries",
                attributeOf(sb, "ytvr_mod_sb_behaviour_poi_highlight", "android:entries"),
                label + ": the highlight picker must use its own array");
        assertEquals("skip-once",
                attributeOf(sb, "ytvr_mod_sb_behaviour_sponsor", "android:defaultValue"),
                label + ": the sponsor picker must default to the option the patch baked");

        Element arrays = root(new File(res, "values/arrays.xml"));
        // Five generic entries since manual-skip became a real behaviour (2026-10-14); four for
        // highlight, which does not offer skip-once.
        assertEquals(5, arraySize(arrays, "ytvr_sb_behaviour_entries"),
                label + ": the behaviour entry array must be added");
        assertEquals(5, arraySize(arrays, "ytvr_sb_behaviour_values"), label + ": behaviour values");
        assertEquals(4, arraySize(arrays, "ytvr_sb_highlight_entries"), label + ": highlight entries");
        assertEquals(4, arraySize(arrays, "ytvr_sb_highlight_values"), label + ": highlight values");
        assertEquals(1, arraySize(arrays, "some_existing_array"),
                label + ": the existing array must survive");

        Element holder = root(new File(res, "xml/deprecated_settings_holder_fragment.xml"));
        Element backButton = elementWithId(holder, "back_button_container");
        assertNotNull(backButton, label + ": the back button must survive the restructure");
        assertEquals("false", backButton.getAttribute("android:layout_centerHorizontal"),
                label + ": the back button must move to the top-left");
        assertEquals("true", backButton.getAttribute("android:layout_alignParentStart"),
                label + ": the back button must move to the top-left");
    }

    // --- tiny DOM helpers -----------------------------------------------------------------------

    private static Element root(File xml) throws Exception {
        Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(xml);
        return doc.getDocumentElement();
    }

    private static Element firstElementChild(Element parent) {
        NodeList children = parent.getChildNodes();
        for (int index = 0; index < children.getLength(); index++) {
            if (children.item(index) instanceof Element) {
                return (Element) children.item(index);
            }
        }
        return null;
    }

    private static List<String> keys(Element root) {
        List<String> keys = new ArrayList<>();
        NodeList nodes = root.getElementsByTagName("*");
        for (int index = 0; index < nodes.getLength(); index++) {
            Element element = (Element) nodes.item(index);
            String key = element.getAttribute("android:key");
            if (!key.isEmpty()) {
                keys.add(key);
            }
        }
        return keys;
    }

    private static String attributeOf(Element root, String key, String attribute) {
        NodeList nodes = root.getElementsByTagName("*");
        for (int index = 0; index < nodes.getLength(); index++) {
            Element element = (Element) nodes.item(index);
            if (key.equals(element.getAttribute("android:key"))) {
                return element.getAttribute(attribute);
            }
        }
        return null;
    }

    private static Element elementWithId(Element root, String id) {
        NodeList nodes = root.getElementsByTagName("*");
        for (int index = 0; index < nodes.getLength(); index++) {
            Element element = (Element) nodes.item(index);
            if (id.equals(element.getAttribute("android:id").replace("@+id/", ""))) {
                return element;
            }
        }
        return null;
    }

    private static int arraySize(Element root, String name) {
        NodeList nodes = root.getElementsByTagName("string-array");
        for (int index = 0; index < nodes.getLength(); index++) {
            Element element = (Element) nodes.item(index);
            if (name.equals(element.getAttribute("name"))) {
                return element.getElementsByTagName("item").getLength();
            }
        }
        return -1;
    }
}

/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-18.
 */
package app.morphe.extension.youtube.patches.general;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.pm.PackageInfo;

import org.json.JSONObject;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import java.lang.reflect.Field;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.xml.parsers.DocumentBuilderFactory;

import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.patches.general.ChangeStartPagePatch.StartPage;
import app.morphe.extension.youtube.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class ChangeStartPageTest {
    private static final String ARRAY_NAME = "revanced_change_start_page_";
    private static final String STRING_NAME = ARRAY_NAME + "entry_";
    private static final List<String> REMOVED_OPTIONS = List.of("EXPLORE", "HYPE", "PODCASTS", "TRENDING");

    @Before
    public void setUp() throws Exception {
        var context = RuntimeEnvironment.getApplication();
        PackageInfo packageInfo = new PackageInfo();
        packageInfo.packageName = context.getPackageName();
        packageInfo.versionName = "21.45.90";
        packageInfo.applicationInfo = context.getApplicationInfo();
        Shadows.shadowOf(context.getPackageManager()).installPackage(packageInfo);

        Field contextField = Utils.class.getDeclaredField("context");
        contextField.setAccessible(true);
        contextField.set(null, context);
    }

    @Test
    public void storedSelectionsKeepLibraryAndDropRemovedOptions() {
        var setting = Settings.CHANGE_START_PAGE;
        Setting.preferences.saveString(setting.key, "LIBRARY");
        Setting.privateSyncValueFromPreferences(setting);
        assertEquals(StartPage.LIBRARY, setting.get());
        assertEquals("FElibrary", setting.get().id);

        for (String removed : REMOVED_OPTIONS) {
            Setting.preferences.saveString(setting.key, removed);
            Setting.privateSyncValueFromPreferences(setting);
            assertEquals(removed, StartPage.DEFAULT, setting.get());
            assertFalse(removed, Setting.preferences.preferences.contains(setting.key));
        }
    }

    @Test
    public void importedSelectionsKeepLibraryAndDropRemovedOptions() throws Exception {
        var context = RuntimeEnvironment.getApplication();
        var setting = Settings.CHANGE_START_PAGE;
        for (String removed : REMOVED_OPTIONS) {
            Setting.importFromJSON(context, "\"change_start_page\":\"library\"");
            assertEquals(StartPage.LIBRARY, setting.get());
            String export = Setting.exportToJson(context);
            assertEquals("library", new JSONObject('{' + export + '}').getString("change_start_page"));

            Setting.importFromJSON(context, "\"change_start_page\":\"" + removed.toLowerCase(Locale.ROOT) + '"');
            assertEquals(removed, StartPage.DEFAULT, setting.get());
            assertFalse(removed, Setting.preferences.preferences.contains(setting.key));
        }
    }

    @Test
    public void labelsAndValuesStayPairedAcrossLocales() throws Exception {
        Path resources = Path.of("patches/src/main/resources/youtube");
        if (!Files.isDirectory(resources)) resources = Path.of("../../patches/src/main/resources/youtube");
        Path base = resources.resolve("settings/host/values");
        List<String> entries = arrayItems(base.resolve("arrays.xml"), ARRAY_NAME + "entries");
        List<String> values = arrayItems(base.resolve("arrays.xml"), ARRAY_NAME + "entry_values");
        assertEquals(values.size(), entries.size());
        assertEquals("DEFAULT", values.get(0));
        assertEquals(values.size(), new HashSet<>(values).size());
        Set<String> enumNames = new HashSet<>(Arrays.stream(StartPage.values()).map(Enum::name).toList());
        assertEquals(enumNames, new HashSet<>(values));

        Map<String, String> specialLabels = Map.of(
                "DEFAULT", "morphe_app_refresh_rate_default",
                "LIKED_VIDEO", STRING_NAME + "liked_videos",
                "MOVIE", STRING_NAME + "movies");
        for (int index = 0; index < values.size(); index++) {
            String value = values.get(index);
            String expected = specialLabels.getOrDefault(value, STRING_NAME + value.toLowerCase(Locale.ROOT));
            assertEquals(value, "@string/" + expected, entries.get(index));
        }

        var english = strings(base.resolve("strings.xml"));
        assertEquals("You", english.get(STRING_NAME + "library"));
        assertTrue("Explore is still used by the navigation bar editor", english.containsKey(STRING_NAME + "explore"));
        assertLabelsResolve(english, english, entries);

        try (var locales = Files.list(resources.resolve("translations"))) {
            for (Path locale : locales.filter(Files::isDirectory).sorted().toList()) {
                Path arrays = locale.resolve("arrays.xml");
                if (Files.exists(arrays)) {
                    assertTrue(locale.toString(), arrayItems(arrays, ARRAY_NAME + "entries").isEmpty());
                    assertTrue(locale.toString(), arrayItems(arrays, ARRAY_NAME + "entry_values").isEmpty());
                }

                Path strings = locale.resolve("strings.xml");
                if (Files.isRegularFile(strings)) assertLabelsResolve(english, strings(strings), entries);
            }
        }
    }

    private static void assertLabelsResolve(Map<String, String> english, Map<String, String> local,
                                            List<String> entries) {
        for (String entry : entries) {
            String key = entry.substring("@string/".length());
            assertFalse(entry, local.getOrDefault(key, english.getOrDefault(key, "")).isBlank());
        }
        for (String retired : List.of("hype", "podcasts", "trending")) {
            assertFalse(retired, local.containsKey(STRING_NAME + retired));
        }
    }

    private static List<String> arrayItems(Path file, String name) throws Exception {
        NodeList arrays = nodes(file, "string-array");
        for (int index = 0; index < arrays.getLength(); index++) {
            Element array = (Element) arrays.item(index);
            if (!name.equals(array.getAttribute("name"))) continue;

            NodeList items = array.getElementsByTagName("item");
            List<String> values = new ArrayList<>(items.getLength());
            for (int item = 0; item < items.getLength(); item++) values.add(items.item(item).getTextContent().trim());
            return values;
        }
        return List.of();
    }

    private static Map<String, String> strings(Path file) throws Exception {
        NodeList nodes = nodes(file, "string");
        Map<String, String> strings = new HashMap<>();
        for (int index = 0; index < nodes.getLength(); index++) {
            Element value = (Element) nodes.item(index);
            strings.put(value.getAttribute("name"), value.getTextContent());
        }
        return strings;
    }

    private static NodeList nodes(Path file, String tag) throws Exception {
        return DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(file.toFile()).getElementsByTagName(tag);
    }
}

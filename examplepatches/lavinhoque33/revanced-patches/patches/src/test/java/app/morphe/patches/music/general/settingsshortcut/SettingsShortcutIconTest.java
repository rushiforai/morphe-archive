/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-16.
 */
package app.morphe.patches.music.general.settingsshortcut;

import static org.junit.Assert.*;

import java.nio.file.Files;
import java.nio.file.Path;

import javax.xml.parsers.DocumentBuilderFactory;

import org.junit.Test;
import org.w3c.dom.Element;

public class SettingsShortcutIconTest {
    private static final String ANDROID = "http://schemas.android.com/apk/res/android";

    private Element drawable(String relativePath) throws Exception {
        Path resources = Path.of("src/main/resources");
        if (!Files.isDirectory(resources)) resources = Path.of("patches/src/main/resources");
        var factory = DocumentBuilderFactory.newInstance();
        factory.setNamespaceAware(true);
        Element root = factory.newDocumentBuilder().parse(resources.resolve(relativePath).toFile()).getDocumentElement();
        // APKEditor's compiler turns comments into text nodes; they must stay inside the drawable root.
        assertNull(root.getPreviousSibling());
        return root;
    }

    @Test
    public void regularKeepsTheNativeThinGear() throws Exception {
        Element icon = drawable("music/settings/drawable/revanced_toolbar_settings_shortcut_icon.xml");
        assertEquals("inset", icon.getTagName());
        assertEquals("@drawable/yt_outline_gear_vd_theme_24", icon.getAttributeNS(ANDROID, "drawable"));
    }

    @Test
    public void boldIsTheNativeVectorNotAnInflatedPreferenceIcon() throws Exception {
        Element icon = drawable("music/visual/icons/bold/drawable/revanced_toolbar_settings_shortcut_icon.xml");
        assertEquals("vector", icon.getTagName());
        assertEquals("24dp", icon.getAttributeNS(ANDROID, "width"));
        assertEquals("24dp", icon.getAttributeNS(ANDROID, "height"));
        assertEquals("24", icon.getAttributeNS(ANDROID, "viewportWidth"));
        assertEquals("24", icon.getAttributeNS(ANDROID, "viewportHeight"));

        Element path = (Element) icon.getElementsByTagName("path").item(0);
        assertFalse(path.hasAttributeNS(ANDROID, "strokeWidth"));
        assertTrue(path.getAttributeNS(ANDROID, "pathData").trim().startsWith("M12.844,1h-1.687"));
        assertTrue(path.getAttributeNS(ANDROID, "pathData").trim().endsWith("0,4Z"));
    }
}

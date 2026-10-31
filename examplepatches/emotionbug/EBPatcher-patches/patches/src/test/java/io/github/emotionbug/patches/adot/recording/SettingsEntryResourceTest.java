package io.github.emotionbug.patches.adot.recording;

import com.reandroid.apk.ApkModule;
import com.reandroid.arsc.chunk.xml.ResXmlElement;
import java.io.File;
import java.util.*;
import org.junit.*;
import static org.junit.Assert.*;

public class SettingsEntryResourceTest {
    @Test public void nativeRowIdsNamesAndTypesMatchTheSupportedApk() throws Exception {
        String path=System.getenv("EBPATCHER_TEST_APK");
        Assume.assumeTrue("Provide private original APK via EBPATCHER_TEST_APK",path!=null);
        try(var apk=ApkModule.loadApkFile(new File(path))) {
            apk.setLoadDefaultFramework(false);
            var table=apk.getTableBlock();
            assertEquals("settings_common_normal_row",table.getResource(0x7f0d01ca).getName());
            assertEquals("layout",table.getResource(0x7f0d01ca).getType());
            assertEquals("icn_new_circle_fill",table.getResource(0x7f08050a).getName());
            assertEquals("drawable",table.getResource(0x7f08050a).getType());
            assertEquals(2,table.getResource(0x7f08050a).getConfigsCount());
            Map<Integer,String> names=Map.ofEntries(
                Map.entry(0x7f0a0424,"item_layout"),Map.entry(0x7f0a07c8,"title"),Map.entry(0x7f0a053d,"next_icon"),
                Map.entry(0x7f0a03ec,"icon"),Map.entry(0x7f0a0773,"subtitle"),Map.entry(0x7f0a0718,"setting_value"),
                Map.entry(0x7f0a0695,"right_status_icon"),Map.entry(0x7f0a068f,"right_button"),
                Map.entry(0x7f0a0777,"switch_button"),Map.entry(0x7f0a01d6,"category_divider"),Map.entry(0x7f0a029e,"divide_line"));
            for(var entry:names.entrySet()) {
                assertEquals(entry.getValue(),table.getResource(entry.getKey()).getName());
                assertEquals("id",table.getResource(entry.getKey()).getType());
            }
            var row=apk.loadResXmlDocument(table.getResource(0x7f0d01ca).get().getValueAsString()).getDocumentElement();
            assertEquals("LinearLayout",row.getName());
            assertEquals(0x7f0d01c9,row.getElement("include").searchAttributeByName("layout").getData());
            assertEquals("settings_common_item_layout",table.getResource(0x7f0d01c9).getName());
            var content=apk.loadResXmlDocument(table.getResource(0x7f0d01c9).get().getValueAsString());
            Map<Integer,String> types=new HashMap<>();
            var children=content.recursiveElements();
            while(children.hasNext()) {
                ResXmlElement child=(ResXmlElement)children.next();
                var identifier=child.searchAttributeByResourceId(0x010100d0);
                if(identifier!=null) types.put(identifier.getData(),child.getName());
            }
            assertTrue(types.keySet().containsAll(names.keySet()));
            assertEquals("androidx.constraintlayout.widget.ConstraintLayout",types.get(0x7f0a0424));
            assertEquals("TextView",types.get(0x7f0a07c8));
            assertEquals("ImageView",types.get(0x7f0a053d));
            assertEquals("com.skt.prod.dialer.activities.main.MainActivity",apk.getAndroidManifest().getMainActivityClassName());
        }
    }
}

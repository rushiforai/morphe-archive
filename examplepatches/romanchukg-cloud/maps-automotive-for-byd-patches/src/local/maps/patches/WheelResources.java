// SPDX-License-Identifier: GPL-3.0-only
package local.maps.patches;

import java.nio.file.Files;
import java.nio.charset.StandardCharsets;
import app.morphe.patcher.patch.ResourcePatchContext;
import org.w3c.dom.*;

/** Key-only accessibility metadata; declaration never enables the service. */
final class WheelResources {
    static void apply(ResourcePatchContext context) throws Exception {
        // Arsclib requires new entry names in public.xml before encoding their values.
        // Append IDs within the existing types; every old ID stays unchanged.
        try(var doc=context.document("res/values/public.xml")){
            for(String[] entry:new String[][]{{"xml","maps_wheel_key_service"},{"string","maps_wheel_service_label"},{"string","maps_wheel_service_description"}}){
                long highest=-1;NodeList existing=doc.getElementsByTagName("public");
                for(int i=0;i<existing.getLength();i++){
                    Element value=(Element)existing.item(i);
                    if(entry[0].equals(value.getAttribute("type"))){
                        if(entry[1].equals(value.getAttribute("name")))throw new IllegalStateException("Wheel resource already declared");
                        highest=Math.max(highest,Long.decode(value.getAttribute("id")));
                    }
                }
                if(highest<0||(highest&65535)==65535)throw new IllegalStateException("No safe wheel resource ID in "+entry[0]);
                Element added=doc.createElement("public");added.setAttribute("type",entry[0]);added.setAttribute("name",entry[1]);
                added.setAttribute("id",String.format(java.util.Locale.ROOT,"0x%08x",highest+1));doc.getDocumentElement().appendChild(added);
            }
        }
        write(context,"res/xml/maps_wheel_key_service.xml", """
            <?xml version="1.0" encoding="utf-8"?>
            <accessibility-service xmlns:android="http://schemas.android.com/apk/res/android"
                android:accessibilityFeedbackType="feedbackGeneric"
                android:accessibilityFlags="flagRequestFilterKeyEvents"
                android:canRequestFilterKeyEvents="true"
                android:canRetrieveWindowContent="false"
                android:description="@string/maps_wheel_service_description"
                android:notificationTimeout="0" />
            """);
        // Pinned Arsclib infers a values-file type from its filename. A custom filename
        // would be treated as a new type instead of string, unlike Android aapt.
        try(var doc=context.document("res/values/strings.xml")){
            String[][] values={{"maps_wheel_service_label","Maps instrument cluster controls"},
                {"maps_wheel_service_description","Uses assigned steering wheel buttons to zoom the instrument cluster map. Does not read screen content."}};
            for(String[] value:values){
                Element added=doc.createElement("string");added.setAttribute("name",value[0]);added.setTextContent(value[1]);doc.getDocumentElement().appendChild(added);
            }
        }
    }
    private static void write(ResourcePatchContext context,String path,String value) throws Exception {
        var file=context.get(path,false).toPath();
        if(Files.exists(file))throw new IllegalStateException("Wheel resource already exists: "+path);
        Files.createDirectories(file.getParent());
        Files.writeString(file,value,StandardCharsets.UTF_8);
    }
    static void manifest(Document doc) {
        Element app=(Element)doc.getElementsByTagName("application").item(0);
        String name="local.maps.cluster.WheelKeyService";
        NodeList services=doc.getElementsByTagName("service");
        for(int i=0;i<services.getLength();i++)if(name.equals(((Element)services.item(i)).getAttribute("android:name")))
            throw new IllegalStateException("Wheel service already declared");
        Element service=doc.createElement("service");
        service.setAttribute("android:name",name);
        service.setAttribute("android:enabled","true");
        service.setAttribute("android:exported","true");
        service.setAttribute("android:permission","android.permission.BIND_ACCESSIBILITY_SERVICE");
        service.setAttribute("android:label","@string/maps_wheel_service_label");
        Element filter=doc.createElement("intent-filter"),action=doc.createElement("action");
        action.setAttribute("android:name","android.accessibilityservice.AccessibilityService");
        filter.appendChild(action);service.appendChild(filter);
        Element meta=doc.createElement("meta-data");
        meta.setAttribute("android:name","android.accessibilityservice");
        meta.setAttribute("android:resource","@xml/maps_wheel_key_service");
        service.appendChild(meta);app.appendChild(service);
    }
}

// SPDX-License-Identifier: GPL-3.0-only
package local.maps.patches;

import org.w3c.dom.*;

/** Own read-only reader components; no vehicle permission or ADB authorization is granted here. */
final class VehicleManifest {
    static void apply(Document doc) {
        Element manifest=doc.getDocumentElement();
        NodeList sdk=doc.getElementsByTagName("uses-sdk");
        if(sdk.getLength()!=1||!"30".equals(((Element)sdk.item(0)).getAttribute("android:minSdkVersion")))
            throw new IllegalStateException("Pinned AAOS input minSdk30 required for API29 experiment");
        ((Element)sdk.item(0)).setAttribute("android:minSdkVersion","29");
        // Same code as private25.2 permits a data-preserving update and rollback.
        // Original-input metadata is checked before this output-only mutation.
        manifest.setAttribute("android:versionCode","1068820722");
        for(String permission:new String[]{"android.permission.INTERNET","android.permission.RECEIVE_BOOT_COMPLETED","android.permission.PACKAGE_USAGE_STATS"}) {
            boolean present=false;
            NodeList existing=doc.getElementsByTagName("uses-permission");
            for(int i=0;i<existing.getLength();i++)
                if(permission.equals(((Element)existing.item(i)).getAttribute("android:name")))present=true;
            if(!present){Element use=doc.createElement("uses-permission");use.setAttribute("android:name",permission);manifest.appendChild(use);}
        }
        Element app=(Element)doc.getElementsByTagName("application").item(0);
        Element receiver=doc.createElement("receiver");
        receiver.setAttribute("android:name","local.maps.cluster.VehicleAutoBoot");
        receiver.setAttribute("android:enabled","true");receiver.setAttribute("android:exported","false");
        Element filter=doc.createElement("intent-filter");
        for(String action:new String[]{"android.intent.action.BOOT_COMPLETED","android.intent.action.MY_PACKAGE_REPLACED"}){
            Element e=doc.createElement("action");e.setAttribute("android:name",action);filter.appendChild(e);
        }
        receiver.appendChild(filter);app.appendChild(receiver);
        Element job=doc.createElement("service");
        job.setAttribute("android:name","local.maps.cluster.VehicleAutoJob");
        job.setAttribute("android:enabled","true");job.setAttribute("android:exported","true");
        job.setAttribute("android:permission","android.permission.BIND_JOB_SERVICE");app.appendChild(job);
    }
}

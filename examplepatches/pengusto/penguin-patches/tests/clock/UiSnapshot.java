/* SPDX-License-Identifier: GPL-3.0-only */
package io.github.pengusto.patches.clock.ui;

import android.app.Instrumentation;
import android.os.Bundle;
import android.util.Base64;
import android.util.Xml;
import android.view.accessibility.AccessibilityNodeInfo;
import java.io.StringWriter;
import org.xmlpull.v1.XmlSerializer;

/** Read fresh accessibility state without requiring Clock's ticking views to go idle. */
public final class UiSnapshot extends Instrumentation {
    @Override public void onCreate(Bundle args) { super.onCreate(args); start(); }
    private void write(XmlSerializer xml, AccessibilityNodeInfo node) throws Exception {
        if (node == null) return;
        xml.startTag(null, "node");
        xml.attribute(null, "text", String.valueOf(node.getText() == null ? "" : node.getText()));
        xml.attribute(null, "content-desc", String.valueOf(node.getContentDescription() == null ? "" : node.getContentDescription()));
        xml.attribute(null, "resource-id", node.getViewIdResourceName() == null ? "" : node.getViewIdResourceName());
        xml.attribute(null, "package", String.valueOf(node.getPackageName()));
        xml.attribute(null, "class", String.valueOf(node.getClassName()));
        xml.attribute(null, "checked", Boolean.toString(node.isChecked()));
        xml.attribute(null, "visible", Boolean.toString(node.isVisibleToUser()));
        android.graphics.Rect bounds = new android.graphics.Rect(); node.getBoundsInScreen(bounds);
        xml.attribute(null, "bounds", bounds.toShortString());
        for (int i = 0; i < node.getChildCount(); i++) write(xml, node.getChild(i));
        xml.endTag(null, "node");
    }
    @Override public void onStart() {
        Bundle result = new Bundle();
        try {
            android.app.UiAutomation ui = getUiAutomation();
            android.accessibilityservice.AccessibilityServiceInfo info = ui.getServiceInfo();
            info.flags |= android.accessibilityservice.AccessibilityServiceInfo.FLAG_REPORT_VIEW_IDS
                | android.accessibilityservice.AccessibilityServiceInfo.FLAG_RETRIEVE_INTERACTIVE_WINDOWS;
            ui.setServiceInfo(info);
            AccessibilityNodeInfo root = null;
            for (int attempt = 0; attempt < 40 && root == null; attempt++) {
                root = ui.getRootInActiveWindow();
                if (root == null) {
                    for (android.view.accessibility.AccessibilityWindowInfo window : ui.getWindows()) {
                        if (window.isFocused()) root = window.getRoot();
                    }
                }
                if (root == null) Thread.sleep(100);
            }
            if (root == null) throw new IllegalStateException("No active accessibility window");
            StringWriter text = new StringWriter(); XmlSerializer xml = Xml.newSerializer(); xml.setOutput(text);
            write(xml, root); xml.flush();
            result.putString("xml", Base64.encodeToString(text.toString().getBytes("UTF-8"), Base64.NO_WRAP));
            finish(-1, result);
        } catch (Exception error) {
            result.putString("error", android.util.Log.getStackTraceString(error)); finish(0, result);
        }
    }
}

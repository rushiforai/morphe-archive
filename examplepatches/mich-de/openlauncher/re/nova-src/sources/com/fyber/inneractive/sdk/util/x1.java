package com.fyber.inneractive.sdk.util;

import android.text.TextUtils;
import java.util.ArrayList;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/* loaded from: classes3.dex */
public abstract class x1 {
    public static Integer a(Node node, String str) {
        String strB = b(node, str);
        if (TextUtils.isEmpty(strB)) {
            return null;
        }
        try {
            return Integer.valueOf(strB);
        } catch (NumberFormatException unused) {
            return null;
        }
    }

    public static String b(Node node, String str) {
        Node namedItem;
        if (node == null || (namedItem = node.getAttributes().getNamedItem(str)) == null) {
            return null;
        }
        return namedItem.getNodeValue();
    }

    public static ArrayList c(Node node, String str) {
        ArrayList arrayList = new ArrayList();
        NodeList childNodes = node.getChildNodes();
        for (int i5 = 0; i5 < childNodes.getLength(); i5++) {
            Node nodeItem = childNodes.item(i5);
            if (nodeItem.getNodeName().equals(str)) {
                arrayList.add(nodeItem);
            }
        }
        return arrayList;
    }

    public static Node d(Node node, String str) {
        if (node == null) {
            return null;
        }
        NodeList childNodes = node.getChildNodes();
        for (int i5 = 0; i5 < childNodes.getLength(); i5++) {
            Node nodeItem = childNodes.item(i5);
            if (nodeItem.getNodeName().equals(str)) {
                return nodeItem;
            }
        }
        return null;
    }

    public static String a(Node node) {
        if (node == null || node.getFirstChild() == null || node.getFirstChild().getNodeValue() == null) {
            return null;
        }
        return node.getFirstChild().getNodeValue().trim();
    }
}

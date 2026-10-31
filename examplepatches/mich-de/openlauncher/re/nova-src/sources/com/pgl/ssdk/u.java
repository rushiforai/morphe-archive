package com.pgl.ssdk;

import android.accessibilityservice.AccessibilityServiceInfo;
import android.content.Context;
import android.view.accessibility.AccessibilityManager;
import b.u4;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes4.dex */
public class u {

    /* renamed from: a, reason: collision with root package name */
    private static AccessibilityManager f42379a;

    private static AccessibilityManager a(Context context) {
        if (f42379a == null) {
            f42379a = (AccessibilityManager) context.getSystemService("accessibility");
        }
        return f42379a;
    }

    public static String b(Context context) {
        AccessibilityManager accessibilityManagerA;
        List<AccessibilityServiceInfo> enabledAccessibilityServiceList;
        if (context == null || (accessibilityManagerA = a(context)) == null || (enabledAccessibilityServiceList = accessibilityManagerA.getEnabledAccessibilityServiceList(-1)) == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        for (int i5 = 0; i5 < enabledAccessibilityServiceList.size(); i5++) {
            AccessibilityServiceInfo accessibilityServiceInfo = enabledAccessibilityServiceList.get(i5);
            if (accessibilityServiceInfo != null) {
                String strM = u4.m(accessibilityServiceInfo.getResolveInfo().serviceInfo.packageName, "#", accessibilityServiceInfo.getResolveInfo().serviceInfo.name);
                if (!arrayList.contains(strM)) {
                    arrayList.add(strM);
                }
            }
        }
        return String.join(",", arrayList);
    }
}

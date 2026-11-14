package android.view.accessibility;

import android.graphics.Region;
import android.view.View;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Android 10's AccessibilityNodeInfo.TouchDelegateInfo for Android 9, where the class does not exist (patch
 * "Android 9 (API 28)"). A top-level class under the nested class's binary name; loaded only on Android 9 (classes
 * load parent first). Android 9 never asks for it (accessibility nodes have no touch delegate info there), so it only
 * holds the regions Maps gives it.
 */
public final class AccessibilityNodeInfo$TouchDelegateInfo {
    private final List<Region> regions = new ArrayList<>();
    private final List<View> views = new ArrayList<>();

    public AccessibilityNodeInfo$TouchDelegateInfo(Map<Region, View> targetMap) {
        if (targetMap == null || targetMap.isEmpty()) {
            throw new IllegalArgumentException("targetMap should not be empty.");
        }
        for (Map.Entry<Region, View> entry : targetMap.entrySet()) {
            regions.add(entry.getKey());
            views.add(entry.getValue());
        }
    }

    public int getRegionCount() {
        return regions.size();
    }

    public Region getRegionAt(int index) {
        return regions.get(index);
    }
}

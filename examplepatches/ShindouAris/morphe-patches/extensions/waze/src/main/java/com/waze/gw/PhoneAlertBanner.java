package com.waze.gw;

import java.lang.ref.WeakReference;
import java.util.ArrayList;

/** Phone-only prototype: identity provenance, never presentation-type gating. */
public final class PhoneAlertBanner {
    private static final ArrayList<WeakReference<Object>> alerts = new ArrayList<>();
    private static final ArrayList<WeakReference<Object>> phones = new ArrayList<>();
    private PhoneAlertBanner() {}

    private static boolean contains(ArrayList<WeakReference<Object>> list, Object value) {
        boolean found = false;
        for (int i = list.size() - 1; i >= 0; i--) {
            Object item = list.get(i).get();
            if (item == null) list.remove(i);
            else if (item == value) found = true;
        }
        return found;
    }

    public static synchronized void markAlert(Object state) {
        if (state != null && !contains(alerts, state)) alerts.add(new WeakReference<>(state));
    }

    public static synchronized void markPhone(Object owner) {
        if (owner != null && !contains(phones, owner)) phones.add(new WeakReference<>(owner));
    }

    public static int unscaleBound(int bound, float scale) {
        return bound == Integer.MAX_VALUE ? bound : Math.round(bound / scale);
    }

    public static synchronized float scale(Object owner, Object displayed, Object target) {
        // Scale the content being drawn, not the next card during its exit.
        // The measurement callback passes its own target as displayed.
        Object state = displayed != null ? displayed : target;
        if (!contains(phones, owner) || !contains(alerts, state)) return 1f;
        return Math.max(60, Math.min(100, Gateway.phoneAlertBannerSize())) / 100f;
    }
}

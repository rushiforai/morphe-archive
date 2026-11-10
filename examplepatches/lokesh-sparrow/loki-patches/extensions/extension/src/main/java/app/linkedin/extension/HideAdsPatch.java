/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * Ad removal for the main (native) feed.
 *
 * <p>The feed builds its next list with collectionTemplate.copyWithNewElements(updates); the patch
 * replaces that call with this one, which drops the sponsored updates before handing them over.
 * An Update counts as an ad when update.metadata.trackingData.sponsoredTracking is present.
 */
@SuppressWarnings("unused")
public final class HideAdsPatch {
    /** Resolved once: the template class is the same for every call. */
    private static volatile Method cachedCopyMethod;

    /**
     * The same list the feed asked for, minus the ads. Whatever the real copyWithNewElements throws
     * is rethrown as thrown, because the feed's own error handling depends on it.
     */
    public static Object copyWithoutSponsored(Object collectionTemplate, List<Object> updates) throws Exception {
        Method copyMethod = cachedCopyMethod;
        if (copyMethod == null) {
            Class<?> templateType = collectionTemplate.getClass();
            copyMethod = templateType.getMethod("copyWithNewElements", List.class);
            cachedCopyMethod = copyMethod;
        }
        List<Object> wanted = withoutAds(updates);
        try {
            Object copy = copyMethod.invoke(collectionTemplate, wanted);
            return copy;
        } catch (InvocationTargetException failure) {
            // Unwrap so callers see the exception their own code threw, not the reflective wrapper.
            Throwable original = failure.getCause();
            if (original instanceof Exception) throw (Exception) original;
            throw failure;
        }
    }

    /** The updates that are not ads, or the very same list when there is nothing to remove. */
    static List<Object> withoutAds(List<Object> updates) {
        if (updates == null || updates.isEmpty()) return updates;
        if (!Settings.hideAds()) return updates;
        try {
            List<Object> kept = new ArrayList<>(updates.size());
            for (int i = 0; i < updates.size(); i++) {
                Object candidate = updates.get(i);
                if (isAd(candidate)) continue;
                kept.add(candidate);
            }
            int removed = updates.size() - kept.size();
            Settings.debugLog("legacy feed: removed " + removed + " of " + updates.size());
            return kept;
        } catch (Throwable failure) {
            Diagnostics.error("filterSponsored failed", failure);
            return updates;
        }
    }

    private static boolean isAd(Object update) {
        Object sponsorMarker = Reflect.get(Reflect.get(update, "metadata"), "trackingData");
        if (sponsorMarker == null) return false;
        return Reflect.get(sponsorMarker, "sponsoredTracking") != null;
    }
}

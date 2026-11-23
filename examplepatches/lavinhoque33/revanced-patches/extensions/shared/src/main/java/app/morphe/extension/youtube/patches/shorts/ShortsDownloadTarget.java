/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-22.
 */
package app.morphe.extension.youtube.patches.shorts;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.function.Consumer;
import java.util.function.Supplier;

/** Resolves a Shorts download tap against the reel currently selected by the native pager. */
public final class ShortsDownloadTarget {
    static final ShortsDownloadTarget INSTANCE = new ShortsDownloadTarget();

    public interface Source {
        @Nullable String patch_getActiveShortDownloadId();
    }

    private WeakReference<Source> source = new WeakReference<>(null);

    /** Injection point on resume of YouTube's Shorts watch fragment. */
    public static void onReelResumed(Source fragment) {
        INSTANCE.bind(fragment);
    }

    /** The modern patch enables this even if its native selector is unavailable; do not guess an ID. */
    static boolean usesNativeSource() {
        return false;
    }

    void bind(Source fragment) {
        if (source.get() != fragment) {
            source = new WeakReference<>(fragment);
        }
    }

    void launch(boolean shortsOpen, boolean nativeSource, Supplier<String> legacyVideoId,
                @Nullable Runnable dismiss, Consumer<String> launch, Runnable unavailable) {
        String videoId = null;
        if (shortsOpen) {
            if (nativeSource) {
                Source fragment = source.get();
                if (fragment != null) videoId = fragment.patch_getActiveShortDownloadId();
            } else {
                videoId = legacyVideoId.get();
            }
        }

        // Dismissal can change the view. Do not read the ID again when opening either backend.
        if (dismiss != null) dismiss.run();

        if (!isVideoId(videoId)) {
            unavailable.run();
            return;
        }
        launch.accept(videoId);
    }

    private static boolean isVideoId(@Nullable String videoId) {
        if (videoId == null || videoId.length() != 11) return false;

        for (int index = 0; index < 11; index++) {
            char character = videoId.charAt(index);
            if (!(character >= 'A' && character <= 'Z'
                    || character >= 'a' && character <= 'z'
                    || character >= '0' && character <= '9'
                    || character == '-' || character == '_')) return false;
        }
        return true;
    }
}

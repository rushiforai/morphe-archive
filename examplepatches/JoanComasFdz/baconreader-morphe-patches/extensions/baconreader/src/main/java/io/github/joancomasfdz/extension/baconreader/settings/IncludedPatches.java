// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.settings;

/**
 * Which patches with settings were applied. Each method returns false here, and the patch
 * makes it return true (IncludedPatches.kt), so the settings screen only shows what was patched.
 */
@SuppressWarnings("unused")
public final class IncludedPatches {
    private IncludedPatches() {
    }

    public static boolean embedCommentImages() {
        return false;
    }

    public static boolean improvePostMediaLoading() {
        return false;
    }

    public static boolean videoAutoplayInDetailView() {
        return false;
    }

    public static boolean promptToOpenRedditLinks() {
        return false;
    }

    public static boolean loadMoreComments() {
        return false;
    }

    public static boolean userAvatars() {
        return false;
    }

    public static boolean redditChat() {
        return false;
    }
}

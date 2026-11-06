/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 *
 * Modified by lavinhoque33, 2026-10-24
 */

package app.morphe.extension.shared.patches;

/**
 * Interface to use obfuscated methods.
 */
public interface ExoPlayerInterface {
    // Method is added during patching.
    void patch_setPlaybackParameters(float speed, float pitch);
}

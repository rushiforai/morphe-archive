/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This program is free software: you can redistribute it and/or modify it under the terms of the
 * GNU General Public License as published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * Written by lavinhoque33, 2026-10-24
 */

package app.morphe.extension.music.patches;

/**
 * Interface to reach the obfuscated methods of the ExoPlayer implementation.
 * The methods are added to the player class during patching.
 */
public interface FadePlayer {
    /**
     * Sets the volume of the player. Calls ExoPlayer.setVolume.
     */
    void patch_setFadeVolume(float volume);

    /**
     * @return The duration of the current item in milliseconds, or a value less than 1 if it is unknown (live).
     */
    long patch_getDurationMs();

    /**
     * @return The current playback position in milliseconds.
     */
    long patch_getPositionMs();
}

/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This program is free software: you can redistribute it and/or modify it under the terms of the
 * GNU General Public License as published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * Written by lavinhoque33, 2026-11-11
 */

package app.morphe.extension.music.patches;

/** Keeps an incoming player's fade gain separate from the app's track normalization. */
final class CrossfadeGain {
    private float appVolume;
    private float gain;

    CrossfadeGain(float appVolume) {
        this.appVolume = appVolume;
    }

    /** Native volume changes must not unmute a player that has not started fading in. */
    float onAppVolume(float volume) {
        appVolume = volume;
        return volume();
    }

    float setGain(float gain) {
        this.gain = gain;
        return volume();
    }

    float volume() {
        return gain * appVolume;
    }

    float appVolume() {
        return appVolume;
    }
}

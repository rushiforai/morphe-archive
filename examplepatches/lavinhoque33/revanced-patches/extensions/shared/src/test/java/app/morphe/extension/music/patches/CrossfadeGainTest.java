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

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class CrossfadeGainTest {
    private static final float EPSILON = 0.000001f;

    @Test
    public void incomingStaysSilentWhenNativeLoadRestoresVolumeBeforeReady() {
        CrossfadeGain incoming = new CrossfadeGain(0.6f);

        assertEquals(0.0f, incoming.volume(), EPSILON);
        assertEquals(0.0f, incoming.onAppVolume(1.0f), EPSILON);
        assertEquals(0.0f, incoming.onAppVolume(0.4f), EPSILON);
    }

    @Test
    public void firstAudibleEqualPowerGainIncludesNormalization() {
        CrossfadeGain incoming = new CrossfadeGain(1.0f);
        incoming.onAppVolume(0.4f);

        float firstGain = CrossfadeManager.FadeCurve.EQUAL_POWER.in(50.0f / 10000.0f);
        assertEquals(0.4f * firstGain, incoming.setGain(firstGain), EPSILON);
        assertEquals(0.4f, incoming.setGain(1.0f), EPSILON);
    }

    @Test
    public void normalizationChangeDuringFadeKeepsTheCurrentEnvelope() {
        CrossfadeGain incoming = new CrossfadeGain(0.6f);
        assertEquals(0.3f, incoming.setGain(0.5f), EPSILON);

        assertEquals(0.2f, incoming.onAppVolume(0.4f), EPSILON);
        assertEquals(0.4f, incoming.appVolume(), EPSILON);
        assertEquals(0.4f, incoming.setGain(1.0f), EPSILON);
    }

    @Test
    public void chainedIncomingPlayersDoNotShareNormalizationOrGain() {
        CrossfadeGain previous = new CrossfadeGain(0.4f);
        previous.setGain(0.5f);
        CrossfadeGain next = new CrossfadeGain(previous.appVolume());

        assertEquals(0.0f, next.onAppVolume(0.8f), EPSILON);
        assertEquals(0.2f, previous.volume(), EPSILON);
        assertEquals(0.4f, previous.appVolume(), EPSILON);
        assertEquals(0.8f, next.setGain(1.0f), EPSILON);
    }

    @Test
    public void restoringVolumeAfterAbortUsesLatestAppVolumeNotUnity() {
        CrossfadeGain incoming = new CrossfadeGain(0.6f);
        incoming.setGain(0.25f);
        incoming.onAppVolume(0.3f);

        assertEquals(0.3f, incoming.appVolume(), EPSILON);
        assertEquals(0.3f, incoming.setGain(1.0f), EPSILON);
    }
}

package com.eclipse.android.core.audio;

import nl.johninnl.eclipse.app.w06;

/**
 * Kept-name app class: the playback service the car link connects to. It is a Service (so a
 * Context); the extension assigns it to a Context before calling anything on it.
 */
public abstract class PlaybackService extends android.app.Service {
    public static volatile w06 I;
}

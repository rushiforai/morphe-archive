package com.facebook.rsys.audio.frame.gen;

import com.facebook.rsys.audio.frame.AudioFrameData;

/** Compile-only copy of Messenger's class. Messenger ships the real one, and this never reaches the extension's dex. */
public abstract class AudioFrame {
    public abstract AudioFrameData getAudioData();

    public abstract AudioFrameMetadata getMetadata();
}

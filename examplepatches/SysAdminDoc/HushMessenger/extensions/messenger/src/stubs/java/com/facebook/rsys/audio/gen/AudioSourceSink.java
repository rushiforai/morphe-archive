package com.facebook.rsys.audio.gen;

import com.facebook.rsys.audio.frame.gen.AudioFrame;

/** Compile-only copy of Messenger's class. Messenger ships the real one, and this never reaches the extension's dex. */
public abstract class AudioSourceSink {
    public abstract void onEncodedPacket(AudioEncodedPacket packet);

    public abstract void onFrame(AudioFrame frame);

    public abstract void onPositionUpdate(float x, float y, float z);
}

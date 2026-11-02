package com.facebook.rsys.audio.gen;

/** Compile-only copy of Messenger's class. Messenger ships the real one, and this never reaches the extension's dex. */
public abstract class AudioApi {
    public abstract void addSink(String stream, int type, AudioSourceSink sink);

    public abstract void removeSink(String stream, int type, AudioSourceSink sink);
}

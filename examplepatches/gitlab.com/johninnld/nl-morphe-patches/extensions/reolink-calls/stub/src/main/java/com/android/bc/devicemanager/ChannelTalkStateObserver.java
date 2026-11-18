package com.android.bc.devicemanager;

/** Compile-only native callback ABI; never packaged in the extension. */
public abstract class ChannelTalkStateObserver {
    public abstract void talkStateChange(Channel channel);
    public void talkMixAudioDataChange(Channel channel, BCAudioData audio) {}
}

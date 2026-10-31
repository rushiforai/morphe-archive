package com.google.android.exoplayer2.audio;

import fe.k0;

/* loaded from: classes3.dex */
public final class AudioSink$ConfigurationException extends Exception {

    /* renamed from: a, reason: collision with root package name */
    public final k0 f31445a;

    public AudioSink$ConfigurationException(AudioProcessor$UnhandledAudioFormatException audioProcessor$UnhandledAudioFormatException, k0 k0Var) {
        super(audioProcessor$UnhandledAudioFormatException);
        this.f31445a = k0Var;
    }

    public AudioSink$ConfigurationException(String str, k0 k0Var) {
        super(str);
        this.f31445a = k0Var;
    }
}

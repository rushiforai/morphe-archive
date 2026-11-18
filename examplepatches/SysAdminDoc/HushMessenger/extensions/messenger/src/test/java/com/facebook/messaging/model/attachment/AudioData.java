package com.facebook.messaging.model.attachment;

import android.net.Uri;

/**
 * A voice attachment's audio, shaped like the one Messenger builds: obfuscated field names, one address among them, and
 * the waveform and ids around it. Only the class name and the single address are what the extension reads.
 */
public final class AudioData {
    public int A00;
    public int A01;
    public Uri A02;
    public Object A03;
    public String A04;
    public boolean A05;
    public Long A06;
    public String A07;

    public AudioData(Uri address) {
        this.A02 = address;
        this.A00 = 3000;
        this.A04 = "audio/mpeg";
    }
}

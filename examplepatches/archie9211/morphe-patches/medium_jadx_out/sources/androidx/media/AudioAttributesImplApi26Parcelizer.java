package androidx.media;

import android.media.AudioAttributes;
import defpackage.nse;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class AudioAttributesImplApi26Parcelizer {
    public static AudioAttributesImplApi26 read(nse nseVar) {
        AudioAttributesImplApi26 audioAttributesImplApi26 = new AudioAttributesImplApi26();
        audioAttributesImplApi26.a = (AudioAttributes) nseVar.g(audioAttributesImplApi26.a, 1);
        audioAttributesImplApi26.b = nseVar.f(audioAttributesImplApi26.b, 2);
        return audioAttributesImplApi26;
    }

    public static void write(AudioAttributesImplApi26 audioAttributesImplApi26, nse nseVar) {
        nseVar.getClass();
        nseVar.k(audioAttributesImplApi26.a, 1);
        nseVar.j(audioAttributesImplApi26.b, 2);
    }
}

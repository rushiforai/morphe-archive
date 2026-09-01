package androidx.media;

import android.media.AudioAttributes;
import defpackage.nse;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class AudioAttributesImplApi21Parcelizer {
    public static AudioAttributesImplApi21 read(nse nseVar) {
        AudioAttributesImplApi21 audioAttributesImplApi21 = new AudioAttributesImplApi21();
        audioAttributesImplApi21.a = (AudioAttributes) nseVar.g(audioAttributesImplApi21.a, 1);
        audioAttributesImplApi21.b = nseVar.f(audioAttributesImplApi21.b, 2);
        return audioAttributesImplApi21;
    }

    public static void write(AudioAttributesImplApi21 audioAttributesImplApi21, nse nseVar) {
        nseVar.getClass();
        nseVar.k(audioAttributesImplApi21.a, 1);
        nseVar.j(audioAttributesImplApi21.b, 2);
    }
}

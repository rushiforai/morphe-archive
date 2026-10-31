package androidx.media;

import android.media.AudioAttributes;
import k7.a;

/* loaded from: classes2.dex */
public class AudioAttributesImplApi26Parcelizer {
    public static AudioAttributesImplApi26 read(a aVar) {
        AudioAttributesImplApi26 audioAttributesImplApi26 = new AudioAttributesImplApi26();
        audioAttributesImplApi26.f14733a = (AudioAttributes) aVar.g(audioAttributesImplApi26.f14733a, 1);
        audioAttributesImplApi26.f14734b = aVar.f(audioAttributesImplApi26.f14734b, 2);
        return audioAttributesImplApi26;
    }

    public static void write(AudioAttributesImplApi26 audioAttributesImplApi26, a aVar) {
        aVar.getClass();
        aVar.k(audioAttributesImplApi26.f14733a, 1);
        aVar.j(audioAttributesImplApi26.f14734b, 2);
    }
}

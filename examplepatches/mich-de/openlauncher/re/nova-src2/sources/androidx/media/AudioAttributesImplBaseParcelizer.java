package androidx.media;

import k7.a;

/* loaded from: classes2.dex */
public class AudioAttributesImplBaseParcelizer {
    public static AudioAttributesImplBase read(a aVar) {
        AudioAttributesImplBase audioAttributesImplBase = new AudioAttributesImplBase();
        audioAttributesImplBase.f14735a = aVar.f(audioAttributesImplBase.f14735a, 1);
        audioAttributesImplBase.f14736b = aVar.f(audioAttributesImplBase.f14736b, 2);
        audioAttributesImplBase.f14737c = aVar.f(audioAttributesImplBase.f14737c, 3);
        audioAttributesImplBase.f14738d = aVar.f(audioAttributesImplBase.f14738d, 4);
        return audioAttributesImplBase;
    }

    public static void write(AudioAttributesImplBase audioAttributesImplBase, a aVar) {
        aVar.getClass();
        aVar.j(audioAttributesImplBase.f14735a, 1);
        aVar.j(audioAttributesImplBase.f14736b, 2);
        aVar.j(audioAttributesImplBase.f14737c, 3);
        aVar.j(audioAttributesImplBase.f14738d, 4);
    }
}

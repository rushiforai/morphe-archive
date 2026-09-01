package androidx.media;

import defpackage.nse;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class AudioAttributesImplBaseParcelizer {
    public static AudioAttributesImplBase read(nse nseVar) {
        AudioAttributesImplBase audioAttributesImplBase = new AudioAttributesImplBase();
        audioAttributesImplBase.a = 0;
        audioAttributesImplBase.b = 0;
        audioAttributesImplBase.c = 0;
        audioAttributesImplBase.d = -1;
        audioAttributesImplBase.a = nseVar.f(0, 1);
        audioAttributesImplBase.b = nseVar.f(audioAttributesImplBase.b, 2);
        audioAttributesImplBase.c = nseVar.f(audioAttributesImplBase.c, 3);
        audioAttributesImplBase.d = nseVar.f(audioAttributesImplBase.d, 4);
        return audioAttributesImplBase;
    }

    public static void write(AudioAttributesImplBase audioAttributesImplBase, nse nseVar) {
        nseVar.getClass();
        nseVar.j(audioAttributesImplBase.a, 1);
        nseVar.j(audioAttributesImplBase.b, 2);
        nseVar.j(audioAttributesImplBase.c, 3);
        nseVar.j(audioAttributesImplBase.d, 4);
    }
}

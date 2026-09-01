package androidx.media;

import defpackage.nse;
import defpackage.pse;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class AudioAttributesCompatParcelizer {
    public static AudioAttributesCompat read(nse nseVar) {
        AudioAttributesCompat audioAttributesCompat = new AudioAttributesCompat();
        pse pseVarH = audioAttributesCompat.a;
        if (nseVar.e(1)) {
            pseVarH = nseVar.h();
        }
        audioAttributesCompat.a = (AudioAttributesImpl) pseVarH;
        return audioAttributesCompat;
    }

    public static void write(AudioAttributesCompat audioAttributesCompat, nse nseVar) {
        nseVar.getClass();
        AudioAttributesImpl audioAttributesImpl = audioAttributesCompat.a;
        nseVar.i(1);
        nseVar.l(audioAttributesImpl);
    }
}

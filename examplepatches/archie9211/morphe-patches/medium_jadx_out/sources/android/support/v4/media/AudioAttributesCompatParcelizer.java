package android.support.v4.media;

import androidx.media.AudioAttributesCompat;
import defpackage.nse;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class AudioAttributesCompatParcelizer extends androidx.media.AudioAttributesCompatParcelizer {
    public static AudioAttributesCompat read(nse nseVar) {
        return androidx.media.AudioAttributesCompatParcelizer.read(nseVar);
    }

    public static void write(AudioAttributesCompat audioAttributesCompat, nse nseVar) {
        androidx.media.AudioAttributesCompatParcelizer.write(audioAttributesCompat, nseVar);
    }
}

package androidx.media;

import java.lang.reflect.InvocationTargetException;
import k7.a;
import k7.c;

/* loaded from: classes2.dex */
public class AudioAttributesCompatParcelizer {
    public static AudioAttributesCompat read(a aVar) {
        AudioAttributesCompat audioAttributesCompat = new AudioAttributesCompat();
        c cVarH = audioAttributesCompat.f14732a;
        if (aVar.e(1)) {
            cVarH = aVar.h();
        }
        audioAttributesCompat.f14732a = (AudioAttributesImpl) cVarH;
        return audioAttributesCompat;
    }

    public static void write(AudioAttributesCompat audioAttributesCompat, a aVar) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        aVar.getClass();
        AudioAttributesImpl audioAttributesImpl = audioAttributesCompat.f14732a;
        aVar.i(1);
        aVar.l(audioAttributesImpl);
    }
}

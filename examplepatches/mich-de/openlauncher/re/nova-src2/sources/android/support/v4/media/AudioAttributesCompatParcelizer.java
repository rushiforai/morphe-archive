package android.support.v4.media;

import androidx.media.AudioAttributesCompat;
import java.lang.reflect.InvocationTargetException;

/* loaded from: classes2.dex */
public final class AudioAttributesCompatParcelizer extends androidx.media.AudioAttributesCompatParcelizer {
    public static AudioAttributesCompat read(k7.a aVar) {
        return androidx.media.AudioAttributesCompatParcelizer.read(aVar);
    }

    public static void write(AudioAttributesCompat audioAttributesCompat, k7.a aVar) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        androidx.media.AudioAttributesCompatParcelizer.write(audioAttributesCompat, aVar);
    }
}

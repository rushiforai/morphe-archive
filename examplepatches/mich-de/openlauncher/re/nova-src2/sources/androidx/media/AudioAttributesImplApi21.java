package androidx.media;

import android.media.AudioAttributes;

/* loaded from: classes2.dex */
public class AudioAttributesImplApi21 implements AudioAttributesImpl {

    /* renamed from: a, reason: collision with root package name */
    public AudioAttributes f14733a;

    /* renamed from: b, reason: collision with root package name */
    public int f14734b = -1;

    public final boolean equals(Object obj) {
        if (obj instanceof AudioAttributesImplApi21) {
            return this.f14733a.equals(((AudioAttributesImplApi21) obj).f14733a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f14733a.hashCode();
    }

    public final String toString() {
        return "AudioAttributesCompat: audioattributes=" + this.f14733a;
    }
}

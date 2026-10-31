package androidx.media;

import android.util.SparseIntArray;
import k7.c;

/* loaded from: classes2.dex */
public class AudioAttributesCompat implements c {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ int f14731b = 0;

    /* renamed from: a, reason: collision with root package name */
    public AudioAttributesImpl f14732a;

    static {
        SparseIntArray sparseIntArray = new SparseIntArray();
        sparseIntArray.put(5, 1);
        sparseIntArray.put(6, 2);
        sparseIntArray.put(7, 2);
        sparseIntArray.put(8, 1);
        sparseIntArray.put(9, 1);
        sparseIntArray.put(10, 1);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof AudioAttributesCompat)) {
            return false;
        }
        AudioAttributesCompat audioAttributesCompat = (AudioAttributesCompat) obj;
        AudioAttributesImpl audioAttributesImpl = this.f14732a;
        return audioAttributesImpl == null ? audioAttributesCompat.f14732a == null : audioAttributesImpl.equals(audioAttributesCompat.f14732a);
    }

    public final int hashCode() {
        return this.f14732a.hashCode();
    }

    public final String toString() {
        return this.f14732a.toString();
    }
}

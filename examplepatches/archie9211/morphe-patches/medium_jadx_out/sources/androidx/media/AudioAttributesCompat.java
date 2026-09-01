package androidx.media;

import android.util.SparseIntArray;
import defpackage.pse;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class AudioAttributesCompat implements pse {
    public static final /* synthetic */ int b = 0;
    public AudioAttributesImpl a;

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
        AudioAttributesImpl audioAttributesImpl = this.a;
        AudioAttributesImpl audioAttributesImpl2 = ((AudioAttributesCompat) obj).a;
        return audioAttributesImpl == null ? audioAttributesImpl2 == null : audioAttributesImpl.equals(audioAttributesImpl2);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return this.a.toString();
    }
}

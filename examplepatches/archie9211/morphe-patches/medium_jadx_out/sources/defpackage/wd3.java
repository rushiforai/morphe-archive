package defpackage;

import com.medium.android.data.settings.Frequency;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wd3 {
    public final Frequency a;

    public wd3(Frequency frequency) {
        this.a = frequency;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof wd3) && this.a == ((wd3) obj).a;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "OnFrequencyChanged(frequency=" + this.a + ")";
    }
}

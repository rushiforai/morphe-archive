package defpackage;

import androidx.compose.runtime.tooling.Dp.CspinKvYN;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class b97 implements e97 {
    public final boolean a;

    public b97(boolean z) {
        this.a = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof b97) && this.a == ((b97) obj).a;
    }

    public final int hashCode() {
        return this.a ? 1231 : 1237;
    }

    public final String toString() {
        return b09.z("IsLoading(isLoading=", CspinKvYN.sXpR, this.a);
    }
}

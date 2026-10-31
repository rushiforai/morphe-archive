package r2;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final int f85330a;

    public final boolean equals(Object obj) {
        if (obj instanceof a) {
            return this.f85330a == ((a) obj).f85330a;
        }
        return false;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f85330a);
    }

    public final String toString() {
        int i5 = this.f85330a;
        return i5 == 1 ? "Touch" : i5 == 2 ? "Keyboard" : k.f40331e;
    }
}

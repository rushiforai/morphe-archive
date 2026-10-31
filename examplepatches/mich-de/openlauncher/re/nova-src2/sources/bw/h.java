package bw;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class h implements j {

    /* renamed from: a, reason: collision with root package name */
    public final m f18665a;

    public h(m mVar) {
        this.f18665a = mVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof h) && Intrinsics.b(this.f18665a, ((h) obj).f18665a);
    }

    public final int hashCode() {
        return this.f18665a.hashCode();
    }

    public final String toString() {
        return "Completed(scannedCard=" + this.f18665a + ")";
    }
}

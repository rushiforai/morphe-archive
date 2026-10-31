package ew;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final List f53047a;

    public g(List autocompletePredictions) {
        Intrinsics.g(autocompletePredictions, "autocompletePredictions");
        this.f53047a = autocompletePredictions;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof g) && Intrinsics.b(this.f53047a, ((g) obj).f53047a);
    }

    public final int hashCode() {
        return this.f53047a.hashCode();
    }

    public final String toString() {
        return "FindAutocompletePredictionsResponse(autocompletePredictions=" + this.f53047a + ")";
    }
}

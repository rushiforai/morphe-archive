package ux;

import kotlin.jvm.internal.Intrinsics;
import ps.e0;

/* loaded from: classes4.dex */
public final class j extends e0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f91620a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f91621b;

    public j(String str, boolean z11) {
        this.f91620a = str;
        this.f91621b = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j)) {
            return false;
        }
        j jVar = (j) obj;
        return Intrinsics.b(this.f91620a, jVar.f91620a) && this.f91621b == jVar.f91621b;
    }

    public final int hashCode() {
        String str = this.f91620a;
        return Boolean.hashCode(this.f91621b) + ((str == null ? 0 : str.hashCode()) * 31);
    }

    public final String toString() {
        return "Insight(insightText=" + this.f91620a + ", isGenerating=" + this.f91621b + ")";
    }
}

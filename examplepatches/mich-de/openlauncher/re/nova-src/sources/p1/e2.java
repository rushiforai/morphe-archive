package p1;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class e2 {

    /* renamed from: a, reason: collision with root package name */
    public final o f81401a;

    public /* synthetic */ e2(o oVar) {
        this.f81401a = oVar;
    }

    public static final /* synthetic */ e2 a(o oVar) {
        return new e2(oVar);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof e2) {
            return Intrinsics.b(this.f81401a, ((e2) obj).f81401a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f81401a.hashCode();
    }

    public final String toString() {
        return "SkippableUpdater(composer=" + this.f81401a + ')';
    }
}

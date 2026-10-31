package ru;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class s implements u {

    /* renamed from: a, reason: collision with root package name */
    public final j f86382a;

    public s(j jVar) {
        this.f86382a = jVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof s) && Intrinsics.b(this.f86382a, ((s) obj).f86382a);
    }

    public final int hashCode() {
        return this.f86382a.hashCode();
    }

    @Override // ru.u
    public final String j() {
        return "failure";
    }

    public final String toString() {
        return "Failure(error=" + this.f86382a + ")";
    }
}

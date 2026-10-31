package uo;

import java.io.Serializable;

/* loaded from: classes4.dex */
public final class h implements Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final String f91437a;

    public h(String str) {
        this.f91437a = str;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof h) {
            return this.f91437a.equalsIgnoreCase(((h) obj).f91437a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f91437a.toLowerCase().hashCode();
    }

    public final String toString() {
        return this.f91437a;
    }
}

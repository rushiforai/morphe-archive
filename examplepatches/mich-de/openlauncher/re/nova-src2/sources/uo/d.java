package uo;

import java.io.Serializable;

/* loaded from: classes4.dex */
public final class d implements Serializable {

    /* renamed from: b, reason: collision with root package name */
    public static final d f91423b = new d("DEF");

    /* renamed from: a, reason: collision with root package name */
    public final String f91424a;

    public d(String str) {
        this.f91424a = str;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof d) {
            return this.f91424a.equals(((d) obj).f91424a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f91424a.hashCode();
    }

    public final String toString() {
        return this.f91424a;
    }
}

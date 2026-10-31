package uo;

import java.io.Serializable;
import java.util.Objects;

/* loaded from: classes4.dex */
public class a implements Serializable {

    /* renamed from: b, reason: collision with root package name */
    public static final a f91408b = new a("none");

    /* renamed from: a, reason: collision with root package name */
    public final String f91409a;

    public a(String str) {
        Objects.requireNonNull(str);
        this.f91409a = str;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof a) {
            return this.f91409a.equals(((a) obj).f91409a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f91409a.hashCode();
    }

    public final String toString() {
        return this.f91409a;
    }
}

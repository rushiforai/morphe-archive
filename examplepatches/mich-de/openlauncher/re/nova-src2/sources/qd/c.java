package qd;

import b.c0;

/* loaded from: classes.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final String f83917a;

    public c(String str) {
        if (str == null) {
            throw new NullPointerException("name is null");
        }
        this.f83917a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        return this.f83917a.equals(((c) obj).f83917a);
    }

    public final int hashCode() {
        return this.f83917a.hashCode() ^ 1000003;
    }

    public final String toString() {
        return c0.q(new StringBuilder("Encoding{name=\""), this.f83917a, "\"}");
    }
}

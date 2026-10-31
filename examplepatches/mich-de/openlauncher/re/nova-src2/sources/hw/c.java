package hw;

import b.c9;

/* loaded from: classes4.dex */
public final class c {
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof c) && Float.compare(1.0f, 1.0f) == 0 && Float.compare(0.0f, 0.0f) == 0;
    }

    public final int hashCode() {
        return Boolean.hashCode(true) + c9.f(a80.m.d(0.0f, Float.hashCode(1.0f) * 31, 31), 31, true);
    }

    public final String toString() {
        return "EmbeddedFlatStyle(separatorThickness=1.0, separatorInsets=0.0, topSeparatorEnabled=true, bottomSeparatorEnabled=true)";
    }
}

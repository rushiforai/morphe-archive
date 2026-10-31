package o7;

/* loaded from: classes2.dex */
public final class n extends p {
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return obj != null && n.class == obj.getClass();
    }

    public final int hashCode() {
        return n.class.getName().hashCode();
    }

    public final String toString() {
        return "Retry";
    }
}

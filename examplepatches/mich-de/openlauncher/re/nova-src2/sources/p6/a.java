package p6;

/* loaded from: classes2.dex */
public final class a extends e0 {
    @Override // p6.e0
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof a) || !super.equals(obj)) {
            return false;
        }
        return true;
    }

    @Override // p6.e0
    public final int hashCode() {
        return super.hashCode() * 961;
    }
}

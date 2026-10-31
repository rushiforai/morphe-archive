package j3;

/* loaded from: classes.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final int f68785a;

    public final boolean equals(Object obj) {
        if (obj instanceof h) {
            return this.f68785a == ((h) obj).f68785a;
        }
        return false;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f68785a);
    }

    public final String toString() {
        int i5 = this.f68785a;
        return i5 == 0 ? "Button" : i5 == 1 ? "Checkbox" : i5 == 2 ? "Switch" : i5 == 3 ? "RadioButton" : i5 == 4 ? "Tab" : i5 == 5 ? "Image" : i5 == 6 ? "DropdownList" : i5 == 7 ? "Picker" : i5 == 8 ? "Carousel" : "Unknown";
    }
}

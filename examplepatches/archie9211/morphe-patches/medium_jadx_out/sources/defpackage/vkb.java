package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vkb {
    public final int a;

    public final boolean equals(Object obj) {
        if (obj instanceof vkb) {
            return this.a == ((vkb) obj).a;
        }
        return false;
    }

    public final int hashCode() {
        return this.a;
    }

    public final String toString() {
        int i = this.a;
        return i == 0 ? "Button" : i == 1 ? "Checkbox" : i == 2 ? "Switch" : i == 3 ? "RadioButton" : i == 4 ? "Tab" : i == 5 ? "Image" : i == 6 ? "DropdownList" : i == 7 ? "Picker" : i == 8 ? "Carousel" : "Unknown";
    }
}

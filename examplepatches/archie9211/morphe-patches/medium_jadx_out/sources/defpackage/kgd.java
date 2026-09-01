package defpackage;

import android.text.Layout;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class kgd {
    public static final Layout.Alignment a;
    public static final Layout.Alignment b;

    static {
        Layout.Alignment[] alignmentArrValues = Layout.Alignment.values();
        Layout.Alignment alignment = Layout.Alignment.ALIGN_NORMAL;
        Layout.Alignment alignment2 = alignment;
        for (Layout.Alignment alignment3 : alignmentArrValues) {
            if (g76.L(alignment3.name(), "ALIGN_LEFT")) {
                alignment = alignment3;
            } else if (g76.L(alignment3.name(), "ALIGN_RIGHT")) {
                alignment2 = alignment3;
            }
        }
        a = alignment;
        b = alignment2;
    }
}

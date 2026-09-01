package defpackage;

import android.view.textclassifier.TextClassification;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lhd extends vgd {
    public final TextClassification b;
    public final int c;

    public lhd(Object obj, TextClassification textClassification, int i) {
        super(obj);
        this.b = textClassification;
        this.c = i;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("TextContextMenuRemoteActionItem(key=");
        sb.append(this.a);
        sb.append(", textClassification=");
        sb.append(this.b);
        sb.append(", index=");
        return km4.A(sb, this.c, ')');
    }
}

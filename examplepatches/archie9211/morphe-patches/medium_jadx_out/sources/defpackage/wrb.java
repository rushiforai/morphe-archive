package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wrb implements nx8 {
    public final int a;
    public final List b;
    public Float c = null;
    public Float d = null;
    public lrb e = null;
    public lrb f = null;

    public wrb(int i, ArrayList arrayList) {
        this.a = i;
        this.b = arrayList;
    }

    @Override // defpackage.nx8
    public final boolean t() {
        return this.b.contains(this);
    }
}

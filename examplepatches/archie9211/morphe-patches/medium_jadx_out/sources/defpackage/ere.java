package defpackage;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ere extends gre implements Iterable, th6 {
    public final String a;
    public final float b;
    public final float c;
    public final float d;
    public final float e;
    public final float f;
    public final float g;
    public final float h;
    public final List i;
    public final ArrayList j;

    public ere(String str, float f, float f2, float f3, float f4, float f5, float f6, float f7, List list, ArrayList arrayList) {
        this.a = str;
        this.b = f;
        this.c = f2;
        this.d = f3;
        this.e = f4;
        this.f = f5;
        this.g = f6;
        this.h = f7;
        this.i = list;
        this.j = arrayList;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof ere)) {
            return false;
        }
        ere ereVar = (ere) obj;
        return g76.L(this.a, ereVar.a) && this.b == ereVar.b && this.c == ereVar.c && this.d == ereVar.d && this.e == ereVar.e && this.f == ereVar.f && this.g == ereVar.g && this.h == ereVar.h && g76.L(this.i, ereVar.i) && this.j.equals(ereVar.j);
    }

    public final int hashCode() {
        return this.j.hashCode() + wgd.p(km4.p(this.h, km4.p(this.g, km4.p(this.f, km4.p(this.e, km4.p(this.d, km4.p(this.c, km4.p(this.b, this.a.hashCode() * 31, 31), 31), 31), 31), 31), 31), 31), 31, this.i);
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return new p89(this);
    }
}

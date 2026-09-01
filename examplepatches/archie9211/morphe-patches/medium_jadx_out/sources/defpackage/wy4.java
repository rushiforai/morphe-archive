package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wy4 {
    public final ArrayList a;
    public final char b;
    public final double c;
    public final String d;
    public final String e;

    public wy4(ArrayList arrayList, char c, double d, String str, String str2) {
        this.a = arrayList;
        this.b = c;
        this.c = d;
        this.d = str;
        this.e = str2;
    }

    public static int a(char c, String str, String str2) {
        return str2.hashCode() + wgd.o(c * 31, 31, str);
    }

    public final int hashCode() {
        return a(this.b, this.e, this.d);
    }
}

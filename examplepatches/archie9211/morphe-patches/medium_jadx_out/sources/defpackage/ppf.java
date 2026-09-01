package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ppf {
    public final String a;
    public final String b;
    public final boolean c;
    public final String d;
    public final String e;
    public a38 f;
    public final String g;
    public final long h;
    public final long i;
    public boolean j;
    public lxf k;
    public final List l;
    public upf m;

    public ppf(String str, String str2, boolean z, String str3, String str4, a38 a38Var, String str5, long j, long j2, ArrayList arrayList, ivf ivfVar) {
        this.a = str;
        this.b = str2;
        this.c = z;
        this.d = str3;
        this.e = str4;
        List list = a38Var.a;
        a38 a38Var2 = new a38();
        if (list != null) {
            a38Var2.a.addAll(list);
        }
        this.f = a38Var2;
        this.g = str5;
        this.h = j;
        this.i = j2;
        this.j = false;
        this.k = null;
        this.l = arrayList;
        this.m = ivfVar;
    }
}

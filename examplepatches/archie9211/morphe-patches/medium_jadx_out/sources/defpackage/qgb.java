package defpackage;

import androidx.emoji2.text.flatbuffer.aI.aJzfoQ;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qgb {
    public final long a;
    public final String b;
    public final String c;
    public final boolean d;
    public final boolean e;
    public final boolean f;
    public final boolean g;
    public final boolean h;
    public final agb i;
    public final List j;
    public final jl5 k;
    public final String l;

    public qgb(long j, String str, String str2, boolean z, boolean z2, boolean z3, boolean z4, boolean z5, agb agbVar, List list, jl5 jl5Var, String str3) {
        this.a = j;
        this.b = str;
        this.c = str2;
        this.d = z;
        this.e = z2;
        this.f = z3;
        this.g = z4;
        this.h = z5;
        this.i = agbVar;
        this.j = list;
        this.k = jl5Var;
        this.l = str3;
    }

    public static final void a(LinkedHashSet linkedHashSet, ugb ugbVar) {
        if (ugbVar.l) {
            linkedHashSet.add(ugbVar.a);
        }
        Iterator it2 = ugbVar.m.iterator();
        while (it2.hasNext()) {
            a(linkedHashSet, (ugb) it2.next());
        }
    }

    public static qgb b(qgb qgbVar, long j, boolean z, boolean z2, boolean z3, boolean z4, boolean z5, agb agbVar, ArrayList arrayList, int i) {
        long j2 = (i & 1) != 0 ? qgbVar.a : j;
        String str = qgbVar.b;
        String str2 = qgbVar.c;
        boolean z6 = (i & 8) != 0 ? qgbVar.d : z;
        boolean z7 = (i & 16) != 0 ? qgbVar.e : z2;
        boolean z8 = (i & 32) != 0 ? qgbVar.f : z3;
        boolean z9 = (i & 64) != 0 ? qgbVar.g : z4;
        boolean z10 = (i & 128) != 0 ? qgbVar.h : z5;
        agb agbVar2 = (i & 256) != 0 ? qgbVar.i : agbVar;
        List list = (i & 512) != 0 ? qgbVar.j : arrayList;
        jl5 jl5Var = qgbVar.k;
        String str3 = qgbVar.l;
        qgbVar.getClass();
        return new qgb(j2, str, str2, z6, z7, z8, z9, z10, agbVar2, list, jl5Var, str3);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof qgb)) {
            return false;
        }
        qgb qgbVar = (qgb) obj;
        return this.a == qgbVar.a && g76.L(this.b, qgbVar.b) && g76.L(this.c, qgbVar.c) && this.d == qgbVar.d && this.e == qgbVar.e && this.f == qgbVar.f && this.g == qgbVar.g && this.h == qgbVar.h && g76.L(this.i, qgbVar.i) && this.j.equals(qgbVar.j) && g76.L(this.k, qgbVar.k) && g76.L(this.l, qgbVar.l);
    }

    public final int hashCode() {
        long j = this.a;
        int i = ((int) (j ^ (j >>> 32))) * 31;
        String str = this.b;
        int iHashCode = (i + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.c;
        int iHashCode2 = (((((((((((iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31) + (this.d ? 1231 : 1237)) * 31) + (this.e ? 1231 : 1237)) * 31) + (this.f ? 1231 : 1237)) * 31) + (this.g ? 1231 : 1237)) * 31) + (this.h ? 1231 : 1237)) * 31;
        agb agbVar = this.i;
        int iP = wgd.p((iHashCode2 + (agbVar == null ? 0 : agbVar.hashCode())) * 31, 31, this.j);
        jl5 jl5Var = this.k;
        int iHashCode3 = (iP + (jl5Var == null ? 0 : jl5Var.hashCode())) * 31;
        String str3 = this.l;
        return iHashCode3 + (str3 != null ? str3.hashCode() : 0);
    }

    public final String toString() {
        return "ResponsesTree(totalResponseCount=" + this.a + ", rootContentAuthorId=" + this.b + ", rootContentAuthorName=" + this.c + ", isLocked=" + this.d + ", isHidden=" + this.e + ", isRefreshing=" + this.f + ", isLoadingMore=" + this.g + ", isLoadingMoreFailure=" + this.h + ", nextPage=" + this.i + aJzfoQ.zvDQVlngWSZx + this.j + ", highlightResponsesData=" + this.k + ", postVersionId=" + this.l + ")";
    }
}

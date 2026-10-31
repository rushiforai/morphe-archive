package r80;

import b.c0;
import b.c9;
import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class x {

    /* renamed from: a, reason: collision with root package name */
    public final String f85719a;

    /* renamed from: b, reason: collision with root package name */
    public final d f85720b;

    /* renamed from: c, reason: collision with root package name */
    public final String f85721c;

    /* renamed from: d, reason: collision with root package name */
    public final String f85722d;

    /* renamed from: e, reason: collision with root package name */
    public final double f85723e;

    /* renamed from: f, reason: collision with root package name */
    public final int[] f85724f;

    /* renamed from: g, reason: collision with root package name */
    public final int[] f85725g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f85726h;

    /* renamed from: i, reason: collision with root package name */
    public final double f85727i;

    /* renamed from: j, reason: collision with root package name */
    public final double f85728j;

    /* renamed from: k, reason: collision with root package name */
    public final y f85729k;

    /* renamed from: l, reason: collision with root package name */
    public final y[] f85730l;

    /* renamed from: m, reason: collision with root package name */
    public final z f85731m;

    public x(String groupId, d type, String primaryLabel_plain, String primaryLabel_html, double d5, int[] matchedIndices, int[] typoIndices, boolean z11, double d11, double d12, y openAction, y[] additionalActions, z zVar) {
        Intrinsics.g(groupId, "groupId");
        Intrinsics.g(type, "type");
        Intrinsics.g(primaryLabel_plain, "primaryLabel_plain");
        Intrinsics.g(primaryLabel_html, "primaryLabel_html");
        Intrinsics.g(matchedIndices, "matchedIndices");
        Intrinsics.g(typoIndices, "typoIndices");
        Intrinsics.g(openAction, "openAction");
        Intrinsics.g(additionalActions, "additionalActions");
        this.f85719a = groupId;
        this.f85720b = type;
        this.f85721c = primaryLabel_plain;
        this.f85722d = primaryLabel_html;
        this.f85723e = d5;
        this.f85724f = matchedIndices;
        this.f85725g = typoIndices;
        this.f85726h = z11;
        this.f85727i = d11;
        this.f85728j = d12;
        this.f85729k = openAction;
        this.f85730l = additionalActions;
        this.f85731m = zVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof x)) {
            return false;
        }
        x xVar = (x) obj;
        return Intrinsics.b(this.f85719a, xVar.f85719a) && this.f85720b == xVar.f85720b && Intrinsics.b(this.f85721c, xVar.f85721c) && Intrinsics.b(this.f85722d, xVar.f85722d) && Double.compare(this.f85723e, xVar.f85723e) == 0 && Intrinsics.b(this.f85724f, xVar.f85724f) && Intrinsics.b(this.f85725g, xVar.f85725g) && this.f85726h == xVar.f85726h && Double.compare(this.f85727i, xVar.f85727i) == 0 && Double.compare(this.f85728j, xVar.f85728j) == 0 && Intrinsics.b(this.f85729k, xVar.f85729k) && Intrinsics.b(this.f85730l, xVar.f85730l) && this.f85731m == xVar.f85731m;
    }

    public final int hashCode() {
        int iHashCode = (Arrays.hashCode(this.f85730l) + ((this.f85729k.hashCode() + c9.c(this.f85728j, c9.c(this.f85727i, c9.f((Arrays.hashCode(this.f85725g) + ((Arrays.hashCode(this.f85724f) + c9.c(this.f85723e, io.branch.engage.sesame_lite.internal.a.a(this.f85722d, io.branch.engage.sesame_lite.internal.a.a(this.f85721c, (this.f85720b.hashCode() + (this.f85719a.hashCode() * 31)) * 31, 31), 31) * 961, 31)) * 31)) * 31, 31, this.f85726h), 31), 31)) * 31)) * 31;
        z zVar = this.f85731m;
        return iHashCode + (zVar == null ? 0 : zVar.hashCode());
    }

    public final String toString() {
        String string = Arrays.toString(this.f85724f);
        String string2 = Arrays.toString(this.f85725g);
        String string3 = Arrays.toString(this.f85730l);
        StringBuilder sb2 = new StringBuilder("SesameLiteResult(groupId=");
        sb2.append(this.f85719a);
        sb2.append(", type=");
        sb2.append(this.f85720b);
        sb2.append(", primaryLabel_plain=");
        c0.D(sb2, this.f85721c, ", primaryLabel_html=", this.f85722d, ", secondaryLabel_plain=null, secondaryLabel_html=null, matchScore=");
        sb2.append(this.f85723e);
        sb2.append(", matchedIndices=");
        sb2.append(string);
        sb2.append(", typoIndices=");
        sb2.append(string2);
        sb2.append(", isSubstringMatch=");
        sb2.append(this.f85726h);
        sb2.append(", searchTimesScore=");
        sb2.append(this.f85727i);
        sb2.append(", usageTimesScore=");
        sb2.append(this.f85728j);
        sb2.append(", openAction=");
        sb2.append(this.f85729k);
        sb2.append(", additionalActions=");
        sb2.append(string3);
        sb2.append(", algorithm=");
        sb2.append(this.f85731m);
        sb2.append(")");
        return sb2.toString();
    }
}

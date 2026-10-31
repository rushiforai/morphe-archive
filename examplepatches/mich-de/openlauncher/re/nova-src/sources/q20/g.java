package q20;

import b.c0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final String f83469a;

    /* renamed from: b, reason: collision with root package name */
    public final String f83470b;

    /* renamed from: c, reason: collision with root package name */
    public final Function1 f83471c;

    /* renamed from: d, reason: collision with root package name */
    public final Function1 f83472d;

    /* renamed from: e, reason: collision with root package name */
    public final Function1 f83473e;

    /* renamed from: f, reason: collision with root package name */
    public final Function1 f83474f;

    /* renamed from: g, reason: collision with root package name */
    public final Function1 f83475g;

    public g(String str, String str2, Function1 function1, Function1 function12, Function1 function13, Function1 function14, Function1 function15) {
        this.f83469a = str;
        this.f83470b = str2;
        this.f83471c = function1;
        this.f83472d = function12;
        this.f83473e = function13;
        this.f83474f = function14;
        this.f83475g = function15;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return Intrinsics.b(this.f83469a, gVar.f83469a) && Intrinsics.b(this.f83470b, gVar.f83470b) && Intrinsics.b(this.f83471c, gVar.f83471c) && Intrinsics.b(this.f83472d, gVar.f83472d) && Intrinsics.b(this.f83473e, gVar.f83473e) && Intrinsics.b(this.f83474f, gVar.f83474f) && Intrinsics.b(this.f83475g, gVar.f83475g);
    }

    public final int hashCode() {
        return this.f83475g.hashCode() + ((this.f83474f.hashCode() + ((this.f83473e.hashCode() + ((this.f83472d.hashCode() + ((this.f83471c.hashCode() + c0.e(this.f83469a.hashCode() * 31, 31, this.f83470b)) * 31)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("ApiParams(type=", this.f83469a, ", endpointUrl=", this.f83470b, ", getDataArrayFromRoot=");
        sbW.append(this.f83471c);
        sbW.append(", getDisplayLabelForItem=");
        sbW.append(this.f83472d);
        sbW.append(", getContentUriForItem=");
        sbW.append(this.f83473e);
        sbW.append(", getImageUrlForItem=");
        sbW.append(this.f83474f);
        sbW.append(", getNextUrlFromRoot=");
        sbW.append(this.f83475g);
        sbW.append(")");
        return sbW.toString();
    }
}

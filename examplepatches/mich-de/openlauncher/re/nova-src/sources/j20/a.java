package j20;

import b.c0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f68729a;

    /* renamed from: b, reason: collision with root package name */
    public final String f68730b;

    /* renamed from: c, reason: collision with root package name */
    public final Function1 f68731c;

    /* renamed from: d, reason: collision with root package name */
    public final Function1 f68732d;

    /* renamed from: e, reason: collision with root package name */
    public final Function1 f68733e;

    /* renamed from: f, reason: collision with root package name */
    public final Function1 f68734f;

    /* renamed from: g, reason: collision with root package name */
    public final Function1 f68735g;

    public a(String str, String str2, Function1 function1, Function1 function12, Function1 function13, Function1 function14, Function1 function15) {
        this.f68729a = str;
        this.f68730b = str2;
        this.f68731c = function1;
        this.f68732d = function12;
        this.f68733e = function13;
        this.f68734f = function14;
        this.f68735g = function15;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f68729a, aVar.f68729a) && Intrinsics.b(this.f68730b, aVar.f68730b) && Intrinsics.b(this.f68731c, aVar.f68731c) && Intrinsics.b(this.f68732d, aVar.f68732d) && Intrinsics.b(this.f68733e, aVar.f68733e) && Intrinsics.b(this.f68734f, aVar.f68734f) && Intrinsics.b(this.f68735g, aVar.f68735g);
    }

    public final int hashCode() {
        return this.f68735g.hashCode() + ((this.f68734f.hashCode() + ((this.f68733e.hashCode() + ((this.f68732d.hashCode() + ((this.f68731c.hashCode() + c0.e(this.f68729a.hashCode() * 31, 31, this.f68730b)) * 31)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("ApiParams(type=", this.f68729a, ", endpointUrl=", this.f68730b, ", getDataArrayFromRoot=");
        sbW.append(this.f68731c);
        sbW.append(", getDisplayLabelForItem=");
        sbW.append(this.f68732d);
        sbW.append(", getContentUriForItem=");
        sbW.append(this.f68733e);
        sbW.append(", getImageUrlForItem=");
        sbW.append(this.f68734f);
        sbW.append(", getNextUrlFromRoot=");
        sbW.append(this.f68735g);
        sbW.append(")");
        return sbW.toString();
    }
}

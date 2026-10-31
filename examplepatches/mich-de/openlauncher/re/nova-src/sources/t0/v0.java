package t0;

import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class v0 {

    /* renamed from: g, reason: collision with root package name */
    public static final v0 f88238g;

    /* renamed from: a, reason: collision with root package name */
    public final Function1 f88239a;

    /* renamed from: b, reason: collision with root package name */
    public final Function1 f88240b;

    /* renamed from: c, reason: collision with root package name */
    public final Function1 f88241c;

    /* renamed from: d, reason: collision with root package name */
    public final Function1 f88242d;

    /* renamed from: e, reason: collision with root package name */
    public final Function1 f88243e;

    /* renamed from: f, reason: collision with root package name */
    public final Function1 f88244f;

    static {
        Function1 function1 = null;
        f88238g = new v0(function1, function1, function1, 63);
    }

    public /* synthetic */ v0(Function1 function1, Function1 function12, Function1 function13, int i5) {
        this((i5 & 1) != 0 ? null : function1, null, (i5 & 4) != 0 ? null : function12, null, (i5 & 16) != 0 ? null : function13, null);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v0)) {
            return false;
        }
        v0 v0Var = (v0) obj;
        return this.f88239a == v0Var.f88239a && this.f88240b == v0Var.f88240b && this.f88241c == v0Var.f88241c && this.f88242d == v0Var.f88242d && this.f88243e == v0Var.f88243e && this.f88244f == v0Var.f88244f;
    }

    public final int hashCode() {
        Function1 function1 = this.f88239a;
        int iHashCode = (function1 != null ? function1.hashCode() : 0) * 31;
        Function1 function12 = this.f88240b;
        int iHashCode2 = (iHashCode + (function12 != null ? function12.hashCode() : 0)) * 31;
        Function1 function13 = this.f88241c;
        int iHashCode3 = (iHashCode2 + (function13 != null ? function13.hashCode() : 0)) * 31;
        Function1 function14 = this.f88242d;
        int iHashCode4 = (iHashCode3 + (function14 != null ? function14.hashCode() : 0)) * 31;
        Function1 function15 = this.f88243e;
        int iHashCode5 = (iHashCode4 + (function15 != null ? function15.hashCode() : 0)) * 31;
        Function1 function16 = this.f88244f;
        return iHashCode5 + (function16 != null ? function16.hashCode() : 0);
    }

    public v0(Function1 function1, Function1 function12, Function1 function13, Function1 function14, Function1 function15, Function1 function16) {
        this.f88239a = function1;
        this.f88240b = function12;
        this.f88241c = function13;
        this.f88242d = function14;
        this.f88243e = function15;
        this.f88244f = function16;
    }
}

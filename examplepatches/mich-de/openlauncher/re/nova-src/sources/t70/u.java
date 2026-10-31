package t70;

import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class u {

    /* renamed from: a, reason: collision with root package name */
    public final Object f88861a;

    /* renamed from: b, reason: collision with root package name */
    public final k f88862b;

    /* renamed from: c, reason: collision with root package name */
    public final Function3 f88863c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f88864d;

    /* renamed from: e, reason: collision with root package name */
    public final Throwable f88865e;

    public u(Object obj, k kVar, Function3 function3, Object obj2, Throwable th2) {
        this.f88861a = obj;
        this.f88862b = kVar;
        this.f88863c = function3;
        this.f88864d = obj2;
        this.f88865e = th2;
    }

    public static u a(u uVar, k kVar, Throwable th2, int i5) {
        Object obj = uVar.f88861a;
        if ((i5 & 2) != 0) {
            kVar = uVar.f88862b;
        }
        k kVar2 = kVar;
        Function3 function3 = uVar.f88863c;
        Object obj2 = uVar.f88864d;
        if ((i5 & 16) != 0) {
            th2 = uVar.f88865e;
        }
        return new u(obj, kVar2, function3, obj2, th2);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u)) {
            return false;
        }
        u uVar = (u) obj;
        return Intrinsics.b(this.f88861a, uVar.f88861a) && Intrinsics.b(this.f88862b, uVar.f88862b) && Intrinsics.b(this.f88863c, uVar.f88863c) && Intrinsics.b(this.f88864d, uVar.f88864d) && Intrinsics.b(this.f88865e, uVar.f88865e);
    }

    public final int hashCode() {
        Object obj = this.f88861a;
        int iHashCode = (obj == null ? 0 : obj.hashCode()) * 31;
        k kVar = this.f88862b;
        int iHashCode2 = (iHashCode + (kVar == null ? 0 : kVar.hashCode())) * 31;
        Function3 function3 = this.f88863c;
        int iHashCode3 = (iHashCode2 + (function3 == null ? 0 : function3.hashCode())) * 31;
        Object obj2 = this.f88864d;
        int iHashCode4 = (iHashCode3 + (obj2 == null ? 0 : obj2.hashCode())) * 31;
        Throwable th2 = this.f88865e;
        return iHashCode4 + (th2 != null ? th2.hashCode() : 0);
    }

    public final String toString() {
        return "CompletedContinuation(result=" + this.f88861a + ", cancelHandler=" + this.f88862b + ", onCancellation=" + this.f88863c + ", idempotentResume=" + this.f88864d + ", cancelCause=" + this.f88865e + ')';
    }

    public /* synthetic */ u(Object obj, k kVar, Function3 function3, Throwable th2, int i5) {
        this(obj, (i5 & 2) != 0 ? null : kVar, (i5 & 4) != 0 ? null : function3, (Object) null, (i5 & 16) != 0 ? null : th2);
    }
}

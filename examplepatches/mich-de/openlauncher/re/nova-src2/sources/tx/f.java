package tx;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class f {

    @NotNull
    public static final e Companion = new e();

    /* renamed from: a, reason: collision with root package name */
    public final long f89716a;

    /* renamed from: b, reason: collision with root package name */
    public final String f89717b;

    /* renamed from: c, reason: collision with root package name */
    public final long f89718c;

    /* renamed from: d, reason: collision with root package name */
    public final String f89719d;

    /* renamed from: e, reason: collision with root package name */
    public final String f89720e;

    public /* synthetic */ f(int i5, long j11, long j12, String str, String str2, String str3) {
        if (7 != (i5 & 7)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 7, d.f89683a.getDescriptor());
        }
        this.f89716a = j11;
        this.f89717b = str;
        this.f89718c = j12;
        if ((i5 & 8) == 0) {
            this.f89719d = null;
        } else {
            this.f89719d = str2;
        }
        if ((i5 & 16) == 0) {
            this.f89720e = null;
        } else {
            this.f89720e = str3;
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        return this.f89716a == fVar.f89716a && Intrinsics.b(this.f89717b, fVar.f89717b) && this.f89718c == fVar.f89718c && Intrinsics.b(this.f89719d, fVar.f89719d) && Intrinsics.b(this.f89720e, fVar.f89720e);
    }

    public final int hashCode() {
        int iD = b.c0.d(b.c0.e(Long.hashCode(this.f89716a) * 31, 31, this.f89717b), 31, this.f89718c);
        String str = this.f89719d;
        int iHashCode = (iD + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f89720e;
        return iHashCode + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbL = a80.m.l(this.f89716a, "ClientSignInResponse(authId=", ", token=", this.f89717b);
        b.c0.B(sbL, ", userId=", this.f89718c, ", secret=");
        return b.c0.s(sbL, this.f89719d, ", existingBrandUid=", this.f89720e, ")");
    }
}

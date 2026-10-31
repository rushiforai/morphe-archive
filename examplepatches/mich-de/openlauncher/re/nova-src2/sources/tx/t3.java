package tx;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class t3 {

    @NotNull
    public static final s3 Companion = new s3();

    /* renamed from: a, reason: collision with root package name */
    public final String f90011a;

    /* renamed from: b, reason: collision with root package name */
    public final String f90012b;

    /* renamed from: c, reason: collision with root package name */
    public final String f90013c;

    /* renamed from: d, reason: collision with root package name */
    public final Long f90014d;

    /* renamed from: e, reason: collision with root package name */
    public final Long f90015e;

    public /* synthetic */ t3(int i5, String str, String str2, String str3, Long l9, Long l11) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, r3.f89979a.getDescriptor());
        }
        this.f90011a = str;
        if ((i5 & 2) == 0) {
            this.f90012b = null;
        } else {
            this.f90012b = str2;
        }
        if ((i5 & 4) == 0) {
            this.f90013c = null;
        } else {
            this.f90013c = str3;
        }
        if ((i5 & 8) == 0) {
            this.f90014d = null;
        } else {
            this.f90014d = l9;
        }
        if ((i5 & 16) == 0) {
            this.f90015e = null;
        } else {
            this.f90015e = l11;
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t3)) {
            return false;
        }
        t3 t3Var = (t3) obj;
        return Intrinsics.b(this.f90011a, t3Var.f90011a) && Intrinsics.b(this.f90012b, t3Var.f90012b) && Intrinsics.b(this.f90013c, t3Var.f90013c) && Intrinsics.b(this.f90014d, t3Var.f90014d) && Intrinsics.b(this.f90015e, t3Var.f90015e);
    }

    public final int hashCode() {
        int iHashCode = this.f90011a.hashCode() * 31;
        String str = this.f90012b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f90013c;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        Long l9 = this.f90014d;
        int iHashCode4 = (iHashCode3 + (l9 == null ? 0 : l9.hashCode())) * 31;
        Long l11 = this.f90015e;
        return iHashCode4 + (l11 != null ? l11.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("NovaGetPersonIdResponse(token=", this.f90011a, ", personId=", this.f90012b, ", personIdSnake=");
        sbW.append(this.f90013c);
        sbW.append(", expiresAt=");
        sbW.append(this.f90014d);
        sbW.append(", expiresAtSnake=");
        sbW.append(this.f90015e);
        sbW.append(")");
        return sbW.toString();
    }
}

package db0;

import b.u4;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class f extends c0 {

    @NotNull
    public static final e Companion = new e();

    /* renamed from: b, reason: collision with root package name */
    public final long f49140b;

    /* renamed from: c, reason: collision with root package name */
    public final long f49141c;

    /* renamed from: d, reason: collision with root package name */
    public final long f49142d;

    /* renamed from: e, reason: collision with root package name */
    public final int f49143e;

    /* renamed from: f, reason: collision with root package name */
    public final long f49144f;

    public f(long j11, long j12, long j13, int i5, long j14) {
        this.f49140b = j11;
        this.f49141c = j12;
        this.f49142d = j13;
        this.f49143e = i5;
        this.f49144f = j14;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        return f0.b(this.f49140b, fVar.f49140b) && f0.b(this.f49141c, fVar.f49141c) && f0.b(this.f49142d, fVar.f49142d) && this.f49143e == fVar.f49143e && this.f49144f == fVar.f49144f;
    }

    public final int hashCode() {
        return Long.hashCode(this.f49144f) + u4.a(this.f49143e, (f0.c(this.f49142d) + ((f0.c(this.f49141c) + (f0.c(this.f49140b) * 31)) * 31)) * 31, 31);
    }

    public final String toString() {
        String strD = f0.d(this.f49140b);
        String strD2 = f0.d(this.f49141c);
        String strD3 = f0.d(this.f49142d);
        StringBuilder sbW = b.c0.w("AppUsage(packageName=", strD, ", className=", strD2, ", shortcutId=");
        sbW.append(strD3);
        sbW.append(", eventType=");
        sbW.append(this.f49143e);
        sbW.append(", timestamp=");
        return a2.c.i(this.f49144f, ")", sbW);
    }

    public /* synthetic */ f(int i5, f0 f0Var, f0 f0Var2, f0 f0Var3, int i11, long j11) {
        if (31 != (i5 & 31)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 31, d.f49138a.getDescriptor());
        }
        this.f49140b = f0Var.e();
        this.f49141c = f0Var2.e();
        this.f49142d = f0Var3.e();
        this.f49143e = i11;
        this.f49144f = j11;
    }
}

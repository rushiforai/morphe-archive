package db0;

import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class s extends c0 {

    @NotNull
    public static final r Companion = new r();

    /* renamed from: b, reason: collision with root package name */
    public final long f49197b;

    /* renamed from: c, reason: collision with root package name */
    public final long f49198c;

    /* renamed from: d, reason: collision with root package name */
    public final long f49199d;

    /* renamed from: e, reason: collision with root package name */
    public final long f49200e;

    public s(long j11, long j12, long j13, long j14) {
        this.f49197b = j11;
        this.f49198c = j12;
        this.f49199d = j13;
        this.f49200e = j14;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s)) {
            return false;
        }
        s sVar = (s) obj;
        return f0.b(this.f49197b, sVar.f49197b) && f0.b(this.f49198c, sVar.f49198c) && this.f49199d == sVar.f49199d && this.f49200e == sVar.f49200e;
    }

    public final int hashCode() {
        return Long.hashCode(this.f49200e) + b.c0.d((f0.c(this.f49198c) + (f0.c(this.f49197b) * 31)) * 31, 31, this.f49199d);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("StartAppFromLauncher(packageName=", f0.d(this.f49197b), ", className=", f0.d(this.f49198c), ", userId=");
        sbW.append(this.f49199d);
        sbW.append(", timestamp=");
        sbW.append(this.f49200e);
        sbW.append(")");
        return sbW.toString();
    }

    public /* synthetic */ s(int i5, f0 f0Var, f0 f0Var2, long j11, long j12) {
        if (15 != (i5 & 15)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 15, q.f49186a.getDescriptor());
        }
        this.f49197b = f0Var.e();
        this.f49198c = f0Var2.e();
        this.f49199d = j11;
        this.f49200e = j12;
    }
}

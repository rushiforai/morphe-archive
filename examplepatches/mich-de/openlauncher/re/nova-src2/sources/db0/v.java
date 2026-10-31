package db0;

import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class v extends c0 {

    @NotNull
    public static final u Companion = new u();

    /* renamed from: b, reason: collision with root package name */
    public final long f49206b;

    /* renamed from: c, reason: collision with root package name */
    public final long f49207c;

    /* renamed from: d, reason: collision with root package name */
    public final long f49208d;

    /* renamed from: e, reason: collision with root package name */
    public final long f49209e;

    public v(long j11, long j12, long j13, long j14) {
        this.f49206b = j11;
        this.f49207c = j12;
        this.f49208d = j13;
        this.f49209e = j14;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v)) {
            return false;
        }
        v vVar = (v) obj;
        return f0.b(this.f49206b, vVar.f49206b) && f0.b(this.f49207c, vVar.f49207c) && this.f49208d == vVar.f49208d && this.f49209e == vVar.f49209e;
    }

    public final int hashCode() {
        return Long.hashCode(this.f49209e) + b.c0.d((f0.c(this.f49207c) + (f0.c(this.f49206b) * 31)) * 31, 31, this.f49208d);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("StartShortcutFromLauncher(packageName=", f0.d(this.f49206b), ", shortcutId=", f0.d(this.f49207c), ", userId=");
        sbW.append(this.f49208d);
        sbW.append(", timestamp=");
        sbW.append(this.f49209e);
        sbW.append(")");
        return sbW.toString();
    }

    public /* synthetic */ v(int i5, f0 f0Var, f0 f0Var2, long j11, long j12) {
        if (15 != (i5 & 15)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 15, t.f49203a.getDescriptor());
        }
        this.f49206b = f0Var.e();
        this.f49207c = f0Var2.e();
        this.f49208d = j11;
        this.f49209e = j12;
    }
}

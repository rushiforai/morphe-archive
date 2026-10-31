package bn;

import b.u4;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class l0 {

    @NotNull
    public static final k0 Companion = new k0();

    /* renamed from: a, reason: collision with root package name */
    public final String f18242a;

    /* renamed from: b, reason: collision with root package name */
    public final String f18243b;

    /* renamed from: c, reason: collision with root package name */
    public final int f18244c;

    /* renamed from: d, reason: collision with root package name */
    public final long f18245d;

    public /* synthetic */ l0(int i5, int i11, long j11, String str, String str2) {
        if (15 != (i5 & 15)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 15, j0.f18232a.getDescriptor());
        }
        this.f18242a = str;
        this.f18243b = str2;
        this.f18244c = i11;
        this.f18245d = j11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l0)) {
            return false;
        }
        l0 l0Var = (l0) obj;
        return Intrinsics.b(this.f18242a, l0Var.f18242a) && Intrinsics.b(this.f18243b, l0Var.f18243b) && this.f18244c == l0Var.f18244c && this.f18245d == l0Var.f18245d;
    }

    public final int hashCode() {
        return Long.hashCode(this.f18245d) + u4.a(this.f18244c, b.c0.e(this.f18242a.hashCode() * 31, 31, this.f18243b), 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SessionDetails(sessionId=");
        sb2.append(this.f18242a);
        sb2.append(", firstSessionId=");
        sb2.append(this.f18243b);
        sb2.append(", sessionIndex=");
        sb2.append(this.f18244c);
        sb2.append(", sessionStartTimestampUs=");
        return a2.c.n(sb2, this.f18245d, ')');
    }

    public l0(String str, String str2, int i5, long j11) {
        this.f18242a = str;
        this.f18243b = str2;
        this.f18244c = i5;
        this.f18245d = j11;
    }
}

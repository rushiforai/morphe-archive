package e00;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class z6 {

    @NotNull
    public static final y6 Companion = new y6();

    /* renamed from: a, reason: collision with root package name */
    public final int f51218a;

    /* renamed from: b, reason: collision with root package name */
    public final String f51219b;

    /* renamed from: c, reason: collision with root package name */
    public final String f51220c;

    public /* synthetic */ z6(int i5, int i11, String str, String str2) {
        if (7 != (i5 & 7)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 7, x6.f51163a.getDescriptor());
        }
        this.f51218a = i11;
        this.f51219b = str;
        this.f51220c = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z6)) {
            return false;
        }
        z6 z6Var = (z6) obj;
        return this.f51218a == z6Var.f51218a && Intrinsics.b(this.f51219b, z6Var.f51219b) && Intrinsics.b(this.f51220c, z6Var.f51220c);
    }

    public final int hashCode() {
        return this.f51220c.hashCode() + b.c0.e(Integer.hashCode(this.f51218a) * 31, 31, this.f51219b);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("UpdateInfo(versionCode=");
        sb2.append(this.f51218a);
        sb2.append(", versionName=");
        sb2.append(this.f51219b);
        sb2.append(", log=");
        return b.c0.q(sb2, this.f51220c, ")");
    }
}

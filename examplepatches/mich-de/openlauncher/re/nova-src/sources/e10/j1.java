package e10;

import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class j1 {

    @NotNull
    public static final i1 Companion = new i1();

    /* renamed from: c, reason: collision with root package name */
    public static final j1 f51604c = new j1(false, false);

    /* renamed from: a, reason: collision with root package name */
    public final boolean f51605a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f51606b;

    public /* synthetic */ j1(int i5, boolean z11, boolean z12) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, h1.f51569a.getDescriptor());
        }
        this.f51605a = z11;
        this.f51606b = z12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j1)) {
            return false;
        }
        j1 j1Var = (j1) obj;
        return this.f51605a == j1Var.f51605a && this.f51606b == j1Var.f51606b;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f51606b) + (Boolean.hashCode(this.f51605a) * 31);
    }

    public final String toString() {
        return "PopupItemVisibility(desktop=" + this.f51605a + ", drawer=" + this.f51606b + ")";
    }

    public j1(boolean z11, boolean z12) {
        this.f51605a = z11;
        this.f51606b = z12;
    }
}

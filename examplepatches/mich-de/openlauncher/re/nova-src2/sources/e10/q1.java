package e10;

import android.content.Context;
import android.graphics.Color;
import b.c9;
import b.u4;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
@SourceDebugExtension
/* loaded from: classes.dex */
public final class q1 {

    @NotNull
    public static final p1 Companion = new p1();

    /* renamed from: f, reason: collision with root package name */
    public static final q1 f51758f = new q1(true, 24, true, -1, 262914);

    /* renamed from: g, reason: collision with root package name */
    public static final q1 f51759g = new q1(false, 24, true, -1, -1);

    /* renamed from: h, reason: collision with root package name */
    public static final q1 f51760h;

    /* renamed from: i, reason: collision with root package name */
    public static final q1 f51761i;

    /* renamed from: j, reason: collision with root package name */
    public static final q1 f51762j;

    /* renamed from: a, reason: collision with root package name */
    public final boolean f51763a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f51764b;

    /* renamed from: c, reason: collision with root package name */
    public final int f51765c;

    /* renamed from: d, reason: collision with root package name */
    public final int f51766d;

    /* renamed from: e, reason: collision with root package name */
    public final int f51767e;

    static {
        q1 q1Var = new q1(true, 8, false, -1, 262914);
        f51760h = q1Var;
        f51761i = new q1(false, 24, false, -1, 262914);
        f51762j = q1Var;
    }

    public /* synthetic */ q1(boolean z11, boolean z12, int i5, int i11, int i12, int i13) {
        if (31 != (i5 & 31)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 31, o1.f51716a.getDescriptor());
        }
        this.f51763a = z11;
        this.f51764b = z12;
        this.f51765c = i11;
        this.f51766d = i12;
        this.f51767e = i13;
    }

    public static q1 a(q1 q1Var, boolean z11, boolean z12, int i5, int i11) {
        if ((i11 & 1) != 0) {
            z11 = q1Var.f51763a;
        }
        boolean z13 = z11;
        if ((i11 & 2) != 0) {
            z12 = q1Var.f51764b;
        }
        boolean z14 = z12;
        if ((i11 & 4) != 0) {
            i5 = q1Var.f51765c;
        }
        int i12 = q1Var.f51766d;
        int i13 = q1Var.f51767e;
        q1Var.getClass();
        return new q1(z13, i5, z14, i12, i13);
    }

    public final n1 b(Context context, tz.v vVar, int i5) {
        int iJ = vVar.f90178a;
        int iO = vVar.f90179b;
        int iJ2 = ((context.getResources().getConfiguration().uiMode & 48) != 32 || (((double) Color.luminance(iJ)) <= 0.1d && ((double) Color.luminance(262914)) <= 0.1d)) ? ((double) Color.luminance(iJ)) < 0.05d ? r4.a.j(r4.a.n(-1, 69), iJ) : r4.a.j(r4.a.n(-16777216, 69), iJ) : r4.a.j(1174405119, iJ);
        if (Color.luminance(iJ) < 0.25f && r4.a.g(iJ, i5) < 1.37d) {
            iJ = r4.a.j(536870911, iJ);
        }
        boolean z11 = this.f51763a;
        int i11 = z11 ? 20 : 34;
        int iJ3 = ((double) Color.luminance(iJ)) < 0.05d ? r4.a.j(r4.a.n(-1, i11), iJ) : r4.a.j(r4.a.n(-16777216, i11), iJ);
        if (Color.luminance(iJ3) < 0.25f && r4.a.g(iJ3, i5) < 1.37d) {
            iJ3 = r4.a.j(536870911, iJ3);
        }
        int i12 = iJ3;
        int iO2 = iO == 262914 ? v30.e.o(iJ) : iO;
        if (iO == 262914) {
            iO = v30.e.o(i12);
        }
        int i13 = iO;
        float fH = h6.c1.h(context, this.f51765c);
        boolean z12 = this.f51764b;
        if (z11 && z12) {
            return new n1(h6.c1.h(context, 2), i12, iJ, 0, 0, fH, fH / 8.0f, iO2, i13);
        }
        int i14 = iJ;
        return z11 ? new n1(0, i14, 0, i12, iJ2, fH, 0.0f, iO2, i13) : z12 ? new n1(h6.c1.h(context, 3), 0, i14, i12, 0, fH, fH / 1.75f, iO2, i13) : new n1(h6.c1.h(context, 4), 0, i14, i12, 0, fH, fH, iO2, i13);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q1)) {
            return false;
        }
        q1 q1Var = (q1) obj;
        return this.f51763a == q1Var.f51763a && this.f51764b == q1Var.f51764b && this.f51765c == q1Var.f51765c && this.f51766d == q1Var.f51766d && this.f51767e == q1Var.f51767e;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f51767e) + u4.a(this.f51766d, u4.a(this.f51765c, c9.f(Boolean.hashCode(this.f51763a) * 31, 31, this.f51764b), 31), 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("PopupMenuStylePersistableConfig(cardBackground=");
        sb2.append(this.f51763a);
        sb2.append(", burgerLayout=");
        sb2.append(this.f51764b);
        sb2.append(", cornerRadiusDp=");
        b.c0.A(sb2, this.f51765c, ", primaryColor=", this.f51766d, ", secondaryColor=");
        return b.c0.o(sb2, this.f51767e, ")");
    }

    public q1(boolean z11, int i5, boolean z12, int i11, int i12) {
        this.f51763a = z11;
        this.f51764b = z12;
        this.f51765c = i5;
        this.f51766d = i11;
        this.f51767e = i12;
    }
}

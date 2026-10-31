package bn;

import b.c9;
import java.util.Map;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes3.dex */
public final class g0 {

    @NotNull
    public static final f0 Companion = new f0();

    /* renamed from: d, reason: collision with root package name */
    public static final Lazy[] f18193d = {null, null, LazyKt.b(LazyThreadSafetyMode.f71680b, new a1.m(23))};

    /* renamed from: a, reason: collision with root package name */
    public final l0 f18194a;

    /* renamed from: b, reason: collision with root package name */
    public final g1 f18195b;

    /* renamed from: c, reason: collision with root package name */
    public final Map f18196c;

    public /* synthetic */ g0(int i5, l0 l0Var, g1 g1Var, Map map) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, e0.f18182a.getDescriptor());
        }
        this.f18194a = l0Var;
        if ((i5 & 2) == 0) {
            this.f18195b = null;
        } else {
            this.f18195b = g1Var;
        }
        if ((i5 & 4) == 0) {
            this.f18196c = null;
        } else {
            this.f18196c = map;
        }
    }

    public static g0 a(g0 g0Var, l0 sessionDetails, g1 g1Var, Map map, int i5) {
        if ((i5 & 1) != 0) {
            sessionDetails = g0Var.f18194a;
        }
        if ((i5 & 2) != 0) {
            g1Var = g0Var.f18195b;
        }
        if ((i5 & 4) != 0) {
            map = g0Var.f18196c;
        }
        g0Var.getClass();
        Intrinsics.g(sessionDetails, "sessionDetails");
        return new g0(sessionDetails, g1Var, map);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g0)) {
            return false;
        }
        g0 g0Var = (g0) obj;
        return Intrinsics.b(this.f18194a, g0Var.f18194a) && Intrinsics.b(this.f18195b, g0Var.f18195b) && Intrinsics.b(this.f18196c, g0Var.f18196c);
    }

    public final int hashCode() {
        int iHashCode = this.f18194a.hashCode() * 31;
        g1 g1Var = this.f18195b;
        int iHashCode2 = (iHashCode + (g1Var == null ? 0 : Long.hashCode(g1Var.f18197a))) * 31;
        Map map = this.f18196c;
        return iHashCode2 + (map != null ? map.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SessionData(sessionDetails=");
        sb2.append(this.f18194a);
        sb2.append(", backgroundTime=");
        sb2.append(this.f18195b);
        sb2.append(", processDataMap=");
        return c9.l(sb2, this.f18196c, ')');
    }

    public g0(l0 sessionDetails, g1 g1Var, Map map) {
        Intrinsics.g(sessionDetails, "sessionDetails");
        this.f18194a = sessionDetails;
        this.f18195b = g1Var;
        this.f18196c = map;
    }
}

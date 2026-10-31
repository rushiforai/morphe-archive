package h50;

import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.reflect.KClass;

/* loaded from: classes.dex */
public final class h1 {

    /* renamed from: a, reason: collision with root package name */
    public Long f59203a;

    /* renamed from: b, reason: collision with root package name */
    public Long f59204b;

    /* renamed from: c, reason: collision with root package name */
    public Long f59205c;

    static {
        KClass type = Reflection.f71864a.getOrCreateKotlinClass(h1.class);
        try {
            Reflection.b(h1.class);
        } catch (Throwable unused) {
        }
        Intrinsics.g(type, "type");
        if (r70.k.U0("TimeoutConfiguration")) {
            throw new IllegalArgumentException("Name can't be blank");
        }
    }

    public h1() {
        this.f59203a = 0L;
        this.f59204b = 0L;
        this.f59205c = 0L;
        this.f59203a = null;
        this.f59204b = null;
        this.f59205c = null;
    }

    public static void a(Long l9) {
        if (l9 != null && l9.longValue() <= 0) {
            throw new IllegalArgumentException("Only positive timeout values are allowed, for infinite timeout use HttpTimeoutConfig.INFINITE_TIMEOUT_MS");
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || h1.class != obj.getClass()) {
            return false;
        }
        h1 h1Var = (h1) obj;
        return Intrinsics.b(this.f59203a, h1Var.f59203a) && Intrinsics.b(this.f59204b, h1Var.f59204b) && Intrinsics.b(this.f59205c, h1Var.f59205c);
    }

    public final int hashCode() {
        Long l9 = this.f59203a;
        int iHashCode = (l9 != null ? l9.hashCode() : 0) * 31;
        Long l11 = this.f59204b;
        int iHashCode2 = (iHashCode + (l11 != null ? l11.hashCode() : 0)) * 31;
        Long l12 = this.f59205c;
        return iHashCode2 + (l12 != null ? l12.hashCode() : 0);
    }
}

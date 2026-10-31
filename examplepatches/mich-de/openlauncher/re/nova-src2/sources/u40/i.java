package u40;

import android.content.Context;
import io.branch.engage.sesame_lite.internal.data.UserHandleDataSource;
import io.branch.search.internal.D5;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public final Context f90592a;

    /* renamed from: b, reason: collision with root package name */
    public final l f90593b;

    /* renamed from: c, reason: collision with root package name */
    public final UserHandleDataSource f90594c;

    public i(Context context, D5 logger, UserHandleDataSource userHandleDataSource) {
        Intrinsics.g(context, "context");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(userHandleDataSource, "userHandleDataSource");
        this.f90592a = context;
        this.f90593b = logger;
        this.f90594c = userHandleDataSource;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i)) {
            return false;
        }
        i iVar = (i) obj;
        return Intrinsics.b(this.f90592a, iVar.f90592a) && Intrinsics.b(this.f90593b, iVar.f90593b) && Intrinsics.b(this.f90594c, iVar.f90594c);
    }

    public final int hashCode() {
        return this.f90594c.hashCode() + ((((this.f90593b.hashCode() + (this.f90592a.hashCode() * 31)) * 31) + 1) * 31);
    }

    public final String toString() {
        return "SesameLiteConfig(context=" + this.f90592a + ", logger=" + this.f90593b + ", ignoreHostPackage=true, userHandleDataSource=" + this.f90594c + ')';
    }
}

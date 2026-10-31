package y40;

import io.branch.search.internal.E2;
import io.branch.search.internal.RequestMetadata;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class v {
    public static /* synthetic */ w a(Object obj, E2 status, RequestMetadata requestMetadata) {
        Intrinsics.g(status, "status");
        Intrinsics.g(requestMetadata, "requestMetadata");
        return new w(obj, status, requestMetadata);
    }

    public static /* synthetic */ w b(v vVar, Object obj, E2 e22) {
        RequestMetadata requestMetadata = new RequestMetadata("io.branch.search", b.c0.j("randomUUID().toString()"), null, 4, null);
        vVar.getClass();
        return a(obj, e22, requestMetadata);
    }
}

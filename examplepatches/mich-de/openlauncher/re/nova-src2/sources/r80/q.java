package r80;

import kotlin.jvm.internal.Intrinsics;
import nova.branch.engage.sesame_lite.internal.IdHash;

/* loaded from: classes5.dex */
public final class q extends w {

    /* renamed from: c, reason: collision with root package name */
    public final String f85700c;

    /* renamed from: d, reason: collision with root package name */
    public final String f85701d;

    /* renamed from: e, reason: collision with root package name */
    public final long f85702e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q(String str, String className, long j11, IdHash idHash) {
        super(idHash, null);
        Intrinsics.g(className, "className");
        Intrinsics.g(idHash, "idHash");
        this.f85700c = str;
        this.f85701d = className;
        this.f85702e = j11;
    }

    public final String c() {
        return this.f85701d;
    }

    public final String d() {
        return this.f85700c;
    }

    public final long e() {
        return this.f85702e;
    }
}

package r80;

import kotlin.jvm.internal.Intrinsics;
import nova.branch.engage.sesame_lite.internal.IdHash;

/* loaded from: classes5.dex */
public final class u extends w {

    /* renamed from: c, reason: collision with root package name */
    public final String f85711c;

    /* renamed from: d, reason: collision with root package name */
    public final String f85712d;

    /* renamed from: e, reason: collision with root package name */
    public final long f85713e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f85714f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u(String str, String shortcutId, long j11, boolean z11, IdHash idHash) {
        super(idHash, null);
        Intrinsics.g(shortcutId, "shortcutId");
        Intrinsics.g(idHash, "idHash");
        this.f85711c = str;
        this.f85712d = shortcutId;
        this.f85713e = j11;
        this.f85714f = z11;
    }
}

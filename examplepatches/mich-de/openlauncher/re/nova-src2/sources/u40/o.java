package u40;

import io.branch.engage.sesame_lite.internal.IdHash;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class o extends q {

    /* renamed from: c, reason: collision with root package name */
    public final String f90600c;

    /* renamed from: d, reason: collision with root package name */
    public final String f90601d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f90602e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o(String str, String shortcutId, boolean z11, IdHash idHash) {
        super(idHash, null);
        Intrinsics.g(shortcutId, "shortcutId");
        Intrinsics.g(idHash, "idHash");
        this.f90600c = str;
        this.f90601d = shortcutId;
        this.f90602e = z11;
    }
}

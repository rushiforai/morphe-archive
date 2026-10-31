package u40;

import io.branch.engage.sesame_lite.internal.IdHash;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m extends q {

    /* renamed from: c, reason: collision with root package name */
    public final String f90598c;

    /* renamed from: d, reason: collision with root package name */
    public final String f90599d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m(IdHash idHash, String str, String className) {
        super(idHash, null);
        Intrinsics.g(className, "className");
        Intrinsics.g(idHash, "idHash");
        this.f90598c = str;
        this.f90599d = className;
    }
}

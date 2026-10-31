package fx;

import b70.n;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;
import w70.i2;

/* loaded from: classes4.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ i f56166a;

    public h(i iVar) {
        this.f56166a = iVar;
    }

    public final void a(String adUnitId) {
        Object value;
        Intrinsics.g(adUnitId, "adUnitId");
        i iVar = this.f56166a;
        i2 i2Var = iVar.f56171d;
        do {
            value = i2Var.getValue();
        } while (!i2Var.i(value, n.Z((Set) value, adUnitId)));
        iVar.f56170c.remove(adUnitId);
    }
}

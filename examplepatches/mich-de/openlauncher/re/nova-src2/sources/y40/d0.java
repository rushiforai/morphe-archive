package y40;

import io.branch.search.internal.E2;
import kotlin.collections.EmptyList;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class d0 {

    @NotNull
    public static final c0 Companion = new c0();

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Long f96659a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ g f96660b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ k f96661c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ i f96662d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ boolean f96663e;

    /* renamed from: f, reason: collision with root package name */
    public /* synthetic */ boolean f96664f;

    /* renamed from: g, reason: collision with root package name */
    public final Function2 f96665g;

    public d0(Long l9, g gVar, k kVar, i iVar, boolean z11, boolean z12, Function2 function2) {
        this.f96659a = l9;
        this.f96660b = gVar;
        this.f96661c = kVar;
        this.f96662d = iVar;
        this.f96663e = z11;
        this.f96664f = z12;
        this.f96665g = function2;
    }

    public final Object a(SuspendLambda suspendLambda) {
        k kVar;
        g gVar = this.f96660b;
        IllegalArgumentException illegalArgumentException = (gVar == null && this.f96661c == null) ? new IllegalArgumentException("No container configuration available for  suggested app or suggested link. Please see setSuggestedAppContainerConfig or setSuggestedLinkContainerConfig") : ((gVar == null || (gVar.f96669c >= 0 && gVar.f96670d >= 0)) && ((kVar = this.f96661c) == null || (kVar.f96674c >= 0 && kVar.f61556b >= 0))) ? null : new IllegalArgumentException("Invalid Parameter in container configuration. rowCount and itemsPerRow shouldn't be less than 0");
        if (illegalArgumentException == null) {
            Function2 function2 = this.f96665g;
            Intrinsics.d(function2);
            return function2.invoke(this, suspendLambda);
        }
        v vVar = w.Companion;
        EmptyList emptyList = EmptyList.f71733a;
        E2.Companion.getClass();
        return v.b(vVar, emptyList, E2.b.a(illegalArgumentException));
    }
}

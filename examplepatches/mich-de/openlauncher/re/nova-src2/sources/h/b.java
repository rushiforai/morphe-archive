package h;

import c3.v0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;
import mx.p0;
import p1.e1;

/* loaded from: classes.dex */
public final class b extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ a f58688j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ j.i f58689k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ String f58690l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ k.b f58691m;
    public final /* synthetic */ e1 n;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(a aVar, j.i iVar, String str, k.b bVar, e1 e1Var) {
        super(1);
        this.f58688j = aVar;
        this.f58689k = iVar;
        this.f58690l = str;
        this.f58691m = bVar;
        this.n = e1Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        j.h hVarD = this.f58689k.d(this.f58690l, this.f58691m, new p0(this.n, 4));
        a aVar = this.f58688j;
        aVar.f58687a = hVarD;
        return new v0(aVar, 1);
    }
}

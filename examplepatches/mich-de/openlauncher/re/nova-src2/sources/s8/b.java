package s8;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import r8.n;

/* loaded from: classes2.dex */
public final class b extends ContinuationImpl {
    public int A;
    public /* synthetic */ Object B;
    public final /* synthetic */ h C;
    public int D;

    /* renamed from: t, reason: collision with root package name */
    public h f86710t;

    /* renamed from: u, reason: collision with root package name */
    public n f86711u;

    /* renamed from: v, reason: collision with root package name */
    public m8.b f86712v;

    /* renamed from: w, reason: collision with root package name */
    public x8.k f86713w;

    /* renamed from: x, reason: collision with root package name */
    public Object f86714x;

    /* renamed from: y, reason: collision with root package name */
    public x8.n f86715y;

    /* renamed from: z, reason: collision with root package name */
    public m8.c f86716z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(h hVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.C = hVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.B = obj;
        this.D |= Integer.MIN_VALUE;
        return h.a(this.C, null, null, null, null, null, null, this);
    }
}

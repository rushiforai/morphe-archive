package nx;

import android.content.Context;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class a extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Context f78605t;

    /* renamed from: u, reason: collision with root package name */
    public iv.c f78606u;

    /* renamed from: v, reason: collision with root package name */
    public iv.c f78607v;

    /* renamed from: w, reason: collision with root package name */
    public Ref.ObjectRef f78608w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f78609x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ c f78610y;

    /* renamed from: z, reason: collision with root package name */
    public int f78611z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(c cVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f78610y = cVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f78609x = obj;
        this.f78611z |= Integer.MIN_VALUE;
        return this.f78610y.a(null, null, null, this);
    }
}

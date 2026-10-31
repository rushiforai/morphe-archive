package k20;

import java.util.ArrayList;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class a extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f70876t;

    /* renamed from: u, reason: collision with root package name */
    public Ref.LongRef f70877u;

    /* renamed from: v, reason: collision with root package name */
    public ArrayList f70878v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f70879w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ c f70880x;

    /* renamed from: y, reason: collision with root package name */
    public int f70881y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(c cVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f70880x = cVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f70879w = obj;
        this.f70881y |= Integer.MIN_VALUE;
        return c.l(this.f70880x, null, this);
    }
}

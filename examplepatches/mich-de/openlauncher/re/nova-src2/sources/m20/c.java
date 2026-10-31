package m20;

import java.util.List;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;
import x80.w;

/* loaded from: classes4.dex */
public final class c extends ContinuationImpl {
    public int A;

    /* renamed from: t, reason: collision with root package name */
    public d f75825t;

    /* renamed from: u, reason: collision with root package name */
    public i20.d f75826u;

    /* renamed from: v, reason: collision with root package name */
    public w f75827v;

    /* renamed from: w, reason: collision with root package name */
    public List f75828w;

    /* renamed from: x, reason: collision with root package name */
    public Ref.ObjectRef f75829x;

    /* renamed from: y, reason: collision with root package name */
    public /* synthetic */ Object f75830y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ d f75831z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(d dVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f75831z = dVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f75830y = obj;
        this.A |= Integer.MIN_VALUE;
        return d.l(this.f75831z, null, this);
    }
}

package q3;

import java.util.List;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class f extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public List f83549t;

    /* renamed from: u, reason: collision with root package name */
    public n f83550u;

    /* renamed from: v, reason: collision with root package name */
    public int f83551v;

    /* renamed from: w, reason: collision with root package name */
    public int f83552w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f83553x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ h f83554y;

    /* renamed from: z, reason: collision with root package name */
    public int f83555z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(h hVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f83554y = hVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f83553x = obj;
        this.f83555z |= Integer.MIN_VALUE;
        return this.f83554y.a(this);
    }
}

package t5;

import java.io.FileOutputStream;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class l0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public FileOutputStream f88645t;

    /* renamed from: u, reason: collision with root package name */
    public FileOutputStream f88646u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f88647v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ m0 f88648w;

    /* renamed from: x, reason: collision with root package name */
    public int f88649x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l0(m0 m0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f88648w = m0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f88647v = obj;
        this.f88649x |= Integer.MIN_VALUE;
        return this.f88648w.b(null, this);
    }
}

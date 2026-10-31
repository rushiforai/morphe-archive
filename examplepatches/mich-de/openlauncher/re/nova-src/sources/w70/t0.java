package w70;

import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Ref;
import kotlinx.coroutines.flow.internal.AbortFlowException;

/* loaded from: classes.dex */
public final class t0 implements n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f94019a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f94020b;

    public /* synthetic */ t0(Ref.ObjectRef objectRef, int i5) {
        this.f94019a = i5;
        this.f94020b = objectRef;
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) {
        switch (this.f94019a) {
            case 0:
                this.f94020b.f71863a = obj;
                throw new AbortFlowException(this);
            default:
                this.f94020b.f71863a = obj;
                throw new AbortFlowException(this);
        }
    }
}

package i6;

import android.os.Looper;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import p1.p1;
import w70.n;

/* loaded from: classes2.dex */
public final class a implements n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f61395a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p1 f61396b;

    public /* synthetic */ a(p1 p1Var, int i5) {
        this.f61395a = i5;
        this.f61396b = p1Var;
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) {
        switch (this.f61395a) {
            case 0:
                this.f61396b.setValue(obj);
                break;
            case 1:
                this.f61396b.setValue(obj);
                break;
            case 2:
                this.f61396b.setValue(obj);
                break;
            case 3:
                Intrinsics.b(Looper.getMainLooper(), Looper.myLooper());
                this.f61396b.setValue(obj);
                break;
            default:
                this.f61396b.setValue(obj);
                break;
        }
        return Unit.f71706a;
    }
}

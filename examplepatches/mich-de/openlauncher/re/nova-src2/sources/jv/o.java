package jv;

import com.stripe.android.core.strings.ResolvableString;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import w70.i2;

/* loaded from: classes4.dex */
public final class o implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70113a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ kv.c f70114b;

    public /* synthetic */ o(kv.c cVar, int i5) {
        this.f70113a = i5;
        this.f70114b = cVar;
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) {
        switch (this.f70113a) {
            case 0:
                this.f70114b.f72283t.a((ResolvableString) obj, true);
                break;
            case 1:
                this.f70114b.e();
                break;
            default:
                Boolean bool = (Boolean) obj;
                bool.getClass();
                i2 i2Var = this.f70114b.f72286w;
                i2Var.getClass();
                i2Var.k(null, bool);
                break;
        }
        return Unit.f71706a;
    }
}

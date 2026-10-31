package hx;

import b2.t;
import com.google.android.gms.internal.consent_sdk.e0;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import p1.a0;
import p1.o;

/* loaded from: classes4.dex */
public final /* synthetic */ class k implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f60889a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ t f60890b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f60891c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f60892d;

    public /* synthetic */ k(Object obj, t tVar, long j11, int i5, int i11) {
        this.f60889a = i11;
        this.f60892d = obj;
        this.f60890b = tVar;
        this.f60891c = j11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f60889a) {
            case 0:
                ((Integer) obj2).getClass();
                int iL = a0.l(1);
                e0.g((String) this.f60892d, this.f60890b, this.f60891c, (o) obj, iL);
                break;
            default:
                ((Integer) obj2).getClass();
                int iL2 = a0.l(1);
                t0.c.a((e1.k) this.f60892d, this.f60890b, this.f60891c, (o) obj, iL2);
                break;
        }
        return Unit.f71706a;
    }
}

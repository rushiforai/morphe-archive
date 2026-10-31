package iq;

import b2.t;
import c3.c3;
import jv.g1;
import jv.r0;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import p1.a0;
import ps.o0;

/* loaded from: classes4.dex */
public final /* synthetic */ class m implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f67980a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f67981b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function0 f67982c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f67983d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f67984e;

    public /* synthetic */ m(t tVar, boolean z11, String str, Function0 function0, int i5) {
        this.f67980a = 2;
        this.f67983d = tVar;
        this.f67981b = z11;
        this.f67984e = str;
        this.f67982c = function0;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f67980a) {
            case 0:
                ((Integer) obj2).getClass();
                int iL = a0.l(7);
                io.sentry.config.a.g((f) this.f67983d, this.f67981b, this.f67982c, (Function1) this.f67984e, (p1.o) obj, iL);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iL2 = a0.l(1);
                g1.d(this.f67981b, (r0) this.f67983d, this.f67982c, (Function0) this.f67984e, (p1.o) obj, iL2);
                break;
            case 2:
                ((Integer) obj2).getClass();
                int iL3 = a0.l(7);
                p3.i.h((t) this.f67983d, this.f67981b, (String) this.f67984e, this.f67982c, (p1.o) obj, iL3);
                break;
            default:
                ((Integer) obj2).getClass();
                int iL4 = a0.l(1);
                o0.k(this.f67981b, (vs.e) this.f67983d, this.f67982c, (c3) this.f67984e, (p1.o) obj, iL4);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ m(f fVar, boolean z11, Function0 function0, Function1 function1, int i5) {
        this.f67980a = 0;
        this.f67983d = fVar;
        this.f67981b = z11;
        this.f67982c = function0;
        this.f67984e = function1;
    }

    public /* synthetic */ m(boolean z11, Object obj, Function0 function0, Object obj2, int i5, int i11) {
        this.f67980a = i11;
        this.f67981b = z11;
        this.f67983d = obj;
        this.f67982c = function0;
        this.f67984e = obj2;
    }
}

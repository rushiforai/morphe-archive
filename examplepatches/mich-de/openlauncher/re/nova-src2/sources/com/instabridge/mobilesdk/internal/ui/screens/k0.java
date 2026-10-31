package com.instabridge.mobilesdk.internal.ui.screens;

import e10.s2;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kw.w3;
import kw.y2;

/* loaded from: classes3.dex */
public final /* synthetic */ class k0 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35751a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f35752b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f35753c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f35754d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f35755e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f35756f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Object f35757g;

    public /* synthetic */ k0(b2.t tVar, y2 y2Var, boolean z11, x1.e eVar, int i5, int i11) {
        this.f35751a = 4;
        this.f35756f = tVar;
        this.f35752b = y2Var;
        this.f35753c = z11;
        this.f35757g = eVar;
        this.f35754d = i5;
        this.f35755e = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f35751a) {
            case 0:
                int iIntValue = ((Integer) obj2).intValue();
                break;
            case 1:
                ((Integer) obj2).getClass();
                d20.z.a((ey.p) this.f35756f, (b2.t) this.f35757g, (Function0) this.f35752b, this.f35753c, (p1.o) obj, p1.a0.l(this.f35754d | 1), this.f35755e);
                break;
            case 2:
                ((Integer) obj2).getClass();
                f1.d2.a((Function0) this.f35752b, (b2.t) this.f35756f, this.f35753c, (x1.e) this.f35757g, (p1.o) obj, p1.a0.l(this.f35754d | 1), this.f35755e);
                break;
            case 3:
                ((Integer) obj2).getClass();
                mk.v.n((y20.b) this.f35756f, (y20.e) this.f35757g, (Function0) this.f35752b, this.f35753c, (p1.o) obj, p1.a0.l(this.f35754d | 1), this.f35755e);
                break;
            case 4:
                ((Integer) obj2).getClass();
                w3.e((b2.t) this.f35756f, (y2) this.f35752b, this.f35753c, (x1.e) this.f35757g, (p1.o) obj, p1.a0.l(this.f35754d | 1), this.f35755e);
                break;
            case 5:
                ((Integer) obj2).getClass();
                m00.l0.b((b2.t) this.f35756f, (m00.e) this.f35752b, (Function2) this.f35757g, this.f35753c, (p1.o) obj, p1.a0.l(this.f35754d | 1), this.f35755e);
                break;
            default:
                ((Integer) obj2).getClass();
                s00.k.b((String) this.f35756f, this.f35754d, (s2) this.f35757g, this.f35753c, (Function0) this.f35752b, (p1.o) obj, p1.a0.l(this.f35755e | 1));
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ k0(b2.t tVar, m00.e eVar, Function2 function2, boolean z11, int i5, int i11) {
        this.f35751a = 5;
        this.f35756f = tVar;
        this.f35752b = eVar;
        this.f35757g = function2;
        this.f35753c = z11;
        this.f35754d = i5;
        this.f35755e = i11;
    }

    public /* synthetic */ k0(Object obj, Object obj2, Function0 function0, boolean z11, int i5, int i11, int i12) {
        this.f35751a = i12;
        this.f35756f = obj;
        this.f35757g = obj2;
        this.f35752b = function0;
        this.f35753c = z11;
        this.f35754d = i5;
        this.f35755e = i11;
    }

    public /* synthetic */ k0(String str, int i5, s2 s2Var, boolean z11, Function0 function0, int i11) {
        this.f35751a = 6;
        this.f35756f = str;
        this.f35754d = i5;
        this.f35757g = s2Var;
        this.f35753c = z11;
        this.f35752b = function0;
        this.f35755e = i11;
    }

    public /* synthetic */ k0(String str, boolean z11, Function0 function0, Function2 function2, int i5, int i11) {
        this.f35751a = 0;
        this.f35756f = str;
        this.f35753c = z11;
        this.f35752b = function0;
        this.f35757g = function2;
        this.f35754d = i5;
        this.f35755e = i11;
    }

    public /* synthetic */ k0(Function0 function0, b2.t tVar, boolean z11, x1.e eVar, int i5, int i11) {
        this.f35751a = 2;
        this.f35752b = function0;
        this.f35756f = tVar;
        this.f35753c = z11;
        this.f35757g = eVar;
        this.f35754d = i5;
        this.f35755e = i11;
    }
}

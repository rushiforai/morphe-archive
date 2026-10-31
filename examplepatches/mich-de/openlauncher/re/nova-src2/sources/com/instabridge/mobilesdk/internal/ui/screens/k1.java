package com.instabridge.mobilesdk.internal.ui.screens;

import cw.u2;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class k1 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35758a = 3;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f35759b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f35760c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f35761d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f35762e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f35763f;

    public /* synthetic */ k1(String str, long j11, Function0 function0, b2.t tVar, int i5) {
        this.f35759b = str;
        this.f35760c = j11;
        this.f35762e = function0;
        this.f35763f = tVar;
        this.f35761d = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f35758a) {
            case 0:
                int iIntValue = ((Integer) obj2).intValue();
                break;
            case 1:
                ((Integer) obj2).getClass();
                u2.a((String) this.f35759b, (b2.t) this.f35762e, this.f35760c, (m3.p0) this.f35763f, (p1.o) obj, p1.a0.l(this.f35761d | 1));
                break;
            case 2:
                ((Integer) obj2).getClass();
                ((l00.o) this.f35762e).g((b2.t) this.f35759b, this.f35760c, (a00.b) this.f35763f, (p1.o) obj, p1.a0.l(this.f35761d | 1));
                break;
            default:
                ((Integer) obj2).getClass();
                mo.l.c((String) this.f35759b, this.f35760c, (Function0) this.f35762e, (b2.t) this.f35763f, (p1.o) obj, p1.a0.l(this.f35761d | 1));
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ k1(String str, b2.t tVar, long j11, m3.p0 p0Var, int i5) {
        this.f35759b = str;
        this.f35762e = tVar;
        this.f35760c = j11;
        this.f35763f = p0Var;
        this.f35761d = i5;
    }

    public /* synthetic */ k1(Function2 function2, String str, String str2, long j11, int i5) {
        this.f35762e = function2;
        this.f35759b = str;
        this.f35763f = str2;
        this.f35760c = j11;
        this.f35761d = i5;
    }

    public /* synthetic */ k1(l00.o oVar, b2.t tVar, long j11, a00.b bVar, int i5) {
        this.f35762e = oVar;
        this.f35759b = tVar;
        this.f35760c = j11;
        this.f35763f = bVar;
        this.f35761d = i5;
    }
}

package com.instabridge.mobilesdk.internal.ui.screens;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class n1 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35800a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b2.t f35801b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f35802c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f35803d;

    public /* synthetic */ n1(int i5, int i11, int i12, b2.t tVar) {
        this.f35800a = i12;
        this.f35801b = tVar;
        this.f35802c = i5;
        this.f35803d = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        p1.o oVar = (p1.o) obj;
        Integer num = (Integer) obj2;
        switch (this.f35800a) {
            case 0:
                break;
            case 1:
                num.getClass();
                ps.e0.c(this.f35801b, oVar, p1.a0.l(this.f35802c | 1), this.f35803d);
                break;
            default:
                num.getClass();
                ps.i0.a(this.f35801b, oVar, p1.a0.l(this.f35802c | 1), this.f35803d);
                break;
        }
        return Unit.f71706a;
    }
}

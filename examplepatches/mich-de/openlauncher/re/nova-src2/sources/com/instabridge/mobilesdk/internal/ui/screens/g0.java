package com.instabridge.mobilesdk.internal.ui.screens;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class g0 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35694a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f35695b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f35696c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Function0 f35697d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f35698e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f35699f;

    public /* synthetic */ g0(long j11, Function0 function0, b2.t tVar, int i5, int i11) {
        this.f35694a = 2;
        this.f35696c = j11;
        this.f35697d = function0;
        this.f35695b = tVar;
        this.f35698e = i5;
        this.f35699f = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f35694a) {
            case 0:
                int iIntValue = ((Integer) obj2).intValue();
                return CommonsKt.SecondaryCta_3IgeMak$lambda$2((String) this.f35695b, this.f35696c, this.f35697d, this.f35698e, this.f35699f, (p1.o) obj, iIntValue);
            case 1:
                int iIntValue2 = ((Integer) obj2).intValue();
                return CommonsKt.PrimaryCta_3IgeMak$lambda$1((String) this.f35695b, this.f35696c, this.f35697d, this.f35698e, this.f35699f, (p1.o) obj, iIntValue2);
            default:
                ((Integer) obj2).getClass();
                ex.i.a(this.f35696c, this.f35697d, (b2.t) this.f35695b, this.f35698e, (p1.o) obj, p1.a0.l(this.f35699f | 1));
                return Unit.f71706a;
        }
    }

    public /* synthetic */ g0(String str, long j11, Function0 function0, int i5, int i11, int i12) {
        this.f35694a = i12;
        this.f35695b = str;
        this.f35696c = j11;
        this.f35697d = function0;
        this.f35698e = i5;
        this.f35699f = i11;
    }
}

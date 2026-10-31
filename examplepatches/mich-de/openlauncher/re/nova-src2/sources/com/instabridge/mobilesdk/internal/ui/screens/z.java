package com.instabridge.mobilesdk.internal.ui.screens;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class z implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35969a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f35970b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function0 f35971c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f35972d;

    public /* synthetic */ z(String str, Function0 function0, int i5, int i11) {
        this.f35969a = i11;
        this.f35970b = str;
        this.f35971c = function0;
        this.f35972d = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        p1.o oVar = (p1.o) obj;
        Integer num = (Integer) obj2;
        switch (this.f35969a) {
            case 0:
                break;
            case 1:
                break;
            case 2:
                num.getClass();
                g00.j.a(this.f35970b, this.f35971c, oVar, p1.a0.l(this.f35972d | 1));
                break;
            case 3:
                num.getClass();
                g00.j.a(this.f35970b, this.f35971c, oVar, p1.a0.l(this.f35972d | 1));
                break;
            default:
                num.intValue();
                p3.i.j(this.f35970b, this.f35971c, oVar, p1.a0.l(this.f35972d | 1));
                break;
        }
        return Unit.f71706a;
    }
}

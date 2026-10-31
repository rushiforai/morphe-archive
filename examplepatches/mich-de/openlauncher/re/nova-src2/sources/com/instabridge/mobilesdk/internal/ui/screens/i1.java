package com.instabridge.mobilesdk.internal.ui.screens;

import java.util.List;
import kotlin.Function;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.ranges.IntRange;

/* loaded from: classes3.dex */
public final /* synthetic */ class i1 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35722a = 2;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f35723b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f35724c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f35725d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f35726e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f35727f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Object f35728g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ Object f35729h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ Object f35730i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Function f35731j;

    public /* synthetic */ i1(String str, b2.t tVar, boolean z11, String str2, String str3, Function2 function2, Function2 function22, int i5, int i11) {
        this.f35728g = str;
        this.f35724c = tVar;
        this.f35723b = z11;
        this.f35729h = str2;
        this.f35725d = str3;
        this.f35730i = function2;
        this.f35731j = function22;
        this.f35726e = i5;
        this.f35727f = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f35722a) {
            case 0:
                int iIntValue = ((Integer) obj2).intValue();
                break;
            case 1:
                ((Integer) obj2).getClass();
                bh.g.s(this.f35723b, (gy.n0) this.f35728g, (List) this.f35729h, (b2.t) this.f35730i, (Function0) this.f35724c, (Function0) this.f35725d, (Function1) this.f35731j, (p1.o) obj, p1.a0.l(this.f35726e | 1), this.f35727f);
                break;
            case 2:
                ((Integer) obj2).getClass();
                ky.l.c((String) this.f35728g, (b2.t) this.f35724c, this.f35723b, (String) this.f35729h, (String) this.f35725d, (Function2) this.f35730i, (Function2) this.f35731j, (p1.o) obj, p1.a0.l(this.f35726e | 1), this.f35727f);
                break;
            case 3:
                ((Integer) obj2).getClass();
                android.support.v4.media.session.b.m((x1.e) this.f35728g, (x1.e) this.f35729h, (Function2) this.f35724c, this.f35723b, (gy.n0) this.f35725d, (List) this.f35730i, (Function1) this.f35731j, (p1.o) obj, p1.a0.l(this.f35726e | 1), this.f35727f);
                break;
            case 4:
                ((Integer) obj2).getClass();
                p6.f.f((String) this.f35728g, (String) this.f35729h, (e10.t0) this.f35724c, (b2.t) this.f35725d, this.f35723b, (IntRange) this.f35730i, (Function1) this.f35731j, (p1.o) obj, p1.a0.l(this.f35726e | 1), this.f35727f);
                break;
            default:
                ((Integer) obj2).getClass();
                ps.f0.c((List) this.f35728g, (b2.t) this.f35729h, this.f35723b, (k0.o1) this.f35724c, (Function2) this.f35725d, (Function2) this.f35730i, (x1.e) this.f35731j, (p1.o) obj, p1.a0.l(this.f35726e | 1), this.f35727f);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ i1(String str, String str2, e10.t0 t0Var, b2.t tVar, boolean z11, IntRange intRange, Function1 function1, int i5, int i11) {
        this.f35728g = str;
        this.f35729h = str2;
        this.f35724c = t0Var;
        this.f35725d = tVar;
        this.f35723b = z11;
        this.f35730i = intRange;
        this.f35731j = function1;
        this.f35726e = i5;
        this.f35727f = i11;
    }

    public /* synthetic */ i1(String str, Function0 function0, Function0 function02, Function0 function03, boolean z11, String str2, Function0 function04, int i5, int i11) {
        this.f35728g = str;
        this.f35724c = function0;
        this.f35725d = function02;
        this.f35730i = function03;
        this.f35723b = z11;
        this.f35729h = str2;
        this.f35731j = function04;
        this.f35726e = i5;
        this.f35727f = i11;
    }

    public /* synthetic */ i1(List list, b2.t tVar, boolean z11, k0.o1 o1Var, Function2 function2, Function2 function22, x1.e eVar, int i5, int i11) {
        this.f35728g = list;
        this.f35729h = tVar;
        this.f35723b = z11;
        this.f35724c = o1Var;
        this.f35725d = function2;
        this.f35730i = function22;
        this.f35731j = eVar;
        this.f35726e = i5;
        this.f35727f = i11;
    }

    public /* synthetic */ i1(x1.e eVar, x1.e eVar2, Function2 function2, boolean z11, gy.n0 n0Var, List list, Function1 function1, int i5, int i11) {
        this.f35728g = eVar;
        this.f35729h = eVar2;
        this.f35724c = function2;
        this.f35723b = z11;
        this.f35725d = n0Var;
        this.f35730i = list;
        this.f35731j = function1;
        this.f35726e = i5;
        this.f35727f = i11;
    }

    public /* synthetic */ i1(boolean z11, gy.n0 n0Var, List list, b2.t tVar, Function0 function0, Function0 function02, Function1 function1, int i5, int i11) {
        this.f35723b = z11;
        this.f35728g = n0Var;
        this.f35729h = list;
        this.f35730i = tVar;
        this.f35724c = function0;
        this.f35725d = function02;
        this.f35731j = function1;
        this.f35726e = i5;
        this.f35727f = i11;
    }
}

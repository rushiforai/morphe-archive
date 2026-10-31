package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.x;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import p1.e1;

/* loaded from: classes4.dex */
public final /* synthetic */ class s0 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f41407a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f41408b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f41409c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f41410d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ e1 f41411e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f41412f;

    public /* synthetic */ s0(Function1 function1, boolean z11, Function2 function2, Function0 function0, e1 e1Var) {
        this.f41412f = function1;
        this.f41408b = z11;
        this.f41409c = function2;
        this.f41410d = function0;
        this.f41411e = e1Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f41407a) {
            case 0:
                return x.f.a.a((Function1) this.f41412f, this.f41408b, (Function2) this.f41409c, (Function0) this.f41410d, this.f41411e);
            case 1:
                Function2 function2 = (Function2) this.f41409c;
                Function0 function0 = (Function0) this.f41410d;
                e1 e1Var = (e1) this.f41412f;
                if (!this.f41408b) {
                    throw new IllegalStateException();
                }
                function2.invoke(Integer.valueOf(((Number) this.f41411e.getValue()).intValue()), Integer.valueOf(((Number) e1Var.getValue()).intValue()));
                function0.invoke();
                return Unit.f71706a;
            case 2:
                Function1 function1 = (Function1) this.f41412f;
                e1 e1Var2 = (e1) this.f41409c;
                e1 e1Var3 = (e1) this.f41410d;
                function1.invoke(g90.k.X((String) this.f41411e.getValue(), (String) e1Var2.getValue(), this.f41408b, ((Boolean) e1Var3.getValue()).booleanValue()));
                return Unit.f71706a;
            default:
                Function1 function12 = (Function1) this.f41412f;
                mx.c0 c0Var = (mx.c0) this.f41409c;
                e1 e1Var4 = (e1) this.f41410d;
                boolean z11 = this.f41408b;
                e1 e1Var5 = this.f41411e;
                if (z11) {
                    List list = (List) e1Var5.getValue();
                    ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
                    Iterator it = list.iterator();
                    while (it.hasNext()) {
                        arrayList.add(new l10.n((mx.c0) it.next(), null));
                    }
                    ArrayList arrayList2 = new ArrayList();
                    Iterator it2 = arrayList.iterator();
                    while (it2.hasNext()) {
                        Object next = it2.next();
                        l10.n nVar = (l10.n) next;
                        if (((List) e1Var4.getValue()).contains(nVar) && nVar.f74437a != c0Var) {
                            arrayList2.add(next);
                        }
                    }
                    function12.invoke(b70.e.L0(arrayList2));
                } else {
                    List list2 = (List) e1Var5.getValue();
                    ArrayList arrayList3 = new ArrayList(b70.c.u0(list2, 10));
                    Iterator it3 = list2.iterator();
                    while (it3.hasNext()) {
                        arrayList3.add(new l10.n((mx.c0) it3.next(), null));
                    }
                    ArrayList arrayList4 = new ArrayList();
                    Iterator it4 = arrayList3.iterator();
                    while (it4.hasNext()) {
                        Object next2 = it4.next();
                        l10.n nVar2 = (l10.n) next2;
                        if (((List) e1Var4.getValue()).contains(nVar2) || nVar2.f74437a == c0Var) {
                            arrayList4.add(next2);
                        }
                    }
                    function12.invoke(b70.e.L0(arrayList4));
                }
                return Unit.f71706a;
        }
    }

    public /* synthetic */ s0(Function1 function1, boolean z11, e1 e1Var, e1 e1Var2, e1 e1Var3) {
        this.f41412f = function1;
        this.f41408b = z11;
        this.f41411e = e1Var;
        this.f41409c = e1Var2;
        this.f41410d = e1Var3;
    }

    public /* synthetic */ s0(boolean z11, Function1 function1, e1 e1Var, mx.c0 c0Var, e1 e1Var2) {
        this.f41408b = z11;
        this.f41412f = function1;
        this.f41411e = e1Var;
        this.f41409c = c0Var;
        this.f41410d = e1Var2;
    }

    public /* synthetic */ s0(boolean z11, Function2 function2, Function0 function0, e1 e1Var, e1 e1Var2) {
        this.f41408b = z11;
        this.f41409c = function2;
        this.f41410d = function0;
        this.f41411e = e1Var;
        this.f41412f = e1Var2;
    }
}

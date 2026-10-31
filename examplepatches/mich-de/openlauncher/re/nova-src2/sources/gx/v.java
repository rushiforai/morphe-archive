package gx;

import java.util.Iterator;
import java.util.List;
import java.util.Set;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;

/* loaded from: classes4.dex */
public final class v implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f58198a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ w70.n f58199b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f58200c;

    public /* synthetic */ v(w70.n nVar, String str, int i5) {
        this.f58198a = i5;
        this.f58199b = nVar;
        this.f58200c = str;
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0064  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00df  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x012b  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0018  */
    @Override // w70.n
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object emit(Object obj, Continuation continuation) {
        u uVar;
        List list;
        x xVar;
        y yVar;
        List list2;
        z zVar;
        switch (this.f58198a) {
            case 0:
                if (continuation instanceof u) {
                    uVar = (u) continuation;
                    int i5 = uVar.f58196u;
                    if ((i5 & Integer.MIN_VALUE) != 0) {
                        uVar.f58196u = i5 - Integer.MIN_VALUE;
                    } else {
                        uVar = new u(this, continuation);
                    }
                }
                Object obj2 = uVar.f58195t;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = uVar.f58196u;
                if (i11 == 0) {
                    ResultKt.b(obj2);
                    dx.q0 q0Var = (dx.q0) ((dx.h) obj).f49705a.get(new dx.t(this.f58200c));
                    String str = null;
                    if (q0Var != null && (list = q0Var.f49763b) != null) {
                        Iterator it = list.iterator();
                        while (true) {
                            if (it.hasNext()) {
                                dx.f fVar = (dx.f) it.next();
                                dx.c cVar = fVar instanceof dx.c ? (dx.c) fVar : null;
                                String str2 = cVar != null ? cVar.f49688b : null;
                                if (str2 != null) {
                                    str = str2;
                                }
                            }
                        }
                    }
                    uVar.f58196u = 1;
                    if (this.f58199b.emit(str, uVar) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj2);
                }
                return Unit.f71706a;
            case 1:
                if (continuation instanceof x) {
                    xVar = (x) continuation;
                    int i12 = xVar.f58205u;
                    if ((i12 & Integer.MIN_VALUE) != 0) {
                        xVar.f58205u = i12 - Integer.MIN_VALUE;
                    } else {
                        xVar = new x(this, continuation);
                    }
                }
                Object obj3 = xVar.f58204t;
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i13 = xVar.f58205u;
                if (i13 == 0) {
                    ResultKt.b(obj3);
                    Boolean boolValueOf = Boolean.valueOf(((Set) obj).contains(this.f58200c));
                    xVar.f58205u = 1;
                    if (this.f58199b.emit(boolValueOf, xVar) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i13 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj3);
                }
                return Unit.f71706a;
            case 2:
                if (continuation instanceof y) {
                    yVar = (y) continuation;
                    int i14 = yVar.f58208u;
                    if ((i14 & Integer.MIN_VALUE) != 0) {
                        yVar.f58208u = i14 - Integer.MIN_VALUE;
                    } else {
                        yVar = new y(this, continuation);
                    }
                }
                Object obj4 = yVar.f58207t;
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i15 = yVar.f58208u;
                if (i15 == 0) {
                    ResultKt.b(obj4);
                    dx.q0 q0Var2 = (dx.q0) ((dx.h) obj).f49705a.get(new dx.t(this.f58200c));
                    String str3 = null;
                    if (q0Var2 != null && (list2 = q0Var2.f49763b) != null) {
                        Iterator it2 = list2.iterator();
                        while (true) {
                            if (it2.hasNext()) {
                                dx.f fVar2 = (dx.f) it2.next();
                                dx.e eVar = fVar2 instanceof dx.e ? (dx.e) fVar2 : null;
                                String str4 = eVar != null ? eVar.f49695a : null;
                                if (str4 != null) {
                                    str3 = str4;
                                }
                            }
                        }
                    }
                    yVar.f58208u = 1;
                    if (this.f58199b.emit(str3, yVar) == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                } else {
                    if (i15 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj4);
                }
                return Unit.f71706a;
            default:
                if (continuation instanceof z) {
                    zVar = (z) continuation;
                    int i16 = zVar.f58211u;
                    if ((i16 & Integer.MIN_VALUE) != 0) {
                        zVar.f58211u = i16 - Integer.MIN_VALUE;
                    } else {
                        zVar = new z(this, continuation);
                    }
                }
                Object obj5 = zVar.f58210t;
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                int i17 = zVar.f58211u;
                if (i17 == 0) {
                    ResultKt.b(obj5);
                    Boolean boolValueOf2 = Boolean.valueOf(((Set) obj).contains(this.f58200c));
                    zVar.f58211u = 1;
                    if (this.f58199b.emit(boolValueOf2, zVar) == coroutineSingletons4) {
                        return coroutineSingletons4;
                    }
                } else {
                    if (i17 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj5);
                }
                return Unit.f71706a;
        }
    }
}

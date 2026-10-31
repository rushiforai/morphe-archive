package ads_mobile_sdk;

import b.c0;
import b.i0;
import b.p5;
import java.util.Iterator;
import java.util.Map;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class dz1 implements b.r {

    /* renamed from: a, reason: collision with root package name */
    public final Map f2691a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f2692b;

    public /* synthetic */ dz1(int i5, Map map) {
        this.f2692b = i5;
        this.f2691a = map;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(i0 i0Var, ContinuationImpl continuationImpl) {
        dk1 dk1Var;
        if (continuationImpl instanceof dk1) {
            dk1Var = (dk1) continuationImpl;
            int i5 = dk1Var.f2555c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dk1Var.f2555c = i5 - Integer.MIN_VALUE;
            } else {
                dk1Var = new dk1(this, continuationImpl);
            }
        }
        Object obj = dk1Var.f2553a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dk1Var.f2555c;
        if (i11 == 0) {
            ResultKt.b(obj);
            dz1 dz1Var = new dz1(this.f2691a);
            dk1Var.f2555c = 1;
            if (dz1Var.a((b.u7) i0Var, (ContinuationImpl) dk1Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        return Unit.f71706a;
    }

    public dz1(Map handlers) {
        this.f2692b = 4;
        Intrinsics.g(handlers, "handlers");
        this.f2691a = handlers;
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(p5 p5Var, ContinuationImpl continuationImpl) {
        g00 g00Var;
        sk3 sk3Var;
        switch (this.f2692b) {
            case 2:
                if (continuationImpl instanceof g00) {
                    g00Var = (g00) continuationImpl;
                    int i5 = g00Var.f3601c;
                    if ((i5 & Integer.MIN_VALUE) != 0) {
                        g00Var.f3601c = i5 - Integer.MIN_VALUE;
                    } else {
                        g00Var = new g00(this, continuationImpl);
                    }
                }
                Object obj = g00Var.f3599a;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = g00Var.f3601c;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    dz1 dz1Var = new dz1(this.f2691a);
                    g00Var.f3601c = 1;
                    if (dz1Var.a((b.u7) p5Var, (ContinuationImpl) g00Var) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                if (continuationImpl instanceof sk3) {
                    sk3Var = (sk3) continuationImpl;
                    int i12 = sk3Var.f9596c;
                    if ((i12 & Integer.MIN_VALUE) != 0) {
                        sk3Var.f9596c = i12 - Integer.MIN_VALUE;
                    } else {
                        sk3Var = new sk3(this, continuationImpl);
                    }
                }
                Object obj2 = sk3Var.f9594a;
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i13 = sk3Var.f9596c;
                if (i13 == 0) {
                    ResultKt.b(obj2);
                    dz1 dz1Var2 = new dz1(this.f2691a);
                    sk3Var.f9596c = 1;
                    if (dz1Var2.a((b.u7) p5Var, (ContinuationImpl) sk3Var) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i13 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj2);
                }
                return Unit.f71706a;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x005b  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00d2  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x001d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(b.u7 u7Var, ContinuationImpl continuationImpl) {
        cz1 cz1Var;
        uy0 uy0Var;
        b.u7 u7Var2;
        Iterator it;
        yh2 yh2Var;
        int i5 = this.f2692b;
        Map map = this.f2691a;
        switch (i5) {
            case 0:
                if (continuationImpl instanceof cz1) {
                    cz1Var = (cz1) continuationImpl;
                    int i11 = cz1Var.f2125c;
                    if ((i11 & Integer.MIN_VALUE) != 0) {
                        cz1Var.f2125c = i11 - Integer.MIN_VALUE;
                    } else {
                        cz1Var = new cz1(this, continuationImpl);
                    }
                }
                Object obj = cz1Var.f2123a;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i12 = cz1Var.f2125c;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    dz1 dz1Var = new dz1(map);
                    cz1Var.f2125c = 1;
                    if (dz1Var.a(u7Var, cz1Var) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 4:
                if (continuationImpl instanceof uy0) {
                    uy0Var = (uy0) continuationImpl;
                    int i13 = uy0Var.f10527e;
                    if ((i13 & Integer.MIN_VALUE) != 0) {
                        uy0Var.f10527e = i13 - Integer.MIN_VALUE;
                    } else {
                        uy0Var = new uy0(this, continuationImpl);
                    }
                }
                Object obj2 = uy0Var.f10525c;
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i14 = uy0Var.f10527e;
                if (i14 == 0) {
                    ResultKt.b(obj2);
                    Iterator it2 = map.entrySet().iterator();
                    u7Var2 = u7Var;
                    it = it2;
                } else {
                    if (i14 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    it = uy0Var.f10524b;
                    u7Var2 = uy0Var.f10523a;
                    ResultKt.b(obj2);
                }
                while (it.hasNext()) {
                    Map.Entry entry = (Map.Entry) it.next();
                    String str = (String) entry.getKey();
                    b.gb gbVar = (b.gb) entry.getValue();
                    cz.b bVar = mu0.f7335a;
                    mu0.b(c0.n("Installing gmsg handler for [", str, "] adKey: [", gbVar.d(), "]"), null);
                    uy0Var.f10523a = u7Var2;
                    uy0Var.f10524b = it;
                    uy0Var.f10527e = 1;
                    if (u7Var2.a(str, gbVar, uy0Var) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                }
                return Unit.f71706a;
            default:
                if (continuationImpl instanceof yh2) {
                    yh2Var = (yh2) continuationImpl;
                    int i15 = yh2Var.f12027c;
                    if ((i15 & Integer.MIN_VALUE) != 0) {
                        yh2Var.f12027c = i15 - Integer.MIN_VALUE;
                    } else {
                        yh2Var = new yh2(this, continuationImpl);
                    }
                }
                Object obj3 = yh2Var.f12025a;
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i16 = yh2Var.f12027c;
                if (i16 == 0) {
                    ResultKt.b(obj3);
                    dz1 dz1Var2 = new dz1(map);
                    yh2Var.f12027c = 1;
                    if (dz1Var2.a(u7Var, yh2Var) == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                } else {
                    if (i16 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj3);
                }
                return Unit.f71706a;
        }
    }

    @Override // b.r
    public final /* bridge */ /* synthetic */ Object a(Object obj, pk1 pk1Var) {
        switch (this.f2692b) {
        }
        return a((b.u7) obj, (ContinuationImpl) pk1Var);
    }
}

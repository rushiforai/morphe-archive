package ads_mobile_sdk;

import java.util.Map;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class k02 implements b.r {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Map f5461a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f5462b;

    public /* synthetic */ k02(int i5, Map map) {
        this.f5462b = i5;
        this.f5461a = map;
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00a2  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00e7  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(b.u7 u7Var, ContinuationImpl continuationImpl) {
        j02 j02Var;
        sz1 sz1Var;
        y81 y81Var;
        ya3 ya3Var;
        switch (this.f5462b) {
            case 0:
                if (continuationImpl instanceof j02) {
                    j02Var = (j02) continuationImpl;
                    int i5 = j02Var.f5079c;
                    if ((i5 & Integer.MIN_VALUE) != 0) {
                        j02Var.f5079c = i5 - Integer.MIN_VALUE;
                    } else {
                        j02Var = new j02(this, continuationImpl);
                    }
                }
                Object obj = j02Var.f5077a;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = j02Var.f5079c;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    dz1 dz1Var = new dz1(this.f5461a);
                    j02Var.f5079c = 1;
                    if (dz1Var.a(u7Var, j02Var) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 1:
                if (continuationImpl instanceof sz1) {
                    sz1Var = (sz1) continuationImpl;
                    int i12 = sz1Var.f9742c;
                    if ((i12 & Integer.MIN_VALUE) != 0) {
                        sz1Var.f9742c = i12 - Integer.MIN_VALUE;
                    } else {
                        sz1Var = new sz1(this, continuationImpl);
                    }
                }
                Object obj2 = sz1Var.f9740a;
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i13 = sz1Var.f9742c;
                if (i13 == 0) {
                    ResultKt.b(obj2);
                    dz1 dz1Var2 = new dz1(this.f5461a);
                    sz1Var.f9742c = 1;
                    if (dz1Var2.a(u7Var, sz1Var) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i13 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj2);
                }
                return Unit.f71706a;
            case 2:
                if (continuationImpl instanceof y81) {
                    y81Var = (y81) continuationImpl;
                    int i14 = y81Var.f11961c;
                    if ((i14 & Integer.MIN_VALUE) != 0) {
                        y81Var.f11961c = i14 - Integer.MIN_VALUE;
                    } else {
                        y81Var = new y81(this, continuationImpl);
                    }
                }
                Object obj3 = y81Var.f11959a;
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i15 = y81Var.f11961c;
                if (i15 == 0) {
                    ResultKt.b(obj3);
                    dz1 dz1Var3 = new dz1(this.f5461a);
                    y81Var.f11961c = 1;
                    if (dz1Var3.a(u7Var, y81Var) == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                } else {
                    if (i15 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj3);
                }
                return Unit.f71706a;
            default:
                if (continuationImpl instanceof ya3) {
                    ya3Var = (ya3) continuationImpl;
                    int i16 = ya3Var.f11989c;
                    if ((i16 & Integer.MIN_VALUE) != 0) {
                        ya3Var.f11989c = i16 - Integer.MIN_VALUE;
                    } else {
                        ya3Var = new ya3(this, continuationImpl);
                    }
                }
                Object obj4 = ya3Var.f11987a;
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                int i17 = ya3Var.f11989c;
                if (i17 == 0) {
                    ResultKt.b(obj4);
                    dz1 dz1Var4 = new dz1(this.f5461a);
                    ya3Var.f11989c = 1;
                    if (dz1Var4.a(u7Var, ya3Var) == coroutineSingletons4) {
                        return coroutineSingletons4;
                    }
                } else {
                    if (i17 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj4);
                }
                return Unit.f71706a;
        }
    }

    @Override // b.r
    public final /* bridge */ /* synthetic */ Object a(Object obj, pk1 pk1Var) {
        switch (this.f5462b) {
        }
        return a((b.u7) obj, (ContinuationImpl) pk1Var);
    }
}

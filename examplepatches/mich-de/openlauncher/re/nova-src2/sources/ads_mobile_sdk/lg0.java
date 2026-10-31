package ads_mobile_sdk;

import c80.d;
import java.util.Map;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;

/* loaded from: classes2.dex */
public final class lg0 implements b.gb {

    /* renamed from: b, reason: collision with root package name */
    public int f6233b;

    /* renamed from: a, reason: collision with root package name */
    public final d f6232a = new d();

    /* renamed from: c, reason: collision with root package name */
    public final int f6234c = 9;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f6235d = true;

    /* JADX WARN: Code restructure failed: missing block: B:37:0x0096, code lost:
    
        if (r8.a(r4, r0) == r1) goto L38;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r8v13, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r8v14 */
    /* JADX WARN: Type inference failed for: r8v4 */
    /* JADX WARN: Type inference failed for: r8v6 */
    /* JADX WARN: Type inference failed for: r8v7 */
    @Override // b.gb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(tx0 tx0Var, Map map, Continuation continuation) throws Throwable {
        kg0 kg0Var;
        d dVar;
        lg0 lg0Var;
        Throwable th2;
        ?? r82;
        if (continuation instanceof kg0) {
            kg0Var = (kg0) continuation;
            int i5 = kg0Var.f5733g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kg0Var.f5733g = i5 - Integer.MIN_VALUE;
            } else {
                kg0Var = new kg0(this, continuation);
            }
        }
        Object obj = kg0Var.f5731e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = kg0Var.f5733g;
        boolean z11 = true;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                kg0Var.f5727a = this;
                kg0Var.f5728b = tx0Var;
                kg0Var.f5729c = map;
                dVar = this.f6232a;
                kg0Var.f5730d = dVar;
                kg0Var.f5733g = 1;
                if (dVar.e(kg0Var) != coroutineSingletons) {
                    lg0Var = this;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                r82 = (c80.a) kg0Var.f5727a;
                try {
                    ResultKt.b(obj);
                    r82 = r82;
                    Unit unit = Unit.f71706a;
                    ((d) r82).g(null);
                    return unit;
                } catch (Throwable th3) {
                    th2 = th3;
                    dVar = r82;
                    dVar.g(null);
                    throw th2;
                }
            }
            d dVar2 = kg0Var.f5730d;
            map = kg0Var.f5729c;
            tx0 tx0Var2 = kg0Var.f5728b;
            lg0Var = (lg0) kg0Var.f5727a;
            ResultKt.b(obj);
            dVar = dVar2;
            tx0Var = tx0Var2;
            if (map.containsKey("start")) {
                lg0Var.f6233b++;
            } else if (map.containsKey("stop")) {
                lg0Var.f6233b--;
            }
            et0 et0Var = tx0Var.o;
            if (et0Var != null) {
                if (lg0Var.f6233b <= 0) {
                    z11 = false;
                }
                kg0Var.f5727a = dVar;
                kg0Var.f5728b = null;
                kg0Var.f5729c = null;
                kg0Var.f5730d = null;
                kg0Var.f5733g = 2;
            }
            r82 = dVar;
            Unit unit2 = Unit.f71706a;
            ((d) r82).g(null);
            return unit2;
        } catch (Throwable th4) {
            th2 = th4;
            dVar.g(null);
            throw th2;
        }
    }

    @Override // b.gb
    public final int b() {
        return this.f6234c;
    }

    @Override // b.gb
    public final boolean c() {
        return this.f6235d;
    }
}

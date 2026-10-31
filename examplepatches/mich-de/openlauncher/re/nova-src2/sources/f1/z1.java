package f1;

import android.content.Context;
import java.util.UUID;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlinx.serialization.internal.EnumsKt;

/* loaded from: classes2.dex */
public final /* synthetic */ class z1 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54150a;

    public /* synthetic */ z1(int i5) {
        this.f54150a = i5;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f54150a) {
            case 0:
                return new y3.f(0);
            case 1:
                p1.z2 z2Var = g2.f53558a;
                return Boolean.TRUE;
            case 2:
                return new m3(i2.s.f61147m, null);
            case 3:
                p1.z2 z2Var2 = v3.f54051a;
                return null;
            case 4:
                float f11 = 4;
                return new y3(s0.h.c(f11), s0.h.c(f11), s0.h.c(0));
            case 5:
                throw null;
            case 6:
                return i5.f53670a;
            case 7:
                return new h5(null, 16383);
            case 8:
                Context context = fo.d.f55465c;
                if (context != null) {
                    return new lo.b(context);
                }
                throw new IllegalStateException("InstaAI not initialized. Call InstaAI.initialize() first.");
            case 9:
                y70.d dVar = fo.d.f55463a;
                return Boolean.TRUE;
            case 10:
                return EnumsKt.createSimpleEnumSerializer("com.stripe.android.model.MobileFallbackWebviewParams.WebviewRequirementType", ft.j0.values());
            case 11:
                p1.z2 z2Var3 = fw.b.f56148a;
                return fw.g.f56151a;
            case 12:
                p1.z2 z2Var4 = fw.d.f56149a;
                return fw.h.f56152a;
            case 13:
                p1.z2 z2Var5 = fw.f.f56150a;
                return fw.i.f56153a;
            case 14:
                float f12 = g0.x.f56754a;
                return Boolean.TRUE;
            case 15:
                return new x80.e0();
            case 16:
                return Long.valueOf(System.currentTimeMillis());
            case 17:
                return Long.valueOf(System.currentTimeMillis());
            case 18:
                return Long.valueOf(System.currentTimeMillis());
            case 19:
                return Long.valueOf(System.currentTimeMillis());
            case 20:
                p1.z2 z2Var6 = gy.v1.f58563a;
                return Boolean.TRUE;
            case 21:
                return Integer.valueOf(w20.e.k(48));
            case 22:
                return UUID.randomUUID().toString();
            case 23:
                return androidx.compose.runtime.d.k(Boolean.FALSE);
            case 24:
                return Unit.f71706a;
            case 25:
                return androidx.compose.runtime.d.k(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            case 26:
                return Unit.f71706a;
            case 27:
                return Unit.f71706a;
            case 28:
                return new hv.w2((31 & 1) != 0 ? i2.s.f61147m : 0L, (31 & 2) != 0 ? i2.s.f61147m : 0L, (4 & 31) != 0 ? i2.s.f61147m : 0L, (31 & 8) != 0 ? i2.s.f61147m : 0L, i2.s.f61147m);
            default:
                return new hv.f3(Float.NaN, Float.NaN, Float.NaN);
        }
    }
}

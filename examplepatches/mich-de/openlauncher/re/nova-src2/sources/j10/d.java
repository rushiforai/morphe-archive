package j10;

import ads_mobile_sdk.db0;
import ads_mobile_sdk.gu0;
import ads_mobile_sdk.sv2;
import android.content.Context;
import androidx.lifecycle.ProcessLifecycleOwner;
import b.b4;
import b10.r0;
import h6.g1;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import ni.b0;
import ni.c0;
import ni.d0;
import ni.e0;
import ni.f0;
import t70.m0;

/* loaded from: classes4.dex */
public abstract class d {

    /* renamed from: a, reason: collision with root package name */
    public static final AtomicBoolean f68601a = new AtomicBoolean(false);

    public static void a(boolean z11) {
        lb0.b.f74823c = z11;
        c0 c0Var = z11 ? c0.f78255c : c0.f78254b;
        try {
            int i5 = Result.f71687b;
            d0 d0Var = d0.f78259a;
            e0 e0Var = e0.f78267a;
            f0 f0Var = new f0(b0.f78250b, ul.b.h("B3EEABB8EE11C2BE770B684D95219ECB"), c0Var);
            b4.f15783a.getClass();
            ((sv2) ((db0) gu0.a()).G0.get()).a(f0Var);
            Unit unit = Unit.f71706a;
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            ResultKt.a(th2);
        }
    }

    public static void b(Context context) {
        a(m.i(context));
        if (f68601a.compareAndSet(false, true)) {
            m0.t(g1.e(ProcessLifecycleOwner.f14727c), null, null, new r0(2, null, 12), 3);
        }
    }
}

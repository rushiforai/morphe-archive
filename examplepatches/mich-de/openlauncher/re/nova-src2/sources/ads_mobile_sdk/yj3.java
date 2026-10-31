package ads_mobile_sdk;

import android.content.Context;
import android.os.Looper;
import b.c0;
import com.google.android.gms.common.ConnectionResult;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;

/* loaded from: classes2.dex */
public final class yj3 extends b.ga implements sg.b, sg.c {

    /* renamed from: j, reason: collision with root package name */
    public static final /* synthetic */ int f12042j = 0;

    /* renamed from: a, reason: collision with root package name */
    public final t70.j0 f12043a;

    /* renamed from: b, reason: collision with root package name */
    public final Context f12044b;

    /* renamed from: c, reason: collision with root package name */
    public final ci3 f12045c;

    /* renamed from: d, reason: collision with root package name */
    public final ai.j0 f12046d;

    /* renamed from: e, reason: collision with root package name */
    public final AtomicBoolean f12047e;

    /* renamed from: f, reason: collision with root package name */
    public final AtomicBoolean f12048f;

    /* renamed from: g, reason: collision with root package name */
    public final AtomicBoolean f12049g;

    /* renamed from: h, reason: collision with root package name */
    public final t70.s f12050h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public yj3(t70.j0 backgroundScope, Context context, ci3 traceLogger) {
        super("com.google.android.gms.ads.internal.request.ITrustlessTokenListener", 0);
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(context, "context");
        Intrinsics.g(traceLogger, "traceLogger");
        this.f12043a = backgroundScope;
        this.f12044b = context;
        this.f12045c = traceLogger;
        this.f12046d = new ai.j0(context, Looper.getMainLooper(), 8, this, this, 1);
        this.f12047e = new AtomicBoolean(false);
        this.f12048f = new AtomicBoolean(false);
        this.f12049g = new AtomicBoolean(false);
        this.f12050h = m0.b();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) {
        uj3 uj3Var;
        yj3 yj3Var;
        if (continuationImpl instanceof uj3) {
            uj3Var = (uj3) continuationImpl;
            int i5 = uj3Var.f10381d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                uj3Var.f10381d = i5 - Integer.MIN_VALUE;
            } else {
                uj3Var = new uj3(this, continuationImpl);
            }
        }
        Object objY = uj3Var.f10379b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = uj3Var.f10381d;
        if (i11 == 0) {
            ResultKt.b(objY);
            boolean andSet = this.f12047e.getAndSet(true);
            t70.s sVar = this.f12050h;
            if (andSet) {
                uj3Var.f10381d = 1;
                Object objY2 = sVar.y(uj3Var);
                if (objY2 != coroutineSingletons) {
                    return objY2;
                }
            } else {
                this.f12046d.checkAvailabilityAndConnect();
                uj3Var.f10378a = this;
                uj3Var.f10381d = 2;
                objY = sVar.y(uj3Var);
                if (objY != coroutineSingletons) {
                    yj3Var = this;
                }
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            ResultKt.b(objY);
            return objY;
        }
        if (i11 != 2) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        yj3Var = uj3Var.f10378a;
        ResultKt.b(objY);
        b.a1 a1Var = (b.a1) objY;
        m0.t(yj3Var.f12043a, null, null, new vj3(yj3Var, null, 0), 3);
        return a1Var;
    }

    @Override // sg.b
    public final void onConnected() {
        if (this.f12049g.getAndSet(true)) {
            return;
        }
        m0.t(this.f12043a, null, null, new vj3(this, null, 1), 3);
    }

    @Override // sg.c
    public final void onConnectionFailed(ConnectionResult result) {
        Intrinsics.g(result, "result");
        tu0 tu0Var = new tu0(a80.m.f(result.f31779g, "Failed to connect to GMSCore. Code: ", ", message: ", result.f31781i));
        if (this.f12048f.getAndSet(true)) {
            return;
        }
        this.f12050h.X(tu0Var);
    }

    @Override // sg.b
    public final void onConnectionSuspended(int i5) {
        tu0 tu0Var = new tu0(c0.h(i5, "GMSCore connection suspended. Code: "));
        if (this.f12048f.getAndSet(true)) {
            return;
        }
        this.f12050h.X(tu0Var);
    }

    public final void a(al0 exceptionParcel) {
        Intrinsics.g(exceptionParcel, "exceptionParcel");
        tu0 tu0Var = new tu0(exceptionParcel.f1036a + ". Error code: " + exceptionParcel.f1037b);
        if (this.f12048f.getAndSet(true)) {
            return;
        }
        this.f12050h.X(tu0Var);
    }
}

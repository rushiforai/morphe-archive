package ads_mobile_sdk;

import a60.d;
import android.content.Context;
import android.graphics.PointF;
import android.view.MotionEvent;
import android.view.ViewConfiguration;
import b.ed;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationUnit;
import t70.m0;
import t70.t0;

/* loaded from: classes.dex */
public final class wf0 {

    /* renamed from: a, reason: collision with root package name */
    public final t70.j0 f11256a;

    /* renamed from: b, reason: collision with root package name */
    public final rf0 f11257b;

    /* renamed from: c, reason: collision with root package name */
    public final jr0 f11258c;

    /* renamed from: d, reason: collision with root package name */
    public final String f11259d;

    /* renamed from: e, reason: collision with root package name */
    public final String f11260e;

    /* renamed from: f, reason: collision with root package name */
    public final com.google.gson.r f11261f;

    /* renamed from: g, reason: collision with root package name */
    public final mi3 f11262g;

    /* renamed from: h, reason: collision with root package name */
    public PointF f11263h;

    /* renamed from: i, reason: collision with root package name */
    public PointF f11264i;

    /* renamed from: j, reason: collision with root package name */
    public tf0 f11265j;

    /* renamed from: k, reason: collision with root package name */
    public final int f11266k;

    /* renamed from: l, reason: collision with root package name */
    public t70.g2 f11267l;

    public wf0(Context context, t70.j0 j0Var, rf0 rf0Var, jr0 jr0Var, String str, String str2, com.google.gson.r rVar, mi3 mi3Var) {
        Intrinsics.g(context, "context");
        this.f11256a = j0Var;
        this.f11257b = rf0Var;
        this.f11258c = jr0Var;
        this.f11259d = str;
        this.f11260e = str2;
        this.f11261f = rVar;
        this.f11262g = mi3Var;
        this.f11263h = new PointF(-1.0f, -1.0f);
        this.f11264i = new PointF(-1.0f, -1.0f);
        this.f11265j = tf0.f9914d;
        this.f11266k = ViewConfiguration.get(context).getScaledTouchSlop();
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x0076, code lost:
    
        if (ads_mobile_sdk.rf0.a(r1, r2, r3, r4, r5, r6) == r0) goto L22;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(wf0 wf0Var, ContinuationImpl continuationImpl) {
        vf0 vf0Var;
        if (continuationImpl instanceof vf0) {
            vf0Var = (vf0) continuationImpl;
            int i5 = vf0Var.f10772d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                vf0Var.f10772d = i5 - Integer.MIN_VALUE;
            } else {
                vf0Var = new vf0(wf0Var, continuationImpl);
            }
        }
        vf0 vf0Var2 = vf0Var;
        Object obj = vf0Var2.f10770b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = vf0Var2.f10772d;
        if (i11 == 0) {
            ResultKt.b(obj);
            jr0 jr0Var = wf0Var.f11258c;
            Duration.Companion companion = Duration.f72038b;
            long j11 = ((Duration) jr0Var.a("gads:debug_hold_gesture:time_millis", ed.k(2, DurationUnit.f72046e, "gads:debug_hold_gesture:time_millis"), u.a$1)).f72041a;
            vf0Var2.f10769a = wf0Var;
            vf0Var2.f10772d = 1;
            if (t0.c(j11, vf0Var2) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        wf0Var = vf0Var2.f10769a;
        ResultKt.b(obj);
        wf0Var.f11265j = tf0.f9913c;
        rf0 rf0Var = wf0Var.f11257b;
        String str = wf0Var.f11259d;
        String str2 = wf0Var.f11260e;
        com.google.gson.r rVar = wf0Var.f11261f;
        mi3 mi3Var = wf0Var.f11262g;
        vf0Var2.f10769a = null;
        vf0Var2.f10772d = 2;
    }

    public final boolean a(float f11, float f12, float f13, float f14) {
        float fAbs = Math.abs(this.f11263h.x - f11);
        int i5 = this.f11266k;
        return fAbs < ((float) i5) && Math.abs(this.f11263h.y - f12) < ((float) i5) && Math.abs(this.f11264i.x - f13) < ((float) i5) && Math.abs(this.f11264i.y - f14) < ((float) i5);
    }

    public final void a(MotionEvent motionEvent) {
        int actionMasked = motionEvent.getActionMasked();
        int historySize = motionEvent.getHistorySize();
        int pointerCount = motionEvent.getPointerCount();
        if (actionMasked == 0) {
            this.f11265j = tf0.f9911a;
            this.f11263h = new PointF(motionEvent.getX(), motionEvent.getY());
            return;
        }
        tf0 tf0Var = this.f11265j;
        if (tf0Var == tf0.f9914d) {
            return;
        }
        Continuation continuation = null;
        if (tf0Var == tf0.f9911a && actionMasked == 5) {
            this.f11265j = tf0.f9912b;
            this.f11264i = new PointF(motionEvent.getX(1), motionEvent.getY(1));
            d dVar = new d(this, continuation, 17);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(context, "context");
            this.f11267l = m0.t(this.f11256a, context, null, new ar.a(dVar, null), 2);
            return;
        }
        if (tf0Var == tf0.f9912b) {
            if (pointerCount == 2) {
                if (actionMasked != 2) {
                    return;
                }
                boolean z11 = false;
                int i5 = 0;
                while (true) {
                    if (i5 >= historySize) {
                        break;
                    }
                    if (!a(motionEvent.getHistoricalX(0, i5), motionEvent.getHistoricalY(0, i5), motionEvent.getHistoricalX(1, i5), motionEvent.getHistoricalY(1, i5))) {
                        z11 = true;
                        break;
                    }
                    i5++;
                }
                if (a(motionEvent.getX(), motionEvent.getY(), motionEvent.getX(1), motionEvent.getY(1)) && !z11) {
                    return;
                }
            }
            t70.g2 g2Var = this.f11267l;
            if (g2Var != null) {
                g2Var.c(null);
            }
            this.f11265j = tf0.f9914d;
        }
    }
}

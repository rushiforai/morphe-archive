package com.amplitude;

import android.os.SystemClock;
import android.view.MotionEvent;
import com.amplitude.Y2;
import java.util.ArrayList;
import java.util.concurrent.ScheduledExecutorService;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class Y2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ com.amplitude.android.sessionreplay.a f20447a;

    public Y2(com.amplitude.android.sessionreplay.a aVar) {
        this.f20447a = aVar;
    }

    public static final void a(ArrayList touchMoves, Long l9, com.amplitude.android.sessionreplay.a this$0, C0435f1 c0435f1, long j11) {
        Intrinsics.g(touchMoves, "$touchMoves");
        Intrinsics.g(this$0, "this$0");
        ArrayList arrayList = new ArrayList();
        if (!touchMoves.isEmpty() && l9 != null) {
            arrayList.add(new C0527v2(new C0522u2(touchMoves), l9.longValue(), this$0.snapshotSequence.incrementAndGet()));
        }
        if (c0435f1 != null) {
            long jIncrementAndGet = this$0.snapshotSequence.incrementAndGet();
            int i5 = c0435f1.f20558a;
            int iA = i5 != 0 ? i5 != 1 ? EnumC0448h2.f20605m.a() : EnumC0448h2.f20604l.a() : EnumC0448h2.f20602j.a();
            C0461j2.f20636g.getClass();
            V1.f20404i.getClass();
            arrayList.add(new C0467k2(new C0461j2(V1.f20405j, iA, (int) c0435f1.f20559b, (int) c0435f1.f20560c), j11, jIncrementAndGet));
        }
        if (arrayList.isEmpty()) {
            return;
        }
        this$0.a(arrayList);
    }

    public final p40.e intercept(MotionEvent motionEvent, Function1 dispatch) {
        Intrinsics.g(motionEvent, "motionEvent");
        Intrinsics.g(dispatch, "dispatch");
        onTouchEvent(motionEvent);
        return (p40.e) dispatch.invoke(motionEvent);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v4, types: [com.amplitude.w2] */
    public final void onTouchEvent(MotionEvent motionEvent) {
        Intrinsics.g(motionEvent, "motionEvent");
        if (this.f20447a.shouldRecord()) {
            int actionMasked = motionEvent.getActionMasked();
            if (actionMasked != 0 && actionMasked != 1) {
                if (actionMasked == 2) {
                    if (this.f20447a.replayState.f20210d == null) {
                        this.f20447a.replayState.f20210d = Long.valueOf(motionEvent.getDownTime() + (System.currentTimeMillis() - SystemClock.uptimeMillis()));
                    }
                    if (motionEvent.getPointerCount() >= 1) {
                        int iA = (int) AbstractC0441g1.a(motionEvent);
                        int iB = (int) AbstractC0441g1.b(motionEvent);
                        C0461j2.f20636g.getClass();
                        V1.f20404i.getClass();
                        c0532w2 = new C0532w2(iA, iB, V1.f20405j, motionEvent.getEventTime() - motionEvent.getDownTime());
                    }
                    if (c0532w2 != null) {
                        this.f20447a.replayState.f20211e.add(c0532w2);
                        return;
                    }
                    return;
                }
                if (actionMasked != 3) {
                    return;
                }
            }
            final long eventTime = motionEvent.getEventTime() + (System.currentTimeMillis() - SystemClock.uptimeMillis());
            final ArrayList arrayList = this.f20447a.replayState.f20211e;
            final Long l9 = this.f20447a.replayState.f20210d;
            D2 d22 = this.f20447a.replayState;
            ArrayList arrayList2 = new ArrayList();
            d22.getClass();
            d22.f20211e = arrayList2;
            this.f20447a.replayState.f20210d = null;
            final C0435f1 c0435f1 = motionEvent.getPointerCount() >= 1 ? new C0435f1(motionEvent.getActionMasked(), AbstractC0441g1.a(motionEvent), AbstractC0441g1.b(motionEvent)) : null;
            ScheduledExecutorService scheduledExecutorServiceAccess$getBackgroundProcessor = com.amplitude.android.sessionreplay.a.access$getBackgroundProcessor(this.f20447a);
            final com.amplitude.android.sessionreplay.a aVar = this.f20447a;
            scheduledExecutorServiceAccess$getBackgroundProcessor.submit(new Runnable() { // from class: g9.b
                @Override // java.lang.Runnable
                public final void run() {
                    Y2.a(arrayList, l9, aVar, c0435f1, eventTime);
                }
            });
        }
    }
}

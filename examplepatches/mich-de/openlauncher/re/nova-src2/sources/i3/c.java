package i3;

import android.graphics.Canvas;
import android.graphics.Rect;
import android.os.CancellationSignal;
import android.view.ScrollCaptureCallback;
import android.view.ScrollCaptureSession;
import androidx.compose.ui.platform.AndroidComposeView;
import androidx.room.p;
import b.c0;
import g90.k;
import ge.j;
import j3.q;
import java.util.function.Consumer;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.math.MathKt;
import p1.b1;
import p1.s2;
import t70.c2;
import t70.g2;
import t70.m0;
import y3.l;

/* loaded from: classes2.dex */
public final class c implements ScrollCaptureCallback {

    /* renamed from: a, reason: collision with root package name */
    public final q f61227a;

    /* renamed from: b, reason: collision with root package name */
    public final l f61228b;

    /* renamed from: c, reason: collision with root package name */
    public final h f61229c;

    /* renamed from: d, reason: collision with root package name */
    public final AndroidComposeView f61230d;

    /* renamed from: e, reason: collision with root package name */
    public final y70.d f61231e;

    /* renamed from: f, reason: collision with root package name */
    public final f f61232f;

    public c(q qVar, l lVar, y70.d dVar, h hVar, AndroidComposeView androidComposeView) {
        this.f61227a = qVar;
        this.f61228b = lVar;
        this.f61229c = hVar;
        this.f61230d = androidComposeView;
        this.f61231e = new y70.d(dVar.getCoroutineContext().plus(d.f61233a));
        this.f61232f = new f(lVar.c(), new f1.i(this, null));
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x00de  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00e1  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(c cVar, ScrollCaptureSession scrollCaptureSession, l lVar, ContinuationImpl continuationImpl) {
        a aVar;
        int i5;
        int i11;
        Object objB;
        ScrollCaptureSession scrollCaptureSessionI;
        l lVar2;
        int i12;
        int i13;
        int iE0;
        int iE02;
        if (continuationImpl instanceof a) {
            aVar = (a) continuationImpl;
            int i14 = aVar.f61222z;
            if ((i14 & Integer.MIN_VALUE) != 0) {
                aVar.f61222z = i14 - Integer.MIN_VALUE;
            } else {
                aVar = new a(cVar, continuationImpl);
            }
        }
        Object obj = aVar.f61220x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i15 = aVar.f61222z;
        if (i15 == 0) {
            ResultKt.b(obj);
            i5 = lVar.f96608b;
            i11 = lVar.f96610d;
            f fVar = cVar.f61232f;
            aVar.f61216t = scrollCaptureSession;
            aVar.f61217u = lVar;
            aVar.f61218v = i5;
            aVar.f61219w = i11;
            aVar.f61222z = 1;
            int i16 = fVar.f61237a;
            if (i5 > i11) {
                throw new IllegalArgumentException(c0.g(i5, i11, "Expected min=", " ≤ max=").toString());
            }
            int i17 = i11 - i5;
            if (i17 > i16) {
                throw new IllegalArgumentException(c0.g(i17, i16, "Expected range (", ") to be ≤ viewportSize=").toString());
            }
            float f11 = i5;
            float f12 = fVar.f61238b;
            if (f11 < f12 || i11 > i16 + f12) {
                objB = fVar.b((f11 < f12 ? i5 : i11 - i16) - f12, aVar);
                if (objB != coroutineSingletons) {
                    objB = Unit.f71706a;
                }
                if (objB != coroutineSingletons) {
                    objB = Unit.f71706a;
                }
            } else {
                objB = Unit.f71706a;
            }
            if (objB != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i15 != 1) {
            if (i15 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i13 = aVar.f61219w;
            i12 = aVar.f61218v;
            lVar2 = aVar.f61217u;
            scrollCaptureSessionI = j.i(aVar.f61216t);
            ResultKt.b(obj);
            f fVar2 = cVar.f61232f;
            iE0 = kotlin.ranges.a.e0(i12 - MathKt.b(fVar2.f61238b), 0, fVar2.f61237a);
            f fVar3 = cVar.f61232f;
            iE02 = kotlin.ranges.a.e0(i13 - MathKt.b(fVar3.f61238b), 0, fVar3.f61237a);
            int i18 = lVar2.f96607a;
            int i19 = lVar2.f96609c;
            if (iE0 != iE02) {
                return l.f96606e;
            }
            Canvas canvasLockHardwareCanvas = scrollCaptureSessionI.getSurface().lockHardwareCanvas();
            try {
                canvasLockHardwareCanvas.save();
                canvasLockHardwareCanvas.translate(-i18, -iE0);
                l lVar3 = cVar.f61228b;
                canvasLockHardwareCanvas.translate(-lVar3.f96607a, -lVar3.f96608b);
                cVar.f61230d.getRootView().draw(canvasLockHardwareCanvas);
                scrollCaptureSessionI.getSurface().unlockCanvasAndPost(canvasLockHardwareCanvas);
                int iB = MathKt.b(cVar.f61232f.f61238b);
                return new l(i18, iE0 + iB, i19, iE02 + iB);
            } catch (Throwable th2) {
                scrollCaptureSessionI.getSurface().unlockCanvasAndPost(canvasLockHardwareCanvas);
                throw th2;
            }
        }
        int i21 = aVar.f61219w;
        int i22 = aVar.f61218v;
        l lVar4 = aVar.f61217u;
        ScrollCaptureSession scrollCaptureSessionI2 = j.i(aVar.f61216t);
        ResultKt.b(obj);
        i5 = i22;
        lVar = lVar4;
        i11 = i21;
        scrollCaptureSession = scrollCaptureSessionI2;
        b bVar = b.f61223k;
        aVar.f61216t = scrollCaptureSession;
        aVar.f61217u = lVar;
        aVar.f61218v = i5;
        aVar.f61219w = i11;
        aVar.f61222z = 2;
        if (b1.a(aVar.getContext()).s(bVar, aVar) != coroutineSingletons) {
            scrollCaptureSessionI = scrollCaptureSession;
            lVar2 = lVar;
            i12 = i5;
            i13 = i11;
            f fVar22 = cVar.f61232f;
            iE0 = kotlin.ranges.a.e0(i12 - MathKt.b(fVar22.f61238b), 0, fVar22.f61237a);
            f fVar32 = cVar.f61232f;
            iE02 = kotlin.ranges.a.e0(i13 - MathKt.b(fVar32.f61238b), 0, fVar32.f61237a);
            int i182 = lVar2.f96607a;
            int i192 = lVar2.f96609c;
            if (iE0 != iE02) {
            }
        }
        return coroutineSingletons;
    }

    public final void onScrollCaptureEnd(Runnable runnable) {
        m0.t(this.f61231e, c2.f88780b, null, new h6.c(this, runnable, null, 12), 2);
    }

    public final void onScrollCaptureImageRequest(ScrollCaptureSession scrollCaptureSession, CancellationSignal cancellationSignal, Rect rect, Consumer consumer) {
        g2 g2VarT = m0.t(this.f61231e, null, null, new p(this, scrollCaptureSession, rect, consumer, null, 20), 3);
        g2VarT.w(new androidx.fragment.app.p(cancellationSignal, 16));
        cancellationSignal.setOnCancelListener(new c1.j(g2VarT, 1));
    }

    public final void onScrollCaptureSearch(CancellationSignal cancellationSignal, Consumer consumer) {
        consumer.accept(k.l0(this.f61228b));
    }

    public final void onScrollCaptureStart(ScrollCaptureSession scrollCaptureSession, CancellationSignal cancellationSignal, Runnable runnable) {
        this.f61232f.f61238b = 0.0f;
        ((s2) this.f61229c.f61240a).setValue(Boolean.TRUE);
        runnable.run();
    }
}

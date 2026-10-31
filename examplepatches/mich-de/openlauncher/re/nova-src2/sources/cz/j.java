package cz;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.PointF;
import android.os.Handler;
import android.os.SystemClock;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.ViewConfiguration;
import com.android.launcher3.Workspace;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.util.NamedIntent;
import e10.s2;
import e10.y2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class j implements GestureDetector.OnGestureListener, GestureDetector.OnDoubleTapListener {
    public final int C;

    /* renamed from: a, reason: collision with root package name */
    public final Context f48648a;

    /* renamed from: b, reason: collision with root package name */
    public final c30.c f48649b;

    /* renamed from: c, reason: collision with root package name */
    public float f48650c;

    /* renamed from: d, reason: collision with root package name */
    public float f48651d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f48652e;

    /* renamed from: f, reason: collision with root package name */
    public float f48653f;

    /* renamed from: g, reason: collision with root package name */
    public float f48654g;

    /* renamed from: h, reason: collision with root package name */
    public float f48655h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f48656i;

    /* renamed from: j, reason: collision with root package name */
    public final int f48657j;

    /* renamed from: k, reason: collision with root package name */
    public final int f48658k;

    /* renamed from: l, reason: collision with root package name */
    public float f48659l;

    /* renamed from: m, reason: collision with root package name */
    public float f48660m;
    public float n;
    public int o;

    /* renamed from: p, reason: collision with root package name */
    public long f48661p;

    /* renamed from: q, reason: collision with root package name */
    public final int f48662q;

    /* renamed from: r, reason: collision with root package name */
    public MotionEvent f48663r;

    /* renamed from: t, reason: collision with root package name */
    public final h f48665t;

    /* renamed from: u, reason: collision with root package name */
    public boolean f48666u;

    /* renamed from: s, reason: collision with root package name */
    public int f48664s = 0;

    /* renamed from: v, reason: collision with root package name */
    public boolean f48667v = false;

    /* renamed from: w, reason: collision with root package name */
    public long f48668w = Long.MIN_VALUE;

    /* renamed from: x, reason: collision with root package name */
    public boolean f48669x = false;

    /* renamed from: y, reason: collision with root package name */
    public boolean f48670y = false;

    /* renamed from: z, reason: collision with root package name */
    public boolean f48671z = false;
    public final PointF A = new PointF();
    public final PointF B = new PointF();
    public boolean D = false;

    public j(NovaLauncher novaLauncher, c30.c cVar) {
        this.f48648a = novaLauncher;
        this.f48649b = cVar;
        this.f48657j = ViewConfiguration.get(novaLauncher).getScaledTouchSlop() * 2;
        Resources resources = novaLauncher.getResources();
        this.f48662q = resources.getDimensionPixelSize(2131165355);
        this.f48658k = resources.getDimensionPixelSize(2131165354);
        this.f48652e = true;
        if (this.f48665t == null) {
            h hVar = new h(novaLauncher, this);
            this.f48665t = hVar;
            hVar.f48637u = false;
        }
        this.C = novaLauncher.getResources().getDimensionPixelSize(2131165527);
    }

    public static final float b(float f11, float f12) {
        float fAbs = Math.abs(f11);
        float f13 = f12 >= 0.0f ? 0.7853982f - (((f12 - fAbs) / (f12 + fAbs)) * 0.7853982f) : 2.3561945f - (((f12 + fAbs) / (fAbs - f12)) * 0.7853982f);
        return f11 < 0.0f ? -f13 : f13;
    }

    public static final float d(float f11) {
        return f11 - (x7.f.y((3.1415927f + f11) / 6.2831855f) * 6.2831855f);
    }

    public final void a() {
        this.f48665t.a();
        this.f48671z = false;
        this.f48667v = false;
        this.f48659l = Float.NaN;
        this.f48660m = Float.NaN;
        this.n = Float.NaN;
        this.o = 0;
        this.f48661p = 0L;
        this.f48669x = false;
        this.D = false;
        this.f48656i = false;
        this.f48670y = true;
    }

    public final float c() {
        boolean z11 = true;
        if (this.f48664s == 1) {
            boolean z12 = this.f48666u;
            if ((!z12 || this.f48653f >= this.f48654g) && (z12 || this.f48653f <= this.f48654g)) {
                z11 = false;
            }
            float fAbs = Math.abs(1.0f - (this.f48653f / this.f48654g)) * 0.5f;
            if (this.f48654g > 0.0f) {
                return z11 ? fAbs + 1.0f : 1.0f - fAbs;
            }
        } else {
            float f11 = this.f48654g;
            if (f11 > 0.0f) {
                return this.f48653f / f11;
            }
        }
        return 1.0f;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:115:0x020f  */
    /* JADX WARN: Removed duplicated region for block: B:118:0x0227  */
    /* JADX WARN: Type inference failed for: r15v12 */
    /* JADX WARN: Type inference failed for: r15v13, types: [boolean] */
    /* JADX WARN: Type inference failed for: r15v15 */
    /* JADX WARN: Type inference failed for: r6v1 */
    /* JADX WARN: Type inference failed for: r6v2, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r6v3 */
    /* JADX WARN: Type inference failed for: r6v98 */
    /* JADX WARN: Type inference failed for: r6v99 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean e(MotionEvent motionEvent) {
        float f11;
        boolean zOnDoubleTapEvent;
        ?? r62;
        float x11;
        float y11;
        int i5;
        boolean zN;
        s2 s2VarU0;
        ?? r15;
        int i11;
        int iSignum;
        int i12;
        MotionEvent motionEvent2;
        MotionEvent motionEvent3;
        j jVar;
        boolean z11;
        if (this.f48670y && motionEvent.getAction() != 0) {
            return this.f48671z;
        }
        this.f48670y = false;
        this.f48671z = false;
        motionEvent.getEventTime();
        int actionMasked = motionEvent.getActionMasked();
        if (!this.f48652e || this.f48667v) {
            f11 = 1.0f;
            zOnDoubleTapEvent = false;
        } else {
            int i13 = h.f48616x;
            int i14 = h.f48617y;
            h hVar = this.f48665t;
            j jVar2 = hVar.f48625g;
            f11 = 1.0f;
            Handler handler = hVar.f48624f;
            int action = motionEvent.getAction();
            g gVar = hVar.f48638v;
            gVar.getClass();
            if (motionEvent.getActionMasked() != 1) {
                gVar.a(motionEvent.getX(), motionEvent.getY(), motionEvent.getEventTime());
            }
            int i15 = action & 255;
            boolean z12 = i15 == 6;
            int actionIndex = z12 ? motionEvent.getActionIndex() : -1;
            int pointerCount = motionEvent.getPointerCount();
            float f12 = 0.0f;
            float y12 = 0.0f;
            for (int i16 = 0; i16 < pointerCount; i16++) {
                if (actionIndex != i16) {
                    float x12 = motionEvent.getX(i16) + f12;
                    y12 = motionEvent.getY(i16) + y12;
                    f12 = x12;
                }
            }
            if (z12) {
                pointerCount--;
            }
            float f13 = pointerCount;
            float f14 = f12 / f13;
            float f15 = y12 / f13;
            if (i15 != 0) {
                if (i15 != 1) {
                    if (i15 != 2) {
                        if (i15 == 3) {
                            hVar.a();
                        } else if (i15 == 5) {
                            hVar.f48633q = f14;
                            hVar.f48635s = f14;
                            hVar.f48634r = f15;
                            hVar.f48636t = f15;
                            handler.removeMessages(1);
                            handler.removeMessages(2);
                            handler.removeMessages(3);
                            hVar.f48632p = false;
                            hVar.f48630l = false;
                            hVar.f48631m = false;
                            hVar.f48628j = false;
                            hVar.f48629k = false;
                        } else if (i15 == 6) {
                            hVar.f48633q = f14;
                            hVar.f48635s = f14;
                            hVar.f48634r = f15;
                            hVar.f48636t = f15;
                        }
                    } else if (!hVar.f48629k) {
                        float f16 = hVar.f48633q - f14;
                        float f17 = hVar.f48634r - f15;
                        if (hVar.f48632p) {
                            zOnDoubleTapEvent = hVar.f48626h.onDoubleTapEvent(motionEvent);
                        } else if (hVar.f48630l) {
                            int i17 = (int) (f14 - hVar.f48635s);
                            int i18 = (int) (f15 - hVar.f48636t);
                            int i19 = (i18 * i18) + (i17 * i17);
                            if (i19 > hVar.f48619a) {
                                jVar2.getClass();
                                hVar.f48633q = f14;
                                hVar.f48634r = f15;
                                z11 = false;
                                hVar.f48630l = false;
                                handler.removeMessages(3);
                                handler.removeMessages(1);
                                handler.removeMessages(2);
                            } else {
                                z11 = false;
                            }
                            if (i19 > hVar.f48620b) {
                                hVar.f48631m = z11;
                            }
                        } else if (Math.abs(f16) >= 1.0f || Math.abs(f17) >= 1.0f) {
                            jVar2.getClass();
                            hVar.f48633q = f14;
                            hVar.f48634r = f15;
                        }
                    }
                    zOnDoubleTapEvent = false;
                } else {
                    hVar.f48627i = false;
                    MotionEvent motionEventObtain = MotionEvent.obtain(motionEvent);
                    if (hVar.f48632p) {
                        zOnDoubleTapEvent = hVar.f48626h.onDoubleTapEvent(motionEvent);
                    } else {
                        if (hVar.f48629k) {
                            handler.removeMessages(3);
                            hVar.f48629k = false;
                        } else if (hVar.f48630l) {
                            jVar2.D = false;
                            if (hVar.f48628j && (jVar = hVar.f48626h) != null) {
                                jVar.onSingleTapConfirmed(motionEvent);
                            }
                        } else {
                            gVar.c(hVar.f48623e);
                            float f18 = gVar.f48613b;
                            float f19 = gVar.f48612a;
                            if (Math.abs(f18) > hVar.f48622d || Math.abs(f19) > hVar.f48622d) {
                                zOnDoubleTapEvent = jVar2.onFling(hVar.n, motionEvent, f19, f18);
                            }
                        }
                        zOnDoubleTapEvent = false;
                    }
                    MotionEvent motionEvent4 = hVar.o;
                    if (motionEvent4 != null) {
                        motionEvent4.recycle();
                    }
                    hVar.o = motionEventObtain;
                    gVar.b();
                    hVar.f48632p = false;
                    hVar.f48628j = false;
                    handler.removeMessages(1);
                    handler.removeMessages(2);
                }
            } else if (hVar.f48626h == null) {
                zOnDoubleTapEvent = false;
                hVar.f48633q = f14;
                hVar.f48635s = f14;
                hVar.f48634r = f15;
                hVar.f48636t = f15;
                motionEvent2 = hVar.n;
                if (motionEvent2 != null) {
                    motionEvent2.recycle();
                }
                hVar.n = MotionEvent.obtain(motionEvent);
                hVar.f48630l = true;
                hVar.f48631m = true;
                hVar.f48627i = true;
                hVar.f48629k = false;
                hVar.f48628j = false;
                if (hVar.f48637u) {
                    handler.removeMessages(2);
                    handler.sendEmptyMessageAtTime(2, hVar.n.getDownTime() + i13 + h.f48615w);
                }
                handler.sendEmptyMessageAtTime(1, hVar.n.getDownTime() + i13);
                jVar2.getClass();
            } else {
                boolean zHasMessages = handler.hasMessages(3);
                if (zHasMessages) {
                    handler.removeMessages(3);
                }
                MotionEvent motionEvent5 = hVar.n;
                if (motionEvent5 != null && (motionEvent3 = hVar.o) != null && zHasMessages && hVar.f48631m) {
                    long eventTime = motionEvent.getEventTime() - motionEvent3.getEventTime();
                    if (eventTime >= h.f48618z && eventTime <= i14) {
                        int x13 = ((int) motionEvent5.getX()) - ((int) motionEvent.getX());
                        int y13 = ((int) motionEvent5.getY()) - ((int) motionEvent.getY());
                        if ((y13 * y13) + (x13 * x13) < hVar.f48621c) {
                            hVar.f48632p = true;
                            hVar.f48626h.onDoubleTap(hVar.n);
                            zOnDoubleTapEvent = hVar.f48626h.onDoubleTapEvent(motionEvent);
                            hVar.f48633q = f14;
                            hVar.f48635s = f14;
                            hVar.f48634r = f15;
                            hVar.f48636t = f15;
                            motionEvent2 = hVar.n;
                            if (motionEvent2 != null) {
                            }
                            hVar.n = MotionEvent.obtain(motionEvent);
                            hVar.f48630l = true;
                            hVar.f48631m = true;
                            hVar.f48627i = true;
                            hVar.f48629k = false;
                            hVar.f48628j = false;
                            if (hVar.f48637u) {
                            }
                            handler.sendEmptyMessageAtTime(1, hVar.n.getDownTime() + i13);
                            jVar2.getClass();
                        }
                    }
                }
                handler.sendEmptyMessageDelayed(3, i14);
                zOnDoubleTapEvent = false;
                hVar.f48633q = f14;
                hVar.f48635s = f14;
                hVar.f48634r = f15;
                hVar.f48636t = f15;
                motionEvent2 = hVar.n;
                if (motionEvent2 != null) {
                }
                hVar.n = MotionEvent.obtain(motionEvent);
                hVar.f48630l = true;
                hVar.f48631m = true;
                hVar.f48627i = true;
                hVar.f48629k = false;
                hVar.f48628j = false;
                if (hVar.f48637u) {
                }
                handler.sendEmptyMessageAtTime(1, hVar.n.getDownTime() + i13);
                jVar2.getClass();
            }
            if (zOnDoubleTapEvent) {
                return zOnDoubleTapEvent;
            }
        }
        boolean z13 = actionMasked == 1 || actionMasked == 3;
        c30.c cVar = this.f48649b;
        if (actionMasked == 0 || z13) {
            if (this.f48656i) {
                cVar.getClass();
                r62 = 0;
                if (actionMasked == 0) {
                    this.f48656i = false;
                }
                this.f48655h = 0.0f;
                this.f48664s = 0;
            } else {
                r62 = 0;
                r62 = 0;
                r62 = 0;
                if (this.f48664s == 1 && z13) {
                    this.f48656i = false;
                    this.f48655h = 0.0f;
                    this.f48664s = 0;
                }
            }
            if (z13) {
                this.f48670y = r62;
                this.f48671z = r62;
                this.f48667v = r62;
                this.f48659l = Float.NaN;
                this.f48660m = Float.NaN;
                this.n = Float.NaN;
                this.o = r62;
                this.f48661p = 0L;
                this.f48669x = r62;
                return r62;
            }
        }
        boolean z14 = actionMasked == 0 || actionMasked == 6 || actionMasked == 5;
        boolean z15 = actionMasked == 6;
        int actionIndex2 = z15 ? motionEvent.getActionIndex() : -1;
        int pointerCount2 = motionEvent.getPointerCount();
        int i21 = z15 ? pointerCount2 - 1 : pointerCount2;
        if (this.f48664s == 1) {
            x11 = this.f48663r.getX();
            y11 = this.f48663r.getY();
            if (motionEvent.getY() < y11) {
                this.f48666u = true;
            } else {
                this.f48666u = false;
            }
        } else {
            float f21 = 0.0f;
            float y14 = 0.0f;
            for (int i22 = 0; i22 < pointerCount2; i22++) {
                if (actionIndex2 != i22) {
                    float x14 = motionEvent.getX(i22) + f21;
                    y14 = motionEvent.getY(i22) + y14;
                    f21 = x14;
                }
            }
            float f22 = i21;
            x11 = f21 / f22;
            y11 = y14 / f22;
        }
        long jUptimeMillis = SystemClock.uptimeMillis();
        int pointerCount3 = motionEvent.getPointerCount();
        boolean z16 = jUptimeMillis - this.f48661p >= 128;
        float f23 = 0.0f;
        int i23 = 0;
        int i24 = 0;
        while (i23 < pointerCount3) {
            boolean z17 = zOnDoubleTapEvent;
            boolean zIsNaN = Float.isNaN(this.n);
            int historySize = motionEvent.getHistorySize();
            boolean z18 = z14;
            int i25 = historySize + 1;
            int i26 = pointerCount3;
            int i27 = 0;
            while (i27 < i25) {
                float historicalTouchMajor = i27 < historySize ? motionEvent.getHistoricalTouchMajor(i23, i27) : motionEvent.getTouchMajor(i23);
                int i28 = i25;
                float f24 = this.f48662q;
                if (historicalTouchMajor >= f24) {
                    f24 = historicalTouchMajor;
                }
                f23 += f24;
                boolean z19 = z16;
                if (Float.isNaN(this.f48659l) || f24 > this.f48659l) {
                    this.f48659l = f24;
                }
                if (Float.isNaN(this.f48660m) || f24 < this.f48660m) {
                    this.f48660m = f24;
                }
                if (zIsNaN || ((iSignum = (int) Math.signum(f24 - this.n)) == (i12 = this.o) && !(iSignum == 0 && i12 == 0))) {
                    i11 = i27;
                    z16 = z19;
                } else {
                    this.o = iSignum;
                    i11 = i27;
                    this.f48661p = i27 < historySize ? motionEvent.getHistoricalEventTime(i27) : motionEvent.getEventTime();
                    z16 = false;
                }
                i27 = i11 + 1;
                i25 = i28;
            }
            i24 += i25;
            i23++;
            zOnDoubleTapEvent = z17;
            z14 = z18;
            pointerCount3 = i26;
        }
        boolean z21 = zOnDoubleTapEvent;
        boolean z22 = z14;
        float f25 = f23 / i24;
        if (z16) {
            float f26 = this.f48659l;
            float f27 = this.f48660m;
            float f28 = ((f26 + f27) + f25) / 3.0f;
            this.f48659l = (f26 + f28) / 2.0f;
            this.f48660m = (f27 + f28) / 2.0f;
            this.n = f28;
            this.o = 0;
            this.f48661p = motionEvent.getEventTime();
        }
        float f29 = 0.0f;
        float fAbs = 0.0f;
        for (int i29 = 0; i29 < pointerCount2; i29++) {
            if (actionIndex2 != i29) {
                float f31 = this.n / 2.0f;
                float fAbs2 = Math.abs(motionEvent.getX(i29) - x11) + f31 + f29;
                fAbs = Math.abs(motionEvent.getY(i29) - y11) + f31 + fAbs;
                f29 = fAbs2;
            }
        }
        float f32 = i21;
        float f33 = (f29 / f32) * 2.0f;
        float fSqrt = (fAbs / f32) * 2.0f;
        if (this.f48664s != 1) {
            fSqrt = (float) Math.sqrt((fSqrt * fSqrt) + (f33 * f33));
        }
        boolean z23 = this.f48656i;
        this.f48650c = x11;
        this.f48651d = y11;
        int i31 = this.f48664s;
        int i32 = this.f48658k;
        if (i31 != 1 && z23 && (fSqrt < i32 || z22)) {
            cVar.getClass();
            this.f48655h = fSqrt;
            this.f48664s = 0;
        }
        if (z22) {
            this.f48653f = fSqrt;
            this.f48654g = fSqrt;
            this.f48655h = fSqrt;
        }
        int i33 = this.f48664s;
        int i34 = this.f48657j;
        if (i33 == 1) {
            i32 = i34;
        }
        boolean z24 = this.f48656i;
        PointF pointF = this.B;
        PointF pointF2 = this.A;
        if (z24) {
            i5 = 1;
        } else {
            if (fSqrt < i32 || (!z23 && Math.abs(fSqrt - this.f48655h) <= i34)) {
                r15 = 1;
                i5 = 1;
                if (motionEvent.getPointerCount() > 1) {
                }
            } else {
                r15 = 1;
            }
            this.f48653f = fSqrt;
            this.f48654g = fSqrt;
            if (motionEvent.getPointerCount() > r15) {
                this.f48667v = r15;
                h hVar2 = this.f48665t;
                if (hVar2 != null) {
                    hVar2.a();
                }
                float x15 = motionEvent.getX(0);
                float y15 = motionEvent.getY(0);
                float x16 = motionEvent.getX(r15 == true ? 1 : 0);
                float y16 = motionEvent.getY(r15 == true ? 1 : 0);
                pointF2.x = x15;
                pointF2.y = y15;
                pointF.x = x16;
                pointF.y = y16;
                cVar.getClass();
                NovaLauncher novaLauncher = (NovaLauncher) cVar.f19533c;
                Workspace workspace = novaLauncher.O;
                VelocityTracker velocityTracker = workspace.f80111k;
                if (velocityTracker != null) {
                    velocityTracker.clear();
                    workspace.f80111k.recycle();
                    workspace.f80111k = null;
                }
                workspace.f80120v = false;
                workspace.A = -1;
                Workspace workspace2 = novaLauncher.O;
                workspace2.l0(workspace2.G());
                i5 = 1;
                this.f48656i = true;
            } else {
                this.f48656i = r15;
                i5 = r15;
            }
        }
        if (actionMasked != 2) {
            return z21;
        }
        this.f48653f = fSqrt;
        if (!this.f48656i) {
            zN = i5;
        } else if (motionEvent.getPointerCount() > i5) {
            if (!this.f48669x) {
                float x17 = motionEvent.getX(0);
                float y17 = motionEvent.getY(0);
                float x18 = motionEvent.getX(i5);
                float y18 = motionEvent.getY(i5);
                float fB = b(pointF.y - pointF2.y, pointF.x - pointF2.x);
                float fB2 = b(y18 - y17, x18 - x17);
                float fB3 = b(y17 - pointF2.y, x17 - pointF2.x);
                float fB4 = b(y18 - pointF.y, x18 - pointF.x);
                float f34 = fB2 + 3.1415927f;
                float fAbs3 = ((f11 - (Math.abs(d(fB4 - f34)) / 3.1415927f)) + (f11 - (Math.abs(d(fB3 - fB2)) / 3.1415927f))) / 2.0f;
                float fAbs4 = ((f11 - (Math.abs(d(fB4 - fB2)) / 3.1415927f)) + (f11 - (Math.abs(d(fB3 - f34)) / 3.1415927f))) / 2.0f;
                float fAbs5 = f11 - (Math.abs(d(d(fB3 - 3.1415927f) - fB4)) / 3.1415927f);
                float fD = d(fB - fB2);
                float f35 = (((y17 - pointF2.y) + y18) - pointF.y) / 2.0f;
                float f36 = fAbs4 * fAbs5;
                float f37 = (f11 - (fAbs3 * fAbs3)) * fD * fAbs5;
                float f38 = (f11 - fAbs5) * f35;
                if (f11 - (((f11 - c()) * fAbs3) * fAbs5) < 0.8f) {
                    cVar.o(false);
                    this.f48669x = true;
                }
                if (!this.f48669x && Math.abs(f37) > 0.2617994f) {
                    boolean z25 = f37 > 0.0f;
                    cVar.getClass();
                    if (z25) {
                        y2.f51877a.getClass();
                        s2VarU0 = y2.t0();
                    } else {
                        y2.f51877a.getClass();
                        s2VarU0 = y2.u0();
                    }
                    NamedIntent namedIntent = (NamedIntent) s2VarU0.l();
                    if (!Intrinsics.b(namedIntent, NamedIntent.f46367d)) {
                        Intent intent = new Intent(namedIntent.f46369b);
                        intent.setSourceBounds(c.i((c) cVar.f19534d));
                        NovaLauncher novaLauncher2 = (NovaLauncher) cVar.f19533c;
                        novaLauncher2.q0(novaLauncher2.P, intent, new w20.i(novaLauncher2, namedIntent, s2VarU0));
                    }
                    this.f48669x = true;
                }
                if (!this.f48669x && f36 > 0.8f && c() > 1.2f && c() < 2.8f) {
                    cVar.o(true);
                    this.f48669x = true;
                }
                if (!this.f48669x && Math.abs(f38) > this.C) {
                    boolean z26 = f38 < 0.0f;
                    cVar.getClass();
                    y2.f51877a.getClass();
                    s2 s2VarA0 = z26 ? y2.A0() : y2.z0();
                    NamedIntent namedIntent2 = (NamedIntent) s2VarA0.l();
                    if (!Intrinsics.b(namedIntent2, NamedIntent.f46367d)) {
                        Intent intent2 = new Intent(namedIntent2.f46369b);
                        intent2.setSourceBounds(c.i((c) cVar.f19534d));
                        NovaLauncher novaLauncher3 = (NovaLauncher) cVar.f19533c;
                        novaLauncher3.q0(novaLauncher3.P, intent2, new w20.i(novaLauncher3, namedIntent2, s2VarA0));
                    }
                    this.f48669x = true;
                }
            }
            zN = false;
        } else {
            if (!this.D) {
                zN = false;
            } else if (c() >= 1.3f) {
                a();
                zN = cVar.n(false);
                this.f48671z = zN;
            } else if (c() <= 0.7f) {
                a();
                zN = cVar.n(true);
                this.f48671z = zN;
            } else {
                zN = false;
            }
            this.f48669x = zN;
            if (zN) {
                this.f48665t.a();
            }
        }
        boolean z27 = z21 | this.f48669x;
        if (zN) {
            this.f48654g = this.f48653f;
        }
        return z27;
    }

    @Override // android.view.GestureDetector.OnDoubleTapListener
    public final boolean onDoubleTap(MotionEvent motionEvent) {
        if (this.f48668w + ViewConfiguration.getDoubleTapTimeout() > motionEvent.getEventTime()) {
            return false;
        }
        this.D = true;
        this.f48663r = motionEvent;
        this.f48664s = 1;
        return false;
    }

    @Override // android.view.GestureDetector.OnDoubleTapListener
    public final boolean onDoubleTapEvent(MotionEvent motionEvent) {
        c30.c cVar;
        if (this.D) {
            h hVar = this.f48665t;
            this.f48650c = hVar.f48635s;
            this.f48651d = hVar.f48636t;
            if (motionEvent.getAction() == 1) {
                this.D = false;
                if (motionEvent.getEventTime() - motionEvent.getDownTime() < 180 && this.f48668w + 100 < motionEvent.getEventTime() && (cVar = this.f48649b) != null) {
                    y2.f51877a.getClass();
                    s2 s2VarM0 = y2.m0();
                    NamedIntent namedIntent = (NamedIntent) s2VarM0.l();
                    NamedIntent namedIntent2 = NamedIntent.f46367d;
                    if (!Intrinsics.b(namedIntent, namedIntent2)) {
                        Intent intent = new Intent(namedIntent.f46369b);
                        intent.setSourceBounds(c.i((c) cVar.f19534d));
                        NovaLauncher novaLauncher = (NovaLauncher) cVar.f19533c;
                        novaLauncher.q0(novaLauncher.P, intent, new w20.i(novaLauncher, namedIntent, s2VarM0));
                    }
                    boolean zB = Intrinsics.b(namedIntent, namedIntent2);
                    boolean z11 = !zB;
                    if (!zB) {
                        a();
                    }
                    return z11;
                }
                this.f48668w = Long.MIN_VALUE;
            }
        }
        return false;
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public final boolean onDown(MotionEvent motionEvent) {
        return false;
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public final boolean onFling(MotionEvent motionEvent, MotionEvent motionEvent2, float f11, float f12) {
        float x11 = motionEvent2.getX() + motionEvent.getX();
        this.f48650c = x11 - (x11 / 2.0f);
        float y11 = motionEvent2.getY() + motionEvent.getY();
        this.f48651d = y11 - (y11 / 2.0f);
        c30.c cVar = this.f48649b;
        if (cVar != null) {
            c cVar2 = (c) cVar.f19534d;
            NovaLauncher novaLauncher = (NovaLauncher) cVar.f19533c;
            float x12 = motionEvent2.getX() - motionEvent.getX();
            float y12 = motionEvent2.getY() - motionEvent.getY();
            if (Math.abs(y12) >= Math.abs(2 * x12) && Float.compare(y12, 0.0f) != 0 && Math.abs(y12) >= cVar.f19532b * 5) {
                if (f12 > 0.0f) {
                    if ((novaLauncher.P.f21089x & 2) != 0) {
                        return false;
                    }
                    y2.f51877a.getClass();
                    s2 s2VarV0 = y2.v0();
                    NamedIntent namedIntent = (NamedIntent) s2VarV0.l();
                    if (!Intrinsics.b(namedIntent, NamedIntent.f46367d) && !cVar2.e()) {
                        Intent intent = new Intent(namedIntent.f46369b);
                        intent.setSourceBounds(c.i(cVar2));
                        novaLauncher.q0(novaLauncher.P, intent, new w20.i(novaLauncher, namedIntent, s2VarV0));
                        return true;
                    }
                } else if (f12 < 0.0f && (novaLauncher.P.f21089x & 1) == 0) {
                    y2.f51877a.getClass();
                    s2 s2VarB0 = y2.B0();
                    NamedIntent namedIntent2 = (NamedIntent) s2VarB0.l();
                    if (!Intrinsics.b(namedIntent2, NamedIntent.f46367d)) {
                        Intent intent2 = new Intent(namedIntent2.f46369b);
                        intent2.setSourceBounds(c.i(cVar2));
                        novaLauncher.q0(novaLauncher.P, intent2, new w20.i(novaLauncher, namedIntent2, s2VarB0));
                        return true;
                    }
                }
            }
        }
        return false;
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public final void onLongPress(MotionEvent motionEvent) {
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public final boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f11, float f12) {
        return false;
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public final void onShowPress(MotionEvent motionEvent) {
    }

    @Override // android.view.GestureDetector.OnDoubleTapListener
    public final boolean onSingleTapConfirmed(MotionEvent motionEvent) {
        this.D = false;
        this.f48668w = Long.MIN_VALUE;
        return false;
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public final boolean onSingleTapUp(MotionEvent motionEvent) {
        this.D = false;
        return false;
    }
}

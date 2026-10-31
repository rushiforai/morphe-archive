package ai;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.content.ComponentName;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.Handler;
import android.os.IInterface;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.MotionEvent;
import android.view.PixelCopy;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.view.animation.AnimationUtils;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.StaggeredGridLayoutManager;
import com.android.launcher3.CropView;
import com.facebook.ads.MediaView;
import com.facebook.ads.internal.api.AdNativeComponentView;
import com.facebook.ads.internal.dynamicloading.DynamicLoaderFactory;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.google.android.material.internal.CheckableImageButton;
import com.google.android.material.textfield.TextInputLayout;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.widget.NumberPicker;
import java.util.ArrayDeque;
import java.util.Iterator;
import java.util.Random;
import java.util.WeakHashMap;

/* loaded from: classes3.dex */
public final /* synthetic */ class h implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f12987a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f12988b;

    public /* synthetic */ h(Object obj, int i5) {
        this.f12987a = i5;
        this.f12988b = obj;
    }

    /* JADX WARN: Removed duplicated region for block: B:204:0x0453  */
    /* JADX WARN: Removed duplicated region for block: B:275:0x0729  */
    @Override // java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void run() throws InterruptedException {
        int iInterpolateOutOfBoundsScroll;
        int height;
        int i5 = 3;
        int i11 = 2;
        int i12 = 1;
        int iInterpolateOutOfBoundsScroll2 = 0;
        switch (this.f12987a) {
            case 0:
                l lVar = (l) this.f12988b;
                try {
                    SQLiteDatabase sQLiteDatabaseU0 = lVar.u0();
                    ContentValues contentValues = new ContentValues();
                    contentValues.put("elapsed_time", (Long) 0L);
                    sQLiteDatabaseU0.update("raw_events", contentValues, null, null);
                    return;
                } catch (SQLiteException e3) {
                    o0 o0Var = ((m1) lVar.f13368a).f13138f;
                    m1.l(o0Var);
                    o0Var.f13190f.b(e3, "Failed to remove elapsed times from raw events table");
                    return;
                }
            case 1:
                ((u0) this.f12988b).f13365a.N();
                return;
            case 2:
                p3 p3Var = ((o3) this.f12988b).f13208c;
                p3Var.O(new ComponentName(((m1) p3Var.f13368a).f13133a, "com.google.android.gms.measurement.AppMeasurementService"));
                return;
            case 3:
                p3 p3Var2 = ((o3) ((ab.z) this.f12988b).f779c).f13208c;
                k1 k1Var = ((m1) p3Var2.f13368a).f13139g;
                m1.l(k1Var);
                k1Var.M(new n3(p3Var2, iInterpolateOutOfBoundsScroll2));
                return;
            case 4:
                u3 u3Var = (u3) this.f12988b;
                x3 x3Var = (x3) u3Var.f13371c.f67328b;
                x3Var.D();
                m1 m1Var = (m1) x3Var.f13368a;
                o0 o0Var2 = m1Var.f13138f;
                Context context = m1Var.f13133a;
                m1.l(o0Var2);
                o0Var2.f13197m.a("Application going to the background");
                z0 z0Var = m1Var.f13137e;
                m1.j(z0Var);
                z0Var.f13500s.d(true);
                x3Var.D();
                x3Var.f13469d = true;
                e eVar = m1Var.f13136d;
                if (!eVar.S()) {
                    long j11 = u3Var.f13370b;
                    w3 w3Var = x3Var.f13471f;
                    w3Var.i(j11, false, false);
                    ((v3) w3Var.f13398c).c();
                }
                long j12 = u3Var.f13369a;
                m1.l(o0Var2);
                o0Var2.f13196l.b(Long.valueOf(j12), "Application backgrounded at: timestamp_millis");
                t2 t2Var = m1Var.f13145m;
                m1.k(t2Var);
                t2Var.D();
                m1 m1Var2 = (m1) t2Var.f13368a;
                t2Var.E();
                p3 p3VarO = m1Var2.o();
                p3VarO.D();
                p3VarO.E();
                if (p3VarO.K()) {
                    p4 p4Var = ((m1) p3VarO.f13368a).f13141i;
                    m1.j(p4Var);
                    if (p4Var.o0() >= 242600) {
                    }
                } else {
                    p3 p3VarO2 = m1Var2.o();
                    p3VarO2.D();
                    p3VarO2.E();
                    p3VarO2.R(new k3(p3VarO2, p3VarO2.T(true), i11));
                }
                if (eVar.O(null, x.N0)) {
                    p4 p4Var2 = m1Var.f13141i;
                    m1.j(p4Var2);
                    long jL = p4Var2.i0(context.getPackageName(), eVar.f12897c) ? 1000L : eVar.L(context.getPackageName(), x.E);
                    m1.l(o0Var2);
                    o0Var2.n.b(Long.valueOf(jL), "[sgtm] Scheduling batch upload with minimum latency in millis");
                    m1.i(m1Var.f13151u);
                    m1Var.f13151u.H(jL);
                    return;
                }
                return;
            case 5:
                j4 j4Var = (j4) this.f12988b;
                j4Var.c().D();
                j4Var.f13049k = new b1(j4Var);
                l lVar2 = new l(j4Var);
                lVar2.F();
                j4Var.f13041c = lVar2;
                g1 g1Var = j4Var.f13039a;
                e eVarE0 = j4Var.e0();
                sg.w.h(g1Var);
                eVarE0.f12898d = g1Var;
                r3 r3Var = new r3(j4Var);
                r3Var.F();
                j4Var.f13047i = r3Var;
                c cVar = new c(j4Var);
                cVar.F();
                j4Var.f13044f = cVar;
                s0 s0Var = new s0(j4Var, i12);
                s0Var.F();
                j4Var.f13046h = s0Var;
                b4 b4Var = new b4(j4Var);
                b4Var.F();
                j4Var.f13043e = b4Var;
                j4Var.f13042d = new u0(j4Var);
                if (j4Var.f13054r != j4Var.f13055s) {
                    j4Var.b().f13190f.c(Integer.valueOf(j4Var.f13054r), "Not all upload components initialized", Integer.valueOf(j4Var.f13055s));
                }
                j4Var.f13051m.set(true);
                j4Var.b().n.a("UploadController is now fully initialized");
                j4Var.c().D();
                l lVar3 = j4Var.f13041c;
                j4.T(lVar3);
                lVar3.N();
                l lVar4 = j4Var.f13041c;
                j4.T(lVar4);
                lVar4.D();
                lVar4.E();
                if (lVar4.o0()) {
                    w wVar = x.f13446u0;
                    if (((Long) wVar.a(null)).longValue() != 0) {
                        SQLiteDatabase sQLiteDatabaseU02 = lVar4.u0();
                        m1 m1Var3 = (m1) lVar4.f13368a;
                        m1Var3.f13143k.getClass();
                        int iDelete = sQLiteDatabaseU02.delete("trigger_uris", "abs(timestamp_millis - ?) > cast(? as integer)", new String[]{String.valueOf(System.currentTimeMillis()), String.valueOf(wVar.a(null))});
                        if (iDelete > 0) {
                            o0 o0Var3 = m1Var3.f13138f;
                            m1.l(o0Var3);
                            o0Var3.n.b(Integer.valueOf(iDelete), "Deleted stale trigger uris. rowsDeleted");
                        }
                    }
                }
                if (j4Var.f13047i.f13286h.f() == 0) {
                    w0 w0Var = j4Var.f13047i.f13286h;
                    j4Var.e().getClass();
                    w0Var.g(System.currentTimeMillis());
                }
                j4Var.N();
                return;
            case 6:
                m1 m1Var4 = (m1) ((r4) this.f12988b).f13290b;
                m1.i(m1Var4.f13151u);
                m1Var4.f13151u.H(((Long) x.D.a(null)).longValue());
                return;
            case 7:
                m1 m1Var5 = (m1) this.f12988b;
                p4 p4Var3 = m1Var5.f13141i;
                t2 t2Var2 = m1Var5.f13145m;
                m1.j(p4Var3);
                p4Var3.D();
                if (p4Var3.a0() != 1) {
                    o0 o0Var4 = m1Var5.f13138f;
                    m1.l(o0Var4);
                    o0Var4.f13193i.a("registerTrigger called but app not eligible");
                    return;
                }
                m1.k(t2Var2);
                t2Var2.D();
                g2 g2Var = t2Var2.f13346l;
                if (g2Var != null) {
                    g2Var.c();
                }
                m1.k(t2Var2);
                new Thread(new f2(t2Var2, i5)).start();
                return;
            case 8:
                androidx.recyclerview.widget.b0 b0Var = (androidx.recyclerview.widget.b0) this.f12988b;
                ValueAnimator valueAnimator = b0Var.f14913z;
                int i13 = b0Var.A;
                if (i13 == 1) {
                    valueAnimator.cancel();
                } else if (i13 != 2) {
                    return;
                }
                b0Var.A = 3;
                valueAnimator.setFloatValues(((Float) valueAnimator.getAnimatedValue()).floatValue(), 0.0f);
                valueAnimator.setDuration(500);
                valueAnimator.start();
                return;
            case 9:
                androidx.recyclerview.widget.r0 r0Var = (androidx.recyclerview.widget.r0) this.f12988b;
                if (r0Var.f15087c != null) {
                    long jCurrentTimeMillis = System.currentTimeMillis();
                    long j13 = r0Var.B;
                    long j14 = j13 != Long.MIN_VALUE ? jCurrentTimeMillis - j13 : 0L;
                    androidx.recyclerview.widget.z1 layoutManager = r0Var.f15100r.getLayoutManager();
                    if (r0Var.A == null) {
                        r0Var.A = new Rect();
                    }
                    layoutManager.calculateItemDecorationsForChild(r0Var.f15087c.itemView, r0Var.A);
                    if (layoutManager.canScrollHorizontally()) {
                        int i14 = (int) (r0Var.f15094j + r0Var.f15092h);
                        int paddingLeft = (i14 - r0Var.A.left) - r0Var.f15100r.getPaddingLeft();
                        float f11 = r0Var.f15092h;
                        iInterpolateOutOfBoundsScroll = ((f11 >= 0.0f || paddingLeft >= 0) && (f11 <= 0.0f || (paddingLeft = ((r0Var.f15087c.itemView.getWidth() + i14) + r0Var.A.right) - (r0Var.f15100r.getWidth() - r0Var.f15100r.getPaddingRight())) <= 0)) ? 0 : paddingLeft;
                    }
                    if (layoutManager.canScrollVertically()) {
                        int i15 = (int) (r0Var.f15095k + r0Var.f15093i);
                        int paddingTop = (i15 - r0Var.A.top) - r0Var.f15100r.getPaddingTop();
                        float f12 = r0Var.f15093i;
                        if (f12 < 0.0f && paddingTop < 0) {
                            iInterpolateOutOfBoundsScroll2 = paddingTop;
                        } else if (f12 > 0.0f && (height = ((r0Var.f15087c.itemView.getHeight() + i15) + r0Var.A.bottom) - (r0Var.f15100r.getHeight() - r0Var.f15100r.getPaddingBottom())) > 0) {
                            iInterpolateOutOfBoundsScroll2 = height;
                        }
                    }
                    if (iInterpolateOutOfBoundsScroll != 0) {
                        iInterpolateOutOfBoundsScroll = r0Var.f15097m.interpolateOutOfBoundsScroll(r0Var.f15100r, r0Var.f15087c.itemView.getWidth(), iInterpolateOutOfBoundsScroll, r0Var.f15100r.getWidth(), j14);
                    }
                    int i16 = iInterpolateOutOfBoundsScroll;
                    if (iInterpolateOutOfBoundsScroll2 != 0) {
                        iInterpolateOutOfBoundsScroll2 = r0Var.f15097m.interpolateOutOfBoundsScroll(r0Var.f15100r, r0Var.f15087c.itemView.getHeight(), iInterpolateOutOfBoundsScroll2, r0Var.f15100r.getHeight(), j14);
                    }
                    if (i16 == 0 && iInterpolateOutOfBoundsScroll2 == 0) {
                        r0Var.B = Long.MIN_VALUE;
                        return;
                    }
                    if (r0Var.B == Long.MIN_VALUE) {
                        r0Var.B = jCurrentTimeMillis;
                    }
                    r0Var.f15100r.scrollBy(i16, iInterpolateOutOfBoundsScroll2);
                    androidx.recyclerview.widget.s2 s2Var = r0Var.f15087c;
                    if (s2Var != null) {
                        r0Var.k(s2Var);
                    }
                    r0Var.f15100r.removeCallbacks(r0Var.f15101s);
                    RecyclerView recyclerView = r0Var.f15100r;
                    WeakHashMap weakHashMap = a5.a1.f250a;
                    recyclerView.postOnAnimation(this);
                    return;
                }
                return;
            case 10:
                ((StaggeredGridLayoutManager) this.f12988b).o();
                return;
            case 11:
                io.sentry.internal.debugmeta.c cVar2 = ((bo.a) this.f12988b).f18330e;
                mg.l lVar5 = (mg.l) cVar2.f67328b;
                co.b bVar = new co.b(cVar2);
                bVar.f20146a = lVar5;
                ((ArrayDeque) lVar5.f76310c).add(bVar);
                if (((co.a) lVar5.f76311d) == null) {
                    lVar5.d();
                    return;
                }
                return;
            case 12:
                MediaView mediaView = (MediaView) this.f12988b;
                mediaView.removeAllViews();
                ((AdNativeComponentView) mediaView).mAdComponentViewApi = null;
                mediaView.mMediaViewApi = DynamicLoaderFactory.makeLoader(mediaView.mConstructorParams.getContext()).createMediaViewApi();
                mediaView.attachAdComponentViewApi(mediaView.mMediaViewApi);
                mediaView.mMediaViewApi.initialize(mediaView.mConstructorParams, mediaView);
                return;
            case 13:
                d10.c cVar3 = (d10.c) this.f12988b;
                NovaLauncher novaLauncher = (NovaLauncher) cVar3.f71306t;
                View view = cVar3.f48828x;
                cs.h hVar = new cs.h(cVar3, i12);
                Bitmap bitmapCreateBitmap = Bitmap.createBitmap(view.getWidth(), view.getHeight(), Bitmap.Config.ARGB_8888);
                int[] iArr = new int[2];
                view.getLocationInWindow(iArr);
                Window window = novaLauncher.getWindow();
                int i17 = iArr[0];
                PixelCopy.request(window, new Rect(i17, iArr[1], view.getWidth() + i17, view.getHeight() + iArr[1]), bitmapCreateBitmap, new d10.b(iInterpolateOutOfBoundsScroll2, hVar, bitmapCreateBitmap), new Handler(Looper.getMainLooper()));
                return;
            case 14:
                e5.e eVar2 = (e5.e) this.f12988b;
                r.g1 g1Var2 = eVar2.f52178c;
                e5.a aVar = eVar2.f52176a;
                if (eVar2.o) {
                    if (eVar2.f52188m) {
                        eVar2.f52188m = false;
                        long jCurrentAnimationTimeMillis = AnimationUtils.currentAnimationTimeMillis();
                        aVar.f52170d = jCurrentAnimationTimeMillis;
                        aVar.f52172f = -1L;
                        aVar.f52171e = jCurrentAnimationTimeMillis;
                        aVar.f52173g = 0.5f;
                    }
                    if ((aVar.f52172f > 0 && AnimationUtils.currentAnimationTimeMillis() > aVar.f52172f + aVar.f52174h) || !eVar2.e()) {
                        eVar2.o = false;
                        return;
                    }
                    if (eVar2.n) {
                        eVar2.n = false;
                        long jUptimeMillis = SystemClock.uptimeMillis();
                        MotionEvent motionEventObtain = MotionEvent.obtain(jUptimeMillis, jUptimeMillis, 3, 0.0f, 0.0f, 0);
                        g1Var2.onTouchEvent(motionEventObtain);
                        motionEventObtain.recycle();
                    }
                    if (aVar.f52171e == 0) {
                        throw new RuntimeException("Cannot compute scroll delta before calling start()");
                    }
                    long jCurrentAnimationTimeMillis2 = AnimationUtils.currentAnimationTimeMillis();
                    float fA = aVar.a(jCurrentAnimationTimeMillis2);
                    long j15 = jCurrentAnimationTimeMillis2 - aVar.f52171e;
                    aVar.f52171e = jCurrentAnimationTimeMillis2;
                    eVar2.f52190q.scrollListBy((int) (j15 * ((fA * 4.0f) + ((-4.0f) * fA * fA)) * aVar.f52169c));
                    WeakHashMap weakHashMap2 = a5.a1.f250a;
                    g1Var2.postOnAnimation(this);
                    return;
                }
                return;
            case 15:
                ei.a aVar2 = (ei.a) this.f12988b;
                synchronized (aVar2.f52776a) {
                    try {
                        if (aVar2.b()) {
                            Log.e("WakeLock", String.valueOf(aVar2.f52785j).concat(" ** IS FORCE-RELEASED ON TIMEOUT **"));
                            aVar2.d();
                            if (aVar2.b()) {
                                aVar2.f52778c = 1;
                                aVar2.e();
                                return;
                            }
                            return;
                        }
                        return;
                    } finally {
                    }
                }
            case 16:
                fi.p pVar = (fi.p) this.f12988b;
                synchronized (pVar.f55154c) {
                    try {
                        fi.d dVar = (fi.d) pVar.f55155d;
                        if (dVar != null) {
                            dVar.onCanceled();
                        }
                    } finally {
                    }
                }
                return;
            case 17:
                CheckableImageButton checkableImageButton = ((TextInputLayout) this.f12988b).f34367c.f55208f;
                checkableImageButton.performClick();
                checkableImageButton.jumpDrawablesToCurrentState();
                return;
            case 18:
                ck.e eVar3 = (ck.e) this.f12988b;
                eVar3.f19978c = false;
                BottomSheetBehavior bottomSheetBehavior = (BottomSheetBehavior) eVar3.f19980e;
                r5.d dVar2 = bottomSheetBehavior.M;
                if (dVar2 != null && dVar2.f()) {
                    eVar3.i(eVar3.f19977b);
                    return;
                } else {
                    if (bottomSheetBehavior.L == 2) {
                        bottomSheetBehavior.K(eVar3.f19977b);
                        return;
                    }
                    return;
                }
            case 19:
                ib.c cVar4 = (ib.c) ((CropView) this.f12988b).f20927e.f61505f;
                cVar4.f61494w = true;
                ib.b bVar2 = cVar4.f61497z;
                bVar2.interrupt();
                try {
                    bVar2.join();
                } catch (InterruptedException unused) {
                    mc0.b bVar3 = mc0.d.f76206a;
                    bVar3.r("TiledImageRenderer");
                    bVar3.n("Interrupted while waiting for TileDecoder thread to finish!", new Object[0]);
                }
                synchronized (cVar4.f61486m) {
                    try {
                        cVar4.o.f57836b = null;
                        cVar4.f61487p.f57836b = null;
                        gu.j jVar = cVar4.n;
                        ib.a aVar3 = (ib.a) jVar.f57836b;
                        if (aVar3 != null) {
                            jVar.f57836b = aVar3.f61468r;
                        }
                        while (aVar3 != null) {
                            aVar3.c();
                            gu.j jVar2 = cVar4.n;
                            aVar3 = (ib.a) jVar2.f57836b;
                            if (aVar3 != null) {
                                jVar2.f57836b = aVar3.f61468r;
                            }
                        }
                    } finally {
                    }
                }
                int size = cVar4.f61485l.size();
                for (int i18 = 0; i18 < size; i18++) {
                    ((ib.a) cVar4.f61485l.valueAt(i18)).c();
                }
                cVar4.f61485l.clear();
                cVar4.f61495x.set(0, 0, 0, 0);
                while (ib.c.E.a() != null) {
                }
                return;
            case 20:
                ((jc.a) this.f12988b).f69429a.b();
                return;
            case 21:
                ((NumberPicker) this.f12988b).performLongClick();
                return;
            case 22:
                TextView textView = (TextView) ((c10.a) this.f12988b).f19149c;
                textView.setText(textView.getText());
                return;
            case 23:
                synchronized (((lc.b) this.f12988b).f74840l) {
                    try {
                        Intent intent = new Intent();
                        intent.setClassName(((lc.b) this.f12988b).f74836h, "com.digitalturbine.ignite.cl.IgniteRemoteService");
                        lc.b bVar4 = (lc.b) this.f12988b;
                        Context context2 = bVar4.f74833e;
                        if (context2 != null) {
                            context2.bindService(intent, bVar4, 1);
                        }
                    } catch (Throwable th2) {
                        Object[] objArr = {th2};
                        com.fyber.inneractive.sdk.ignite.k kVar = rc.a.f85792b.f85793a;
                        if (kVar != null) {
                            kVar.e("Failed to bind IgniteRemoteService", objArr);
                        }
                        if (th2.getMessage() != null && th2.getMessage().contains("Too many bind requests")) {
                            return;
                        } else {
                            nc.a.b(nc.c.ONE_DT_GENERAL_ERROR, ps.j.b(th2, nc.b.IGNITE_SERVICE_UNAVAILABLE));
                        }
                    } finally {
                    }
                }
                return;
            case 24:
                m.n0 n0Var = (m.n0) this.f12988b;
                Window.Callback callback = n0Var.f75311b;
                q.k kVarA = n0Var.A();
                q.k kVar2 = kVarA != null ? kVarA : null;
                if (kVar2 != null) {
                    kVar2.w();
                }
                try {
                    kVarA.clear();
                    if (!callback.onCreatePanelMenu(0, kVarA) || !callback.onPreparePanel(0, null, kVarA)) {
                        kVarA.clear();
                    }
                    if (kVar2 != null) {
                        kVar2.v();
                        return;
                    }
                    return;
                } catch (Throwable th3) {
                    if (kVar2 != null) {
                        kVar2.v();
                    }
                    throw th3;
                }
            case 25:
                mh.c cVar5 = (mh.c) this.f12988b;
                Activity activity = (Activity) cVar5.f76323b;
                View view2 = (View) cVar5.f76325d;
                if (view2 == null) {
                    return;
                }
                if (activity.isInPictureInPictureMode()) {
                    cVar5.N();
                    return;
                }
                try {
                    WindowManager.LayoutParams layoutParams = (WindowManager.LayoutParams) view2.getLayoutParams();
                    if (layoutParams != null) {
                        layoutParams.height = Math.min(activity.getResources().getDimensionPixelSize(2131166378), (int) (cw.l2.M(activity) * 0.6f));
                        if (activity.getResources().getConfiguration().screenWidthDp > 640) {
                            layoutParams.width = cw.l2.K(activity, 640);
                        } else {
                            layoutParams.width = -1;
                        }
                        ((WindowManager) cVar5.f76324c).updateViewLayout(view2, layoutParams);
                        Log.i("HsdpLoadingPanel", "updateLoadingView: updated window size.");
                        return;
                    }
                    return;
                } catch (RuntimeException e11) {
                    Log.e("HsdpLoadingPanel", "updateLoadingView: error updating window size.", e11);
                    return;
                }
            case 26:
                mk.o oVar = (mk.o) ((kk.l) this.f12988b).f71542b;
                if (((IInterface) oVar.f76470k) != null) {
                    if (Log.isLoggable("ServiceConnMgrImpl", 4)) {
                        Log.i("ServiceConnMgrImpl", "unlinkToDeath");
                    }
                    IInterface iInterface = (IInterface) oVar.f76470k;
                    iInterface.getClass();
                    iInterface.asBinder().unlinkToDeath((kk.i) oVar.f76468i, 0);
                    oVar.f76470k = null;
                    Log.i("ServiceConnMgrImpl", "notifyOnDisconnected in onServiceDisconnected()");
                    oVar.l();
                }
                oVar.f76460a = false;
                return;
            case 27:
                Iterator it = ((mk.f) this.f12988b).f76432c.values().iterator();
                while (it.hasNext()) {
                    ((mk.l) it.next()).a(4);
                    it.remove();
                }
                return;
            default:
                o30.e eVar4 = (o30.e) this.f12988b;
                o30.f fVar = (o30.f) eVar4.f79481d;
                o30.c cVar6 = eVar4.f79479b;
                Random random = o30.f.f79482i;
                fVar.e(cVar6);
                o30.f.d((o30.f) eVar4.f79481d, eVar4.f79479b);
                return;
        }
    }

    public h(u0 u0Var, boolean z11) {
        this.f12987a = 1;
        this.f12988b = u0Var;
    }

    public h(j4 j4Var, k4 k4Var) {
        this.f12987a = 5;
        this.f12988b = j4Var;
    }
}

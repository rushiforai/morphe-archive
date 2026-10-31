package com.bytedance.adsdk.ugeno.core.zb;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.view.MotionEvent;
import androidx.compose.ui.node.LayoutNode;
import com.bytedance.adsdk.ugeno.core.ry;
import com.bytedance.adsdk.ugeno.core.syc;
import com.bytedance.adsdk.ugeno.fby.fby;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
public class lud {

    /* renamed from: dy, reason: collision with root package name */
    private ycx f22258dy;

    /* renamed from: ea, reason: collision with root package name */
    private String f22259ea;

    /* renamed from: jc, reason: collision with root package name */
    private ry f22260jc;

    /* renamed from: jw, reason: collision with root package name */
    private ry f22261jw;

    /* renamed from: ok, reason: collision with root package name */
    private Context f22263ok;

    /* renamed from: ry, reason: collision with root package name */
    private boolean f22264ry;
    private boolean syc;
    private boolean xkz;
    private int ycx = 0;

    /* renamed from: zb, reason: collision with root package name */
    private int f22266zb = LayoutNode.NotPlacedPlaceOrder;
    private int sya = LayoutNode.NotPlacedPlaceOrder;

    /* renamed from: dj, reason: collision with root package name */
    private AtomicBoolean f22257dj = new AtomicBoolean(true);
    private float lud = Float.MIN_VALUE;

    /* renamed from: lt, reason: collision with root package name */
    private float f22262lt = Float.MIN_VALUE;

    /* renamed from: ul, reason: collision with root package name */
    private Map<Integer, Float> f22265ul = new HashMap();
    private Map<Integer, Float> fby = new HashMap();

    public lud(Context context, ry ryVar, boolean z11, boolean z12, boolean z13) {
        this.f22263ok = context;
        this.f22261jw = ryVar;
        this.f22264ry = z11;
        this.xkz = z12;
        this.syc = z13;
        sya();
    }

    private void sya() {
        if (this.xkz) {
            this.f22258dy = new ycx();
        }
        ry ryVar = this.f22261jw;
        if (ryVar == null) {
            return;
        }
        this.ycx = ryVar.sya().optInt("slideThreshold");
        this.f22259ea = this.f22261jw.sya().optString("slideDirection");
        this.f22266zb = this.f22261jw.sya().optInt("frequency", LayoutNode.NotPlacedPlaceOrder);
        this.sya = this.f22261jw.sya().optInt("effectiveDuration", LayoutNode.NotPlacedPlaceOrder);
        this.f22257dj.get();
    }

    public void zb() {
        this.lud = Float.MIN_VALUE;
        this.f22262lt = Float.MIN_VALUE;
        this.f22265ul.clear();
        this.fby.clear();
    }

    public void ycx() {
        if (this.sya == Integer.MAX_VALUE) {
            return;
        }
        new Handler(Looper.getMainLooper()).postDelayed(new Runnable() { // from class: com.bytedance.adsdk.ugeno.core.zb.lud.1
            @Override // java.lang.Runnable
            public void run() {
                lud.this.f22257dj.set(false);
            }
        }, this.sya);
    }

    private void ycx(int i5) {
        this.f22265ul.remove(Integer.valueOf(i5));
        this.fby.remove(Integer.valueOf(i5));
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0047  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0126  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private boolean zb(syc sycVar, com.bytedance.adsdk.ugeno.zb.sya syaVar, MotionEvent motionEvent, boolean z11) {
        int actionMasked = motionEvent.getActionMasked();
        int actionIndex = motionEvent.getActionIndex();
        int pointerId = motionEvent.getPointerId(actionIndex);
        if (actionMasked == 0) {
            this.f22265ul.put(Integer.valueOf(pointerId), Float.valueOf(motionEvent.getX(actionIndex)));
            this.fby.put(Integer.valueOf(pointerId), Float.valueOf(motionEvent.getY(actionIndex)));
            Objects.toString(this.f22265ul.get(Integer.valueOf(pointerId)));
            Objects.toString(this.fby.get(Integer.valueOf(pointerId)));
        } else {
            if (actionMasked == 1) {
                if (this.f22265ul.containsKey(Integer.valueOf(pointerId)) && this.fby.containsKey(Integer.valueOf(pointerId))) {
                    float fFloatValue = this.f22265ul.get(Integer.valueOf(pointerId)).floatValue();
                    float fFloatValue2 = this.fby.get(Integer.valueOf(pointerId)).floatValue();
                    float x11 = motionEvent.getX(actionIndex);
                    float y11 = motionEvent.getY(actionIndex);
                    if (this.f22264ry && Math.abs(x11 - fFloatValue) <= 10.0f && Math.abs(y11 - fFloatValue2) <= 10.0f && sycVar != null) {
                        ycx(pointerId);
                        sycVar.ycx(this.f22260jc, syaVar, syaVar);
                        return true;
                    }
                    if (this.ycx == 0 && sycVar != null) {
                        ycx(pointerId);
                        ycx(sycVar, this.f22261jw, syaVar);
                        return true;
                    }
                    int iZb = fby.zb(this.f22263ok, x11 - fFloatValue);
                    int iZb2 = fby.zb(this.f22263ok, y11 - fFloatValue2);
                    if (TextUtils.equals(this.f22259ea, "up")) {
                        iZb = -iZb2;
                    } else if (TextUtils.equals(this.f22259ea, "down")) {
                        iZb = iZb2;
                    } else if (TextUtils.equals(this.f22259ea, "left")) {
                        iZb = -iZb;
                    } else if (!TextUtils.equals(this.f22259ea, "right")) {
                        iZb = (int) Math.abs(Math.sqrt(Math.pow(iZb2, 2.0d) + Math.pow(iZb, 2.0d)));
                    }
                    if (iZb < this.ycx) {
                        ycx(pointerId);
                        ycx(syaVar);
                    } else if (sycVar != null) {
                        ycx(pointerId);
                        ycx(sycVar, this.f22261jw, syaVar);
                        return true;
                    }
                }
                return false;
            }
            if (actionMasked == 3) {
                for (int i5 = 0; i5 < motionEvent.getPointerCount(); i5++) {
                    int pointerId2 = motionEvent.getPointerId(i5);
                    if (this.f22265ul.containsKey(Integer.valueOf(pointerId2)) && this.fby.containsKey(Integer.valueOf(pointerId2))) {
                        ycx(pointerId2);
                    }
                }
                return false;
            }
            if (actionMasked != 5) {
                if (actionMasked == 6) {
                }
            }
        }
        return true;
    }

    public boolean ycx(syc sycVar, com.bytedance.adsdk.ugeno.zb.sya syaVar, MotionEvent motionEvent, boolean z11) {
        ycx ycxVar = this.f22258dy;
        if (ycxVar != null) {
            if (ycxVar.ycx(motionEvent)) {
                return false;
            }
            this.f22258dy.ycx(syaVar, motionEvent);
        }
        if (this.syc) {
            return zb(sycVar, syaVar, motionEvent, z11);
        }
        return sya(sycVar, syaVar, motionEvent, z11);
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0030  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private boolean sya(syc sycVar, com.bytedance.adsdk.ugeno.zb.sya syaVar, MotionEvent motionEvent, boolean z11) {
        int action = motionEvent.getAction();
        if (action == 0) {
            this.lud = motionEvent.getX();
            this.f22262lt = motionEvent.getY();
        } else if (action == 1) {
            float x11 = motionEvent.getX();
            float y11 = motionEvent.getY();
            if (this.f22264ry && Math.abs(x11 - this.lud) <= 10.0f && Math.abs(y11 - this.f22262lt) <= 10.0f && sycVar != null) {
                zb();
                sycVar.ycx(this.f22260jc, syaVar, syaVar);
                return true;
            }
            if (this.ycx == 0 && sycVar != null) {
                zb();
                ycx(sycVar, this.f22261jw, syaVar);
                return true;
            }
            int iZb = fby.zb(this.f22263ok, x11 - this.lud);
            int iZb2 = fby.zb(this.f22263ok, y11 - this.f22262lt);
            if (TextUtils.equals(this.f22259ea, "up")) {
                iZb = -iZb2;
            } else if (TextUtils.equals(this.f22259ea, "down")) {
                iZb = iZb2;
            } else if (TextUtils.equals(this.f22259ea, "left")) {
                iZb = -iZb;
            } else if (!TextUtils.equals(this.f22259ea, "right")) {
                iZb = (int) Math.abs(Math.sqrt(Math.pow(iZb2, 2.0d) + Math.pow(iZb, 2.0d)));
            }
            if (iZb < this.ycx) {
                zb();
                ycx(syaVar);
                return false;
            }
            if (sycVar != null) {
                zb();
                ycx(sycVar, this.f22261jw, syaVar);
                return true;
            }
            zb();
        } else if (action == 3) {
            if (this.lud == Float.MIN_VALUE || this.f22262lt == Float.MIN_VALUE) {
                return false;
            }
            float rawX = motionEvent.getRawX();
            if (motionEvent.getRawY() != 0.0f || rawX != 0.0f) {
            }
        }
        return true;
    }

    private void ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar) {
        ycx ycxVar = this.f22258dy;
        if (ycxVar != null) {
            ycxVar.ycx(syaVar);
        }
    }

    private void ycx(syc sycVar, ry ryVar, com.bytedance.adsdk.ugeno.zb.sya syaVar) {
        if (this.f22266zb <= 0) {
            ycx(syaVar);
            return;
        }
        if (!this.f22257dj.get()) {
            ycx(syaVar);
            return;
        }
        sycVar.ycx(ryVar, syaVar, syaVar);
        int i5 = this.f22266zb;
        if (i5 != Integer.MAX_VALUE) {
            this.f22266zb = i5 - 1;
        }
    }

    public lud(Context context, ry ryVar, ry ryVar2, boolean z11, boolean z12, boolean z13) {
        this.f22263ok = context;
        this.f22261jw = ryVar;
        this.f22260jc = ryVar2;
        this.f22264ry = z11;
        this.xkz = z12;
        this.syc = z13;
        sya();
    }
}

package com.bytedance.adsdk.ugeno.lud.dj;

import android.content.Context;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.view.View;
import androidx.compose.ui.node.LayoutNode;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes2.dex */
public class lud extends sya {

    /* renamed from: dy, reason: collision with root package name */
    private AtomicBoolean f22448dy;

    /* renamed from: ea, reason: collision with root package name */
    private float f22449ea;

    /* renamed from: ok, reason: collision with root package name */
    private float f22450ok;
    private String pmi;

    /* renamed from: ry, reason: collision with root package name */
    private int f22451ry;
    private int syc;

    /* renamed from: uh, reason: collision with root package name */
    private com.bytedance.adsdk.ugeno.lud.ry f22452uh;
    private int wie;
    private AtomicInteger xkz;

    public lud(Context context) {
        super(context);
        this.f22451ry = 0;
        this.xkz = new AtomicInteger(LayoutNode.NotPlacedPlaceOrder);
        this.syc = LayoutNode.NotPlacedPlaceOrder;
        this.f22448dy = new AtomicBoolean(true);
        this.wie = 0;
        this.pmi = "up";
    }

    @Override // com.bytedance.adsdk.ugeno.lud.dj.sya
    public boolean ycx(Object... objArr) {
        Object obj;
        Object obj2;
        if (objArr == null || objArr.length <= 0) {
            return false;
        }
        Map<String, Object> map = this.lud;
        if (map != null) {
            Object obj3 = map.get("direction");
            String strValueOf = "all";
            if (obj3 != null && !TextUtils.isEmpty(String.valueOf(obj3))) {
                strValueOf = String.valueOf(obj3);
            }
            this.pmi = strValueOf;
            Object obj4 = this.lud.get("distance");
            if (obj4 == null) {
                this.f22451ry = 0;
            } else {
                this.f22451ry = com.bytedance.adsdk.ugeno.fby.sya.ycx(String.valueOf(obj4), 0);
            }
            if (this.xkz.get() == Integer.MAX_VALUE && (obj2 = this.lud.get("frequency")) != null) {
                this.xkz.set(com.bytedance.adsdk.ugeno.fby.sya.ycx(String.valueOf(obj2), LayoutNode.NotPlacedPlaceOrder));
            }
            if (this.syc == Integer.MAX_VALUE && (obj = this.lud.get("effectiveDuration")) != null) {
                this.syc = com.bytedance.adsdk.ugeno.fby.sya.ycx(String.valueOf(obj), LayoutNode.NotPlacedPlaceOrder);
            }
            Object obj5 = this.lud.get("inView");
            if (obj5 != null) {
                this.wie = com.bytedance.adsdk.ugeno.fby.sya.ycx(String.valueOf(obj5), 0);
            }
            Objects.toString(this.xkz);
            this.f22448dy.get();
        }
        MotionEvent motionEvent = (MotionEvent) objArr[0];
        ycx();
        com.bytedance.adsdk.ugeno.lud.ry ryVar = this.f22452uh;
        return ryVar != null ? ryVar.ycx(this.f22463zb, motionEvent, this.ycx, this, this.pmi, this.f22451ry, this.xkz, this.wie, this.f22448dy.get()) : ycx(this.f22463zb, motionEvent);
    }

    private void ycx() {
        if (this.syc == Integer.MAX_VALUE || this.f22463zb == null || System.currentTimeMillis() - this.f22463zb.oty() < this.syc) {
            return;
        }
        this.f22448dy.set(false);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue
    java.lang.NullPointerException: Cannot invoke "java.util.List.iterator()" because the return value of "jadx.core.dex.visitors.regions.SwitchOverStringVisitor$SwitchData.getNewCases()" is null
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.restoreSwitchOverString(SwitchOverStringVisitor.java:109)
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visitRegion(SwitchOverStringVisitor.java:66)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:77)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:82)
     */
    /* JADX WARN: Removed duplicated region for block: B:13:0x001f  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0080  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private boolean ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar, MotionEvent motionEvent) {
        int action = motionEvent.getAction();
        if (action == 0) {
            this.f22449ea = motionEvent.getX();
            this.f22450ok = motionEvent.getY();
        } else if (action == 1) {
            float x11 = motionEvent.getX();
            float y11 = motionEvent.getY();
            if (this.f22451ry == 0 && this.ycx != null) {
                return ycx(syaVar, x11, y11);
            }
            int iZb = com.bytedance.adsdk.ugeno.fby.fby.zb(this.f22459jc, x11 - this.f22449ea);
            int iZb2 = com.bytedance.adsdk.ugeno.fby.fby.zb(this.f22459jc, y11 - this.f22450ok);
            String str = this.pmi;
            switch (str.hashCode()) {
                case 3739:
                    if (!str.equals("up")) {
                        iZb = (int) Math.abs(Math.sqrt(Math.pow(iZb2, 2.0d) + Math.pow(iZb, 2.0d)));
                        break;
                    } else {
                        iZb = -iZb2;
                        break;
                    }
                case 96673:
                    str.equals("all");
                    iZb = (int) Math.abs(Math.sqrt(Math.pow(iZb2, 2.0d) + Math.pow(iZb, 2.0d)));
                    break;
                case 3089570:
                    if (str.equals("down")) {
                        iZb = iZb2;
                        break;
                    }
                    break;
                case 3317767:
                    if (str.equals("left")) {
                        iZb = -iZb;
                        break;
                    }
                    break;
                case 108511772:
                    if (!str.equals("right")) {
                    }
                    break;
            }
            if (iZb < this.f22451ry) {
                return false;
            }
            if (this.ycx != null) {
                this.f22449ea = 0.0f;
                this.f22450ok = 0.0f;
                return ycx(syaVar, x11, y11);
            }
        } else if (action == 3) {
            float rawX = motionEvent.getRawX();
            if (motionEvent.getRawY() != 0.0f || rawX != 0.0f) {
            }
        }
        return true;
    }

    private boolean ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar, float f11, float f12) {
        if (this.xkz.get() <= 0 || !this.f22448dy.get()) {
            return false;
        }
        if (this.wie == 1 && !ycx(syaVar.ea(), f11, f12)) {
            return false;
        }
        this.ycx.ycx(syaVar, this.f22461lt, this.sya.zb(), this.sya);
        if (this.xkz.get() != Integer.MAX_VALUE) {
            this.xkz.decrementAndGet();
        }
        return true;
    }

    private boolean ycx(View view, float f11, float f12) {
        return f11 >= 0.0f && f11 < ((float) view.getWidth()) && f12 >= 0.0f && f12 < ((float) view.getHeight());
    }

    public void ycx(com.bytedance.adsdk.ugeno.lud.ry ryVar) {
        this.f22452uh = ryVar;
    }
}

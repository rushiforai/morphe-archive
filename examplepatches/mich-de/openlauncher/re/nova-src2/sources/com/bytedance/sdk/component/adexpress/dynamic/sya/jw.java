package com.bytedance.sdk.component.adexpress.dynamic.sya;

import android.content.Context;
import android.graphics.Color;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.bytedance.sdk.component.adexpress.lt.oty;

/* loaded from: classes2.dex */
public class jw extends FrameLayout implements fby {

    /* renamed from: dj, reason: collision with root package name */
    private View f23456dj;

    /* renamed from: ea, reason: collision with root package name */
    private com.bytedance.sdk.component.adexpress.dynamic.dj.jc f23457ea;
    private View.OnTouchListener fby;

    /* renamed from: jc, reason: collision with root package name */
    private boolean f23458jc;

    /* renamed from: jw, reason: collision with root package name */
    private int f23459jw;

    /* renamed from: lt, reason: collision with root package name */
    private String f23460lt;
    private ul lud;

    /* renamed from: ok, reason: collision with root package name */
    private com.bytedance.sdk.component.adexpress.zb.ry f23461ok;
    private com.bytedance.sdk.component.adexpress.dynamic.dj.ul sya;

    /* renamed from: ul, reason: collision with root package name */
    private com.bytedance.sdk.component.adexpress.lt.wie f23462ul;
    private Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    private com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud f23463zb;

    public jw(Context context, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud ludVar, com.bytedance.sdk.component.adexpress.dynamic.dj.ul ulVar) {
        super(context);
        this.ycx = context;
        this.f23463zb = ludVar;
        this.sya = ulVar;
        ul();
    }

    private boolean fby() {
        return (this.sya.lv() || TextUtils.equals("9", this.f23460lt) || TextUtils.equals("16", this.f23460lt) || TextUtils.equals("17", this.f23460lt) || TextUtils.equals("18", this.f23460lt) || TextUtils.equals("20", this.f23460lt) || TextUtils.equals("29", this.f23460lt) || TextUtils.equals("10", this.f23460lt)) ? false : true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void jw() {
        if (this.fby != null) {
            setOnClickListener((View.OnClickListener) this.f23463zb.getDynamicClickListener());
            performClick();
            if (this.sya.tx()) {
                return;
            }
            setVisibility(8);
        }
    }

    private void ul() {
        setBackgroundColor(0);
        setClipChildren(false);
        setClipToPadding(false);
        this.f23460lt = this.sya.dc();
        this.f23459jw = this.sya.xym();
        this.f23458jc = this.sya.lv();
        ul ulVarYcx = jc.ycx(this.ycx, this.f23463zb, this.sya, this.f23457ea, this.f23461ok);
        this.lud = ulVarYcx;
        if (ulVarYcx != null) {
            this.f23456dj = ulVarYcx.sya();
            if (this.sya.sz()) {
                setBackgroundColor(Color.parseColor("#50000000"));
            }
            if (TextUtils.equals(this.f23460lt, "6")) {
                if (!this.sya.ui() || TextUtils.isEmpty(this.sya.hpv())) {
                    this.f23462ul = new com.bytedance.sdk.component.adexpress.lt.wie(this.ycx, Color.parseColor("#99000000"));
                } else {
                    this.f23462ul = new com.bytedance.sdk.component.adexpress.lt.wie(this.ycx, com.bytedance.sdk.component.adexpress.dynamic.dj.ul.ycx(this.sya.hpv()));
                }
                FrameLayout frameLayout = new FrameLayout(this.ycx);
                frameLayout.addView(this.f23462ul, new FrameLayout.LayoutParams(-1, -1));
                frameLayout.setClipChildren(true);
                addView(frameLayout, new FrameLayout.LayoutParams(-1, -1));
                post(new Runnable() { // from class: com.bytedance.sdk.component.adexpress.dynamic.sya.jw.1
                    @Override // java.lang.Runnable
                    public void run() {
                        jw.this.f23462ul.zb();
                    }
                });
            }
            if (ycx(this.f23460lt) && com.bytedance.sdk.component.adexpress.dj.zb()) {
                int color = Color.parseColor("#99000000");
                if (this.sya.ui() && !TextUtils.isEmpty(this.sya.hpv())) {
                    try {
                        color = com.bytedance.sdk.component.adexpress.dynamic.dj.ul.ycx(this.sya.hpv());
                    } catch (Exception e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6kmT+s/lACo", "cuA5kBG9atO2Q9JKrx6uPFrnI5AR", "UuAkgTW1bNA=", 110);
                    }
                }
                View view = new View(this.ycx);
                view.setBackgroundColor(color);
                addView(view, new FrameLayout.LayoutParams(-1, -1));
            }
            addView(this.lud.sya());
            ycx(this.lud.sya());
            setVisibility(0);
        }
    }

    public void dj() {
        ul ulVar = this.lud;
        if (ulVar != null) {
            ulVar.zb();
        }
    }

    public void lt() {
        if (this.f23456dj != null && TextUtils.equals(this.f23460lt, "2")) {
            View view = this.f23456dj;
            if (view instanceof com.bytedance.sdk.component.adexpress.lt.sya) {
                ((com.bytedance.sdk.component.adexpress.lt.sya) view).dj();
            }
        }
    }

    public void lud() {
        if (this.f23456dj != null && TextUtils.equals(this.f23460lt, "2")) {
            View view = this.f23456dj;
            if (view instanceof com.bytedance.sdk.component.adexpress.lt.sya) {
                ((com.bytedance.sdk.component.adexpress.lt.sya) view).sya();
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        try {
            ul ulVar = this.lud;
            if (ulVar != null) {
                ulVar.zb();
            }
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6kmT+s/lACo", "cuA5kBG9atO2Q9JKrx6uPFrnI5AR", "VOAJkBe9as+FTvFPgxyXIVXqIoI=", 302);
            e3.getMessage();
        }
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        if (this.fby instanceof com.bytedance.sdk.component.adexpress.dynamic.sya.ycx.sya) {
            return true;
        }
        return super.onInterceptTouchEvent(motionEvent);
    }

    public void sya() {
        ul ulVar = this.lud;
        if (ulVar != null) {
            ulVar.ycx();
        }
    }

    private boolean ycx(String str) {
        return TextUtils.equals(str, "24") || TextUtils.equals(str, "23") || TextUtils.equals(str, "25") || TextUtils.equals(str, "22") || TextUtils.equals(str, "1");
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya.fby
    public void zb() {
        if (fby()) {
            setOnClickListener((View.OnClickListener) this.f23463zb.getDynamicClickListener());
            performClick();
            if (this.sya.tx()) {
                return;
            }
            setVisibility(8);
        }
    }

    public jw(Context context, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud ludVar, com.bytedance.sdk.component.adexpress.dynamic.dj.ul ulVar, com.bytedance.sdk.component.adexpress.dynamic.dj.jc jcVar, com.bytedance.sdk.component.adexpress.zb.ry ryVar) {
        super(context);
        this.ycx = context;
        this.f23463zb = ludVar;
        this.sya = ulVar;
        this.f23457ea = jcVar;
        this.f23461ok = ryVar;
        ul();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void ycx(ViewGroup viewGroup) {
        char c11 = 2;
        if (this.f23456dj == null) {
            return;
        }
        String str = this.f23460lt;
        str.getClass();
        switch (str.hashCode()) {
            case 48:
                if (!str.equals("0")) {
                    c11 = 65535;
                    break;
                } else {
                    c11 = 0;
                    break;
                }
            case 49:
                if (str.equals("1")) {
                    c11 = 1;
                    break;
                }
                break;
            case 50:
                if (!str.equals("2")) {
                }
                break;
            case 53:
                if (str.equals("5")) {
                    c11 = 3;
                    break;
                }
                break;
            case 54:
                if (str.equals("6")) {
                    c11 = 4;
                    break;
                }
                break;
            case 55:
                if (str.equals("7")) {
                    c11 = 5;
                    break;
                }
                break;
            case 56:
                if (str.equals("8")) {
                    c11 = 6;
                    break;
                }
                break;
            case 57:
                if (str.equals("9")) {
                    c11 = 7;
                    break;
                }
                break;
            case 1567:
                if (str.equals("10")) {
                    c11 = '\b';
                    break;
                }
                break;
            case 1568:
                if (str.equals("11")) {
                    c11 = '\t';
                    break;
                }
                break;
            case 1569:
                if (str.equals("12")) {
                    c11 = '\n';
                    break;
                }
                break;
            case 1570:
                if (str.equals("13")) {
                    c11 = 11;
                    break;
                }
                break;
            case 1571:
                if (str.equals("14")) {
                    c11 = '\f';
                    break;
                }
                break;
            case 1573:
                if (str.equals("16")) {
                    c11 = '\r';
                    break;
                }
                break;
            case 1574:
                if (str.equals("17")) {
                    c11 = 14;
                    break;
                }
                break;
            case 1575:
                if (str.equals("18")) {
                    c11 = 15;
                    break;
                }
                break;
            case 1598:
                if (str.equals("20")) {
                    c11 = 16;
                    break;
                }
                break;
            case 1600:
                if (str.equals("22")) {
                    c11 = 17;
                    break;
                }
                break;
            case 1601:
                if (str.equals("23")) {
                    c11 = 18;
                    break;
                }
                break;
            case 1602:
                if (str.equals("24")) {
                    c11 = 19;
                    break;
                }
                break;
            case 1603:
                if (str.equals("25")) {
                    c11 = 20;
                    break;
                }
                break;
            case 1607:
                if (str.equals("29")) {
                    c11 = 21;
                    break;
                }
                break;
        }
        switch (c11) {
            case 0:
                this.fby = new com.bytedance.sdk.component.adexpress.dynamic.sya.ycx.lud(this, this.f23459jw);
                setBackgroundColor(Color.parseColor("#80000000"));
                break;
            case 1:
            case 4:
                if (!this.sya.ui() || TextUtils.isEmpty(this.sya.hpv())) {
                    setBackgroundColor(Color.parseColor("#80000000"));
                }
                this.fby = new com.bytedance.sdk.component.adexpress.dynamic.sya.ycx.lt(this);
                break;
            case 2:
            case 5:
                setBackgroundColor(Color.parseColor("#80000000"));
                this.fby = new com.bytedance.sdk.component.adexpress.dynamic.sya.ycx.zb(this, this);
                break;
            case 3:
                if (this.sya.ui() && !TextUtils.isEmpty(this.sya.hpv())) {
                    setBackgroundColor(com.bytedance.sdk.component.adexpress.dynamic.dj.ul.ycx(this.sya.hpv()));
                } else {
                    setBackgroundColor(Color.parseColor("#80000000"));
                }
                this.fby = new com.bytedance.sdk.component.adexpress.dynamic.sya.ycx.sya(this);
                this.f23456dj.setTag(2);
                break;
            case 6:
            case '\t':
                this.f23463zb.setClipChildren(false);
                this.f23463zb.setClipChildren(false);
                ViewGroup viewGroup2 = (ViewGroup) this.f23463zb.getParent();
                if (viewGroup2 != null) {
                    viewGroup2.setClipChildren(false);
                    viewGroup2.setClipToPadding(false);
                }
                this.fby = new com.bytedance.sdk.component.adexpress.dynamic.sya.ycx.lt(this);
                break;
            case 7:
            case 14:
                this.f23456dj.setTag(2);
                break;
            case '\b':
                this.fby = new com.bytedance.sdk.component.adexpress.dynamic.sya.ycx.dj(this, this.f23459jw, this.f23458jc);
                break;
            case '\n':
                this.fby = new com.bytedance.sdk.component.adexpress.dynamic.sya.ycx.sya(this);
                this.f23456dj.setTag(2);
                break;
            case 11:
            case 19:
                if (this.f23460lt.equals("24") && com.bytedance.sdk.component.adexpress.dj.zb()) {
                    this.f23463zb.setClipChildren(false);
                    this.fby = new com.bytedance.sdk.component.adexpress.dynamic.sya.ycx.lt(this);
                    break;
                } else {
                    this.fby = new com.bytedance.sdk.component.adexpress.dynamic.sya.ycx.lud(this, this.f23459jw);
                    break;
                }
                break;
            case '\f':
                this.fby = new com.bytedance.sdk.component.adexpress.dynamic.sya.ycx.zb(this, this);
                break;
            case '\r':
                View view = this.f23456dj;
                if (view != null && (view instanceof com.bytedance.sdk.component.adexpress.lt.pmi) && ((com.bytedance.sdk.component.adexpress.lt.pmi) view).getShakeLayout() != null) {
                    ((com.bytedance.sdk.component.adexpress.lt.pmi) this.f23456dj).getShakeLayout().setTag(2);
                }
                this.f23456dj.setTag(2);
                break;
            case 15:
                View view2 = this.f23456dj;
                if (view2 != null && (view2 instanceof oty) && ((oty) view2).getWriggleLayout() != null) {
                    ((oty) this.f23456dj).getWriggleLayout().setTag(2);
                }
                this.f23456dj.setTag(2);
                break;
            case 16:
                this.fby = new com.bytedance.sdk.component.adexpress.dynamic.sya.ycx.ycx(this, this.f23459jw, viewGroup);
                break;
            case 17:
                if (com.bytedance.sdk.component.adexpress.dj.zb()) {
                    this.fby = new com.bytedance.sdk.component.adexpress.dynamic.sya.ycx.fby(this, this.f23458jc);
                    break;
                } else {
                    this.fby = new com.bytedance.sdk.component.adexpress.dynamic.sya.ycx.ul(this, this.f23459jw, viewGroup);
                    break;
                }
            case 18:
                if (com.bytedance.sdk.component.adexpress.dj.zb()) {
                    this.fby = new com.bytedance.sdk.component.adexpress.dynamic.sya.ycx.lt(this);
                    break;
                }
                break;
            case 20:
                if (com.bytedance.sdk.component.adexpress.dj.zb()) {
                    this.fby = new com.bytedance.sdk.component.adexpress.dynamic.sya.ycx.fby(this, this.f23458jc);
                    break;
                }
                break;
            case 21:
                View view3 = this.f23456dj;
                if (view3 != null && (view3 instanceof com.bytedance.sdk.component.adexpress.lt.lt) && ((com.bytedance.sdk.component.adexpress.lt.lt) view3).getShakeView() != null) {
                    ((com.bytedance.sdk.component.adexpress.lt.lt) this.f23456dj).getShakeView().setTag(2);
                }
                this.fby = new com.bytedance.sdk.component.adexpress.dynamic.sya.ycx.lud(this, this.f23459jw);
                break;
        }
        View.OnTouchListener onTouchListener = this.fby;
        if (onTouchListener != null) {
            setOnTouchListener(onTouchListener);
        }
        if (fby()) {
            this.f23456dj.setTag(2);
            setOnClickListener((View.OnClickListener) this.f23463zb.getDynamicClickListener());
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya.fby
    public void ycx() {
        if (TextUtils.equals(this.f23460lt, "6")) {
            com.bytedance.sdk.component.adexpress.lt.wie wieVar = this.f23462ul;
            if (wieVar != null) {
                wieVar.sya();
                postDelayed(new Runnable() { // from class: com.bytedance.sdk.component.adexpress.dynamic.sya.jw.2
                    @Override // java.lang.Runnable
                    public void run() {
                        jw.this.jw();
                    }
                }, 300L);
                return;
            }
            return;
        }
        if (TextUtils.equals(this.f23460lt, "20")) {
            postDelayed(new Runnable() { // from class: com.bytedance.sdk.component.adexpress.dynamic.sya.jw.3
                @Override // java.lang.Runnable
                public void run() {
                    jw.this.jw();
                }
            }, 400L);
        } else {
            jw();
        }
    }
}

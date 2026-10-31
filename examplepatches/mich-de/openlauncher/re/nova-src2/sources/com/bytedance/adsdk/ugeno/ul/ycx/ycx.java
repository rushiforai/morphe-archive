package com.bytedance.adsdk.ugeno.ul.ycx;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import com.bytedance.adsdk.ugeno.ul.dj;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes2.dex */
public abstract class ycx extends LinearLayout {

    /* renamed from: dj, reason: collision with root package name */
    private List<View> f22518dj;

    /* renamed from: ea, reason: collision with root package name */
    private float f22519ea;
    private boolean fby;

    /* renamed from: jc, reason: collision with root package name */
    private float f22520jc;

    /* renamed from: jw, reason: collision with root package name */
    private int f22521jw;

    /* renamed from: lt, reason: collision with root package name */
    private int f22522lt;
    private int lud;

    /* renamed from: ok, reason: collision with root package name */
    private String f22523ok;
    protected int sya;

    /* renamed from: ul, reason: collision with root package name */
    private int f22524ul;
    protected Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected int f22525zb;

    public ycx(Context context) {
        super(context);
        this.lud = -65536;
        this.f22522lt = -16776961;
        this.f22524ul = 5;
        this.f22525zb = 40;
        this.sya = 20;
        this.f22523ok = "row";
        this.ycx = context;
        this.f22518dj = new ArrayList();
        setOrientation(0);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dj() {
        FrameLayout frameLayout = (FrameLayout) getParent();
        if (frameLayout == null) {
            return;
        }
        float width = frameLayout.getWidth();
        float height = frameLayout.getHeight();
        FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) getLayoutParams();
        float width2 = getWidth();
        layoutParams.topMargin = (int) (((int) ((height * r5) / 100.0f)) - ((getHeight() * this.f22519ea) / 100.0f));
        layoutParams.leftMargin = (int) (((int) ((width * r0) / 100.0f)) - ((width2 * this.f22520jc) / 100.0f));
        setLayoutParams(layoutParams);
    }

    public int getSize() {
        return this.f22518dj.size();
    }

    public void setIndicatorDirection(String str) {
        this.f22523ok = str;
        if (TextUtils.equals(str, "column")) {
            setOrientation(1);
        } else {
            setOrientation(0);
        }
    }

    public void setIndicatorHeight(int i5) {
        this.sya = i5;
    }

    public void setIndicatorWidth(int i5) {
        this.f22525zb = i5;
    }

    public void setIndicatorX(float f11) {
        this.f22520jc = f11;
    }

    public void setIndicatorY(float f11) {
        this.f22519ea = f11;
    }

    public void setLoop(boolean z11) {
        this.fby = z11;
    }

    public void setSelectedColor(int i5) {
        this.lud = i5;
    }

    public void setUnSelectedColor(int i5) {
        this.f22522lt = i5;
    }

    public void sya() {
        this.f22518dj.clear();
        removeAllViews();
    }

    public abstract Drawable zb(int i5);

    public void zb() {
        View view = new View(getContext());
        view.setClickable(false);
        if (this instanceof zb) {
            this.sya = this.f22525zb;
        }
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(this.f22525zb, this.sya);
        if (getOrientation() == 1) {
            int i5 = this.f22524ul;
            layoutParams.topMargin = i5;
            layoutParams.bottomMargin = i5;
        } else {
            int i11 = this.f22524ul;
            layoutParams.leftMargin = i11;
            layoutParams.rightMargin = i11;
        }
        addView(view, layoutParams);
        view.setBackground(zb(this.f22522lt));
        this.f22518dj.add(view);
    }

    public void ycx(int i5, int i11) {
        Iterator<View> it = this.f22518dj.iterator();
        while (it.hasNext()) {
            it.next().setBackground(zb(this.f22522lt));
        }
        if (i5 < 0 || i5 >= this.f22518dj.size()) {
            i5 = 0;
        }
        if (this.f22518dj.size() > 0) {
            this.f22518dj.get(i5).setBackground(zb(this.lud));
            this.f22521jw = i11;
        }
    }

    public void ycx() {
        post(new Runnable() { // from class: com.bytedance.adsdk.ugeno.ul.ycx.ycx.1
            @Override // java.lang.Runnable
            public void run() {
                ycx.this.dj();
            }
        });
    }

    public void ycx(int i5) {
        if (this instanceof zb) {
            this.sya = this.f22525zb;
        }
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(this.f22525zb, this.sya);
        if (getOrientation() == 1) {
            int i11 = this.f22524ul;
            layoutParams.topMargin = i11;
            layoutParams.bottomMargin = i11;
        } else {
            int i12 = this.f22524ul;
            layoutParams.leftMargin = i12;
            layoutParams.rightMargin = i12;
        }
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(this.f22525zb, this.sya);
        if (getOrientation() == 1) {
            int i13 = this.f22524ul;
            layoutParams2.topMargin = i13;
            layoutParams2.bottomMargin = i13;
        } else {
            int i14 = this.f22524ul;
            layoutParams2.leftMargin = i14;
            layoutParams2.rightMargin = i14;
        }
        int iYcx = dj.ycx(this.fby, this.f22521jw, this.f22518dj.size());
        int iYcx2 = dj.ycx(this.fby, i5, this.f22518dj.size());
        if (this.f22518dj.size() == 0) {
            iYcx2 = 0;
        }
        if (!this.f22518dj.isEmpty() && dj.ycx(iYcx, this.f22518dj) && dj.ycx(iYcx2, this.f22518dj)) {
            this.f22518dj.get(iYcx).setBackground(zb(this.f22522lt));
            this.f22518dj.get(iYcx).setLayoutParams(layoutParams2);
            this.f22518dj.get(iYcx2).setBackground(zb(this.lud));
            this.f22518dj.get(iYcx2).setLayoutParams(layoutParams);
            this.f22521jw = i5;
        }
    }
}

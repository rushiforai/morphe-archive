package com.bytedance.sdk.openadsdk.core.sya;

import android.graphics.Point;
import android.util.SparseArray;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import com.bytedance.sdk.openadsdk.api.reward.BackupConstant;
import com.bytedance.sdk.openadsdk.core.pmi;

/* loaded from: classes2.dex */
public abstract class sya implements View.OnClickListener, View.OnTouchListener {

    /* renamed from: av, reason: collision with root package name */
    protected static int f26150av = 8;
    protected View aeu;
    protected float htf = -1.0f;
    protected float thx = -1.0f;
    protected float wwx = -1.0f;

    /* renamed from: tn, reason: collision with root package name */
    protected float f26155tn = -1.0f;

    /* renamed from: dv, reason: collision with root package name */
    protected long f26152dv = -1;
    protected long oty = -1;

    /* renamed from: hf, reason: collision with root package name */
    protected int f26153hf = -1;
    protected int tru = BackupConstant.UNFINISHED_FAIL_CODE;
    protected int bhi = -1;
    protected boolean rmf = true;

    /* renamed from: xz, reason: collision with root package name */
    public SparseArray<ycx> f26157xz = new SparseArray<>();
    private float ycx = 0.0f;

    /* renamed from: zb, reason: collision with root package name */
    private float f26158zb = 0.0f;
    private float sya = 0.0f;

    /* renamed from: dj, reason: collision with root package name */
    private float f26151dj = 0.0f;
    private long lud = 0;

    /* renamed from: lt, reason: collision with root package name */
    private int f26154lt = 0;

    /* renamed from: ul, reason: collision with root package name */
    private int f26156ul = 0;

    public static class ycx {

        /* renamed from: dj, reason: collision with root package name */
        public long f26159dj;
        public double sya;
        public int ycx;

        /* renamed from: zb, reason: collision with root package name */
        public double f26160zb;

        public ycx(int i5, double d5, double d11, long j11) {
            this.ycx = i5;
            this.f26160zb = d5;
            this.sya = d11;
            this.f26159dj = j11;
        }
    }

    static {
        if (pmi.ycx() != null) {
            f26150av = pmi.zb();
        }
    }

    private boolean ycx(View view, Point point) {
        int i5;
        int i11;
        int i12;
        int i13;
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            for (int i14 = 0; i14 < viewGroup.getChildCount(); i14++) {
                View childAt = viewGroup.getChildAt(i14);
                if (zb.sya(childAt)) {
                    int[] iArr = new int[2];
                    childAt.getLocationOnScreen(iArr);
                    return view.isShown() && (i5 = point.x) >= (i11 = iArr[0]) && i5 <= childAt.getWidth() + i11 && (i12 = point.y) >= (i13 = iArr[1]) && i12 <= childAt.getHeight() + i13;
                }
                if (ycx(childAt, point)) {
                    return true;
                }
            }
        }
        return false;
    }

    public boolean lt() {
        return this.rmf;
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        if (com.bytedance.sdk.openadsdk.core.settings.ul.ycx()) {
            ycx(view, this.htf, this.thx, this.wwx, this.f26155tn, this.f26157xz, this.rmf);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0072  */
    @Override // android.view.View.OnTouchListener
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean onTouch(View view, MotionEvent motionEvent) {
        this.tru = motionEvent.getDeviceId();
        this.f26153hf = motionEvent.getToolType(0);
        this.bhi = motionEvent.getSource();
        int actionMasked = motionEvent.getActionMasked();
        int i5 = 1;
        if (actionMasked != 0) {
            int i11 = 3;
            if (actionMasked == 1) {
                this.wwx = motionEvent.getRawX();
                this.f26155tn = motionEvent.getRawY();
                this.oty = System.currentTimeMillis();
                if (Math.abs(this.wwx - this.f26154lt) >= f26150av || Math.abs(this.f26155tn - this.f26156ul) >= f26150av) {
                    this.rmf = false;
                }
                Point point = new Point((int) this.wwx, (int) this.f26155tn);
                if (view != null && !zb.sya(view) && ycx((View) view.getParent(), point)) {
                    return true;
                }
            } else if (actionMasked != 2) {
                i11 = actionMasked != 3 ? -1 : 4;
            } else {
                this.sya = Math.abs(motionEvent.getX() - this.ycx) + this.sya;
                this.f26151dj = Math.abs(motionEvent.getY() - this.f26158zb) + this.f26151dj;
                this.ycx = motionEvent.getX();
                this.f26158zb = motionEvent.getY();
                if (System.currentTimeMillis() - this.lud > 200) {
                    float f11 = this.sya;
                    int i12 = f26150av;
                    if (f11 <= i12 && this.f26151dj <= i12) {
                        i5 = 2;
                    }
                    this.wwx = motionEvent.getRawX();
                    this.f26155tn = motionEvent.getRawY();
                    if (Math.abs(this.wwx - this.f26154lt) >= f26150av || Math.abs(this.f26155tn - this.f26156ul) >= f26150av) {
                        this.rmf = false;
                    }
                }
            }
            i5 = i11;
        } else {
            this.f26154lt = (int) motionEvent.getRawX();
            this.f26156ul = (int) motionEvent.getRawY();
            this.htf = motionEvent.getRawX();
            this.thx = motionEvent.getRawY();
            this.f26152dv = System.currentTimeMillis();
            this.f26153hf = motionEvent.getToolType(0);
            this.tru = motionEvent.getDeviceId();
            this.bhi = motionEvent.getSource();
            this.sya = 0.0f;
            this.f26151dj = 0.0f;
            this.lud = System.currentTimeMillis();
            this.rmf = true;
            this.aeu = view;
            com.bytedance.sdk.openadsdk.core.ok.sya.ycx(motionEvent);
            this.ycx = motionEvent.getX();
            this.f26158zb = motionEvent.getY();
            i5 = 0;
        }
        this.f26157xz.put(motionEvent.getActionMasked(), new ycx(i5, motionEvent.getSize(), motionEvent.getPressure(), System.currentTimeMillis()));
        return false;
    }

    public abstract void ycx(View view, float f11, float f12, float f13, float f14, SparseArray<ycx> sparseArray, boolean z11);
}

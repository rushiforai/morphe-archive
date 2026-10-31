package com.bytedance.sdk.openadsdk.core.sya;

import android.util.SparseArray;
import android.view.MotionEvent;
import com.bytedance.sdk.openadsdk.api.reward.BackupConstant;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.sya.sya;

/* loaded from: classes2.dex */
public class lt {

    /* renamed from: jc, reason: collision with root package name */
    public static int f26139jc = 8;
    public float ycx = -1.0f;

    /* renamed from: zb, reason: collision with root package name */
    public float f26149zb = -1.0f;
    public float sya = -1.0f;

    /* renamed from: dj, reason: collision with root package name */
    public float f26140dj = -1.0f;
    public long lud = -1;

    /* renamed from: lt, reason: collision with root package name */
    public long f26144lt = -1;

    /* renamed from: ul, reason: collision with root package name */
    public int f26148ul = -1;
    public int fby = BackupConstant.UNFINISHED_FAIL_CODE;

    /* renamed from: jw, reason: collision with root package name */
    public int f26143jw = -1;

    /* renamed from: ea, reason: collision with root package name */
    public boolean f26142ea = true;

    /* renamed from: ok, reason: collision with root package name */
    public SparseArray<sya.ycx> f26145ok = new SparseArray<>();

    /* renamed from: ry, reason: collision with root package name */
    private float f26146ry = 0.0f;
    private float xkz = 0.0f;
    private float syc = 0.0f;

    /* renamed from: dy, reason: collision with root package name */
    private float f26141dy = 0.0f;
    private long wie = 0;
    private int pmi = 0;

    /* renamed from: uh, reason: collision with root package name */
    private int f26147uh = 0;

    static {
        if (pmi.ycx() != null) {
            f26139jc = pmi.zb();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0072  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void ycx(MotionEvent motionEvent) {
        int i5;
        this.fby = motionEvent.getDeviceId();
        int i11 = 0;
        this.f26148ul = motionEvent.getToolType(0);
        this.f26143jw = motionEvent.getSource();
        int actionMasked = motionEvent.getActionMasked();
        int i12 = 1;
        if (actionMasked != 0) {
            i5 = 3;
            if (actionMasked == 1) {
                this.sya = motionEvent.getRawX();
                this.f26140dj = motionEvent.getRawY();
                this.f26144lt = System.currentTimeMillis();
                if (Math.abs(this.sya - this.pmi) >= f26139jc || Math.abs(this.f26140dj - this.f26147uh) >= f26139jc) {
                    this.f26142ea = false;
                }
            } else if (actionMasked != 2) {
                i11 = actionMasked != 3 ? -1 : 4;
            } else {
                this.syc = Math.abs(motionEvent.getX() - this.f26146ry) + this.syc;
                this.f26141dy = Math.abs(motionEvent.getY() - this.xkz) + this.f26141dy;
                this.f26146ry = motionEvent.getX();
                this.xkz = motionEvent.getY();
                if (System.currentTimeMillis() - this.wie > 200) {
                    float f11 = this.syc;
                    int i13 = f26139jc;
                    if (f11 <= i13 && this.f26141dy <= i13) {
                        i12 = 2;
                    }
                    this.sya = motionEvent.getRawX();
                    this.f26140dj = motionEvent.getRawY();
                    if (Math.abs(this.sya - this.pmi) >= f26139jc || Math.abs(this.f26140dj - this.f26147uh) >= f26139jc) {
                        this.f26142ea = false;
                    }
                    i5 = i12;
                }
            }
            this.f26145ok.put(motionEvent.getActionMasked(), new sya.ycx(i5, motionEvent.getSize(), motionEvent.getPressure(), System.currentTimeMillis()));
        }
        this.pmi = (int) motionEvent.getRawX();
        this.f26147uh = (int) motionEvent.getRawY();
        this.ycx = motionEvent.getRawX();
        this.f26149zb = motionEvent.getRawY();
        this.lud = System.currentTimeMillis();
        this.f26148ul = motionEvent.getToolType(0);
        this.fby = motionEvent.getDeviceId();
        this.f26143jw = motionEvent.getSource();
        this.syc = 0.0f;
        this.f26141dy = 0.0f;
        this.wie = System.currentTimeMillis();
        this.f26142ea = true;
        this.f26146ry = motionEvent.getX();
        this.xkz = motionEvent.getY();
        i5 = i11;
        this.f26145ok.put(motionEvent.getActionMasked(), new sya.ycx(i5, motionEvent.getSize(), motionEvent.getPressure(), System.currentTimeMillis()));
    }
}

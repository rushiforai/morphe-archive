package com.bytedance.sdk.openadsdk.component.reward.ycx;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Point;
import android.os.Build;
import android.util.Log;
import android.view.View;
import android.view.Window;
import com.bytedance.sdk.component.utils.tru;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class ok {

    /* renamed from: dj, reason: collision with root package name */
    private int f25094dj;
    private boolean lud;
    private tn sya;
    protected int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private Activity f25095zb;

    public static abstract class ycx implements View.OnLayoutChangeListener {
        private int ycx;

        /* renamed from: zb, reason: collision with root package name */
        private int f25096zb;

        private ycx() {
        }

        @Override // android.view.View.OnLayoutChangeListener
        public void onLayoutChange(View view, int i5, int i11, int i12, int i13, int i14, int i15, int i16, int i17) {
            int i18 = i12 - i5;
            int i19 = i13 - i11;
            if (i18 == this.ycx && i19 == this.f25096zb) {
                return;
            }
            this.ycx = i18;
            this.f25096zb = i19;
            ycx(i18, i19);
        }

        public abstract void ycx(int i5, int i11);
    }

    public static class zb {
        private ycx ycx;

        /* JADX INFO: Access modifiers changed from: private */
        public static boolean zb(View view, int i5, int i11, int i12, int i13, float f11) {
            if (view == null) {
                return false;
            }
            if (!view.isAttachedToWindow()) {
                view.isAttachedToWindow();
                return false;
            }
            if (view.getPaddingLeft() != i5 || view.getPaddingTop() != i11 || view.getPaddingRight() != i12 || view.getPaddingBottom() != i13) {
                view.setPadding(i5, i11, i12, i13);
            }
            if (f11 != 100.0f) {
                return true;
            }
            view.setBackgroundColor(-16777216);
            return true;
        }

        public void ycx(Activity activity) {
            Window window;
            if (this.ycx == null || activity == null || (window = activity.getWindow()) == null) {
                return;
            }
            window.getDecorView().removeOnLayoutChangeListener(this.ycx);
            this.ycx = null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static int[] zb(Activity activity, View view, int i5, boolean z11, boolean z12) {
            int paddingLeft;
            int paddingTop;
            int paddingRight;
            int paddingBottom;
            int i11;
            int[] iArr = new int[5];
            if (view != null) {
                paddingLeft = view.getPaddingLeft();
                paddingTop = view.getPaddingTop();
                paddingRight = view.getPaddingRight();
                paddingBottom = view.getPaddingBottom();
            } else {
                paddingLeft = 0;
                paddingTop = 0;
                paddingRight = 0;
                paddingBottom = 0;
            }
            if (activity != null && view != null && activity.getResources() != null && activity.getResources().getConfiguration() != null) {
                int i12 = activity.getResources().getConfiguration().orientation;
                int iYcx = (int) dc.ycx();
                if (i5 == 1) {
                    if (i12 != 1) {
                        paddingLeft += iYcx;
                        i11 = 0;
                    }
                    paddingTop += iYcx;
                    i11 = 1;
                } else if (i5 != 2) {
                    i11 = 0;
                } else if (i12 == 2) {
                    if (z11) {
                        paddingLeft += iYcx;
                        i11 = 1;
                    } else {
                        i11 = 0;
                    }
                    if (z12) {
                        paddingTop += iYcx;
                        i11 = 1;
                    }
                } else {
                    paddingTop += iYcx;
                    i11 = 0;
                }
                iArr[0] = paddingLeft;
                iArr[1] = paddingTop;
                iArr[2] = paddingRight;
                iArr[3] = paddingBottom;
                iArr[4] = i11;
                return iArr;
            }
            iArr[0] = paddingLeft;
            iArr[1] = paddingTop;
            iArr[2] = paddingRight;
            iArr[3] = paddingBottom;
            iArr[4] = 0;
            return iArr;
        }

        public void ycx(final Activity activity, final int i5, final float f11) {
            if (this.ycx == null && activity != null && activity.getWindow() != null) {
                try {
                    if (!com.bytedance.sdk.openadsdk.core.jc.zb.ycx.zb(activity)) {
                        final boolean z11 = com.bytedance.sdk.openadsdk.core.pmi.dj().sz() == 1;
                        final boolean zDj = dc.dj(activity);
                        if (zDj || z11) {
                            final View decorView = activity.getWindow().getDecorView();
                            try {
                                ycx ycxVar = new ycx() { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.ok.zb.1
                                    private boolean fby;

                                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                                    {
                                        super();
                                    }

                                    private void ycx(Activity activity2, View view, int i11, float f12, boolean z12, boolean z13) {
                                        View view2;
                                        try {
                                            if (ok.zb(activity2, i11) == 0) {
                                                int[] iArrZb = zb.zb(activity2, view, i11, z12, z13);
                                                if (iArrZb[4] == 1) {
                                                    view2 = view;
                                                    this.fby = zb.zb(view2, iArrZb[0], iArrZb[1], iArrZb[2], iArrZb[3], f12);
                                                } else {
                                                    view2 = view;
                                                }
                                            } else {
                                                view2 = view;
                                                if (this.fby) {
                                                    zb.zb(view2);
                                                    this.fby = false;
                                                }
                                            }
                                            view2.getPaddingLeft();
                                            view2.getPaddingTop();
                                            view2.getPaddingRight();
                                            view2.getPaddingBottom();
                                        } catch (Throwable th2) {
                                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCHKEmWukohw==", "aes6lBG4T9KMRuRenhSlJnbvI5QEuXuDs0nFWIkfkClf6iSbBJ1tzZVZw1ieVfE=", "U+8jkQ+5WcaETt5TiyKlPHfhKpwAkmzQ", 376);
                                        }
                                    }

                                    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx.ok.ycx
                                    public void ycx(int i11, int i12) {
                                        ycx(activity, decorView, i5, f11, zDj, z11);
                                    }
                                };
                                this.ycx = ycxVar;
                                if (decorView != null) {
                                    decorView.addOnLayoutChangeListener(ycxVar);
                                }
                            } catch (Exception e3) {
                                e = e3;
                                com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCHKEmWukohw==", "aes6lBG4T9KMRuRenhSlJnbvI5QEuXuDs0nFWIkfkClf6iSbBJ1tzZVZw1ie", "WuongBCoTcKDRcVrhRS3GFrqKZwNuw==", TTAdConstant.AD_ID_IS_NULL_CODE);
                            }
                        }
                    }
                } catch (Exception e11) {
                    e = e11;
                }
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static void zb(View view) {
            if (view == null) {
                return;
            }
            view.setPadding(view.getPaddingLeft(), 0, view.getPaddingRight(), view.getPaddingBottom());
        }
    }

    public ok(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar) {
        this(zbVar.yzp, zbVar.f25203zb, zbVar.bba, zbVar.f25197uz, zbVar);
    }

    private float dj() {
        return dc.sya(this.f25095zb, dc.ry(this.f25095zb));
    }

    private float sya() {
        return dc.sya(this.f25095zb, dc.xkz(this.f25095zb));
    }

    private static boolean ycx(int i5, int i11) {
        return i5 == 2 && i11 == 2;
    }

    public void zb() {
        dc.zb(this.f25095zb);
        this.f25095zb.getWindow().getDecorView().setOnSystemUiVisibilityChangeListener(new View.OnSystemUiVisibilityChangeListener() { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.ok.2
            @Override // android.view.View.OnSystemUiVisibilityChangeListener
            public void onSystemUiVisibilityChange(int i5) {
                if (i5 == 0) {
                    try {
                        if (ok.this.f25095zb.isFinishing()) {
                            return;
                        }
                        ok.this.f25095zb.getWindow().getDecorView().postDelayed(new Runnable() { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.ok.2.1
                            @Override // java.lang.Runnable
                            public void run() {
                                dc.zb(ok.this.f25095zb);
                            }
                        }, 2500L);
                    } catch (Exception e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCHKEmWukohw==", "aes6lBG4T9KMRuRenhSlJnbvI5QEuXuD0g==", "VOAejBCobMq1Q+FUnxiiIVfnOYwgtGjJh08=", 242);
                        com.bytedance.sdk.component.utils.htf.sya("TTAD.RFSM", e3.getMessage());
                    }
                }
            }
        });
    }

    public ok(Activity activity, tn tnVar, int i5, boolean z11, com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar) {
        this.ycx = 0;
        this.f25095zb = activity;
        this.sya = tnVar;
        this.lud = z11;
        if (zbVar != null) {
            ycx(zbVar);
            i5 = zbVar.bba;
        }
        this.f25094dj = i5;
        try {
            this.ycx = dc.sya(activity, dc.ycx());
            if (!activity.getWindow().hasFeature(1)) {
                activity.requestWindowFeature(1);
            }
            activity.getWindow().addFlags(16777344);
            if (this.f25094dj != 2 && dc.dj(activity)) {
                return;
            }
            activity.getWindow().addFlags(1024);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCHKEmWukohw==", "aes6lBG4T9KMRuRenhSlJnbvI5QEuXs=", "B+cjnBfi", 68);
            Log.e("TTAD.RFSM", "init: ", th2);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int zb(Activity activity, int i5) {
        int i11 = activity.getResources().getConfiguration().orientation;
        View decorView = activity.getWindow().getDecorView();
        if (ycx(i5, i11)) {
            return Math.abs(dc.xkz(activity) - decorView.getWidth());
        }
        return Math.abs(dc.ry(activity) - decorView.getHeight());
    }

    public void ycx(tru truVar) {
        if (truVar == null) {
            return;
        }
        truVar.postDelayed(new Runnable() { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.ok.1
            @Override // java.lang.Runnable
            public void run() {
                View viewFindViewById;
                try {
                    View decorView = ok.this.f25095zb.getWindow().getDecorView();
                    if (decorView == null || (viewFindViewById = decorView.findViewById(16908335)) == null) {
                        return;
                    }
                    viewFindViewById.setVisibility(8);
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCHKEmWukohw==", "aes6lBG4T9KMRuRenhSlJnbvI5QEuXuD0Q==", "Sfsj", 93);
                }
            }
        }, 300L);
    }

    private void ycx(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar) {
        zbVar.f25183mp = zbVar.f25203zb.oq();
        zbVar.bba = ycx(zbVar.yzp, zbVar.f25203zb);
    }

    public static int ycx(Activity activity, tn tnVar) {
        if (26 == Build.VERSION.SDK_INT) {
            Resources resources = activity != null ? activity.getResources() : null;
            Configuration configuration = resources != null ? resources.getConfiguration() : null;
            return (configuration == null || configuration.orientation == 1) ? 1 : 2;
        }
        if (tnVar != null) {
            return tnVar.pvm();
        }
        return 1;
    }

    private static float[] zb(int i5, Activity activity, tn tnVar) {
        float[] fArrYcx = new float[2];
        if (activity != null && activity.getWindow() != null) {
            View decorView = activity.getWindow().getDecorView();
            int paddingLeft = decorView.getPaddingLeft();
            int paddingTop = decorView.getPaddingTop();
            boolean z11 = paddingLeft == 0 && paddingTop == 0;
            boolean z12 = com.bytedance.sdk.openadsdk.core.pmi.dj().sz() == 1;
            boolean zDj = dc.dj(activity);
            if (z11 && ((zDj || z12) && zb(activity, i5) == 0)) {
                int[] iArrZb = zb.zb(activity, decorView, i5, zDj, z12);
                int i11 = iArrZb[0];
                paddingTop = iArrZb[1];
                paddingLeft = i11;
            }
            decorView.getWidth();
            decorView.getHeight();
            int i12 = Build.VERSION.SDK_INT;
            if (i12 >= 35 && tnVar != null && tnVar.oq() == 100.0f) {
                fArrYcx[0] = decorView.getWidth() - paddingLeft;
                fArrYcx[1] = decorView.getHeight() - paddingTop;
            } else {
                fArrYcx[0] = decorView.getWidth() - (paddingLeft * 2);
                fArrYcx[1] = decorView.getHeight() - (paddingTop * 2);
            }
            fArrYcx[0] = dc.sya(activity, fArrYcx[0]);
            float fSya = dc.sya(activity, fArrYcx[1]);
            fArrYcx[1] = fSya;
            if (fArrYcx[0] < 10.0f || fSya < 10.0f) {
                fArrYcx = com.bytedance.sdk.openadsdk.core.jc.zb.ycx.ycx(activity, dc.sya(activity, dc.ycx()), i5);
            }
            if (i12 != 26 && i12 != 27) {
                if (activity.getResources() != null && activity.getResources().getConfiguration() != null) {
                    if ((activity.getResources().getConfiguration().orientation == 2 ? 2 : 1) != i5) {
                        if (i5 == 2) {
                            float f11 = fArrYcx[0];
                            float f12 = fArrYcx[1];
                            if (f11 < f12) {
                                fArrYcx[1] = f11;
                                fArrYcx[0] = f12;
                            }
                        } else {
                            float f13 = fArrYcx[0];
                            float f14 = fArrYcx[1];
                            if (f13 > f14) {
                                fArrYcx[1] = f13;
                                fArrYcx[0] = f14;
                            }
                        }
                    }
                }
                float f15 = fArrYcx[0];
                float f16 = fArrYcx[1];
                return fArrYcx;
            }
            float f17 = fArrYcx[0];
            float f18 = fArrYcx[1];
        }
        return fArrYcx;
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x00ab  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void ycx(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar, boolean z11) {
        float fMin;
        float fMax;
        int iMax;
        int i5;
        int iMax2 = 0;
        if (com.bytedance.sdk.openadsdk.core.jc.zb.ycx.zb(this.f25095zb)) {
            float[] fArrYcx = ycx(this.f25095zb, this.f25094dj, true);
            zbVar.f25191uf = (int) fArrYcx[0];
            zbVar.duz = (int) fArrYcx[1];
            return;
        }
        ycx();
        float fSya = sya();
        float fDj = dj();
        if (this.f25094dj == 2) {
            fMin = Math.max(fSya, fDj);
            fMax = Math.min(fSya, fDj);
        } else {
            fMin = Math.min(fSya, fDj);
            fMax = Math.max(fSya, fDj);
        }
        int iSya = dc.sya(this.f25095zb, dc.ycx());
        if (this.f25094dj != 2) {
            if (dc.dj(this.f25095zb)) {
                fMax -= iSya;
            }
        } else if (dc.dj(this.f25095zb)) {
            fMin -= iSya;
        }
        if (z11) {
            zbVar.f25191uf = (int) fMin;
            zbVar.duz = (int) fMax;
            return;
        }
        int i11 = 20;
        if (this.f25094dj != 2) {
            float f11 = zbVar.f25183mp;
            if (f11 == 0.0f || f11 == 100.0f) {
                iMax = 0;
                i5 = 0;
                i11 = 0;
            } else {
                iMax = (int) Math.max((fMax - (((fMin - 20.0f) - 20.0f) / f11)) / 2.0f, 0.0f);
                i5 = iMax;
                iMax2 = 20;
            }
        } else {
            float f12 = zbVar.f25183mp;
            if (f12 != 0.0f && f12 != 100.0f) {
                iMax2 = (int) Math.max((fMin - (((fMax - 20.0f) - 20.0f) * f12)) / 2.0f, 0.0f);
                iMax = 20;
                i5 = 20;
                i11 = iMax2;
            }
        }
        float f13 = iMax2;
        float f14 = i11;
        zbVar.f25191uf = (int) ((fMin - f13) - f14);
        float f15 = iMax;
        float f16 = i5;
        zbVar.duz = (int) ((fMax - f15) - f16);
        com.bytedance.sdk.openadsdk.activity.single.fby fbyVar = zbVar.f25196uu;
        if (fbyVar == null || fbyVar.f24555jc == 0) {
            this.f25095zb.getWindow().getDecorView().setPadding(dc.zb(this.f25095zb, f13), dc.zb(this.f25095zb, f15), dc.zb(this.f25095zb, f14), dc.zb(this.f25095zb, f16));
        }
    }

    public void ycx() {
        uh.ycx(this.f25095zb, this.f25094dj, this.lud, 1);
    }

    public float[] ycx(int i5) {
        if (com.bytedance.sdk.openadsdk.core.jc.zb.ycx.zb(this.f25095zb)) {
            return ycx(this.f25095zb, i5, true);
        }
        return ycx(i5, this.f25095zb, this.sya);
    }

    public static float[] ycx(int i5, Activity activity, tn tnVar) {
        return zb(i5, activity, tnVar);
    }

    public static float[] ycx(Activity activity, int i5, boolean z11) {
        float[] fArr = {0.0f, 0.0f};
        if (activity != null && activity.getWindow() != null) {
            View decorView = activity.getWindow().getDecorView();
            int width = decorView.getWidth();
            int height = decorView.getHeight();
            boolean z12 = com.bytedance.sdk.openadsdk.core.pmi.dj().sz() == 1;
            boolean zDj = dc.dj(activity);
            int iYcx = (int) dc.ycx();
            boolean z13 = i5 == 1 || zDj || z12;
            if (width < 10 || height < 10) {
                Point pointZb = dc.zb((Context) activity);
                width = pointZb.x;
                height = pointZb.y;
            }
            int iMin = Math.min(width, height);
            if (z13) {
                iMin = Math.max(iMin - iYcx, 0);
            }
            if (z11) {
                float f11 = iMin;
                fArr[0] = dc.sya(activity, f11);
                fArr[1] = dc.sya(activity, f11);
            } else {
                float f12 = iMin;
                fArr[0] = f12;
                fArr[1] = f12;
            }
        }
        return fArr;
    }
}

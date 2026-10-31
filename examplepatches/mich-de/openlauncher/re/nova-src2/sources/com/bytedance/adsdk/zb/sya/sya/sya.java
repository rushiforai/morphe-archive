package com.bytedance.adsdk.zb.sya.sya;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.text.TextUtils;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.bytedance.adsdk.zb.htf;
import com.bytedance.adsdk.zb.jc;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class sya extends dj {

    /* renamed from: ea, reason: collision with root package name */
    private final List<TextView> f22994ea;
    private LinearLayout fby;

    /* renamed from: jc, reason: collision with root package name */
    private final List<String> f22995jc;

    /* renamed from: jw, reason: collision with root package name */
    private final LinearLayout.LayoutParams f22996jw;

    /* renamed from: ok, reason: collision with root package name */
    private String f22997ok;

    public sya(com.bytedance.adsdk.zb.jw jwVar, lud ludVar, Context context) {
        List<jc.ycx> listSya;
        super(jwVar, ludVar);
        this.f22996jw = new LinearLayout.LayoutParams(-2, -2);
        this.f22995jc = new ArrayList();
        this.f22994ea = new ArrayList();
        com.bytedance.adsdk.zb.jc jcVar = ((dj) this).f22953ul;
        if (jcVar == null || (listSya = jcVar.sya()) == null || listSya.size() <= 0) {
            return;
        }
        LinearLayout linearLayout = new LinearLayout(context);
        this.fby = linearLayout;
        int i5 = 0;
        linearLayout.setOrientation(0);
        zb(listSya.get(0).f22853ul);
        LinearLayout linearLayout2 = new LinearLayout(context);
        linearLayout2.setOrientation(0);
        linearLayout2.setGravity(80);
        this.fby.addView(linearLayout2);
        List<String> listOk = ok();
        while (i5 < listSya.size()) {
            jc.ycx ycxVar = listSya.get(i5);
            TextView textView = new TextView(context);
            ycx(textView, ycxVar, (listOk == null || i5 >= listOk.size()) ? b.f42142b : listOk.get(i5));
            int i11 = ycxVar.f22852lt;
            if (i11 != 0) {
                this.f22996jw.bottomMargin = (int) (com.bytedance.adsdk.zb.lt.lt.ycx() * i11);
                linearLayout2.addView(textView, this.f22996jw);
            } else {
                linearLayout2.addView(textView);
            }
            i5++;
        }
        float fYcx = com.bytedance.adsdk.zb.lt.lt.ycx();
        ycx(this.fby, (int) (((dj) this).f22953ul.ycx() * fYcx), (int) (((dj) this).f22953ul.zb() * fYcx));
    }

    private List<String> ok() {
        com.bytedance.adsdk.zb.jw jwVar;
        htf htfVarDv;
        List<jc.ycx> listSya;
        if (((dj) this).f22953ul == null || (jwVar = this.f23013zb) == null || (htfVarDv = jwVar.dv()) == null) {
            return null;
        }
        String strDj = ((dj) this).f22953ul.dj();
        if ((!TextUtils.isEmpty(strDj) || !TextUtils.isEmpty(this.f22997ok)) && (listSya = ((dj) this).f22953ul.sya()) != null) {
            String strYcx = this.f22997ok;
            if (TextUtils.isEmpty(strYcx)) {
                strYcx = htfVarDv.ycx(strDj);
            }
            if (!TextUtils.isEmpty(strYcx)) {
                int length = strYcx.length();
                this.f22995jc.clear();
                for (int i5 = 0; i5 < listSya.size(); i5++) {
                    jc.ycx ycxVar = listSya.get(i5);
                    int iMax = ycxVar.ycx;
                    int iMax2 = ycxVar.f22854zb;
                    if (iMax < 0) {
                        iMax = Math.max(iMax + length, 0);
                    }
                    if (iMax2 < 0) {
                        iMax2 = Math.max(iMax2 + length, 0);
                    }
                    if (iMax + iMax2 > length) {
                        this.f22995jc.add(b.f42142b);
                    } else {
                        if (listSya.size() == 1 && iMax == 0 && iMax2 == 0) {
                            iMax2 = length;
                        }
                        this.f22995jc.add(strYcx.substring(iMax, iMax2 + iMax));
                    }
                }
                return this.f22995jc;
            }
        }
        return null;
    }

    private void sya(float f11) {
        List<jc.ycx> listSya;
        com.bytedance.adsdk.zb.jc jcVar = ((dj) this).f22953ul;
        if (jcVar == null || (listSya = jcVar.sya()) == null || listSya.size() <= 0) {
            return;
        }
        this.fby.setOrientation(0);
        this.fby.setGravity(17);
        if (this.fby.getChildCount() <= 0) {
            return;
        }
        LinearLayout linearLayout = (LinearLayout) this.fby.getChildAt(0);
        linearLayout.setOrientation(0);
        linearLayout.setGravity(80);
        this.fby.removeAllViews();
        if (linearLayout.getChildCount() != listSya.size()) {
            return;
        }
        List<String> listOk = ok();
        this.f22994ea.clear();
        int i5 = 0;
        while (i5 < listSya.size()) {
            jc.ycx ycxVar = listSya.get(i5);
            TextView textView = (TextView) linearLayout.getChildAt(i5);
            this.f22994ea.add(textView);
            ycx(textView, ycxVar, (listOk == null || i5 >= listOk.size()) ? b.f42142b : listOk.get(i5));
            i5++;
        }
        linearLayout.removeAllViews();
        for (int i11 = 0; i11 < listSya.size(); i11++) {
            jc.ycx ycxVar2 = listSya.get(i11);
            TextView textView2 = this.f22994ea.get(i11);
            textView2.setAlpha(f11);
            linearLayout.setAlpha(f11);
            int i12 = ycxVar2.f22852lt;
            if (i12 != 0) {
                this.f22996jw.bottomMargin = (int) (com.bytedance.adsdk.zb.lt.lt.ycx() * i12);
                linearLayout.addView(textView2, this.f22996jw);
            } else {
                linearLayout.addView(textView2);
            }
        }
        this.fby.setAlpha(f11);
        this.fby.addView(linearLayout);
        float fYcx = com.bytedance.adsdk.zb.lt.lt.ycx();
        ycx(this.fby, (int) (((dj) this).f22953ul.ycx() * fYcx), (int) (((dj) this).f22953ul.zb() * fYcx));
    }

    private void ycx(TextView textView, jc.ycx ycxVar, String str) {
        if (TextUtils.isEmpty(str)) {
            textView.setText(b.f42142b);
        } else {
            textView.setText(str);
        }
        if (!TextUtils.isEmpty(ycxVar.sya)) {
            textView.setTextColor(Color.parseColor(ycxVar.sya));
        }
        if (!TextUtils.isEmpty(ycxVar.f22851dj)) {
            textView.setBackgroundColor(Color.parseColor(ycxVar.f22851dj));
        }
        textView.setGravity(17);
        textView.setTextSize(ycxVar.lud);
    }

    private void zb(String str) {
        if (TextUtils.isEmpty(str)) {
            this.fby.setGravity(17);
            return;
        }
        str.getClass();
        if (str.equals("left")) {
            this.fby.setGravity(3);
        } else if (str.equals("right")) {
            this.fby.setGravity(5);
        } else {
            this.fby.setGravity(17);
        }
    }

    @Override // com.bytedance.adsdk.zb.sya.sya.dj, com.bytedance.adsdk.zb.sya.sya.ycx
    public void zb(Canvas canvas, Matrix matrix, int i5) {
        if (this.fby != null) {
            canvas.save();
            canvas.concat(matrix);
            ycx(i5);
            sya(lt());
            this.fby.draw(canvas);
            canvas.restore();
            return;
        }
        super.zb(canvas, matrix, i5);
    }

    private static void ycx(View view, int i5, int i11) {
        view.layout(0, 0, i5, i11);
        view.measure(View.MeasureSpec.makeMeasureSpec(i5, 1073741824), View.MeasureSpec.makeMeasureSpec(i11, 1073741824));
        view.layout(0, 0, view.getMeasuredWidth(), view.getMeasuredHeight());
    }

    public void ycx(String str) {
        this.f22997ok = str;
    }
}

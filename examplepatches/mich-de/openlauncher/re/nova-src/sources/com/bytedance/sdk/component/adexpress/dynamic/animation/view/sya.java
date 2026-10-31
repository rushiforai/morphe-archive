package com.bytedance.sdk.component.adexpress.dynamic.animation.view;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Region;
import android.graphics.Shader;
import android.view.View;
import android.view.ViewGroup;
import com.bytedance.sdk.component.adexpress.dynamic.dj.ul;
import com.bytedance.sdk.component.adexpress.dynamic.dynamicview.ea;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes2.dex */
public class sya {

    /* renamed from: dj, reason: collision with root package name */
    private int f23283dj;

    /* renamed from: lt, reason: collision with root package name */
    private int f23284lt;
    private int lud;
    Paint ycx;

    /* renamed from: zb, reason: collision with root package name */
    Path f23285zb = new Path();
    Path sya = new Path();

    public sya() {
        Paint paint = new Paint();
        this.ycx = paint;
        paint.setAntiAlias(true);
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0048  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0059  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0154  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x015e  */
    /* JADX WARN: Removed duplicated region for block: B:57:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void ycx(Canvas canvas, IAnimation iAnimation, View view) {
        float f11;
        int iIntValue;
        int iIntValue2;
        float[] fArrZb;
        String str;
        if (iAnimation.getRippleValue() != 0.0f) {
            if (com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya() != null) {
                String str2 = b.f42142b;
                try {
                    str = (String) view.getTag(2097610712);
                } catch (Exception e3) {
                    e = e3;
                }
                try {
                    fArrZb = ul.zb(str);
                } catch (Exception e11) {
                    e = e11;
                    str2 = str;
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6EmUuMsgQqzZ4mWQ9JK", "euAkmAKoYMiOfcVcnAGlOg==", "VOAJhwKr", 42);
                    fArrZb = null;
                    str = str2;
                    if (!str.startsWith("#")) {
                    }
                    ((ViewGroup) view.getParent()).setClipChildren(true);
                    canvas.drawCircle(this.f23283dj, this.lud, iAnimation.getRippleValue() * Math.min(r0, r5) * 2, this.ycx);
                    if (iAnimation.getShineValue() == 0.0f) {
                    }
                    if (iAnimation.getMarqueeValue() == 0.0f) {
                    }
                }
                if (!str.startsWith("#")) {
                    this.ycx.setColor(Color.parseColor(str));
                    this.ycx.setAlpha(90);
                } else if (fArrZb != null) {
                    this.ycx.setColor(com.bytedance.sdk.component.adexpress.dj.ul.ycx((1.0f - iAnimation.getRippleValue()) * fArrZb[3], fArrZb[0] / 256.0f, fArrZb[1] / 256.0f, fArrZb[2] / 256.0f));
                }
            }
            ((ViewGroup) view.getParent()).setClipChildren(true);
            canvas.drawCircle(this.f23283dj, this.lud, iAnimation.getRippleValue() * Math.min(r0, r5) * 2, this.ycx);
        }
        if (iAnimation.getShineValue() == 0.0f) {
            f11 = 1.0f;
        } else {
            if (view.getParent() != null) {
                ((ViewGroup) view.getParent()).setClipChildren(true);
            }
            if (view.getParent().getParent() != null) {
                ((ViewGroup) view.getParent().getParent()).setClipChildren(true);
            }
            this.f23285zb.reset();
            try {
                iIntValue2 = ((Integer) view.getTag(2097610711)).intValue();
            } catch (Exception e12) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e12, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6EmUuMsgQqzZ4mWQ9JK", "euAkmAKoYMiOfcVcnAGlOg==", "VOAJhwKr", 67);
                iIntValue2 = 0;
            }
            if (iIntValue2 >= 0) {
                int shineValue = ((int) (iAnimation.getShineValue() * ((this.lud * 2) + ((iIntValue2 * 2) + (this.f23283dj * 4))))) - ((this.lud * 2) + iIntValue2);
                float f12 = shineValue;
                int i5 = this.lud;
                f11 = 1.0f;
                this.ycx.setShader(new LinearGradient(f12, 0.0f, ((iIntValue2 + i5) / 2) + shineValue, i5 / 2, new int[]{Color.parseColor("#20ffffff"), Color.parseColor("#60ffffff"), Color.parseColor("#65ffffff")}, (float[]) null, Shader.TileMode.MIRROR));
                this.ycx.setStrokeWidth(this.f23283dj * 2);
                Path path = this.sya;
                if (path != null) {
                    canvas.clipPath(path, Region.Op.INTERSECT);
                }
                int i11 = shineValue + iIntValue2;
                canvas.drawLine(f12, 0.0f, i11 + r0, this.lud, this.ycx);
            }
        }
        if (iAnimation.getMarqueeValue() == 0.0f) {
            try {
                iIntValue = ((Integer) view.getTag(2097610709)).intValue();
            } catch (Exception e13) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e13, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6EmUuMsgQqzZ4mWQ9JK", "euAkmAKoYMiOfcVcnAGlOg==", "VOAJhwKr", 89);
                iIntValue = 0;
            }
            if (iIntValue >= 0) {
                this.f23285zb.reset();
                this.f23285zb.moveTo(0.0f, 0.0f);
                this.f23285zb.lineTo(this.f23283dj * 2, 0.0f);
                this.f23285zb.lineTo(this.f23283dj * 2, this.lud * 2);
                this.f23285zb.lineTo(0.0f, this.lud * 2);
                this.f23285zb.lineTo(0.0f, 0.0f);
                this.ycx.setShader(new LinearGradient(0.0f, 0.0f, this.f23283dj * 2, this.lud * 2, new int[]{(int) (iAnimation.getMarqueeValue() * (-65536.0f)), (int) ((f11 - iAnimation.getMarqueeValue()) * (-65536.0f))}, (float[]) null, Shader.TileMode.CLAMP));
                this.ycx.setColor(-65536);
                this.ycx.setStyle(Paint.Style.STROKE);
                this.ycx.setStrokeWidth(iIntValue);
                canvas.drawPath(this.f23285zb, this.ycx);
            }
        }
    }

    public void ycx(View view, float f11) {
        ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
        layoutParams.width = (int) (this.f23284lt * f11);
        view.setTranslationX((r1 - r6) / 2);
        if (view instanceof ea) {
            int i5 = 0;
            while (true) {
                ViewGroup viewGroup = (ViewGroup) view;
                if (i5 >= viewGroup.getChildCount()) {
                    break;
                }
                viewGroup.getChildAt(i5).setTranslationX((-(this.f23284lt - layoutParams.width)) / 2);
                i5++;
            }
        }
        view.setLayoutParams(layoutParams);
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0064  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void ycx(View view, int i5, int i11) {
        String str;
        this.f23283dj = i5 / 2;
        this.lud = i11 / 2;
        String str2 = b.f42142b;
        if (this.f23284lt == 0 && view.getLayoutParams().width > 0) {
            this.f23284lt = view.getLayoutParams().width;
        }
        try {
            str = (String) view.getTag(2097610710);
        } catch (Exception e3) {
            e = e3;
        }
        try {
            this.sya.addRoundRect(new RectF(0.0f, 0.0f, i5, i11), i11 / 2, i11 / 2, Path.Direction.CW);
        } catch (Exception e11) {
            e = e11;
            str2 = str;
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6EmUuMsgQqzZ4mWQ9JK", "euAkmAKoYMiOfcVcnAGlOg==", "VOAenBm5Ss+BRNBYiA==", Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE);
            str = str2;
            if (!"right".equals(str)) {
            }
        }
        if (!"right".equals(str)) {
            view.setPivotX(this.f23283dj * 2);
            view.setPivotY(this.lud);
        } else if ("left".equals(str)) {
            view.setPivotX(0.0f);
            view.setPivotY(this.lud);
        } else {
            view.setPivotX(this.f23283dj);
            view.setPivotY(this.lud);
        }
    }
}

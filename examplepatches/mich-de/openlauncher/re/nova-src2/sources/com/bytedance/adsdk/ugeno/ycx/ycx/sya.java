package com.bytedance.adsdk.ugeno.ycx.ycx;

import android.animation.PropertyValuesHolder;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Shader;
import android.util.Log;
import android.view.View;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class sya extends ycx {

    /* renamed from: dj, reason: collision with root package name */
    private float f22573dj;

    /* renamed from: ea, reason: collision with root package name */
    private Matrix f22574ea;
    private Paint fby;

    /* renamed from: jc, reason: collision with root package name */
    private LinearGradient f22575jc;

    /* renamed from: jw, reason: collision with root package name */
    private PorterDuffXfermode f22576jw;

    /* renamed from: lt, reason: collision with root package name */
    private View f22577lt;
    private float lud;
    private String sya;

    /* renamed from: ul, reason: collision with root package name */
    private Paint f22578ul;

    public sya(com.bytedance.adsdk.ugeno.zb.sya syaVar, JSONObject jSONObject) {
        super(syaVar, jSONObject);
        this.f22577lt = this.f22579zb.ea();
        Paint paint = new Paint();
        this.f22578ul = paint;
        paint.setAntiAlias(true);
        this.f22577lt.setLayerType(2, null);
        this.f22576jw = new PorterDuffXfermode(PorterDuff.Mode.CLEAR);
        this.fby = new Paint();
        this.f22574ea = new Matrix();
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    private void sya(Canvas canvas) {
        try {
            if (this.f22579zb.bba() <= 0.0f) {
                this.f22578ul.setXfermode(this.f22576jw);
                canvas.drawRect(0.0f, 0.0f, this.f22573dj, this.lud, this.f22578ul);
                return;
            }
            int iBba = (int) (this.f22573dj * this.f22579zb.bba());
            int iBba2 = (int) (this.lud * this.f22579zb.bba());
            this.f22578ul.setXfermode(this.f22576jw);
            String str = this.sya;
            switch (str.hashCode()) {
                case -1383228885:
                    if (str.equals("bottom")) {
                        float f11 = iBba2;
                        canvas.drawRect(0.0f, f11, this.f22573dj, this.lud, this.f22578ul);
                        this.f22574ea.setTranslate(0.0f, f11);
                        this.f22575jc.setLocalMatrix(this.f22574ea);
                        this.fby.setShader(this.f22575jc);
                        if (this.f22579zb.bba() <= 1.0f && this.f22579zb.bba() > 0.9f) {
                            this.fby.setAlpha((int) (255.0f - (this.f22579zb.bba() * 255.0f)));
                        }
                        canvas.drawRect(0.0f, 0.0f, this.f22573dj, f11, this.fby);
                        break;
                    }
                    break;
                case 115029:
                    if (str.equals("top")) {
                        float f12 = iBba2;
                        canvas.drawRect(0.0f, 0.0f, this.f22573dj, this.lud - f12, this.f22578ul);
                        this.f22574ea.setTranslate(0.0f, this.lud - f12);
                        this.f22575jc.setLocalMatrix(this.f22574ea);
                        this.fby.setShader(this.f22575jc);
                        if (this.f22579zb.bba() <= 1.0f && this.f22579zb.bba() > 0.9f) {
                            this.fby.setAlpha((int) (255.0f - (this.f22579zb.bba() * 255.0f)));
                        }
                        float f13 = this.f22573dj;
                        float f14 = this.lud;
                        canvas.drawRect(f13, f14, 0.0f, f14 - f12, this.fby);
                        break;
                    }
                    break;
                case 3317767:
                    if (str.equals("left")) {
                        float f15 = iBba;
                        canvas.drawRect(0.0f, 0.0f, this.f22573dj - f15, this.lud, this.f22578ul);
                        this.f22574ea.setTranslate(this.f22573dj - f15, 0.0f);
                        this.f22575jc.setLocalMatrix(this.f22574ea);
                        this.fby.setShader(this.f22575jc);
                        if (this.f22579zb.bba() <= 1.0f && this.f22579zb.bba() > 0.9f) {
                            this.fby.setAlpha((int) (255.0f - (this.f22579zb.bba() * 255.0f)));
                        }
                        float f16 = this.f22573dj;
                        canvas.drawRect(f16, this.lud, f16 - f15, 0.0f, this.fby);
                        break;
                    }
                    break;
                case 108511772:
                    if (str.equals("right")) {
                        float f17 = iBba;
                        canvas.drawRect(f17, 0.0f, this.f22573dj, this.lud, this.f22578ul);
                        this.f22574ea.setTranslate(f17, this.lud);
                        this.f22575jc.setLocalMatrix(this.f22574ea);
                        this.fby.setShader(this.f22575jc);
                        if (this.f22579zb.bba() <= 1.0f && this.f22579zb.bba() > 0.9f) {
                            this.fby.setAlpha((int) (255.0f - (this.f22579zb.bba() * 255.0f)));
                        }
                        canvas.drawRect(0.0f, 0.0f, f17, this.lud, this.fby);
                        break;
                    }
                    break;
            }
        } catch (Throwable th2) {
            Log.e("BaseEffectWrapper", th2.getMessage());
        }
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ycx.ycx
    public void ycx(Canvas canvas) {
        sya(canvas);
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ycx.ycx
    public void zb() {
        this.sya = this.ycx.optString("direction", "left");
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ycx.ycx
    public void ycx(int i5, int i11) {
        this.f22573dj = i5;
        this.lud = i11;
        String str = this.sya;
        str.getClass();
        switch (str) {
            case "bottom":
                this.f22575jc = new LinearGradient(0.0f, -this.lud, 0.0f, 0.0f, 0, -1, Shader.TileMode.CLAMP);
                break;
            case "top":
                this.f22575jc = new LinearGradient(0.0f, this.lud, 0.0f, 0.0f, 0, -1, Shader.TileMode.CLAMP);
                break;
            case "left":
                this.f22575jc = new LinearGradient(this.f22573dj, 0.0f, 0.0f, 0.0f, 0, -1, Shader.TileMode.CLAMP);
                break;
            case "right":
                this.f22575jc = new LinearGradient(-this.f22573dj, 0.0f, 0.0f, this.lud, 0, -1, Shader.TileMode.CLAMP);
                break;
        }
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ycx.ycx
    public void zb(Canvas canvas) {
        sya(canvas);
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ycx.ycx
    public List<PropertyValuesHolder> sya() {
        ArrayList arrayList = new ArrayList();
        arrayList.add(PropertyValuesHolder.ofFloat("rubIn", 0.0f, 1.0f));
        arrayList.add(PropertyValuesHolder.ofFloat(com.bytedance.adsdk.ugeno.ycx.lud.ALPHA.zb(), 0.0f, 1.0f));
        return arrayList;
    }
}

package com.bytedance.adsdk.ugeno.ycx.ycx;

import android.animation.PropertyValuesHolder;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lud extends ycx {

    /* renamed from: dj, reason: collision with root package name */
    private float f22565dj;

    /* renamed from: ea, reason: collision with root package name */
    private Path f22566ea;
    private boolean fby;

    /* renamed from: jc, reason: collision with root package name */
    private Path f22567jc;

    /* renamed from: jw, reason: collision with root package name */
    private boolean f22568jw;

    /* renamed from: lt, reason: collision with root package name */
    private float f22569lt;
    private Paint lud;

    /* renamed from: ok, reason: collision with root package name */
    private Path f22570ok;

    /* renamed from: ry, reason: collision with root package name */
    private PorterDuffXfermode f22571ry;
    private float sya;

    /* renamed from: ul, reason: collision with root package name */
    private String f22572ul;

    public lud(com.bytedance.adsdk.ugeno.zb.sya syaVar, JSONObject jSONObject) {
        super(syaVar, jSONObject);
        this.fby = true;
        this.f22568jw = true;
        Paint paint = new Paint();
        this.lud = paint;
        paint.setAntiAlias(true);
        this.f22579zb.ea().setLayerType(2, null);
        this.f22571ry = new PorterDuffXfermode(PorterDuff.Mode.CLEAR);
        this.f22567jc = new Path();
        this.f22566ea = new Path();
        this.f22570ok = new Path();
        this.lud.setXfermode(this.f22571ry);
    }

    private void sya(Canvas canvas) {
        int iZr;
        int iZr2;
        if (this.f22579zb.zr() <= 0.0f) {
            this.lud.setXfermode(this.f22571ry);
            canvas.drawRect(0.0f, 0.0f, this.sya, this.f22565dj, this.lud);
            return;
        }
        iZr = (int) (this.f22579zb.zr() * this.sya);
        iZr2 = (int) (this.f22579zb.zr() * this.f22565dj);
        this.lud.setXfermode(this.f22571ry);
        String str = this.f22572ul;
        str.getClass();
        switch (str) {
            case "bottom":
                canvas.drawRect(0.0f, iZr2, this.sya, this.f22565dj, this.lud);
                break;
            case "center":
                this.f22567jc.reset();
                this.f22566ea.reset();
                this.f22570ok.reset();
                Path.Direction direction = Path.Direction.CW;
                this.f22567jc.addCircle(this.sya / 2.0f, this.f22565dj / 2.0f, iZr, direction);
                Path path = this.f22566ea;
                float f11 = this.sya;
                path.addRect(f11 / 2.0f, 0.0f, f11, this.f22565dj, direction);
                Path path2 = this.f22566ea;
                Path path3 = this.f22567jc;
                Path.Op op2 = Path.Op.DIFFERENCE;
                path2.op(path3, op2);
                this.f22570ok.addRect(0.0f, 0.0f, this.sya / 2.0f, this.f22565dj, direction);
                this.f22570ok.op(this.f22567jc, op2);
                canvas.drawPath(this.f22566ea, this.lud);
                canvas.drawPath(this.f22570ok, this.lud);
                break;
            case "top":
                canvas.drawRect(0.0f, 0.0f, this.sya, this.f22565dj - iZr2, this.lud);
                break;
            case "left":
                canvas.drawRect(0.0f, 0.0f, this.sya - iZr, this.f22565dj, this.lud);
                break;
            case "right":
                canvas.drawRect(iZr, 0.0f, this.sya, this.f22565dj, this.lud);
                break;
        }
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ycx.ycx
    public void ycx(Canvas canvas) {
        sya(canvas);
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ycx.ycx
    public void zb() {
        this.f22569lt = (float) this.ycx.optDouble("start", 0.0d);
        this.f22572ul = this.ycx.optString("direction", "center");
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ycx.ycx
    public void ycx(int i5, int i11) {
        if (i5 > 0 && this.fby) {
            this.sya = i5;
            this.fby = false;
        }
        if (i11 <= 0 || !this.f22568jw) {
            return;
        }
        this.f22565dj = i11;
        this.f22568jw = false;
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ycx.ycx
    public void zb(Canvas canvas) {
        sya(canvas);
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ycx.ycx
    public List<PropertyValuesHolder> sya() {
        PropertyValuesHolder propertyValuesHolderOfFloat = PropertyValuesHolder.ofFloat(dj(), this.f22569lt, 1.0f);
        ArrayList arrayList = new ArrayList();
        arrayList.add(propertyValuesHolderOfFloat);
        return arrayList;
    }
}

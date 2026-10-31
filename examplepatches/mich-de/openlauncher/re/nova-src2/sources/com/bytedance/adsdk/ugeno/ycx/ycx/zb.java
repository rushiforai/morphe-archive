package com.bytedance.adsdk.ugeno.ycx.ycx;

import android.animation.PropertyValuesHolder;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class zb extends ycx {

    /* renamed from: dj, reason: collision with root package name */
    private int f22580dj;

    /* renamed from: lt, reason: collision with root package name */
    private Paint f22581lt;
    private int lud;
    private int sya;

    public zb(com.bytedance.adsdk.ugeno.zb.sya syaVar, JSONObject jSONObject) {
        super(syaVar, jSONObject);
        Paint paint = new Paint();
        this.f22581lt = paint;
        paint.setAntiAlias(true);
    }

    private void sya(Canvas canvas) {
        try {
            if (this.f22579zb.xym() > 0.0f) {
                this.f22581lt.setColor(this.sya);
                this.f22581lt.setAlpha((int) ((1.0f - this.f22579zb.xym()) * 255.0f));
                ((ViewGroup) this.f22579zb.ea().getParent()).setClipChildren(true);
                canvas.drawCircle(this.f22580dj, this.lud, Math.min(r0, r2) * 2 * this.f22579zb.xym(), this.f22581lt);
            }
        } catch (Throwable th2) {
            th2.getMessage();
        }
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ycx.ycx
    public void ycx(Canvas canvas) {
        sya(canvas);
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ycx.ycx
    public void zb() {
        this.sya = com.bytedance.adsdk.ugeno.fby.ycx.ycx(this.ycx.optString("backgroundColor"), -1);
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ycx.ycx
    public void ycx(int i5, int i11) {
        this.f22580dj = i5 / 2;
        this.lud = i11 / 2;
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ycx.ycx
    public void zb(Canvas canvas) {
        sya(canvas);
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ycx.ycx
    public List<PropertyValuesHolder> sya() {
        PropertyValuesHolder propertyValuesHolderOfFloat = PropertyValuesHolder.ofFloat(dj(), 0.0f, 1.0f);
        ArrayList arrayList = new ArrayList();
        arrayList.add(propertyValuesHolderOfFloat);
        return arrayList;
    }
}

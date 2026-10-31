package com.bytedance.adsdk.ugeno.ycx.ycx;

import android.animation.PropertyValuesHolder;
import android.annotation.SuppressLint;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Region;
import android.graphics.Shader;
import android.text.TextUtils;
import com.bytedance.adsdk.ugeno.fby.fby;
import com.bytedance.adsdk.ugeno.fby.ycx;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class dj extends ycx {

    /* renamed from: dy, reason: collision with root package name */
    private static final float f22556dy;
    private static final float syc;
    private static final float wie;
    private static final float xkz;

    /* renamed from: dj, reason: collision with root package name */
    private Paint f22557dj;

    /* renamed from: ea, reason: collision with root package name */
    private int f22558ea;
    private int fby;

    /* renamed from: jc, reason: collision with root package name */
    private int f22559jc;

    /* renamed from: jw, reason: collision with root package name */
    private float f22560jw;

    /* renamed from: lt, reason: collision with root package name */
    private ycx.C0015ycx f22561lt;
    private Path lud;

    /* renamed from: ok, reason: collision with root package name */
    private boolean f22562ok;
    private float pmi;

    /* renamed from: ry, reason: collision with root package name */
    private Path f22563ry;
    private int sya;

    /* renamed from: ul, reason: collision with root package name */
    private int f22564ul;

    static {
        float radians = (float) Math.toRadians(30.0d);
        xkz = radians;
        syc = (float) Math.tan(radians);
        f22556dy = (float) Math.cos(radians);
        wie = (float) Math.sin(radians);
    }

    public dj(com.bytedance.adsdk.ugeno.zb.sya syaVar, JSONObject jSONObject) {
        super(syaVar, jSONObject);
        this.f22562ok = true;
        Paint paint = new Paint();
        this.f22557dj = paint;
        paint.setAntiAlias(true);
        this.lud = new Path();
        this.f22560jw = this.f22579zb.tn();
        this.f22563ry = new Path();
    }

    private void sya(Canvas canvas) {
        LinearGradient linearGradient;
        try {
            if (this.f22579zb.rl() > 0.0f) {
                int i5 = this.f22559jc;
                float f11 = syc;
                float fRl = ((i5 * f11) + i5) * this.f22579zb.rl();
                this.f22563ry.reset();
                this.f22563ry.moveTo(fRl, 0.0f);
                int i11 = this.f22558ea;
                float f12 = fRl - (i11 * f11);
                this.f22563ry.lineTo(f12, i11);
                this.f22563ry.lineTo(f12 + this.sya, this.f22558ea);
                this.f22563ry.lineTo(this.sya + fRl, 0.0f);
                this.f22563ry.close();
                float f13 = this.pmi;
                float f14 = f22556dy * f13;
                float f15 = f13 * wie;
                if (!this.f22562ok || this.f22561lt == null) {
                    int i12 = this.fby;
                    linearGradient = new LinearGradient(fRl, 0.0f, fRl + f14, f15, new int[]{i12, this.f22564ul, i12}, (float[]) null, Shader.TileMode.CLAMP);
                } else {
                    linearGradient = new LinearGradient(fRl, 0.0f, fRl + f14, f15, this.f22561lt.f22286zb, (float[]) null, Shader.TileMode.CLAMP);
                }
                this.f22557dj.setShader(linearGradient);
                Path path = this.lud;
                if (path != null) {
                    canvas.clipPath(path, Region.Op.INTERSECT);
                }
                canvas.drawPath(this.f22563ry, this.f22557dj);
            }
        } catch (Throwable unused) {
        }
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ycx.ycx
    @SuppressLint({"DrawAllocation"})
    public void ycx(Canvas canvas) {
        sya(canvas);
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ycx.ycx
    public void zb() {
        this.sya = (int) fby.ycx(this.f22579zb.ea().getContext(), this.ycx.optInt("shineWidth", 30));
        String strOptString = this.ycx.optString("backgroundColor", "linear-gradient(90deg, rgba(255, 255, 255, 0), rgba(255, 255, 255, 0.25) 30%, rgba(255, 255, 255, 0.3) 50%, rgba(255, 255, 255, 0.25) 70%, rgba(255, 255, 255, 0))");
        String str = TextUtils.isEmpty(strOptString) ? "linear-gradient(90deg, rgba(255, 255, 255, 0), rgba(255, 255, 255, 0.25) 30%, rgba(255, 255, 255, 0.3) 50%, rgba(255, 255, 255, 0.25) 70%, rgba(255, 255, 255, 0))" : strOptString;
        if (str.startsWith("linear")) {
            this.f22561lt = com.bytedance.adsdk.ugeno.fby.ycx.zb(str);
        } else {
            int iYcx = com.bytedance.adsdk.ugeno.fby.ycx.ycx(str);
            this.f22564ul = iYcx;
            this.fby = com.bytedance.adsdk.ugeno.fby.ycx.ycx(iYcx, 32);
            this.f22562ok = false;
        }
        this.pmi = f22556dy * this.sya;
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ycx.ycx
    public void ycx(int i5, int i11) {
        this.f22559jc = i5;
        this.f22558ea = i11;
        try {
            RectF rectF = new RectF(0.0f, 0.0f, i5, i11);
            Path path = this.lud;
            float f11 = this.f22560jw;
            path.addRoundRect(rectF, f11, f11, Path.Direction.CW);
        } catch (Throwable unused) {
        }
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

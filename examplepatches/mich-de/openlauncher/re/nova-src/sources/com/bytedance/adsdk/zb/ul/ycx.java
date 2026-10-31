package com.bytedance.adsdk.zb.ul;

import android.graphics.PointF;
import android.view.animation.Interpolator;
import com.bytedance.adsdk.zb.ul;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public class ycx<T> {

    /* renamed from: dj, reason: collision with root package name */
    public final Interpolator f23129dj;

    /* renamed from: dy, reason: collision with root package name */
    private float f23130dy;

    /* renamed from: ea, reason: collision with root package name */
    private float f23131ea;
    public PointF fby;

    /* renamed from: jc, reason: collision with root package name */
    private final ul f23132jc;

    /* renamed from: jw, reason: collision with root package name */
    public PointF f23133jw;

    /* renamed from: lt, reason: collision with root package name */
    public final float f23134lt;
    public final Interpolator lud;

    /* renamed from: ok, reason: collision with root package name */
    private float f23135ok;

    /* renamed from: ry, reason: collision with root package name */
    private int f23136ry;
    public final Interpolator sya;
    private float syc;

    /* renamed from: ul, reason: collision with root package name */
    public Float f23137ul;
    private int xkz;
    public final T ycx;

    /* renamed from: zb, reason: collision with root package name */
    public T f23138zb;

    public ycx(ul ulVar, T t6, T t9, Interpolator interpolator, float f11, Float f12) {
        this.f23131ea = -3987645.8f;
        this.f23135ok = -3987645.8f;
        this.f23136ry = 784923401;
        this.xkz = 784923401;
        this.syc = Float.MIN_VALUE;
        this.f23130dy = Float.MIN_VALUE;
        this.fby = null;
        this.f23133jw = null;
        this.f23132jc = ulVar;
        this.ycx = t6;
        this.f23138zb = t9;
        this.sya = interpolator;
        this.f23129dj = null;
        this.lud = null;
        this.f23134lt = f11;
        this.f23137ul = f12;
    }

    public float dj() {
        if (this.f23132jc == null) {
            return 1.0f;
        }
        if (this.f23130dy == Float.MIN_VALUE) {
            if (this.f23137ul == null) {
                this.f23130dy = 1.0f;
            } else {
                this.f23130dy = ((this.f23137ul.floatValue() - this.f23134lt) / this.f23132jc.wie()) + sya();
            }
        }
        return this.f23130dy;
    }

    public int fby() {
        if (this.f23136ry == 784923401) {
            this.f23136ry = ((Integer) this.ycx).intValue();
        }
        return this.f23136ry;
    }

    public int jw() {
        if (this.xkz == 784923401) {
            this.xkz = ((Integer) this.f23138zb).intValue();
        }
        return this.xkz;
    }

    public float lt() {
        if (this.f23131ea == -3987645.8f) {
            this.f23131ea = ((Float) this.ycx).floatValue();
        }
        return this.f23131ea;
    }

    public boolean lud() {
        return this.sya == null && this.f23129dj == null && this.lud == null;
    }

    public float sya() {
        ul ulVar = this.f23132jc;
        if (ulVar == null) {
            return 0.0f;
        }
        if (this.syc == Float.MIN_VALUE) {
            this.syc = (this.f23134lt - ulVar.lt()) / this.f23132jc.wie();
        }
        return this.syc;
    }

    public String toString() {
        return "Keyframe{startValue=" + this.ycx + ", endValue=" + this.f23138zb + ", startFrame=" + this.f23134lt + ", endFrame=" + this.f23137ul + ", interpolator=" + this.sya + AbstractJsonLexerKt.END_OBJ;
    }

    public float ul() {
        if (this.f23135ok == -3987645.8f) {
            this.f23135ok = ((Float) this.f23138zb).floatValue();
        }
        return this.f23135ok;
    }

    public ycx<T> ycx(T t6, T t9) {
        return new ycx<>(t6, t9);
    }

    public boolean ycx(float f11) {
        return f11 >= sya() && f11 < dj();
    }

    public ycx(ul ulVar, T t6, T t9, Interpolator interpolator, Interpolator interpolator2, float f11, Float f12) {
        this.f23131ea = -3987645.8f;
        this.f23135ok = -3987645.8f;
        this.f23136ry = 784923401;
        this.xkz = 784923401;
        this.syc = Float.MIN_VALUE;
        this.f23130dy = Float.MIN_VALUE;
        this.fby = null;
        this.f23133jw = null;
        this.f23132jc = ulVar;
        this.ycx = t6;
        this.f23138zb = t9;
        this.sya = null;
        this.f23129dj = interpolator;
        this.lud = interpolator2;
        this.f23134lt = f11;
        this.f23137ul = f12;
    }

    public ycx(ul ulVar, T t6, T t9, Interpolator interpolator, Interpolator interpolator2, Interpolator interpolator3, float f11, Float f12) {
        this.f23131ea = -3987645.8f;
        this.f23135ok = -3987645.8f;
        this.f23136ry = 784923401;
        this.xkz = 784923401;
        this.syc = Float.MIN_VALUE;
        this.f23130dy = Float.MIN_VALUE;
        this.fby = null;
        this.f23133jw = null;
        this.f23132jc = ulVar;
        this.ycx = t6;
        this.f23138zb = t9;
        this.sya = interpolator;
        this.f23129dj = interpolator2;
        this.lud = interpolator3;
        this.f23134lt = f11;
        this.f23137ul = f12;
    }

    public ycx(T t6) {
        this.f23131ea = -3987645.8f;
        this.f23135ok = -3987645.8f;
        this.f23136ry = 784923401;
        this.xkz = 784923401;
        this.syc = Float.MIN_VALUE;
        this.f23130dy = Float.MIN_VALUE;
        this.fby = null;
        this.f23133jw = null;
        this.f23132jc = null;
        this.ycx = t6;
        this.f23138zb = t6;
        this.sya = null;
        this.f23129dj = null;
        this.lud = null;
        this.f23134lt = Float.MIN_VALUE;
        this.f23137ul = Float.valueOf(Float.MAX_VALUE);
    }

    private ycx(T t6, T t9) {
        this.f23131ea = -3987645.8f;
        this.f23135ok = -3987645.8f;
        this.f23136ry = 784923401;
        this.xkz = 784923401;
        this.syc = Float.MIN_VALUE;
        this.f23130dy = Float.MIN_VALUE;
        this.fby = null;
        this.f23133jw = null;
        this.f23132jc = null;
        this.ycx = t6;
        this.f23138zb = t9;
        this.sya = null;
        this.f23129dj = null;
        this.lud = null;
        this.f23134lt = Float.MIN_VALUE;
        this.f23137ul = Float.valueOf(Float.MAX_VALUE);
    }
}

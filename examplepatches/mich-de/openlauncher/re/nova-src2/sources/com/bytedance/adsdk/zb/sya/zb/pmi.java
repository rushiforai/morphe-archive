package com.bytedance.adsdk.zb.sya.zb;

import android.graphics.Paint;
import com.bytedance.adsdk.zb.ycx.ycx.htf;
import java.util.List;

/* loaded from: classes2.dex */
public class pmi implements sya {

    /* renamed from: dj, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.sya.ycx.ycx f23077dj;
    private final zb fby;

    /* renamed from: jc, reason: collision with root package name */
    private final boolean f23078jc;

    /* renamed from: jw, reason: collision with root package name */
    private final float f23079jw;

    /* renamed from: lt, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.sya.ycx.zb f23080lt;
    private final com.bytedance.adsdk.zb.sya.ycx.dj lud;
    private final List<com.bytedance.adsdk.zb.sya.ycx.zb> sya;

    /* renamed from: ul, reason: collision with root package name */
    private final ycx f23081ul;
    private final String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.sya.ycx.zb f23082zb;

    /* renamed from: com.bytedance.adsdk.zb.sya.zb.pmi$1, reason: invalid class name */
    public static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] ycx;

        /* renamed from: zb, reason: collision with root package name */
        static final /* synthetic */ int[] f23083zb;

        static {
            int[] iArr = new int[zb.values().length];
            f23083zb = iArr;
            try {
                iArr[zb.BEVEL.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                f23083zb[zb.MITER.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                f23083zb[zb.ROUND.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            int[] iArr2 = new int[ycx.values().length];
            ycx = iArr2;
            try {
                iArr2[ycx.BUTT.ordinal()] = 1;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                ycx[ycx.ROUND.ordinal()] = 2;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                ycx[ycx.UNKNOWN.ordinal()] = 3;
            } catch (NoSuchFieldError unused6) {
            }
        }
    }

    public enum ycx {
        BUTT,
        ROUND,
        UNKNOWN;

        public Paint.Cap ycx() {
            int i5 = AnonymousClass1.ycx[ordinal()];
            return i5 != 1 ? i5 != 2 ? Paint.Cap.SQUARE : Paint.Cap.ROUND : Paint.Cap.BUTT;
        }
    }

    public enum zb {
        MITER,
        ROUND,
        BEVEL;

        public Paint.Join ycx() {
            int i5 = AnonymousClass1.f23083zb[ordinal()];
            if (i5 == 1) {
                return Paint.Join.BEVEL;
            }
            if (i5 == 2) {
                return Paint.Join.MITER;
            }
            if (i5 != 3) {
                return null;
            }
            return Paint.Join.ROUND;
        }
    }

    public pmi(String str, com.bytedance.adsdk.zb.sya.ycx.zb zbVar, List<com.bytedance.adsdk.zb.sya.ycx.zb> list, com.bytedance.adsdk.zb.sya.ycx.ycx ycxVar, com.bytedance.adsdk.zb.sya.ycx.dj djVar, com.bytedance.adsdk.zb.sya.ycx.zb zbVar2, ycx ycxVar2, zb zbVar3, float f11, boolean z11) {
        this.ycx = str;
        this.f23082zb = zbVar;
        this.sya = list;
        this.f23077dj = ycxVar;
        this.lud = djVar;
        this.f23080lt = zbVar2;
        this.f23081ul = ycxVar2;
        this.fby = zbVar3;
        this.f23079jw = f11;
        this.f23078jc = z11;
    }

    public com.bytedance.adsdk.zb.sya.ycx.zb dj() {
        return this.f23080lt;
    }

    public zb fby() {
        return this.fby;
    }

    public boolean jc() {
        return this.f23078jc;
    }

    public float jw() {
        return this.f23079jw;
    }

    public com.bytedance.adsdk.zb.sya.ycx.zb lt() {
        return this.f23082zb;
    }

    public List<com.bytedance.adsdk.zb.sya.ycx.zb> lud() {
        return this.sya;
    }

    public com.bytedance.adsdk.zb.sya.ycx.dj sya() {
        return this.lud;
    }

    public ycx ul() {
        return this.f23081ul;
    }

    @Override // com.bytedance.adsdk.zb.sya.zb.sya
    public com.bytedance.adsdk.zb.ycx.ycx.sya ycx(com.bytedance.adsdk.zb.jw jwVar, com.bytedance.adsdk.zb.ul ulVar, com.bytedance.adsdk.zb.sya.sya.ycx ycxVar) {
        return new htf(jwVar, ycxVar, this);
    }

    public com.bytedance.adsdk.zb.sya.ycx.ycx zb() {
        return this.f23077dj;
    }

    public String ycx() {
        return this.ycx;
    }
}

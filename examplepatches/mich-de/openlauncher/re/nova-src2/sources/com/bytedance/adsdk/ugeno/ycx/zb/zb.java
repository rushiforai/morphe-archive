package com.bytedance.adsdk.ugeno.ycx.zb;

import android.animation.FloatEvaluator;
import android.animation.Keyframe;
import android.animation.TypeEvaluator;
import android.content.Context;
import com.bytedance.adsdk.ugeno.fby.fby;
import com.bytedance.adsdk.ugeno.ycx.lud;
import java.util.TreeMap;

/* loaded from: classes2.dex */
public class zb extends ycx {

    /* renamed from: com.bytedance.adsdk.ugeno.ycx.zb.zb$1, reason: invalid class name */
    public static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] ycx;

        static {
            int[] iArr = new int[lud.values().length];
            ycx = iArr;
            try {
                iArr[lud.TRANSLATE_X.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                ycx[lud.TRANSLATE_Y.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                ycx[lud.SCALE_X.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                ycx[lud.SCALE_Y.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                ycx[lud.ROTATE_X.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                ycx[lud.ROTATE_Y.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                ycx[lud.ROTATE_Z.ordinal()] = 7;
            } catch (NoSuchFieldError unused7) {
            }
            try {
                ycx[lud.ALPHA.ordinal()] = 8;
            } catch (NoSuchFieldError unused8) {
            }
            try {
                ycx[lud.BORDER_RADIUS.ordinal()] = 9;
            } catch (NoSuchFieldError unused9) {
            }
        }
    }

    public zb(Context context, com.bytedance.adsdk.ugeno.zb.sya syaVar, String str, TreeMap<Float, String> treeMap) {
        super(context, syaVar, str, treeMap);
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.zb.ycx
    public TypeEvaluator lt() {
        return new FloatEvaluator();
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.zb.ycx
    public void ycx(float f11, String str) {
        this.lud.add(Keyframe.ofFloat(f11, (this.f22585zb.startsWith(lud.TRANSLATE.ycx()) || this.f22582dj == lud.BORDER_RADIUS) ? fby.ycx(this.ycx, com.bytedance.adsdk.ugeno.fby.sya.ycx(str, 0.0f)) : com.bytedance.adsdk.ugeno.fby.sya.ycx(str, 0.0f)));
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.zb.ycx
    public void zb() {
        float fSyc;
        switch (AnonymousClass1.ycx[this.f22582dj.ordinal()]) {
            case 1:
                fSyc = this.f22584ul.syc();
                break;
            case 2:
                fSyc = this.f22584ul.dy();
                break;
            case 3:
                fSyc = this.f22584ul.wie();
                break;
            case 4:
                fSyc = this.f22584ul.pmi();
                break;
            case 5:
                fSyc = this.f22584ul.uh();
                if (this.f22584ul.ea() != null) {
                    this.f22584ul.ea().setCameraDistance(10000.0f);
                    break;
                }
                break;
            case 6:
                fSyc = this.f22584ul.htf();
                if (this.f22584ul.ea() != null) {
                    this.f22584ul.ea().setCameraDistance(10000.0f);
                    break;
                }
                break;
            case 7:
                fSyc = this.f22584ul.thx();
                break;
            case 8:
                fSyc = this.f22584ul.wwx();
                break;
            case 9:
                fSyc = this.f22584ul.tn();
                break;
            default:
                fSyc = 0.0f;
                break;
        }
        this.lud.add(Keyframe.ofFloat(0.0f, fSyc));
    }
}

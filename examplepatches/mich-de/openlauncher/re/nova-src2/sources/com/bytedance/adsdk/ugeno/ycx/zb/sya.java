package com.bytedance.adsdk.ugeno.ycx.zb;

import android.animation.ArgbEvaluator;
import android.animation.IntEvaluator;
import android.animation.Keyframe;
import android.animation.TypeEvaluator;
import android.content.Context;
import com.bytedance.adsdk.ugeno.ycx.lud;
import java.util.TreeMap;

/* loaded from: classes2.dex */
public class sya extends ycx {
    public sya(Context context, com.bytedance.adsdk.ugeno.zb.sya syaVar, String str, TreeMap<Float, String> treeMap) {
        super(context, syaVar, str, treeMap);
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.zb.ycx
    public TypeEvaluator lt() {
        return this.f22582dj == lud.BACKGROUND_COLOR ? new ArgbEvaluator() : new IntEvaluator();
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.zb.ycx
    public void ycx(float f11, String str) {
        this.lud.add(this.f22582dj == lud.BACKGROUND_COLOR ? Keyframe.ofInt(f11, com.bytedance.adsdk.ugeno.fby.ycx.ycx(str)) : Keyframe.ofInt(f11, com.bytedance.adsdk.ugeno.fby.sya.ycx(str, 0)));
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.zb.ycx
    public void zb() {
        if (this.f22582dj == lud.BACKGROUND_COLOR) {
            this.lud.add(Keyframe.ofInt(0.0f, this.f22584ul.oby()));
        }
    }
}

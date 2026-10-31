package com.bytedance.adsdk.ugeno.ycx.zb;

import android.animation.FloatEvaluator;
import android.animation.Keyframe;
import android.animation.PropertyValuesHolder;
import android.animation.TypeEvaluator;
import android.content.Context;
import android.text.TextUtils;
import com.bytedance.adsdk.ugeno.fby.fby;
import com.bytedance.adsdk.ugeno.ycx.lud;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;

/* loaded from: classes2.dex */
public class dj extends ycx {
    private List<Keyframe> fby;

    /* renamed from: com.bytedance.adsdk.ugeno.ycx.zb.dj$1, reason: invalid class name */
    public static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] ycx;

        static {
            int[] iArr = new int[lud.values().length];
            ycx = iArr;
            try {
                iArr[lud.TRANSLATE.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                ycx[lud.SCALE.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
        }
    }

    public dj(Context context, com.bytedance.adsdk.ugeno.zb.sya syaVar, String str, Map<Float, String> map) {
        super(context, syaVar, str, map);
        this.fby = new ArrayList();
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.zb.ycx
    public TypeEvaluator lt() {
        return new FloatEvaluator();
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.zb.ycx
    public List<PropertyValuesHolder> lud() {
        String strZb = this.f22582dj.zb();
        dj();
        PropertyValuesHolder propertyValuesHolderOfKeyframe = PropertyValuesHolder.ofKeyframe(strZb + "X", (Keyframe[]) this.lud.toArray(new Keyframe[0]));
        this.f22583lt.add(propertyValuesHolderOfKeyframe);
        PropertyValuesHolder propertyValuesHolderOfKeyframe2 = PropertyValuesHolder.ofKeyframe(strZb + "Y", (Keyframe[]) this.fby.toArray(new Keyframe[0]));
        this.f22583lt.add(propertyValuesHolderOfKeyframe2);
        TypeEvaluator typeEvaluatorLt = lt();
        if (typeEvaluatorLt != null) {
            propertyValuesHolderOfKeyframe.setEvaluator(typeEvaluatorLt);
            propertyValuesHolderOfKeyframe2.setEvaluator(typeEvaluatorLt);
        }
        return this.f22583lt;
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.zb.ycx
    public void ycx(float f11, String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        try {
            JSONArray jSONArray = new JSONArray(str);
            if (jSONArray.length() != 2) {
                return;
            }
            float fOptDouble = (float) jSONArray.optDouble(0);
            float fOptDouble2 = (float) jSONArray.optDouble(1);
            if (this.f22582dj == lud.TRANSLATE) {
                fOptDouble = fby.ycx(this.ycx, fOptDouble);
                fOptDouble2 = fby.ycx(this.ycx, fOptDouble2);
            }
            this.lud.add(Keyframe.ofFloat(f11, fOptDouble));
            this.fby.add(Keyframe.ofFloat(f11, fOptDouble2));
        } catch (JSONException unused) {
        }
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.zb.ycx
    public void zb() {
        Keyframe keyframeOfFloat;
        Keyframe keyframeOfFloat2;
        int i5 = AnonymousClass1.ycx[this.f22582dj.ordinal()];
        if (i5 == 1) {
            keyframeOfFloat = Keyframe.ofFloat(0.0f, this.f22584ul.syc());
            keyframeOfFloat2 = Keyframe.ofFloat(0.0f, this.f22584ul.dy());
        } else if (i5 != 2) {
            keyframeOfFloat = null;
            keyframeOfFloat2 = null;
        } else {
            keyframeOfFloat = Keyframe.ofFloat(0.0f, this.f22584ul.wie());
            keyframeOfFloat2 = Keyframe.ofFloat(0.0f, this.f22584ul.pmi());
        }
        if (keyframeOfFloat != null) {
            this.lud.add(keyframeOfFloat);
        }
        if (keyframeOfFloat2 != null) {
            this.fby.add(keyframeOfFloat2);
        }
    }
}

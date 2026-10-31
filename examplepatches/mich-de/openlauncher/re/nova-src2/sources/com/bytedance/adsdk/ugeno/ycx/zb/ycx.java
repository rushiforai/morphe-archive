package com.bytedance.adsdk.ugeno.ycx.zb;

import android.animation.Keyframe;
import android.animation.PropertyValuesHolder;
import android.animation.TypeEvaluator;
import android.content.Context;
import com.bytedance.adsdk.ugeno.ycx.lud;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/* loaded from: classes2.dex */
public abstract class ycx {

    /* renamed from: dj, reason: collision with root package name */
    protected lud f22582dj;

    /* renamed from: lt, reason: collision with root package name */
    protected List<PropertyValuesHolder> f22583lt = new ArrayList();
    protected List<Keyframe> lud = new ArrayList();
    protected Map<Float, String> sya;

    /* renamed from: ul, reason: collision with root package name */
    protected com.bytedance.adsdk.ugeno.zb.sya f22584ul;
    protected Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected String f22585zb;

    public ycx(Context context, com.bytedance.adsdk.ugeno.zb.sya syaVar, String str, Map<Float, String> map) {
        this.ycx = context;
        this.f22585zb = str;
        this.sya = map;
        this.f22582dj = lud.ycx(this.f22585zb);
        this.f22584ul = syaVar;
    }

    public void dj() {
        Map<Float, String> map = this.sya;
        if (map == null || map.size() <= 0) {
            return;
        }
        if (!ycx()) {
            zb();
        }
        for (Map.Entry<Float, String> entry : this.sya.entrySet()) {
            if (entry != null) {
                ycx(entry.getKey().floatValue() / 100.0f, entry.getValue());
            }
        }
        sya();
    }

    public abstract TypeEvaluator lt();

    public List<PropertyValuesHolder> lud() {
        String strZb = this.f22582dj.zb();
        dj();
        PropertyValuesHolder propertyValuesHolderOfKeyframe = PropertyValuesHolder.ofKeyframe(strZb, (Keyframe[]) this.lud.toArray(new Keyframe[0]));
        TypeEvaluator typeEvaluatorLt = lt();
        if (typeEvaluatorLt != null) {
            propertyValuesHolderOfKeyframe.setEvaluator(typeEvaluatorLt);
        }
        this.f22583lt.add(propertyValuesHolderOfKeyframe);
        return this.f22583lt;
    }

    public void sya() {
        Map<Float, String> map = this.sya;
        if (map == null || map.size() <= 0) {
            return;
        }
        Map<Float, String> map2 = this.sya;
        if (map2 instanceof TreeMap) {
            Float f11 = (Float) ((TreeMap) map2).lastKey();
            if (f11.floatValue() != 100.0f) {
                ycx(100.0f, this.sya.get(f11));
            }
        }
    }

    public abstract void ycx(float f11, String str);

    public boolean ycx() {
        Map<Float, String> map = this.sya;
        if (map == null || map.size() <= 0) {
            return false;
        }
        return this.sya.containsKey(Float.valueOf(0.0f));
    }

    public abstract void zb();
}

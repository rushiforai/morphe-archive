package com.bytedance.adsdk.ugeno.yoga;

import java.util.ArrayList;
import java.util.List;

@com.bytedance.adsdk.ugeno.yoga.ycx.ycx
/* loaded from: classes2.dex */
public abstract class YogaNodeJNIBase extends jc implements Cloneable {

    @com.bytedance.adsdk.ugeno.yoga.ycx.ycx
    private float[] arr;

    /* renamed from: dj, reason: collision with root package name */
    private ul f22591dj;

    /* renamed from: lt, reason: collision with root package name */
    private Object f22592lt;
    private zb lud;

    @com.bytedance.adsdk.ugeno.yoga.ycx.ycx
    private int mLayoutDirection;
    private List<YogaNodeJNIBase> sya;

    /* renamed from: ul, reason: collision with root package name */
    private boolean f22593ul;
    protected long ycx;

    /* renamed from: zb, reason: collision with root package name */
    private YogaNodeJNIBase f22594zb;

    private YogaNodeJNIBase(long j11) {
        this.arr = null;
        this.mLayoutDirection = 0;
        this.f22593ul = true;
        if (j11 == 0) {
            throw new IllegalStateException("Failed to allocate native memory");
        }
        this.ycx = j11;
    }

    @com.bytedance.adsdk.ugeno.yoga.ycx.ycx
    private final long replaceChild(YogaNodeJNIBase yogaNodeJNIBase, int i5) {
        List<YogaNodeJNIBase> list = this.sya;
        if (list == null) {
            throw new IllegalStateException("Cannot replace child. YogaNode does not have children");
        }
        list.remove(i5);
        this.sya.add(i5, yogaNodeJNIBase);
        yogaNodeJNIBase.f22594zb = this;
        return yogaNodeJNIBase.ycx;
    }

    @com.bytedance.adsdk.ugeno.yoga.ycx.ycx
    public final float baseline(float f11, float f12) {
        return this.lud.ycx(this, f11, f12);
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    /* renamed from: dj, reason: merged with bridge method [inline-methods] */
    public YogaNodeJNIBase zb(int i5) {
        List<YogaNodeJNIBase> list = this.sya;
        if (list == null) {
            throw new IllegalStateException("Trying to remove a child of a YogaNode that does not have children");
        }
        YogaNodeJNIBase yogaNodeJNIBaseRemove = list.remove(i5);
        yogaNodeJNIBaseRemove.f22594zb = null;
        YogaNative.jni_YGNodeRemoveChildJNI(this.ycx, yogaNodeJNIBaseRemove.ycx);
        return yogaNodeJNIBaseRemove;
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    /* renamed from: ea, reason: merged with bridge method [inline-methods] */
    public YogaNodeJNIBase zb() {
        return this.f22594zb;
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void fby(float f11) {
        YogaNative.jni_YGNodeStyleSetMinWidthJNI(this.ycx, f11);
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void jc(float f11) {
        YogaNative.jni_YGNodeStyleSetMaxWidthJNI(this.ycx, f11);
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void jw(float f11) {
        YogaNative.jni_YGNodeStyleSetMinHeightJNI(this.ycx, f11);
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void lt(float f11) {
        YogaNative.jni_YGNodeStyleSetHeightJNI(this.ycx, f11);
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void lud(float f11) {
        YogaNative.jni_YGNodeStyleSetWidthPercentJNI(this.ycx, f11);
    }

    @com.bytedance.adsdk.ugeno.yoga.ycx.ycx
    public final long measure(float f11, int i5, float f12, int i11) {
        if (ok()) {
            return this.f22591dj.ycx(this, f11, fby.ycx(i5), f12, fby.ycx(i11));
        }
        throw new RuntimeException("Measure function isn't defined!");
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void ok(float f11) {
        YogaNative.jni_YGNodeStyleSetAspectRatioJNI(this.ycx, f11);
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    /* renamed from: sya, reason: merged with bridge method [inline-methods] */
    public YogaNodeJNIBase ycx(int i5) {
        List<YogaNodeJNIBase> list = this.sya;
        if (list != null) {
            return list.get(i5);
        }
        throw new IllegalStateException("YogaNode does not have children");
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void ul(float f11) {
        YogaNative.jni_YGNodeStyleSetHeightPercentJNI(this.ycx, f11);
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void ea(float f11) {
        YogaNative.jni_YGNodeStyleSetMaxHeightJNI(this.ycx, f11);
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public float fby() {
        float[] fArr = this.arr;
        if (fArr != null) {
            return fArr[1];
        }
        return 0.0f;
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public Object jc() {
        return this.f22592lt;
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public float jw() {
        float[] fArr = this.arr;
        if (fArr != null) {
            return fArr[2];
        }
        return 0.0f;
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public float lt() {
        float[] fArr = this.arr;
        if (fArr != null) {
            return fArr[3];
        }
        return 0.0f;
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void lud() {
        YogaNative.jni_YGNodeStyleSetHeightAutoJNI(this.ycx);
    }

    public boolean ok() {
        return this.f22591dj != null;
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public float ul() {
        float[] fArr = this.arr;
        if (fArr != null) {
            return fArr[4];
        }
        return 0.0f;
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public int ycx() {
        List<YogaNodeJNIBase> list = this.sya;
        if (list == null) {
            return 0;
        }
        return list.size();
    }

    private void zb(jc jcVar) {
        jc();
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void ycx(jc jcVar, int i5) {
        if (jcVar instanceof YogaNodeJNIBase) {
            YogaNodeJNIBase yogaNodeJNIBase = (YogaNodeJNIBase) jcVar;
            if (yogaNodeJNIBase.f22594zb == null) {
                if (this.sya == null) {
                    this.sya = new ArrayList(4);
                }
                this.sya.add(i5, yogaNodeJNIBase);
                yogaNodeJNIBase.f22594zb = this;
                YogaNative.jni_YGNodeInsertChildJNI(this.ycx, yogaNodeJNIBase.ycx, i5);
                return;
            }
            throw new IllegalStateException("Child already has a parent, it must be removed first.");
        }
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void sya(ycx ycxVar) {
        YogaNative.jni_YGNodeStyleSetAlignContentJNI(this.ycx, ycxVar.ycx());
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void zb(ycx ycxVar) {
        YogaNative.jni_YGNodeStyleSetAlignSelfJNI(this.ycx, ycxVar.ycx());
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void sya(float f11) {
        YogaNative.jni_YGNodeStyleSetFlexBasisJNI(this.ycx, f11);
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void zb(float f11) {
        YogaNative.jni_YGNodeStyleSetFlexShrinkJNI(this.ycx, f11);
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void dj(float f11) {
        YogaNative.jni_YGNodeStyleSetWidthJNI(this.ycx, f11);
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void sya() {
        YogaNative.jni_YGNodeStyleSetFlexBasisAutoJNI(this.ycx);
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void zb(dj djVar, float f11) {
        YogaNative.jni_YGNodeStyleSetPaddingJNI(this.ycx, djVar.ycx(), f11);
    }

    public YogaNodeJNIBase() {
        this(YogaNative.jni_YGNodeNewJNI());
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void dj() {
        YogaNative.jni_YGNodeStyleSetWidthAutoJNI(this.ycx);
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void sya(dj djVar, float f11) {
        YogaNative.jni_YGNodeStyleSetPositionJNI(this.ycx, djVar.ycx(), f11);
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public int ycx(jc jcVar) {
        List<YogaNodeJNIBase> list = this.sya;
        if (list == null) {
            return -1;
        }
        return list.indexOf(jcVar);
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void ycx(float f11, float f12) {
        zb((jc) null);
        ArrayList arrayList = new ArrayList();
        arrayList.add(this);
        for (int i5 = 0; i5 < arrayList.size(); i5++) {
            YogaNodeJNIBase yogaNodeJNIBase = (YogaNodeJNIBase) arrayList.get(i5);
            List<YogaNodeJNIBase> list = yogaNodeJNIBase.sya;
            if (list != null) {
                for (YogaNodeJNIBase yogaNodeJNIBase2 : list) {
                    yogaNodeJNIBase2.zb(yogaNodeJNIBase);
                    arrayList.add(yogaNodeJNIBase2);
                }
            }
        }
        YogaNodeJNIBase[] yogaNodeJNIBaseArr = (YogaNodeJNIBase[]) arrayList.toArray(new YogaNodeJNIBase[arrayList.size()]);
        long[] jArr = new long[yogaNodeJNIBaseArr.length];
        for (int i11 = 0; i11 < yogaNodeJNIBaseArr.length; i11++) {
            jArr[i11] = yogaNodeJNIBaseArr[i11].ycx;
        }
        YogaNative.jni_YGNodeCalculateLayoutJNI(this.ycx, f11, f12, jArr, yogaNodeJNIBaseArr);
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void ycx(sya syaVar) {
        YogaNative.jni_YGNodeStyleSetDirectionJNI(this.ycx, syaVar.ycx());
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void ycx(lud ludVar) {
        YogaNative.jni_YGNodeStyleSetFlexDirectionJNI(this.ycx, ludVar.ycx());
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void ycx(lt ltVar) {
        YogaNative.jni_YGNodeStyleSetJustifyContentJNI(this.ycx, ltVar.ycx());
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void ycx(ycx ycxVar) {
        YogaNative.jni_YGNodeStyleSetAlignItemsJNI(this.ycx, ycxVar.ycx());
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void ycx(ry ryVar) {
        YogaNative.jni_YGNodeStyleSetPositionTypeJNI(this.ycx, ryVar.ycx());
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void ycx(xkz xkzVar) {
        YogaNative.jni_YGNodeStyleSetFlexWrapJNI(this.ycx, xkzVar.ycx());
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void ycx(float f11) {
        YogaNative.jni_YGNodeStyleSetFlexGrowJNI(this.ycx, f11);
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void ycx(dj djVar, float f11) {
        YogaNative.jni_YGNodeStyleSetMarginJNI(this.ycx, djVar.ycx(), f11);
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void ycx(ul ulVar) {
        this.f22591dj = ulVar;
        YogaNative.jni_YGNodeSetHasMeasureFuncJNI(this.ycx, ulVar != null);
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void ycx(boolean z11) {
        YogaNative.jni_YGNodeSetAlwaysFormsContainingBlockJNI(this.ycx, z11);
    }

    @Override // com.bytedance.adsdk.ugeno.yoga.jc
    public void ycx(Object obj) {
        this.f22592lt = obj;
    }
}

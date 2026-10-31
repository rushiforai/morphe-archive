package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes2.dex */
public class DynamicRootView extends FrameLayout implements com.bytedance.sdk.component.adexpress.dynamic.dj {
    private String bgColor;
    private Map<Integer, String> bgMaterialCenterCalcColor;
    private lud dynamicBaseWidget;
    private int logoUnionHeight;
    private Context mContext;
    private com.bytedance.sdk.component.adexpress.dynamic.lt.ycx mDynamicClickListener;
    boolean mIsMute;
    private com.bytedance.sdk.component.adexpress.zb.ea mRenderListener;
    private com.bytedance.sdk.component.adexpress.zb.ry mRenderRequest;
    private ViewGroup mTimeOut;
    private com.bytedance.sdk.component.adexpress.dynamic.zb muteListener;
    protected final com.bytedance.sdk.component.adexpress.zb.xkz renderResult;
    private int scoreCountWithIcon;
    private List<com.bytedance.sdk.component.adexpress.dynamic.sya> timeOutListener;
    private int timedown;
    private com.bytedance.sdk.component.adexpress.dynamic.lud videoListener;
    public View videoView;

    public DynamicRootView(Context context, boolean z11, com.bytedance.sdk.component.adexpress.zb.ry ryVar, com.bytedance.sdk.component.adexpress.dynamic.lt.ycx ycxVar) {
        super(context);
        this.mTimeOut = null;
        this.timedown = 0;
        this.timeOutListener = new ArrayList();
        this.logoUnionHeight = 0;
        this.scoreCountWithIcon = 0;
        this.mContext = context;
        com.bytedance.sdk.component.adexpress.zb.xkz xkzVar = new com.bytedance.sdk.component.adexpress.zb.xkz();
        this.renderResult = xkzVar;
        xkzVar.ycx(2);
        this.mDynamicClickListener = ycxVar;
        ycxVar.ycx(this);
        this.mIsMute = z11;
        this.mRenderRequest = ryVar;
    }

    private void checkCanOpenLandingPage(com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        com.bytedance.sdk.component.adexpress.dynamic.dj.lt ltVarLud;
        com.bytedance.sdk.component.adexpress.dynamic.dj.lud ludVarJc = fbyVar.jc();
        if (ludVarJc == null || (ltVarLud = ludVarJc.lud()) == null) {
            return;
        }
        this.renderResult.sya(ltVarLud.kh());
    }

    private boolean checkSizeValid() {
        lud ludVar = this.dynamicBaseWidget;
        return ludVar.lud > 0.0f && ludVar.f23412lt > 0.0f;
    }

    private void setClipChildren(ViewGroup viewGroup, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        ViewGroup viewGroup2;
        if (viewGroup == null || (viewGroup2 = (ViewGroup) viewGroup.getParent()) == null || !fbyVar.dv()) {
            return;
        }
        viewGroup2.setClipChildren(false);
        viewGroup2.setClipToPadding(false);
        ViewGroup viewGroup3 = (ViewGroup) viewGroup2.getParent();
        if (viewGroup3 != null) {
            viewGroup3.setClipChildren(false);
            viewGroup3.setClipToPadding(false);
        }
    }

    public void beginHideFromVisible() {
        beginShowFromInvisible(this.dynamicBaseWidget, 4);
    }

    public void beginShowFromInvisible() {
        beginShowFromInvisible(this.dynamicBaseWidget, 0);
    }

    public void callBackRenderFail(int i5, String str) {
        this.renderResult.zb(false);
        this.renderResult.zb(i5);
        this.renderResult.ycx(str);
        this.mRenderListener.ycx(this.renderResult);
    }

    public String getBgColor() {
        return this.bgColor;
    }

    public Map<Integer, String> getBgMaterialCenterCalcColor() {
        return this.bgMaterialCenterCalcColor;
    }

    public com.bytedance.sdk.component.adexpress.dynamic.lt.ycx getDynamicClickListener() {
        return this.mDynamicClickListener;
    }

    public int getLogoUnionHeight() {
        return this.logoUnionHeight;
    }

    public com.bytedance.sdk.component.adexpress.zb.ea getRenderListener() {
        return this.mRenderListener;
    }

    public com.bytedance.sdk.component.adexpress.zb.ry getRenderRequest() {
        return this.mRenderRequest;
    }

    public int getScoreCountWithIcon() {
        return this.scoreCountWithIcon;
    }

    public ViewGroup getTimeOut() {
        return this.mTimeOut;
    }

    public List<com.bytedance.sdk.component.adexpress.dynamic.sya> getTimeOutListener() {
        return this.timeOutListener;
    }

    public int getTimedown() {
        return this.timedown;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dj
    public void onvideoComplate() {
        try {
            this.videoListener.ycx();
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6QxVe8gnACqYMKX", "f/cjlA61avWPRcNrhRS3", "VOA7nAe5ZuSPR8dRjQWl", 246);
        }
    }

    public void render(com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar, int i5) {
        this.dynamicBaseWidget = renderDynamicView(fbyVar, this, i5);
        this.renderResult.zb(true);
        this.renderResult.ycx(this.dynamicBaseWidget.lud);
        this.renderResult.zb(this.dynamicBaseWidget.f23412lt);
        this.renderResult.ycx(this.videoView);
        this.mRenderListener.ycx(this.renderResult);
    }

    public lud renderDynamicView(com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar, ViewGroup viewGroup, int i5) {
        if (fbyVar == null) {
            return null;
        }
        List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> listEa = fbyVar.ea();
        lud ludVarYcx = com.bytedance.sdk.component.adexpress.dynamic.ycx.zb.ycx(this.mContext, this, fbyVar);
        if (ludVarYcx instanceof rmf) {
            callBackRenderFail(i5 == 3 ? 128 : Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE, "unknow widget");
            return null;
        }
        checkCanOpenLandingPage(fbyVar);
        ludVarYcx.sya();
        if (viewGroup != null) {
            viewGroup.addView(ludVarYcx);
            setClipChildren(viewGroup, fbyVar);
        }
        if (listEa == null || listEa.size() <= 0) {
            return null;
        }
        Iterator<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> it = listEa.iterator();
        while (it.hasNext()) {
            renderDynamicView(it.next(), ludVarYcx, i5);
        }
        return ludVarYcx;
    }

    public void setBgColor(String str) {
        this.bgColor = str;
    }

    public void setBgMaterialCenterCalcColor(Map<Integer, String> map) {
        this.bgMaterialCenterCalcColor = map;
    }

    public void setLogoUnionHeight(int i5) {
        this.logoUnionHeight = i5;
    }

    public void setMuteListener(com.bytedance.sdk.component.adexpress.dynamic.zb zbVar) {
        this.muteListener = zbVar;
    }

    public void setRenderListener(com.bytedance.sdk.component.adexpress.zb.ea eaVar) {
        this.mRenderListener = eaVar;
        this.mDynamicClickListener.ycx(eaVar);
    }

    public void setScoreCountWithIcon(int i5) {
        this.scoreCountWithIcon = i5;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dj
    public void setSoundMute(boolean z11) {
        com.bytedance.sdk.component.adexpress.dynamic.zb zbVar = this.muteListener;
        if (zbVar != null) {
            zbVar.setSoundMute(z11);
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dj
    public void setTime(CharSequence charSequence, int i5, int i11, boolean z11) {
        for (int i12 = 0; i12 < this.timeOutListener.size(); i12++) {
            if (this.timeOutListener.get(i12) != null) {
                this.timeOutListener.get(i12).ycx(charSequence, i5 == 1, i11, z11);
            }
        }
    }

    public void setTimeOut(ViewGroup viewGroup) {
        this.mTimeOut = viewGroup;
    }

    public void setTimeOutListener(com.bytedance.sdk.component.adexpress.dynamic.sya syaVar) {
        this.timeOutListener.add(syaVar);
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dj
    public void setTimeUpdate(int i5) {
        this.videoListener.setTimeUpdate(i5);
    }

    public void setTimedown(int i5) {
        this.timedown = i5;
    }

    public void setVideoListener(com.bytedance.sdk.component.adexpress.dynamic.lud ludVar) {
        this.videoListener = ludVar;
    }

    public void updateRenderInfoForVideo(double d5, double d11, double d12, double d13, float f11) {
        this.renderResult.sya(d5);
        this.renderResult.dj(d11);
        this.renderResult.lud(d12);
        this.renderResult.lt(d13);
        this.renderResult.ycx(f11);
        this.renderResult.zb(f11);
        this.renderResult.sya(f11);
        this.renderResult.dj(f11);
    }

    public void beginShowFromInvisible(lud ludVar, int i5) {
        if (ludVar == null) {
            return;
        }
        if (ludVar.getBeginInvisibleAndShow()) {
            ludVar.setVisibility(i5);
            View view = ludVar.syc;
            if (view != null) {
                view.setVisibility(i5);
            }
        }
        int childCount = ludVar.getChildCount();
        if (childCount <= 0) {
            return;
        }
        for (int i11 = 0; i11 < childCount; i11++) {
            if (ludVar.getChildAt(i11) instanceof lud) {
                beginShowFromInvisible((lud) ludVar.getChildAt(i11), i5);
            }
        }
    }
}

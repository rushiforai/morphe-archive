package com.bytedance.sdk.openadsdk.component.reward.sya.zb;

import android.view.ViewGroup;
import com.bytedance.sdk.openadsdk.component.reward.sya.jw;
import com.bytedance.sdk.openadsdk.core.model.tn;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ul implements jw {
    private tn ycx;

    /* renamed from: zb, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.xkz.lt f24968zb;

    public ul(tn tnVar) {
        this.ycx = tnVar;
    }

    public void ycx(ViewGroup viewGroup) {
        if (!this.ycx.cd() || viewGroup == null) {
            return;
        }
        if (this.f24968zb == null) {
            this.f24968zb = com.bytedance.sdk.openadsdk.core.xkz.lt.ycx();
        }
        this.f24968zb.ycx(viewGroup, this.ycx);
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.sya.jw
    public void ycx(int i5, JSONObject jSONObject) {
        tn tnVar;
        boolean zOptBoolean;
        long jOptLong;
        long j11;
        int iJvd;
        JSONObject jSONObjectOptJSONObject;
        if (this.f24968zb == null || (tnVar = this.ycx) == null) {
            return;
        }
        com.bytedance.sdk.openadsdk.core.model.dj djVarQye = tnVar.qye();
        com.bytedance.sdk.openadsdk.core.xkz.dj djVarYcx = djVarQye != null ? djVarQye.ycx() : null;
        if (jSONObject == null || (jSONObjectOptJSONObject = jSONObject.optJSONObject("params")) == null) {
            zOptBoolean = false;
            jOptLong = 0;
            j11 = 0;
        } else {
            long jOptLong2 = jSONObjectOptJSONObject.optLong("video_duration", 0L);
            zOptBoolean = jSONObjectOptJSONObject.optBoolean("is_mute", false);
            j11 = jOptLong2;
            jOptLong = jSONObjectOptJSONObject.optLong("current_position", 0L);
        }
        if (i5 != 3) {
            switch (i5) {
                case 15:
                    if (this.ycx.tz() == 7) {
                        iJvd = this.ycx.jxj();
                    } else {
                        iJvd = this.ycx.jvd();
                    }
                    com.bytedance.sdk.openadsdk.core.xkz.lt ltVar = this.f24968zb;
                    if (ltVar != null) {
                        ltVar.ycx(iJvd > 0, iJvd / 1000);
                        break;
                    }
                    break;
                case 16:
                    com.bytedance.sdk.openadsdk.core.xkz.lt ltVar2 = this.f24968zb;
                    if (ltVar2 != null) {
                        ltVar2.ycx(j11, zOptBoolean);
                        break;
                    }
                    break;
                case 17:
                    com.bytedance.sdk.openadsdk.core.xkz.lt ltVar3 = this.f24968zb;
                    if (ltVar3 != null) {
                        ltVar3.dj();
                        break;
                    }
                    break;
                default:
                    com.bytedance.sdk.openadsdk.core.xkz.lt ltVar4 = this.f24968zb;
                    if (ltVar4 != null) {
                        ltVar4.ycx(i5);
                        break;
                    }
                    break;
            }
        } else {
            com.bytedance.sdk.openadsdk.core.xkz.lt ltVar5 = this.f24968zb;
            if (ltVar5 != null) {
                ltVar5.sya();
            }
        }
        ycx(i5, djVarYcx, jOptLong, j11, zOptBoolean);
    }

    private void ycx(int i5, com.bytedance.sdk.openadsdk.core.xkz.dj djVar, long j11, long j12, boolean z11) {
        if (djVar == null) {
            return;
        }
        switch (i5) {
            case 0:
                djVar.zb(j11);
                break;
            case 1:
                djVar.sya(j11);
                break;
            case 2:
                djVar.lt(j11);
                djVar.lud(j11);
                break;
            case 3:
                djVar.ycx(j11);
                break;
            case 6:
            case 7:
            case 8:
            case 15:
                djVar.ycx(i5, j11, j12);
                break;
            case 9:
                djVar.dj(j11);
                break;
            case 12:
                if (z11) {
                    djVar.fby(j11);
                    break;
                } else {
                    djVar.jw(j11);
                    break;
                }
            case 13:
                djVar.ul(j11);
                break;
            case 14:
                djVar.ycx(com.bytedance.sdk.openadsdk.core.xkz.ycx.ycx.GENERAL_LINEAR_AD_ERROR);
                break;
        }
    }
}

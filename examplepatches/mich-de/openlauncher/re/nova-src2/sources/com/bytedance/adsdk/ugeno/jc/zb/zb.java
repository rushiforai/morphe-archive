package com.bytedance.adsdk.ugeno.jc.zb;

import android.content.Context;
import android.text.TextUtils;
import android.widget.FrameLayout;
import com.bytedance.adsdk.ugeno.zb.ycx;
import org.json.JSONException;

/* loaded from: classes2.dex */
public class zb extends com.bytedance.adsdk.ugeno.zb.ycx<com.bytedance.adsdk.ugeno.jc.zb.ycx> {

    /* renamed from: qt, reason: collision with root package name */
    private com.bytedance.adsdk.ugeno.jc.zb.ycx f22352qt;

    public static class ycx extends ycx.C0024ycx {

        /* renamed from: hf, reason: collision with root package name */
        protected int f22353hf;

        public ycx(com.bytedance.adsdk.ugeno.zb.ycx ycxVar) {
            super(ycxVar);
            this.f22353hf = -1;
        }

        /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
        /* JADX WARN: Removed duplicated region for block: B:4:0x000e  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        private int zb(String str) {
            str.getClass();
            switch (str) {
                case "bottom":
                    return 80;
                case "center":
                    return 17;
                case "center_vertical":
                    return 16;
                case "top":
                    return 48;
                case "left":
                    return 3;
                case "right":
                    return 5;
                case "center_horizontal":
                    return 1;
                default:
                    return -1;
            }
        }

        @Override // com.bytedance.adsdk.ugeno.zb.ycx.C0024ycx
        public void ycx(Context context, String str, String str2) {
            if (TextUtils.isEmpty(str)) {
                return;
            }
            super.ycx(context, str, str2);
            if (TextUtils.equals(str, "layoutGravity")) {
                this.f22353hf = ycx(str2);
            }
        }

        @Override // com.bytedance.adsdk.ugeno.zb.ycx.C0024ycx
        /* renamed from: zb, reason: merged with bridge method [inline-methods] */
        public FrameLayout.LayoutParams ycx() {
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams((int) this.ycx, (int) this.f22723zb);
            layoutParams.leftMargin = (int) this.f22717lt;
            layoutParams.rightMargin = (int) this.f22722ul;
            layoutParams.topMargin = (int) this.fby;
            layoutParams.bottomMargin = (int) this.f22716jw;
            layoutParams.gravity = this.f22353hf;
            return layoutParams;
        }

        private int ycx(String str) {
            String[] strArrSplit;
            if (TextUtils.isEmpty(str) || (strArrSplit = str.split("\\|")) == null || strArrSplit.length <= 0) {
                return -1;
            }
            int iZb = 0;
            for (String str2 : strArrSplit) {
                iZb |= zb(str2);
            }
            return iZb;
        }
    }

    public zb(Context context) {
        super(context);
    }

    @Override // com.bytedance.adsdk.ugeno.zb.ycx
    public ycx.C0024ycx jc() {
        return new ycx(this);
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    /* renamed from: sya, reason: merged with bridge method [inline-methods] */
    public com.bytedance.adsdk.ugeno.jc.zb.ycx ycx() {
        com.bytedance.adsdk.ugeno.jc.zb.ycx ycxVar = new com.bytedance.adsdk.ugeno.jc.zb.ycx(this.f22701zb);
        this.f22352qt = ycxVar;
        ycxVar.ycx(this);
        return this.f22352qt;
    }

    @Override // com.bytedance.adsdk.ugeno.zb.ycx, com.bytedance.adsdk.ugeno.zb.sya
    public void zb() throws JSONException {
        this.f22352qt.setEventMap(this.f22668kt);
        super.zb();
    }
}

package com.bytedance.sdk.openadsdk.core.widget;

import android.content.Context;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.bykv.vk.openvk.ycx.ycx.ycx.sya.c;
import com.bytedance.sdk.component.utils.wwx;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class thx {

    /* renamed from: dj, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.syc.zb.ycx f26332dj;
    private ViewGroup fby;

    /* renamed from: lt, reason: collision with root package name */
    private boolean f26333lt = false;
    private zb lud;
    private Context sya;

    /* renamed from: ul, reason: collision with root package name */
    private c f26334ul;
    private View ycx;

    /* renamed from: zb, reason: collision with root package name */
    private TextView f26335zb;

    public enum ycx {
        PAUSE_VIDEO,
        RELEASE_VIDEO,
        START_VIDEO
    }

    public interface zb {
        void ea();

        boolean jc();
    }

    private void dj() {
        View view = this.ycx;
        if (view != null) {
            view.setVisibility(8);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sya() {
        if (this.sya == null) {
            return;
        }
        dj();
    }

    private void zb() {
        this.f26334ul = null;
    }

    public void ycx(Context context, ViewGroup viewGroup) {
        if (context == null || viewGroup == null) {
            return;
        }
        this.fby = viewGroup;
        this.sya = com.bytedance.sdk.openadsdk.core.pmi.ycx().getApplicationContext();
    }

    private void ycx(Context context, View view, boolean z11) {
        ViewGroup.LayoutParams layoutParamsYcx;
        if (context == null || view == null || this.ycx != null || (layoutParamsYcx = ycx(this.fby)) == null) {
            return;
        }
        com.bytedance.sdk.openadsdk.syc.lud ludVar = new com.bytedance.sdk.openadsdk.syc.lud(context);
        this.ycx = ludVar;
        ludVar.setLayoutParams(layoutParamsYcx);
        this.fby.addView(this.ycx);
        this.f26335zb = (TextView) this.ycx.findViewById(com.bytedance.sdk.openadsdk.utils.wie.gjv);
        View viewFindViewById = this.ycx.findViewById(com.bytedance.sdk.openadsdk.utils.wie.kfb);
        if (z11) {
            viewFindViewById.setClickable(true);
            viewFindViewById.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.core.widget.thx.1
                @Override // android.view.View.OnClickListener
                public void onClick(View view2) {
                    thx.this.sya();
                    if (thx.this.f26332dj != null) {
                        thx.this.f26332dj.ycx(ycx.START_VIDEO, (String) null);
                    }
                }
            });
        } else {
            viewFindViewById.setOnClickListener(null);
            viewFindViewById.setClickable(false);
        }
    }

    private ViewGroup.LayoutParams ycx(ViewGroup viewGroup) {
        if (viewGroup instanceof RelativeLayout) {
            return new RelativeLayout.LayoutParams(-1, -1);
        }
        if (viewGroup instanceof LinearLayout) {
            return new LinearLayout.LayoutParams(-1, -1);
        }
        if (viewGroup instanceof FrameLayout) {
            return new FrameLayout.LayoutParams(-1, -1);
        }
        return null;
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.syc.zb.ycx ycxVar, zb zbVar) {
        this.lud = zbVar;
        this.f26332dj = ycxVar;
    }

    public boolean ycx(int i5, c cVar, boolean z11) {
        Context context = this.sya;
        if (context == null || cVar == null) {
            return true;
        }
        ycx(context, this.fby, z11);
        this.f26334ul = cVar;
        if (i5 == 1 || i5 == 2) {
            return ycx(i5);
        }
        return true;
    }

    private boolean ycx(int i5) {
        zb zbVar;
        if (ycx() || this.f26333lt) {
            return true;
        }
        if (this.f26332dj != null && (zbVar = this.lud) != null) {
            if (zbVar.jc()) {
                this.f26332dj.lud(null, null);
            }
            this.f26332dj.ycx(ycx.PAUSE_VIDEO, (String) null);
        }
        ycx(this.f26334ul, true);
        return false;
    }

    public void ycx(boolean z11) {
        if (z11) {
            zb();
        }
        dj();
    }

    public boolean ycx() {
        View view = this.ycx;
        return view != null && view.getVisibility() == 0;
    }

    private void ycx(c cVar, boolean z11) {
        View view;
        String str;
        View view2;
        if (cVar == null || (view = this.ycx) == null || this.sya == null || view.getVisibility() == 0) {
            return;
        }
        zb zbVar = this.lud;
        if (zbVar != null) {
            zbVar.ea();
        }
        double dCeil = Math.ceil((cVar.f22185c * 1.0d) / 1048576.0d);
        if (z11) {
            str = String.format(wwx.ycx(this.sya, "tt_video_without_wifi_tips"), Float.valueOf(Double.valueOf(dCeil).floatValue()));
        } else {
            str = wwx.ycx(this.sya, "tt_video_without_wifi_tips") + wwx.ycx(this.sya, "tt_video_bytesize");
        }
        dc.ycx(this.ycx, 0);
        dc.ycx(this.f26335zb, str);
        Log.i("VideoTrafficTipLayout", "showTrafficTipCover: ");
        if (!dc.dj(this.ycx) || (view2 = this.ycx) == null) {
            return;
        }
        view2.bringToFront();
        Log.i("VideoTrafficTipLayout", "showTrafficTipCover: bringToFront");
    }
}

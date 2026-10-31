package com.bytedance.sdk.openadsdk.common;

import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import com.bytedance.sdk.openadsdk.FilterWord;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.sya.jc;
import com.bytedance.sdk.openadsdk.sya.ok;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class wie extends com.bytedance.sdk.openadsdk.core.lt.sya implements jc.zb {

    /* renamed from: dj, reason: collision with root package name */
    private Context f24722dj;

    /* renamed from: lt, reason: collision with root package name */
    private boolean f24723lt;
    private String lud;
    private ycx sya;

    /* renamed from: ul, reason: collision with root package name */
    private final com.bytedance.sdk.openadsdk.sya.jc f24724ul;
    private View ycx;

    /* renamed from: zb, reason: collision with root package name */
    private tn f24725zb;

    public interface ycx {
        void ycx(View view);

        void ycx(FilterWord filterWord);

        void zb(View view);
    }

    public wie(Context context, tn tnVar) {
        this(context.getApplicationContext());
        this.f24725zb = tnVar;
        this.f24722dj = context;
        dj();
        lud();
    }

    private void dj() {
        this.f24724ul.ycx(this.f24725zb.pks());
        this.f24724ul.ycx(this);
    }

    private ok.ycx lt() {
        return new ok.ycx() { // from class: com.bytedance.sdk.openadsdk.common.wie.2
            @Override // com.bytedance.sdk.openadsdk.sya.ok.ycx
            public void sya() {
                wie.this.setVisibility(0);
            }

            @Override // com.bytedance.sdk.openadsdk.sya.ok.ycx
            public void ycx() {
                wie.this.setVisibility(8);
            }

            @Override // com.bytedance.sdk.openadsdk.sya.ok.ycx
            public void zb() {
                wie.this.setVisibility(0);
            }

            @Override // com.bytedance.sdk.openadsdk.sya.ok.ycx
            public void ycx(int i5, FilterWord filterWord, String str) {
                wie.this.f24724ul.sya(str);
                wie.this.setVisibility(0);
            }
        };
    }

    private void lud() {
        com.bytedance.sdk.openadsdk.sya.jc jcVar;
        tn tnVar = this.f24725zb;
        if (tnVar == null || (jcVar = this.f24724ul) == null) {
            return;
        }
        jcVar.ycx(tnVar.hti());
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        com.bytedance.sdk.openadsdk.sya.jc jcVar = this.f24724ul;
        if (jcVar != null) {
            jcVar.ycx();
        }
    }

    public void setCallback(ycx ycxVar) {
        this.sya = ycxVar;
    }

    public void setDislikeSource(String str) {
        this.lud = str;
        this.f24724ul.zb(str);
    }

    public void sya() {
        Context context = this.f24722dj;
        if (context instanceof Activity) {
            boolean zIsFinishing = ((Activity) context).isFinishing();
            com.bytedance.sdk.openadsdk.sya.ok okVar = new com.bytedance.sdk.openadsdk.sya.ok(this.f24722dj, this.f24724ul);
            okVar.ycx(lt());
            okVar.ycx(this.f24725zb);
            if (zIsFinishing || okVar.isShowing()) {
                return;
            }
            okVar.show();
        }
    }

    public void zb() {
        setVisibility(8);
        this.f24723lt = false;
        ycx ycxVar = this.sya;
        if (ycxVar != null) {
            ycxVar.zb(this);
        }
    }

    private void ycx(Context context, AttributeSet attributeSet) {
        setClickable(true);
        setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.common.wie.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (wie.this.f24724ul != null) {
                    wie.this.f24724ul.lud();
                } else {
                    wie.this.zb();
                }
            }
        });
        setBackgroundColor(Color.parseColor("#80000000"));
        this.ycx = new com.bytedance.sdk.openadsdk.sya.jw(context, this.f24724ul);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -2);
        layoutParams.gravity = 17;
        layoutParams.leftMargin = dc.zb(getContext(), 20.0f);
        layoutParams.rightMargin = dc.zb(getContext(), 20.0f);
        this.ycx.setLayoutParams(layoutParams);
        this.ycx.setClickable(true);
        lud();
    }

    public wie(Context context) {
        this(context, (AttributeSet) null);
    }

    public wie(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public wie(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        this.f24723lt = false;
        this.f24724ul = new com.bytedance.sdk.openadsdk.sya.jc();
        ycx(context, attributeSet);
    }

    public void ycx() {
        if (this.ycx.getParent() == null) {
            addView(this.ycx);
        }
        setVisibility(0);
        this.f24723lt = true;
        ycx ycxVar = this.sya;
        if (ycxVar != null) {
            ycxVar.ycx(this);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.sya.jc.zb
    public void ycx(int i5) {
        if (com.bytedance.sdk.openadsdk.sya.jc.f26994zb == i5) {
            FilterWord filterWordZb = this.f24724ul.zb();
            if (filterWordZb == null || com.bytedance.sdk.openadsdk.sya.jc.ycx.equals(filterWordZb)) {
                return;
            }
            ycx ycxVar = this.sya;
            if (ycxVar != null) {
                try {
                    ycxVar.ycx(filterWordZb);
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erSVU4A==", "b9oMkSe1esuJQdJ5hRCsJ1w=", "VOAEmxe5e8aDXt5LiQ==", 145);
                }
            }
            zb();
            return;
        }
        if (com.bytedance.sdk.openadsdk.sya.jc.sya == i5) {
            zb();
        } else if (com.bytedance.sdk.openadsdk.sya.jc.lud == i5) {
            sya();
        }
    }
}

package com.bytedance.sdk.openadsdk.component.jw;

import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.bytedance.sdk.openadsdk.core.jc;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.widget.pmi;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class fby {
    private static boolean ycx;

    /* renamed from: zb, reason: collision with root package name */
    private static Drawable f24785zb;

    /* renamed from: dj, reason: collision with root package name */
    private TextView f24786dj;
    private pmi sya;

    public static Drawable sya() {
        return f24785zb;
    }

    public void ycx(sya syaVar, tn tnVar, float f11, float f12, boolean z11) {
        ViewGroup.LayoutParams layoutParams;
        ViewGroup.LayoutParams layoutParams2;
        if (syaVar != null) {
            this.sya = syaVar.getHostAppIcon();
            this.f24786dj = syaVar.getHostAppName();
            View userInfo = syaVar.getUserInfo();
            if (syaVar instanceof dj) {
                pmi pmiVar = this.sya;
                if (pmiVar != null && (layoutParams2 = pmiVar.getLayoutParams()) != null) {
                    if (tnVar.pvm() == 1) {
                        int iZb = dc.zb(this.sya.getContext(), 40.0f);
                        layoutParams2.width = iZb;
                        layoutParams2.height = iZb;
                    } else {
                        int iZb2 = dc.zb(this.sya.getContext(), 30.0f);
                        layoutParams2.width = iZb2;
                        layoutParams2.height = iZb2;
                    }
                    this.sya.setLayoutParams(layoutParams2);
                }
                if (this.f24786dj != null) {
                    if (tnVar.pvm() == 1) {
                        this.f24786dj.setTextSize(30.0f);
                    } else {
                        this.f24786dj.setTextSize(24.0f);
                    }
                }
                if (userInfo != null && (layoutParams = userInfo.getLayoutParams()) != null) {
                    if (tnVar.pvm() == 1) {
                        layoutParams.height = dc.zb(userInfo.getContext(), 107.0f);
                    } else {
                        layoutParams.height = dc.zb(userInfo.getContext(), 60.0f);
                    }
                    userInfo.setLayoutParams(layoutParams);
                }
            }
            if (userInfo != null) {
                userInfo.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.component.jw.fby.1
                    @Override // android.view.View.OnClickListener
                    public void onClick(View view) {
                    }
                });
            }
        }
    }

    public void zb() {
        if (ycx) {
            return;
        }
        try {
            int iJw = jc.zb().jw();
            if (iJw != 0) {
                f24785zb = com.bytedance.sdk.openadsdk.core.pmi.ycx().getResources().getDrawable(iJw);
            }
            ycx = true;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J/zoVd", "b9oMhROTecKOa9NonxSyAVXoIrkCpWbSlGLSUZwUsg==", "WOYolgidedepSdhT", 115);
            ycx = true;
        }
    }

    public void ycx() {
        String strFby = jc.zb().fby();
        if (TextUtils.isEmpty(strFby)) {
            this.f24786dj.setVisibility(8);
        } else {
            this.f24786dj.setText(strFby);
        }
        zb();
        try {
            Drawable drawable = f24785zb;
            if (drawable == null) {
                this.sya.setVisibility(8);
                return;
            }
            this.sya.setImageDrawable(drawable);
            if (this.f24786dj.getVisibility() == 8) {
                ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) this.sya.getLayoutParams();
                marginLayoutParams.setMargins(0, 0, 0, 0);
                this.sya.setLayoutParams(marginLayoutParams);
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J/zoVd", "b9oMhROTecKOa9NonxSyAVXoIrkCpWbSlGLSUZwUsg==", "WecjkTavbNWpRNFSqBC0KQ==", 100);
            this.sya.setVisibility(8);
        }
    }
}

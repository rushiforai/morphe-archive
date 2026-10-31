package com.bytedance.sdk.openadsdk.core.sya;

import android.util.SparseArray;
import android.view.MotionEvent;
import android.view.View;
import com.bytedance.sdk.openadsdk.core.sya.sya;
import com.bytedance.sdk.openadsdk.utils.wie;

/* loaded from: classes2.dex */
public abstract class ul extends sya {
    private sya sya;
    private final String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final com.bytedance.sdk.openadsdk.core.xkz.ycx f26161zb;

    public ul(String str, com.bytedance.sdk.openadsdk.core.xkz.ycx ycxVar) {
        this(str, ycxVar, null);
    }

    @Override // com.bytedance.sdk.openadsdk.core.sya.sya, android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        return super.onTouch(view, motionEvent);
    }

    public void ycx(sya syaVar) {
        this.sya = syaVar;
    }

    public ul(String str, com.bytedance.sdk.openadsdk.core.xkz.ycx ycxVar, sya syaVar) {
        this.ycx = str;
        this.f26161zb = ycxVar;
        this.sya = syaVar;
    }

    @Override // com.bytedance.sdk.openadsdk.core.sya.sya
    public void ycx(View view, float f11, float f12, float f13, float f14, SparseArray<sya.ycx> sparseArray, boolean z11) {
        com.bytedance.sdk.openadsdk.core.xkz.ycx ycxVar = this.f26161zb;
        if (ycxVar != null) {
            ycxVar.lud(this.ycx);
        }
        if (view != null) {
            if (view.getId() == wie.lud) {
                view.setTag(570425345, "VAST_TITLE");
            } else if (view.getId() == wie.f27204jw) {
                view.setTag(570425345, "VAST_DESCRIPTION");
            } else {
                view.setTag(570425345, this.ycx);
            }
        }
        sya syaVar = this.sya;
        if (syaVar != null) {
            syaVar.f26152dv = this.f26152dv;
            syaVar.oty = this.oty;
            syaVar.f26153hf = this.f26153hf;
            int i5 = this.f26153hf;
            syaVar.tru = i5;
            syaVar.bhi = i5;
            syaVar.ycx(view, f11, f12, f13, f14, sparseArray, z11);
        }
    }
}

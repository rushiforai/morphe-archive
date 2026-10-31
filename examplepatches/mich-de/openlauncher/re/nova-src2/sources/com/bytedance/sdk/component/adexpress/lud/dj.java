package com.bytedance.sdk.component.adexpress.lud;

import android.webkit.JavascriptInterface;
import com.bytedance.sdk.component.utils.bhi;
import com.bytedance.sdk.component.ycx.htf;
import java.lang.ref.WeakReference;

/* loaded from: classes2.dex */
public class dj {
    private WeakReference<htf> ycx;

    /* renamed from: zb, reason: collision with root package name */
    private htf f23637zb;

    public dj(htf htfVar) {
        ycx(htfVar);
    }

    @JavascriptInterface
    public void invokeMethod(String str) {
        htf htfVar;
        htf htfVar2 = this.f23637zb;
        if (htfVar2 != null) {
            htfVar2.invokeMethod(str);
            return;
        }
        WeakReference<htf> weakReference = this.ycx;
        if (weakReference == null || (htfVar = weakReference.get()) == null) {
            return;
        }
        htfVar.invokeMethod(str);
    }

    public void ycx(htf htfVar) {
        if (bhi.ycx()) {
            this.f23637zb = htfVar;
            this.ycx = null;
        } else {
            this.ycx = new WeakReference<>(htfVar);
            this.f23637zb = null;
        }
    }
}

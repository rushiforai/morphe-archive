package com.bytedance.sdk.openadsdk.dj;

import android.os.SystemClock;
import android.text.TextUtils;
import android.webkit.WebBackForwardList;
import android.webkit.WebView;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: classes2.dex */
public class jw {
    private final WebView fby;

    /* renamed from: jc, reason: collision with root package name */
    private long f26520jc;

    /* renamed from: lt, reason: collision with root package name */
    private int f26522lt;
    private final boolean lud;

    /* renamed from: ul, reason: collision with root package name */
    private int f26523ul;
    private final tn ycx;

    /* renamed from: jw, reason: collision with root package name */
    private String f26521jw = "landingpage";

    /* renamed from: zb, reason: collision with root package name */
    private final Map<Integer, Long> f26524zb = new HashMap();
    private final List<Integer> sya = new ArrayList();

    /* renamed from: dj, reason: collision with root package name */
    private final Map<Integer, String> f26519dj = new HashMap();

    public jw(tn tnVar, WebView webView, boolean z11) {
        this.ycx = tnVar;
        this.fby = webView;
        this.lud = z11;
    }

    public void sya(String str) {
        this.f26521jw = str;
    }

    public void ycx(String str, int i5) {
        if (this.lud) {
            i5++;
        }
        if (ycx(true)) {
            sya.ycx(this.ycx, this.f26521jw, this.f26522lt, str, i5);
            this.f26519dj.put(Integer.valueOf(this.f26522lt), str);
            this.f26520jc = SystemClock.elapsedRealtime();
        }
    }

    public void zb(String str) {
        String str2 = this.f26519dj.get(Integer.valueOf(this.f26522lt));
        if (TextUtils.isEmpty(str2)) {
            str2 = b.f42142b;
        }
        String str3 = str2;
        int i5 = this.f26522lt;
        if (i5 > 0) {
            sya.ycx(this.ycx, this.f26521jw, i5, str3, str, 1);
        }
    }

    private void zb(boolean z11) {
        try {
            WebBackForwardList webBackForwardListCopyBackForwardList = this.fby.copyBackForwardList();
            if (webBackForwardListCopyBackForwardList != null) {
                if (z11) {
                    int currentIndex = webBackForwardListCopyBackForwardList.getCurrentIndex();
                    this.f26522lt = currentIndex + 1;
                    if (this.lud) {
                        this.f26522lt = currentIndex + 2;
                        return;
                    }
                    return;
                }
                int currentIndex2 = webBackForwardListCopyBackForwardList.getCurrentIndex();
                this.f26523ul = currentIndex2 + 1;
                if (this.lud) {
                    this.f26523ul = currentIndex2 + 2;
                }
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "evwvnBeuaMCFZtZTiBiuL3fhKg==", "Tv4plBe5StKSWNJTmCGhL17HI5EGpA==", 114);
            htf.sya("ArbitrageLandingLog", th2.toString());
        }
    }

    public void ycx(String str) {
        if (ycx(false)) {
            sya.ycx(this.ycx, this.f26521jw, this.f26522lt, str, SystemClock.elapsedRealtime() - this.f26520jc);
        }
    }

    public void ycx(WebView webView, String str) {
        tn tnVar = this.ycx;
        if (tnVar == null || !com.bytedance.sdk.component.jw.zb.ycx(tnVar.hf().sya(), str)) {
            return;
        }
        String str2 = this.f26519dj.get(Integer.valueOf(this.f26522lt));
        if (TextUtils.isEmpty(str2)) {
            str2 = b.f42142b;
        }
        sya.ycx(this.ycx, this.f26521jw, this.f26522lt, str2, str, 2);
    }

    private boolean ycx(boolean z11) {
        int i5 = z11 ? this.f26522lt : this.f26523ul;
        zb(z11);
        int i11 = z11 ? this.f26522lt : this.f26523ul;
        return i11 > 0 && i11 != i5;
    }
}

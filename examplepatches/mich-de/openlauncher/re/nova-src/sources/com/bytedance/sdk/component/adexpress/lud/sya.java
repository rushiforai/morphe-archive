package com.bytedance.sdk.component.adexpress.lud;

import android.webkit.JavascriptInterface;
import com.bytedance.sdk.component.utils.bhi;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.lang.ref.WeakReference;

/* loaded from: classes2.dex */
public class sya {
    private WeakReference<zb> ycx;

    /* renamed from: zb, reason: collision with root package name */
    private zb f23643zb;

    public sya(zb zbVar) {
        ycx(zbVar);
    }

    @JavascriptInterface
    public String adInfo() {
        zb zbVar;
        zb zbVar2 = this.f23643zb;
        if (zbVar2 != null) {
            return zbVar2.adInfo();
        }
        WeakReference<zb> weakReference = this.ycx;
        return (weakReference == null || (zbVar = weakReference.get()) == null) ? b.f42142b : zbVar.adInfo();
    }

    @JavascriptInterface
    public String appInfo() {
        zb zbVar;
        zb zbVar2 = this.f23643zb;
        if (zbVar2 != null) {
            return zbVar2.appInfo();
        }
        WeakReference<zb> weakReference = this.ycx;
        return (weakReference == null || (zbVar = weakReference.get()) == null) ? b.f42142b : zbVar.appInfo();
    }

    @JavascriptInterface
    public String changeVideoState(String str) {
        zb zbVar;
        zb zbVar2 = this.f23643zb;
        if (zbVar2 != null) {
            return zbVar2.changeVideoState(str);
        }
        WeakReference<zb> weakReference = this.ycx;
        return (weakReference == null || (zbVar = weakReference.get()) == null) ? b.f42142b : zbVar.changeVideoState(str);
    }

    @JavascriptInterface
    public String clickEvent(String str) {
        zb zbVar;
        zb zbVar2 = this.f23643zb;
        if (zbVar2 != null) {
            return zbVar2.clickEvent(str);
        }
        WeakReference<zb> weakReference = this.ycx;
        return (weakReference == null || (zbVar = weakReference.get()) == null) ? b.f42142b : zbVar.clickEvent(str);
    }

    @JavascriptInterface
    public String dynamicTrack(String str) {
        zb zbVar;
        zb zbVar2 = this.f23643zb;
        if (zbVar2 != null) {
            return zbVar2.dynamicTrack(str);
        }
        WeakReference<zb> weakReference = this.ycx;
        return (weakReference == null || (zbVar = weakReference.get()) == null) ? b.f42142b : zbVar.dynamicTrack(str);
    }

    @JavascriptInterface
    public String getCurrentVideoState() {
        zb zbVar;
        zb zbVar2 = this.f23643zb;
        if (zbVar2 != null) {
            return zbVar2.getCurrentVideoState();
        }
        WeakReference<zb> weakReference = this.ycx;
        return (weakReference == null || (zbVar = weakReference.get()) == null) ? b.f42142b : zbVar.getCurrentVideoState();
    }

    @JavascriptInterface
    public String getData(String str) {
        zb zbVar;
        zb zbVar2 = this.f23643zb;
        if (zbVar2 != null) {
            return zbVar2.getData(str);
        }
        WeakReference<zb> weakReference = this.ycx;
        return (weakReference == null || (zbVar = weakReference.get()) == null) ? b.f42142b : zbVar.getData(str);
    }

    @JavascriptInterface
    public String getTemplateInfo() {
        zb zbVar;
        zb zbVar2 = this.f23643zb;
        if (zbVar2 != null) {
            return zbVar2.getTemplateInfo();
        }
        WeakReference<zb> weakReference = this.ycx;
        return (weakReference == null || (zbVar = weakReference.get()) == null) ? b.f42142b : zbVar.getTemplateInfo();
    }

    @JavascriptInterface
    public String initRenderFinish() {
        zb zbVar;
        zb zbVar2 = this.f23643zb;
        if (zbVar2 != null) {
            return zbVar2.initRenderFinish();
        }
        WeakReference<zb> weakReference = this.ycx;
        return (weakReference == null || (zbVar = weakReference.get()) == null) ? b.f42142b : zbVar.initRenderFinish();
    }

    @JavascriptInterface
    public String muteVideo(String str) {
        zb zbVar;
        zb zbVar2 = this.f23643zb;
        if (zbVar2 != null) {
            return zbVar2.muteVideo(str);
        }
        WeakReference<zb> weakReference = this.ycx;
        return (weakReference == null || (zbVar = weakReference.get()) == null) ? b.f42142b : zbVar.muteVideo(str);
    }

    @JavascriptInterface
    public String renderDidFinish(String str) {
        zb zbVar;
        zb zbVar2 = this.f23643zb;
        if (zbVar2 != null) {
            return zbVar2.renderDidFinish(str);
        }
        WeakReference<zb> weakReference = this.ycx;
        return (weakReference == null || (zbVar = weakReference.get()) == null) ? b.f42142b : zbVar.renderDidFinish(str);
    }

    @JavascriptInterface
    public String requestPauseVideo(String str) {
        zb zbVar;
        zb zbVar2 = this.f23643zb;
        if (zbVar2 != null) {
            return zbVar2.ycx(str);
        }
        WeakReference<zb> weakReference = this.ycx;
        return (weakReference == null || (zbVar = weakReference.get()) == null) ? b.f42142b : zbVar.ycx(str);
    }

    @JavascriptInterface
    public String skipVideo() {
        zb zbVar;
        zb zbVar2 = this.f23643zb;
        if (zbVar2 != null) {
            return zbVar2.skipVideo();
        }
        WeakReference<zb> weakReference = this.ycx;
        return (weakReference == null || (zbVar = weakReference.get()) == null) ? b.f42142b : zbVar.skipVideo();
    }

    @JavascriptInterface
    public String videoFrameChanged(String str) {
        zb zbVar;
        zb zbVar2 = this.f23643zb;
        if (zbVar2 != null) {
            return zbVar2.videoFrameChanged(str);
        }
        WeakReference<zb> weakReference = this.ycx;
        return (weakReference == null || (zbVar = weakReference.get()) == null) ? b.f42142b : zbVar.videoFrameChanged(str);
    }

    public void ycx(zb zbVar) {
        if (bhi.ycx()) {
            this.f23643zb = zbVar;
            this.ycx = null;
        } else {
            this.ycx = new WeakReference<>(zbVar);
            this.f23643zb = null;
        }
    }
}

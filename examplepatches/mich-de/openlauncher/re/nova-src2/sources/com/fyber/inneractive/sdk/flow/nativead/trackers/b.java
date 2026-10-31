package com.fyber.inneractive.sdk.flow.nativead.trackers;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.text.TextUtils;
import android.webkit.RenderProcessGoneDetail;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.fyber.inneractive.sdk.network.z;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.web.m;
import java.util.ArrayList;
import java.util.concurrent.ConcurrentLinkedQueue;

/* loaded from: classes3.dex */
public final class b extends WebViewClient implements Handler.Callback {

    /* renamed from: e, reason: collision with root package name */
    public static final String f28252e = IAlog.a(b.class);

    /* renamed from: a, reason: collision with root package name */
    public final ConcurrentLinkedQueue f28253a;

    /* renamed from: b, reason: collision with root package name */
    public c f28254b;

    /* renamed from: c, reason: collision with root package name */
    public m f28255c;

    /* renamed from: d, reason: collision with root package name */
    public Handler f28256d = new Handler(Looper.getMainLooper(), this);

    public b(ArrayList arrayList, c cVar) {
        this.f28253a = new ConcurrentLinkedQueue(arrayList);
        this.f28254b = cVar;
        m mVar = new m();
        mVar.setWebViewClient(this);
        mVar.setVisibility(8);
        mVar.getSettings().setJavaScriptEnabled(true);
        this.f28255c = mVar;
    }

    public final void a() {
        String str;
        Handler handler = this.f28256d;
        if (handler != null) {
            handler.removeMessages(13);
        }
        if (this.f28253a.isEmpty() || this.f28256d == null || this.f28255c == null || (str = (String) this.f28253a.poll()) == null) {
            Handler handler2 = this.f28256d;
            if (handler2 != null) {
                handler2.sendEmptyMessage(12);
                return;
            }
            return;
        }
        if (this.f28256d != null) {
            Message messageObtain = Message.obtain();
            messageObtain.what = 14;
            messageObtain.obj = str;
            this.f28256d.sendMessage(messageObtain);
        }
    }

    @Override // android.os.Handler.Callback
    public final boolean handleMessage(Message message) {
        switch (message.what) {
            case 12:
                c cVar = this.f28254b;
                if (cVar != null) {
                    cVar.b();
                    break;
                }
                break;
            case 13:
                Object obj = message.obj;
                IAlog.b("%sTimeout reached for tracker: %s", f28252e, obj != null ? obj.toString() : "unknown");
                a();
                break;
            case 14:
                Object obj2 = message.obj;
                if (obj2 != null) {
                    String str = f28252e;
                    IAlog.a("%sLoading tracker %s", str, obj2);
                    String string = message.obj.toString();
                    if (this.f28256d != null && this.f28255c != null) {
                        Message messageObtain = Message.obtain();
                        messageObtain.what = 13;
                        messageObtain.obj = string;
                        this.f28256d.sendMessageDelayed(messageObtain, 5000L);
                        this.f28255c.loadDataWithBaseURL(null, string, "text/html", "UTF-8", null);
                        break;
                    } else {
                        IAlog.b("%sWas destroyed. Unable to load JS tracker %s", str, string);
                        break;
                    }
                }
                break;
        }
        return true;
    }

    @Override // android.webkit.WebViewClient
    public final boolean onRenderProcessGone(WebView webView, RenderProcessGoneDetail renderProcessGoneDetail) {
        z.a("WebViewRendererProcessGone", "Encountered WebViewRendererProcessGone while executing native JS tracking", null, null);
        Handler handler = this.f28256d;
        if (handler == null) {
            return true;
        }
        handler.sendEmptyMessage(12);
        return true;
    }

    @Override // android.webkit.WebViewClient
    public final boolean shouldOverrideUrlLoading(WebView webView, String str) {
        if (TextUtils.isEmpty(str) || !str.contains("iaadfinishedloading")) {
            return super.shouldOverrideUrlLoading(webView, str);
        }
        IAlog.a("%sTracker finished", f28252e);
        a();
        return true;
    }
}

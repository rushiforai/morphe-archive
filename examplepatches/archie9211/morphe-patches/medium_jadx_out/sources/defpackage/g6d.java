package defpackage;

import android.content.Context;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.webkit.WebView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class g6d extends WebView {
    public b6d a;
    public boolean b;
    public final GestureDetector c;

    public g6d(Context context) {
        super(context);
        this.b = true;
        getSettings().setJavaScriptEnabled(true);
        getSettings().setLoadWithOverviewMode(false);
        getSettings().setUseWideViewPort(false);
        getSettings().setSupportZoom(true);
        getSettings().setBuiltInZoomControls(true);
        getSettings().setCacheMode(2);
        getSettings().setDomStorageEnabled(true);
        setLayerType(2, null);
        getSettings().setDisplayZoomControls(false);
        setHorizontalScrollBarEnabled(false);
        setVerticalScrollBarEnabled(false);
        this.c = new GestureDetector(context, new bw5(this, 2));
    }

    public final b6d getListener() {
        b6d b6dVar = this.a;
        if (b6dVar != null) {
            return b6dVar;
        }
        g76.g0("listener");
        throw null;
    }

    public final boolean getShouldInterceptTouchEvents() {
        return this.b;
    }

    @Override // android.webkit.WebView, android.view.View
    public final InputConnection onCreateInputConnection(EditorInfo editorInfo) {
        return new f6d(this);
    }

    @Override // android.webkit.WebView, android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        motionEvent.getClass();
        if (this.b) {
            this.c.onTouchEvent(motionEvent);
        }
        return super.onTouchEvent(motionEvent);
    }

    public final void setListener(b6d b6dVar) {
        b6dVar.getClass();
        this.a = b6dVar;
    }

    public final void setShouldInterceptTouchEvents(boolean z) {
        this.b = z;
    }
}

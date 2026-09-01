package defpackage;

import android.content.Context;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.webkit.WebView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class cw5 extends WebView {
    public final GestureDetector a;

    public cw5(Context context) {
        super(context);
        this.a = new GestureDetector(context, new bw5(this, 0));
    }

    @Override // android.webkit.WebView, android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        motionEvent.getClass();
        this.a.onTouchEvent(motionEvent);
        return super.onTouchEvent(motionEvent);
    }
}

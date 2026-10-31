package com.tiktok.appevents.edp.proxy;

import android.view.MotionEvent;
import android.view.View;

/* loaded from: classes4.dex */
public class ProxyOnTouchListener implements View.OnTouchListener {
    ITouchListener listener;
    View.OnTouchListener originOnTouchListener;

    public ProxyOnTouchListener(ITouchListener iTouchListener, View.OnTouchListener onTouchListener) {
        this.listener = iTouchListener;
        this.originOnTouchListener = onTouchListener;
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        View.OnTouchListener onTouchListener = this.originOnTouchListener;
        boolean zOnTouch = onTouchListener != null ? onTouchListener.onTouch(view, motionEvent) : false;
        try {
            ITouchListener iTouchListener = this.listener;
            if (iTouchListener != null) {
                iTouchListener.onTouch(view, motionEvent);
            }
        } catch (Throwable unused) {
        }
        return zOnTouch;
    }
}

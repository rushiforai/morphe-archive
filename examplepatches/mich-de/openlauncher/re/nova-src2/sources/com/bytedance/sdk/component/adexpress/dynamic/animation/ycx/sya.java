package com.bytedance.sdk.component.adexpress.dynamic.animation.ycx;

import android.view.View;
import android.view.ViewGroup;

/* loaded from: classes2.dex */
public class sya {
    private static volatile sya ycx;

    private sya() {
    }

    public static sya ycx() {
        if (ycx == null) {
            synchronized (sya.class) {
                try {
                    if (ycx == null) {
                        ycx = new sya();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return ycx;
    }

    public dj ycx(View view, com.bytedance.sdk.component.adexpress.dynamic.dj.ycx ycxVar) {
        if (ycxVar == null) {
            return null;
        }
        if (view.getParent() != null) {
            ((ViewGroup) view.getParent()).setClipChildren(false);
        }
        if (view.getParent().getParent() != null) {
            ((ViewGroup) view.getParent().getParent()).setClipChildren(false);
        }
        if ("scale".equals(ycxVar.jw())) {
            return new ea(view, ycxVar);
        }
        if ("translate".equals(ycxVar.jw())) {
            return new syc(view, ycxVar);
        }
        if ("ripple".equals(ycxVar.jw())) {
            return new fby(view, ycxVar);
        }
        if ("marquee".equals(ycxVar.jw())) {
            return new ul(view, ycxVar);
        }
        if ("waggle".equals(ycxVar.jw())) {
            return new dy(view, ycxVar);
        }
        if ("shine".equals(ycxVar.jw())) {
            return new ok(view, ycxVar);
        }
        if ("swing".equals(ycxVar.jw())) {
            return new xkz(view, ycxVar);
        }
        if ("fade".equals(ycxVar.jw())) {
            return new ycx(view, ycxVar);
        }
        if ("rubIn".equals(ycxVar.jw())) {
            return new jc(view, ycxVar);
        }
        if ("rotate".equals(ycxVar.jw())) {
            return new jw(view, ycxVar);
        }
        if ("cutIn".equals(ycxVar.jw())) {
            return new lt(view, ycxVar);
        }
        if ("stretch".equals(ycxVar.jw())) {
            return new ry(view, ycxVar);
        }
        if ("bounce".equals(ycxVar.jw())) {
            return new lud(view, ycxVar);
        }
        return null;
    }
}

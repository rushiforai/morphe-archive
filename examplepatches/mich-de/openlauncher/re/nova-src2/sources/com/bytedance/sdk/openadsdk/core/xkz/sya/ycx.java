package com.bytedance.sdk.openadsdk.core.xkz.sya;

import android.content.Context;
import android.graphics.Point;
import android.view.Display;
import android.view.WindowManager;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.utils.dc;
import java.util.HashSet;
import java.util.Set;

/* loaded from: classes2.dex */
public class ycx {
    public static final Set<String> ycx = new HashSet<String>() { // from class: com.bytedance.sdk.openadsdk.core.xkz.sya.ycx.1
        {
            add("image/jpeg");
            add("image/png");
            add("image/bmp");
            add("image/gif");
            add("image/jpg");
        }
    };

    /* renamed from: zb, reason: collision with root package name */
    public static Set<String> f26453zb = new HashSet<String>() { // from class: com.bytedance.sdk.openadsdk.core.xkz.sya.ycx.2
        {
            add("application/x-javascript");
        }
    };

    /* renamed from: com.bytedance.sdk.openadsdk.core.xkz.sya.ycx$ycx, reason: collision with other inner class name */
    public enum EnumC0091ycx {
        NONE,
        IMAGE,
        JAVASCRIPT
    }

    public enum zb {
        HTML_RESOURCE,
        STATIC_RESOURCE,
        IFRAME_RESOURCE
    }

    public static Point ycx(Context context, int i5, int i11, zb zbVar) {
        if (context == null) {
            context = pmi.ycx();
        }
        Point point = new Point(i5, i11);
        Display defaultDisplay = ((WindowManager) context.getSystemService("window")).getDefaultDisplay();
        int width = defaultDisplay.getWidth();
        int height = defaultDisplay.getHeight();
        int iZb = dc.zb(context, i5);
        int iZb2 = dc.zb(context, i11);
        if (iZb > width || iZb2 > height) {
            Point point2 = new Point();
            if (zb.HTML_RESOURCE == zbVar) {
                point2.x = Math.min(width, iZb);
                point2.y = Math.min(height, iZb2);
            } else {
                float f11 = iZb;
                float f12 = f11 / width;
                float f13 = iZb2;
                float f14 = f13 / height;
                if (f12 >= f14) {
                    point2.x = width;
                    point2.y = (int) (f13 / f12);
                } else {
                    point2.x = (int) (f11 / f14);
                    point2.y = height;
                }
            }
            int i12 = point2.x;
            if (i12 >= 0 && point2.y >= 0) {
                point2.x = dc.sya(context, i12);
                point2.y = dc.sya(context, point2.y);
                return point2;
            }
        }
        return point;
    }
}

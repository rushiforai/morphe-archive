package com.facebook.ads.redexgen.X;

import android.view.MotionEvent;
import android.view.View;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;

/* renamed from: com.facebook.ads.redexgen.X.qZ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnTouchListenerC2423qZ implements View.OnTouchListener {
    public static String[] A01 = {"GAoi7e2GZholANKQaFUqWvePU7NxiTqr", "vb8E81bR1MwYS5sOTKIeAzcfatUAeMfq", "tvP0CUNMIqR1dXXZTJqn2kJyLu", "ToPakhSNZce1XoF4x", "vxkDV0qoZKXVVhmoEQOLc8nAr8pWxtMB", InneractiveMediationDefs.GENDER_FEMALE, "JGQHaNdNPurLAe0i", "UkFBXNXpVFfbW7TJtiIq1noSlOflx3YB"};
    public final /* synthetic */ C06715p A00;

    public ViewOnTouchListenerC2423qZ(C06715p c06715p) {
        this.A00 = c06715p;
    }

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View view, MotionEvent motionEvent) {
        if (motionEvent.getX() >= this.A00.A0L.getX() && motionEvent.getX() <= this.A00.A0L.getX() + this.A00.A0L.getWidth() && motionEvent.getY() >= this.A00.A0L.getY()) {
            float y11 = motionEvent.getY();
            float y12 = this.A00.A0L.getY();
            float height = this.A00.A0L.getHeight();
            String[] strArr = A01;
            if (strArr[0].charAt(1) == strArr[4].charAt(1)) {
                throw new RuntimeException();
            }
            A01[3] = "S4gfXsXBmsh8RCg7i";
            if (y11 <= y12 + height) {
                AbstractC2685un abstractC2685un = this.A00.A02;
                String[] strArr2 = A01;
                if (strArr2[2].length() == strArr2[6].length()) {
                    throw new RuntimeException();
                }
                String[] strArr3 = A01;
                strArr3[2] = "wmResHB4042NHBLGv5148RREE8";
                strArr3[6] = "yh3nhQx57G08pdLl";
                if (abstractC2685un != null) {
                    this.A00.A02.dispatchTouchEvent(motionEvent);
                    return true;
                }
                return true;
            }
            return false;
        }
        return false;
    }
}

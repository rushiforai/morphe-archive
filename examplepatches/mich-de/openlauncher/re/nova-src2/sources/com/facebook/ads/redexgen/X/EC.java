package com.facebook.ads.redexgen.X;

import android.graphics.drawable.Drawable;
import android.util.Log;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import androidx.annotation.ReplaceWith;
import androidx.core.R;
import androidx.core.view.ViewPropertyAnimatorCompat;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.WeakHashMap;

/* loaded from: assets/audience_network/classes.dex */
public abstract class EC {
    public static WeakHashMap<View, ViewPropertyAnimatorCompat> A00;
    public static boolean A01;
    public static boolean A02;
    public static byte[] A03;
    public static String[] A04 = {"AZ1GzXwLivRm6MP5bNjVDsL3c35Y4E5j", "QF76NzmmwdTWwAK4Zp7ww2LfrX7e4oLt", "TaS82rJuoSCRpkBhV9F8e5LDpn6AsUlS", "hU1wETHxFLmJP2WkQCDWN7V7f0b9Nzua", "a2Omd77K8tL0Q6TObxpW1klVM7klkqr3", "HjN73G6iT8CGx71OIN0BQCESvUtmeaFT", "ZSGefGLBUQEEbWxzEQjP9o", "6XsezYL8OV3CCZ3"};
    public static final DY A05;
    public static final ViewTreeObserverOnGlobalLayoutListenerC0863Dq A06;
    public static final int[] A07;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 60);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A03 = new byte[]{-79, -11, 0, -10, 4, -79, -1, 0, 5, -79, -9, 6, -3, -3, 10, -79, -6, -2, 1, -3, -10, -2, -10, -1, 5, -79, -25, -6, -10, 8, -31, -14, 3, -10, -1, 5, -109, -90, -94, -76, -128, -84, -86, -83, -98, -79, 27, 29, 29, 31, 45, 45, 35, 28, 35, 38, 35, 46, 51};
    }

    static {
        A03();
        A00 = null;
        A01 = false;
        A02 = true;
        A07 = new int[]{R.id.accessibility_custom_action_0, R.id.accessibility_custom_action_1, R.id.accessibility_custom_action_2, R.id.accessibility_custom_action_3, R.id.accessibility_custom_action_4, R.id.accessibility_custom_action_5, R.id.accessibility_custom_action_6, R.id.accessibility_custom_action_7, R.id.accessibility_custom_action_8, R.id.accessibility_custom_action_9, R.id.accessibility_custom_action_10, R.id.accessibility_custom_action_11, R.id.accessibility_custom_action_12, R.id.accessibility_custom_action_13, R.id.accessibility_custom_action_14, R.id.accessibility_custom_action_15, R.id.accessibility_custom_action_16, R.id.accessibility_custom_action_17, R.id.accessibility_custom_action_18, R.id.accessibility_custom_action_19, R.id.accessibility_custom_action_20, R.id.accessibility_custom_action_21, R.id.accessibility_custom_action_22, R.id.accessibility_custom_action_23, R.id.accessibility_custom_action_24, R.id.accessibility_custom_action_25, R.id.accessibility_custom_action_26, R.id.accessibility_custom_action_27, R.id.accessibility_custom_action_28, R.id.accessibility_custom_action_29, R.id.accessibility_custom_action_30, R.id.accessibility_custom_action_31};
        A05 = new DY() { // from class: com.facebook.ads.redexgen.X.VU
        };
        A06 = new ViewTreeObserverOnGlobalLayoutListenerC0863Dq();
    }

    public static AbstractC0864Dr<CharSequence> A00() {
        return new VT(R.id.tag_accessibility_pane_title, CharSequence.class, 8, 28);
    }

    public static CharSequence A01(View view) {
        return A00().A01(view);
    }

    public static void A04(View view) {
        if (view.getImportantForAccessibility() == 0) {
            view.setImportantForAccessibility(1);
        }
    }

    public static void A05(View view, int i5) {
        AccessibilityManager accessibilityManager = (AccessibilityManager) view.getContext().getSystemService(A02(46, 13, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE));
        if (!accessibilityManager.isEnabled()) {
            return;
        }
        boolean z11 = A01(view) != null && view.isShown() && view.getWindowVisibility() == 0;
        if (view.getAccessibilityLiveRegion() != 0 || z11) {
            AccessibilityEvent accessibilityEventObtain = AccessibilityEvent.obtain();
            String[] strArr = A04;
            if (strArr[4].charAt(19) != strArr[3].charAt(19)) {
                throw new RuntimeException();
            }
            A04[7] = "iUa4xNcZlvpWr6I";
            accessibilityEventObtain.setEventType(z11 ? 32 : 2048);
            accessibilityEventObtain.setContentChangeTypes(i5);
            if (z11) {
                accessibilityEventObtain.getText().add(A01(view));
                A04(view);
            }
            view.sendAccessibilityEventUnchecked(accessibilityEventObtain);
            return;
        }
        if (i5 == 32) {
            AccessibilityEvent event = AccessibilityEvent.obtain();
            view.onInitializeAccessibilityEvent(event);
            event.setEventType(32);
            event.setContentChangeTypes(i5);
            event.setSource(view);
            view.onPopulateAccessibilityEvent(event);
            event.getText().add(A01(view));
            accessibilityManager.sendAccessibilityEvent(event);
            return;
        }
        if (view.getParent() != null) {
            try {
                view.getParent().notifySubtreeAccessibilityStateChanged(view, view, i5);
            } catch (AbstractMethodError e3) {
                Log.e(A02(36, 10, 1), view.getParent().getClass().getSimpleName() + A02(0, 36, 85), e3);
            }
        }
    }

    @ReplaceWith
    @Deprecated
    public static void A06(View view, Drawable drawable) {
        view.setBackground(drawable);
    }
}

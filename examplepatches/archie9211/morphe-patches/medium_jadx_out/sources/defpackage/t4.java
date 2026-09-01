package defpackage;

import android.R;
import android.os.Build;
import android.view.accessibility.AccessibilityNodeInfo;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t4 {
    public static final t4 e;
    public static final t4 f;
    public static final t4 g;
    public static final t4 h;
    public static final t4 i;
    public static final t4 j;
    public static final t4 k;
    public static final t4 l;
    public static final t4 m;
    public static final t4 n;
    public static final t4 o;
    public static final t4 p;
    public final Object a;
    public final int b;
    public final Class c;
    public final l5 d;

    static {
        AccessibilityNodeInfo.AccessibilityAction accessibilityActionA = null;
        new t4(1, (String) null);
        new t4(2, (String) null);
        new t4(4, (String) null);
        new t4(8, (String) null);
        new t4(16, (String) null);
        new t4(32, (String) null);
        e = new t4(64, (String) null);
        f = new t4(128, (String) null);
        new t4(256, e5.class);
        new t4(512, e5.class);
        new t4(1024, f5.class);
        new t4(RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH, f5.class);
        g = new t4(4096, (String) null);
        h = new t4(8192, (String) null);
        new t4(OlympusMakernoteDirectory.TAG_MAIN_INFO, (String) null);
        new t4(32768, (String) null);
        new t4(ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID, (String) null);
        new t4(131072, j5.class);
        i = new t4(262144, (String) null);
        new t4(524288, (String) null);
        j = new t4(1048576, (String) null);
        new t4(2097152, k5.class);
        new t4(AccessibilityNodeInfo.AccessibilityAction.ACTION_SHOW_ON_SCREEN, R.id.accessibilityActionShowOnScreen, null, null, null);
        k = new t4(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_TO_POSITION, R.id.accessibilityActionScrollToPosition, null, null, h5.class);
        l = new t4(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_UP, R.id.accessibilityActionScrollUp, null, null, null);
        m = new t4(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_LEFT, R.id.accessibilityActionScrollLeft, null, null, null);
        n = new t4(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_DOWN, R.id.accessibilityActionScrollDown, null, null, null);
        o = new t4(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_RIGHT, R.id.accessibilityActionScrollRight, null, null, null);
        int i2 = Build.VERSION.SDK_INT;
        new t4(i2 >= 29 ? AccessibilityNodeInfo.AccessibilityAction.ACTION_PAGE_UP : null, R.id.accessibilityActionPageUp, null, null, null);
        new t4(i2 >= 29 ? AccessibilityNodeInfo.AccessibilityAction.ACTION_PAGE_DOWN : null, R.id.accessibilityActionPageDown, null, null, null);
        new t4(i2 >= 29 ? AccessibilityNodeInfo.AccessibilityAction.ACTION_PAGE_LEFT : null, R.id.accessibilityActionPageLeft, null, null, null);
        new t4(i2 >= 29 ? AccessibilityNodeInfo.AccessibilityAction.ACTION_PAGE_RIGHT : null, R.id.accessibilityActionPageRight, null, null, null);
        new t4(AccessibilityNodeInfo.AccessibilityAction.ACTION_CONTEXT_CLICK, R.id.accessibilityActionContextClick, null, null, null);
        new t4(i2 >= 24 ? AccessibilityNodeInfo.AccessibilityAction.ACTION_SET_PROGRESS : null, R.id.accessibilityActionSetProgress, null, null, i5.class);
        new t4(i2 >= 26 ? AccessibilityNodeInfo.AccessibilityAction.ACTION_MOVE_WINDOW : null, R.id.accessibilityActionMoveWindow, null, null, g5.class);
        new t4(i2 >= 28 ? AccessibilityNodeInfo.AccessibilityAction.ACTION_SHOW_TOOLTIP : null, R.id.accessibilityActionShowTooltip, null, null, null);
        new t4(i2 >= 28 ? AccessibilityNodeInfo.AccessibilityAction.ACTION_HIDE_TOOLTIP : null, R.id.accessibilityActionHideTooltip, null, null, null);
        new t4(i2 >= 30 ? AccessibilityNodeInfo.AccessibilityAction.ACTION_PRESS_AND_HOLD : null, R.id.accessibilityActionPressAndHold, null, null, null);
        new t4(i2 >= 30 ? AccessibilityNodeInfo.AccessibilityAction.ACTION_IME_ENTER : null, R.id.accessibilityActionImeEnter, null, null, null);
        new t4(i2 >= 32 ? AccessibilityNodeInfo.AccessibilityAction.ACTION_DRAG_START : null, R.id.accessibilityActionDragStart, null, null, null);
        new t4(i2 >= 32 ? AccessibilityNodeInfo.AccessibilityAction.ACTION_DRAG_DROP : null, R.id.accessibilityActionDragDrop, null, null, null);
        new t4(i2 >= 32 ? AccessibilityNodeInfo.AccessibilityAction.ACTION_DRAG_CANCEL : null, R.id.accessibilityActionDragCancel, null, null, null);
        new t4(i2 >= 33 ? AccessibilityNodeInfo.AccessibilityAction.ACTION_SHOW_TEXT_SUGGESTIONS : null, R.id.accessibilityActionShowTextSuggestions, null, null, null);
        p = new t4(i2 >= 34 ? m4.k() : null, R.id.accessibilityActionScrollInDirection, null, null, null);
        int i3 = c01.a;
        if (i2 >= 36 && b01.a() >= 3600001) {
            accessibilityActionA = x4.a();
        }
        new t4(accessibilityActionA, R.id.ALT, null, null, null);
    }

    public t4(Object obj, int i2, CharSequence charSequence, l5 l5Var, Class cls) {
        this.b = i2;
        this.d = l5Var;
        if (obj == null) {
            this.a = new AccessibilityNodeInfo.AccessibilityAction(i2, charSequence);
        } else {
            this.a = obj;
        }
        this.c = cls;
    }

    public final int a() {
        return ((AccessibilityNodeInfo.AccessibilityAction) this.a).getId();
    }

    public final boolean equals(Object obj) {
        if (obj == null || !(obj instanceof t4)) {
            return false;
        }
        Object obj2 = ((t4) obj).a;
        Object obj3 = this.a;
        return obj3 == null ? obj2 == null : obj3.equals(obj2);
    }

    public final int hashCode() {
        Object obj = this.a;
        if (obj != null) {
            return obj.hashCode();
        }
        return 0;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("AccessibilityActionCompat: ");
        String strD = y4.d(this.b);
        if (strD.equals("ACTION_UNKNOWN")) {
            Object obj = this.a;
            if (((AccessibilityNodeInfo.AccessibilityAction) obj).getLabel() != null) {
                strD = ((AccessibilityNodeInfo.AccessibilityAction) obj).getLabel().toString();
            }
        }
        sb.append(strD);
        return sb.toString();
    }

    public t4(int i2, Class cls) {
        this(null, i2, null, null, cls);
    }

    public t4(int i2, String str) {
        this(null, i2, str, null, null);
    }
}

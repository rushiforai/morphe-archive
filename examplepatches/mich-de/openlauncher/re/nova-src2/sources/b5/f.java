package b5;

import android.os.Handler;
import android.os.Looper;
import android.view.accessibility.AccessibilityNodeInfo;
import fe.q1;
import java.util.HashMap;
import m.w;

/* loaded from: classes2.dex */
public final class f implements dn.b {

    /* renamed from: b, reason: collision with root package name */
    public static f f17549b;

    /* renamed from: a, reason: collision with root package name */
    public Object f17550a;

    public /* synthetic */ f(Object obj) {
        this.f17550a = obj;
    }

    public static f a(Object obj) {
        if (obj != null) {
            return new f(obj);
        }
        throw new NullPointerException("instance cannot be null");
    }

    public static com.google.android.exoplayer2.drm.a b(q1 q1Var) {
        new w(21);
        q1Var.getClass();
        new HashMap();
        throw null;
    }

    public static f i(float f11, float f12, float f13) {
        return new f(AccessibilityNodeInfo.RangeInfo.obtain(1, f11, f12, f13));
    }

    public static f j(int i5, int i11, int i12, boolean z11) {
        return new f(AccessibilityNodeInfo.CollectionInfo.obtain(i5, i11, z11, i12));
    }

    public static f k(boolean z11, boolean z12, int i5, int i11, int i12, int i13) {
        return new f(AccessibilityNodeInfo.CollectionItemInfo.obtain(i5, i11, i12, i13, z11, z12));
    }

    public int c() {
        return ((AccessibilityNodeInfo.CollectionItemInfo) this.f17550a).getColumnIndex();
    }

    public int d() {
        return ((AccessibilityNodeInfo.CollectionItemInfo) this.f17550a).getColumnSpan();
    }

    public int e() {
        return ((AccessibilityNodeInfo.CollectionItemInfo) this.f17550a).getRowIndex();
    }

    public int f() {
        return ((AccessibilityNodeInfo.CollectionItemInfo) this.f17550a).getRowSpan();
    }

    public boolean g() {
        return ((AccessibilityNodeInfo.CollectionItemInfo) this.f17550a).isHeading();
    }

    @Override // w60.a
    public Object get() {
        return this.f17550a;
    }

    public boolean h() {
        return ((AccessibilityNodeInfo.CollectionItemInfo) this.f17550a).isSelected();
    }

    public f(int i5) {
        switch (i5) {
            case 5:
                this.f17550a = new Object();
                break;
            default:
                this.f17550a = new Object();
                new Handler(Looper.getMainLooper(), new dk.d(this, 0));
                break;
        }
    }
}

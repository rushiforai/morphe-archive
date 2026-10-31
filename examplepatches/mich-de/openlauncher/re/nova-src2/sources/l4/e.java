package l4;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import b.c0;
import java.lang.reflect.Constructor;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes2.dex */
public final class e extends ViewGroup.MarginLayoutParams {

    /* renamed from: a, reason: collision with root package name */
    public b f74696a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f74697b;

    /* renamed from: c, reason: collision with root package name */
    public final int f74698c;

    /* renamed from: d, reason: collision with root package name */
    public final int f74699d;

    /* renamed from: e, reason: collision with root package name */
    public final int f74700e;

    /* renamed from: f, reason: collision with root package name */
    public final int f74701f;

    /* renamed from: g, reason: collision with root package name */
    public final int f74702g;

    /* renamed from: h, reason: collision with root package name */
    public int f74703h;

    /* renamed from: i, reason: collision with root package name */
    public int f74704i;

    /* renamed from: j, reason: collision with root package name */
    public int f74705j;

    /* renamed from: k, reason: collision with root package name */
    public View f74706k;

    /* renamed from: l, reason: collision with root package name */
    public View f74707l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f74708m;
    public boolean n;
    public boolean o;

    /* renamed from: p, reason: collision with root package name */
    public final Rect f74709p;

    public e(int i5, int i11) {
        super(i5, i11);
        this.f74697b = false;
        this.f74698c = 0;
        this.f74699d = 0;
        this.f74700e = -1;
        this.f74701f = -1;
        this.f74702g = 0;
        this.f74703h = 0;
        this.f74709p = new Rect();
    }

    public final boolean a(int i5) {
        if (i5 == 0) {
            return this.f74708m;
        }
        if (i5 != 1) {
            return false;
        }
        return this.n;
    }

    public final void b(b bVar) {
        b bVar2 = this.f74696a;
        if (bVar2 != bVar) {
            if (bVar2 != null) {
                bVar2.j();
            }
            this.f74696a = bVar;
            this.f74697b = true;
            if (bVar != null) {
                bVar.g(this);
            }
        }
    }

    public e(Context context, AttributeSet attributeSet) throws NoSuchMethodException, SecurityException {
        b bVar;
        super(context, attributeSet);
        this.f74697b = false;
        this.f74698c = 0;
        this.f74699d = 0;
        this.f74700e = -1;
        this.f74701f = -1;
        this.f74702g = 0;
        this.f74703h = 0;
        this.f74709p = new Rect();
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, k4.a.f71097b);
        this.f74698c = typedArrayObtainStyledAttributes.getInteger(0, 0);
        this.f74701f = typedArrayObtainStyledAttributes.getResourceId(1, -1);
        this.f74699d = typedArrayObtainStyledAttributes.getInteger(2, 0);
        this.f74700e = typedArrayObtainStyledAttributes.getInteger(6, -1);
        this.f74702g = typedArrayObtainStyledAttributes.getInt(5, 0);
        this.f74703h = typedArrayObtainStyledAttributes.getInt(4, 0);
        boolean zHasValue = typedArrayObtainStyledAttributes.hasValue(3);
        this.f74697b = zHasValue;
        if (zHasValue) {
            String string = typedArrayObtainStyledAttributes.getString(3);
            String str = CoordinatorLayout.f14194t;
            if (TextUtils.isEmpty(string)) {
                bVar = null;
            } else {
                if (string.startsWith(".")) {
                    string = context.getPackageName() + string;
                } else if (string.indexOf(46) < 0) {
                    String str2 = CoordinatorLayout.f14194t;
                    if (!TextUtils.isEmpty(str2)) {
                        string = a2.c.g('.', str2, string);
                    }
                }
                try {
                    ThreadLocal threadLocal = CoordinatorLayout.f14196v;
                    Map map = (Map) threadLocal.get();
                    if (map == null) {
                        map = new HashMap();
                        threadLocal.set(map);
                    }
                    Constructor<?> constructor = (Constructor) map.get(string);
                    if (constructor == null) {
                        constructor = Class.forName(string, false, context.getClassLoader()).getConstructor(CoordinatorLayout.f14195u);
                        constructor.setAccessible(true);
                        map.put(string, constructor);
                    }
                    bVar = (b) constructor.newInstance(context, attributeSet);
                } catch (Exception e3) {
                    throw new RuntimeException(c0.k("Could not inflate Behavior subclass ", string), e3);
                }
            }
            this.f74696a = bVar;
        }
        typedArrayObtainStyledAttributes.recycle();
        b bVar2 = this.f74696a;
        if (bVar2 != null) {
            bVar2.g(this);
        }
    }

    public e(e eVar) {
        super((ViewGroup.MarginLayoutParams) eVar);
        this.f74697b = false;
        this.f74698c = 0;
        this.f74699d = 0;
        this.f74700e = -1;
        this.f74701f = -1;
        this.f74702g = 0;
        this.f74703h = 0;
        this.f74709p = new Rect();
    }

    public e(ViewGroup.MarginLayoutParams marginLayoutParams) {
        super(marginLayoutParams);
        this.f74697b = false;
        this.f74698c = 0;
        this.f74699d = 0;
        this.f74700e = -1;
        this.f74701f = -1;
        this.f74702g = 0;
        this.f74703h = 0;
        this.f74709p = new Rect();
    }

    public e(ViewGroup.LayoutParams layoutParams) {
        super(layoutParams);
        this.f74697b = false;
        this.f74698c = 0;
        this.f74699d = 0;
        this.f74700e = -1;
        this.f74701f = -1;
        this.f74702g = 0;
        this.f74703h = 0;
        this.f74709p = new Rect();
    }
}

package j4;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import androidx.constraintlayout.widget.ConstraintLayout;
import java.util.Arrays;
import java.util.HashMap;

/* loaded from: classes2.dex */
public abstract class c extends View {

    /* renamed from: a, reason: collision with root package name */
    public int[] f68905a;

    /* renamed from: b, reason: collision with root package name */
    public int f68906b;

    /* renamed from: c, reason: collision with root package name */
    public Context f68907c;

    /* renamed from: d, reason: collision with root package name */
    public g4.i f68908d;

    /* renamed from: e, reason: collision with root package name */
    public String f68909e;

    /* renamed from: f, reason: collision with root package name */
    public String f68910f;

    /* renamed from: g, reason: collision with root package name */
    public HashMap f68911g;

    /* JADX WARN: Removed duplicated region for block: B:26:0x004c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(String str) throws IllegalAccessException, Resources.NotFoundException, IllegalArgumentException {
        int identifier;
        HashMap map;
        Context context = this.f68907c;
        if (str == null || str.length() == 0 || context == null) {
            return;
        }
        String strTrim = str.trim();
        ConstraintLayout constraintLayout = getParent() instanceof ConstraintLayout ? (ConstraintLayout) getParent() : null;
        if (!isInEditMode() || constraintLayout == null) {
            identifier = 0;
        } else {
            Object obj = (strTrim == null || (map = constraintLayout.f14192l) == null || !map.containsKey(strTrim)) ? null : constraintLayout.f14192l.get(strTrim);
            if (obj instanceof Integer) {
                identifier = ((Integer) obj).intValue();
            }
        }
        if (identifier == 0 && constraintLayout != null) {
            identifier = f(constraintLayout, strTrim);
        }
        if (identifier == 0) {
            try {
                identifier = o.class.getField(strTrim).getInt(null);
            } catch (Exception unused) {
            }
        }
        if (identifier == 0) {
            identifier = context.getResources().getIdentifier(strTrim, "id", context.getPackageName());
        }
        if (identifier != 0) {
            this.f68911g.put(Integer.valueOf(identifier), strTrim);
            b(identifier);
        } else {
            Log.w("ConstraintHelper", "Could not find id of \"" + strTrim + "\"");
        }
    }

    public final void b(int i5) {
        if (i5 == getId()) {
            return;
        }
        int i11 = this.f68906b + 1;
        int[] iArr = this.f68905a;
        if (i11 > iArr.length) {
            this.f68905a = Arrays.copyOf(iArr, iArr.length * 2);
        }
        int[] iArr2 = this.f68905a;
        int i12 = this.f68906b;
        iArr2[i12] = i5;
        this.f68906b = i12 + 1;
    }

    public final void c(String str) {
        if (str == null || str.length() == 0 || this.f68907c == null) {
            return;
        }
        String strTrim = str.trim();
        ConstraintLayout constraintLayout = getParent() instanceof ConstraintLayout ? (ConstraintLayout) getParent() : null;
        if (constraintLayout == null) {
            Log.w("ConstraintHelper", "Parent not a ConstraintLayout");
            return;
        }
        int childCount = constraintLayout.getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            View childAt = constraintLayout.getChildAt(i5);
            ViewGroup.LayoutParams layoutParams = childAt.getLayoutParams();
            if ((layoutParams instanceof e) && strTrim.equals(((e) layoutParams).Y)) {
                if (childAt.getId() == -1) {
                    Log.w("ConstraintHelper", "to use ConstraintTag view " + childAt.getClass().getSimpleName() + " must have an ID");
                } else {
                    b(childAt.getId());
                }
            }
        }
    }

    public final void d(ConstraintLayout constraintLayout) {
        int visibility = getVisibility();
        float elevation = getElevation();
        for (int i5 = 0; i5 < this.f68906b; i5++) {
            View view = (View) constraintLayout.f14181a.get(this.f68905a[i5]);
            if (view != null) {
                view.setVisibility(visibility);
                if (elevation > 0.0f) {
                    view.setTranslationZ(view.getTranslationZ() + elevation);
                }
            }
        }
    }

    public void e(ConstraintLayout constraintLayout) {
    }

    public final int f(ConstraintLayout constraintLayout, String str) throws Resources.NotFoundException {
        Resources resources;
        String resourceEntryName;
        if (str != null && (resources = this.f68907c.getResources()) != null) {
            int childCount = constraintLayout.getChildCount();
            for (int i5 = 0; i5 < childCount; i5++) {
                View childAt = constraintLayout.getChildAt(i5);
                if (childAt.getId() != -1) {
                    try {
                        resourceEntryName = resources.getResourceEntryName(childAt.getId());
                    } catch (Resources.NotFoundException unused) {
                        resourceEntryName = null;
                    }
                    if (str.equals(resourceEntryName)) {
                        return childAt.getId();
                    }
                }
            }
        }
        return 0;
    }

    public abstract void g(g4.d dVar, boolean z11);

    public final void h(String str) throws IllegalAccessException, Resources.NotFoundException, IllegalArgumentException {
        this.f68909e = str;
        if (str == null) {
            return;
        }
        int i5 = 0;
        this.f68906b = 0;
        while (true) {
            int iIndexOf = str.indexOf(44, i5);
            if (iIndexOf == -1) {
                a(str.substring(i5));
                return;
            } else {
                a(str.substring(i5, iIndexOf));
                i5 = iIndexOf + 1;
            }
        }
    }

    public final void i(String str) {
        this.f68910f = str;
        if (str == null) {
            return;
        }
        int i5 = 0;
        this.f68906b = 0;
        while (true) {
            int iIndexOf = str.indexOf(44, i5);
            if (iIndexOf == -1) {
                c(str.substring(i5));
                return;
            } else {
                c(str.substring(i5, iIndexOf));
                i5 = iIndexOf + 1;
            }
        }
    }

    public final void j(int[] iArr) {
        this.f68909e = null;
        this.f68906b = 0;
        for (int i5 : iArr) {
            b(i5);
        }
    }

    public final void k() {
        if (this.f68908d == null) {
            return;
        }
        ViewGroup.LayoutParams layoutParams = getLayoutParams();
        if (layoutParams instanceof e) {
            ((e) layoutParams).f68942p0 = this.f68908d;
        }
    }

    @Override // android.view.View
    public void onAttachedToWindow() throws IllegalAccessException, Resources.NotFoundException, IllegalArgumentException {
        super.onAttachedToWindow();
        String str = this.f68909e;
        if (str != null) {
            h(str);
        }
        String str2 = this.f68910f;
        if (str2 != null) {
            i(str2);
        }
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
    }

    @Override // android.view.View
    public void onMeasure(int i5, int i11) {
        setMeasuredDimension(0, 0);
    }

    @Override // android.view.View
    public final void setTag(int i5, Object obj) {
        super.setTag(i5, obj);
        if (obj == null && this.f68909e == null) {
            b(i5);
        }
    }
}

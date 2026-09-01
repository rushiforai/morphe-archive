package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import androidx.constraintlayout.widget.ConstraintLayout;
import com.datadog.android.core.yjCm.PqkdNGCEoxOKZk;
import java.util.Arrays;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class p52 extends View {
    public int[] a;
    public int b;
    public Context c;
    public bn0 d;
    public String e;
    public String f;
    public HashMap g;

    public p52(Context context) {
        super(context);
        this.a = new int[32];
        this.g = new HashMap();
        this.c = context;
        g(null);
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x004e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void a(java.lang.String r6) {
        /*
            r5 = this;
            android.content.Context r0 = r5.c
            int r1 = r6.length()
            if (r1 != 0) goto La
            goto L9a
        La:
            if (r0 != 0) goto Le
            goto L9a
        Le:
            java.lang.String r6 = r6.trim()
            android.view.ViewParent r1 = r5.getParent()
            boolean r1 = r1 instanceof androidx.constraintlayout.widget.ConstraintLayout
            r2 = 0
            if (r1 == 0) goto L22
            android.view.ViewParent r1 = r5.getParent()
            androidx.constraintlayout.widget.ConstraintLayout r1 = (androidx.constraintlayout.widget.ConstraintLayout) r1
            goto L23
        L22:
            r1 = r2
        L23:
            boolean r3 = r5.isInEditMode()
            if (r3 == 0) goto L4e
            if (r1 == 0) goto L4e
            boolean r3 = defpackage.y30.C(r6)
            if (r3 == 0) goto L42
            java.util.HashMap r3 = r1.m
            if (r3 == 0) goto L42
            boolean r3 = r3.containsKey(r6)
            if (r3 == 0) goto L42
            java.util.HashMap r3 = r1.m
            java.lang.Object r3 = r3.get(r6)
            goto L43
        L42:
            r3 = r2
        L43:
            boolean r4 = r3 instanceof java.lang.Integer
            if (r4 == 0) goto L4e
            java.lang.Integer r3 = (java.lang.Integer) r3
            int r3 = r3.intValue()
            goto L4f
        L4e:
            r3 = 0
        L4f:
            if (r3 != 0) goto L57
            if (r1 == 0) goto L57
            int r3 = r5.f(r1, r6)
        L57:
            if (r3 != 0) goto L63
            java.lang.Class<sra> r1 = defpackage.sra.class
            java.lang.reflect.Field r1 = r1.getField(r6)     // Catch: java.lang.Exception -> L63
            int r3 = r1.getInt(r2)     // Catch: java.lang.Exception -> L63
        L63:
            if (r3 != 0) goto L73
            android.content.res.Resources r1 = r0.getResources()
            java.lang.String r2 = "id"
            java.lang.String r0 = r0.getPackageName()
            int r3 = r1.getIdentifier(r6, r2, r0)
        L73:
            if (r3 == 0) goto L82
            java.util.HashMap r0 = r5.g
            java.lang.Integer r1 = java.lang.Integer.valueOf(r3)
            r0.put(r1, r6)
            r5.b(r3)
            goto L9a
        L82:
            java.lang.StringBuilder r5 = new java.lang.StringBuilder
            java.lang.String r0 = "Could not find id of \""
            r5.<init>(r0)
            r5.append(r6)
            java.lang.String r6 = "\""
            r5.append(r6)
            java.lang.String r5 = r5.toString()
            java.lang.String r6 = "ConstraintHelper"
            android.util.Log.w(r6, r5)
        L9a:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.p52.a(java.lang.String):void");
    }

    public final void b(int i) {
        if (i == getId()) {
            return;
        }
        int i2 = this.b + 1;
        int[] iArrCopyOf = this.a;
        if (i2 > iArrCopyOf.length) {
            iArrCopyOf = Arrays.copyOf(iArrCopyOf, iArrCopyOf.length * 2);
            this.a = iArrCopyOf;
        }
        int i3 = this.b;
        iArrCopyOf[i3] = i;
        this.b = i3 + 1;
    }

    public final void d(ConstraintLayout constraintLayout) {
        int visibility = getVisibility();
        float elevation = getElevation();
        for (int i = 0; i < this.b; i++) {
            View view = (View) constraintLayout.a.get(this.a[i]);
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

    public final int f(ConstraintLayout constraintLayout, String str) {
        Resources resources;
        String resourceEntryName;
        if (str != null && (resources = this.c.getResources()) != null) {
            int childCount = constraintLayout.getChildCount();
            for (int i = 0; i < childCount; i++) {
                View childAt = constraintLayout.getChildAt(i);
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

    public void g(AttributeSet attributeSet) {
        if (attributeSet != null) {
            TypedArray typedArrayObtainStyledAttributes = getContext().obtainStyledAttributes(attributeSet, xra.b);
            int indexCount = typedArrayObtainStyledAttributes.getIndexCount();
            for (int i = 0; i < indexCount; i++) {
                int index = typedArrayObtainStyledAttributes.getIndex(i);
                if (index == 35) {
                    String string = typedArrayObtainStyledAttributes.getString(index);
                    this.e = string;
                    setIds(string);
                } else if (index == 36) {
                    String string2 = typedArrayObtainStyledAttributes.getString(index);
                    this.f = string2;
                    setReferenceTags(string2);
                }
            }
            typedArrayObtainStyledAttributes.recycle();
        }
    }

    public int[] getReferencedIds() {
        return Arrays.copyOf(this.a, this.b);
    }

    public void h(b72 b72Var, boolean z) {
    }

    public void i() {
    }

    public final void j() {
        if (this.d == null) {
            return;
        }
        ViewGroup.LayoutParams layoutParams = getLayoutParams();
        if (layoutParams instanceof t52) {
            ((t52) layoutParams).p0 = this.d;
        }
    }

    @Override // android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        String str = this.e;
        if (str != null) {
            setIds(str);
        }
        String str2 = this.f;
        if (str2 != null) {
            setReferenceTags(str2);
        }
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
    }

    @Override // android.view.View
    public final void onMeasure(int i, int i2) {
        setMeasuredDimension(0, 0);
    }

    public void setIds(String str) {
        this.e = str;
        if (str == null) {
            return;
        }
        int i = 0;
        this.b = 0;
        while (true) {
            int iIndexOf = str.indexOf(44, i);
            if (iIndexOf == -1) {
                a(str.substring(i));
                return;
            } else {
                a(str.substring(i, iIndexOf));
                i = iIndexOf + 1;
            }
        }
    }

    public void setReferenceTags(String str) {
        this.f = str;
        if (str == null) {
            return;
        }
        int i = 0;
        this.b = 0;
        while (true) {
            int iIndexOf = str.indexOf(44, i);
            if (iIndexOf == -1) {
                c(str.substring(i));
                return;
            } else {
                c(str.substring(i, iIndexOf));
                i = iIndexOf + 1;
            }
        }
    }

    public void setReferencedIds(int[] iArr) {
        this.e = null;
        this.b = 0;
        for (int i : iArr) {
            b(i);
        }
    }

    @Override // android.view.View
    public final void setTag(int i, Object obj) {
        super.setTag(i, obj);
        if (obj == null && this.e == null) {
            b(i);
        }
    }

    public final void c(String str) {
        ConstraintLayout constraintLayout;
        if (str.length() != 0 && this.c != null) {
            String strTrim = str.trim();
            if (getParent() instanceof ConstraintLayout) {
                constraintLayout = (ConstraintLayout) getParent();
            } else {
                constraintLayout = null;
            }
            String str2 = PqkdNGCEoxOKZk.ssKWSVUSQh;
            if (constraintLayout == null) {
                Log.w(str2, "Parent not a ConstraintLayout");
                return;
            }
            int childCount = constraintLayout.getChildCount();
            for (int i = 0; i < childCount; i++) {
                View childAt = constraintLayout.getChildAt(i);
                ViewGroup.LayoutParams layoutParams = childAt.getLayoutParams();
                if ((layoutParams instanceof t52) && strTrim.equals(((t52) layoutParams).Y)) {
                    if (childAt.getId() == -1) {
                        Log.w(str2, "to use ConstraintTag view " + childAt.getClass().getSimpleName() + " must have an ID");
                    } else {
                        b(childAt.getId());
                    }
                }
            }
        }
    }
}

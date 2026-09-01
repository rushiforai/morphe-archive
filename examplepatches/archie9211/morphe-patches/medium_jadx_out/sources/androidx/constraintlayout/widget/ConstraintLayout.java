package androidx.constraintlayout.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.util.SparseIntArray;
import android.view.View;
import android.view.ViewGroup;
import defpackage.a62;
import defpackage.b72;
import defpackage.c72;
import defpackage.g72;
import defpackage.i7c;
import defpackage.j62;
import defpackage.k52;
import defpackage.lig;
import defpackage.p52;
import defpackage.rh5;
import defpackage.s52;
import defpackage.sh5;
import defpackage.t52;
import defpackage.u11;
import defpackage.u52;
import defpackage.wz6;
import defpackage.xra;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import org.xmlpull.v1.XmlPullParserException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ConstraintLayout extends ViewGroup {
    public static i7c p;
    public final SparseArray a;
    public final ArrayList b;
    public final c72 c;
    public int d;
    public int e;
    public int f;
    public int g;
    public boolean h;
    public int i;
    public j62 j;
    public lig k;
    public int l;
    public HashMap m;
    public final SparseArray n;
    public final u52 o;

    public ConstraintLayout(Context context) {
        super(context);
        this.a = new SparseArray();
        this.b = new ArrayList(4);
        this.c = new c72();
        this.d = 0;
        this.e = 0;
        this.f = Integer.MAX_VALUE;
        this.g = Integer.MAX_VALUE;
        this.h = true;
        this.i = 257;
        this.j = null;
        this.k = null;
        this.l = -1;
        this.m = new HashMap();
        this.n = new SparseArray();
        this.o = new u52(this, this);
        c(null);
    }

    public static t52 a() {
        t52 t52Var = new t52(-2, -2);
        t52Var.a = -1;
        t52Var.b = -1;
        t52Var.c = -1.0f;
        t52Var.d = true;
        t52Var.e = -1;
        t52Var.f = -1;
        t52Var.g = -1;
        t52Var.h = -1;
        t52Var.i = -1;
        t52Var.j = -1;
        t52Var.k = -1;
        t52Var.l = -1;
        t52Var.m = -1;
        t52Var.n = -1;
        t52Var.o = -1;
        t52Var.p = -1;
        t52Var.q = 0;
        t52Var.r = 0.0f;
        t52Var.s = -1;
        t52Var.t = -1;
        t52Var.u = -1;
        t52Var.v = -1;
        t52Var.w = Integer.MIN_VALUE;
        t52Var.x = Integer.MIN_VALUE;
        t52Var.y = Integer.MIN_VALUE;
        t52Var.z = Integer.MIN_VALUE;
        t52Var.A = Integer.MIN_VALUE;
        t52Var.B = Integer.MIN_VALUE;
        t52Var.C = Integer.MIN_VALUE;
        t52Var.D = 0;
        t52Var.E = 0.5f;
        t52Var.F = 0.5f;
        t52Var.G = null;
        t52Var.H = -1.0f;
        t52Var.I = -1.0f;
        t52Var.J = 0;
        t52Var.K = 0;
        t52Var.L = 0;
        t52Var.M = 0;
        t52Var.N = 0;
        t52Var.O = 0;
        t52Var.P = 0;
        t52Var.Q = 0;
        t52Var.R = 1.0f;
        t52Var.S = 1.0f;
        t52Var.T = -1;
        t52Var.U = -1;
        t52Var.V = -1;
        t52Var.W = false;
        t52Var.X = false;
        t52Var.Y = null;
        t52Var.Z = 0;
        t52Var.a0 = true;
        t52Var.b0 = true;
        t52Var.c0 = false;
        t52Var.d0 = false;
        t52Var.e0 = false;
        t52Var.f0 = -1;
        t52Var.g0 = -1;
        t52Var.h0 = -1;
        t52Var.i0 = -1;
        t52Var.j0 = Integer.MIN_VALUE;
        t52Var.k0 = Integer.MIN_VALUE;
        t52Var.l0 = 0.5f;
        t52Var.p0 = new b72();
        return t52Var;
    }

    private int getPaddingWidth() {
        int iMax = Math.max(0, getPaddingRight()) + Math.max(0, getPaddingLeft());
        int iMax2 = Math.max(0, getPaddingEnd()) + Math.max(0, getPaddingStart());
        return iMax2 > 0 ? iMax2 : iMax;
    }

    public static i7c getSharedValues() {
        i7c i7cVar = p;
        if (i7cVar != null) {
            return i7cVar;
        }
        i7c i7cVar2 = new i7c();
        new SparseIntArray();
        new HashMap();
        p = i7cVar2;
        return i7cVar2;
    }

    public final b72 b(View view) {
        if (view == this) {
            return this.c;
        }
        if (view == null) {
            return null;
        }
        if (view.getLayoutParams() instanceof t52) {
            return ((t52) view.getLayoutParams()).p0;
        }
        view.setLayoutParams(generateLayoutParams(view.getLayoutParams()));
        if (view.getLayoutParams() instanceof t52) {
            return ((t52) view.getLayoutParams()).p0;
        }
        return null;
    }

    public final void c(AttributeSet attributeSet) {
        c72 c72Var = this.c;
        c72Var.h0 = this;
        u52 u52Var = this.o;
        c72Var.v0 = u52Var;
        c72Var.t0.h = u52Var;
        this.a.put(getId(), this);
        this.j = null;
        if (attributeSet != null) {
            TypedArray typedArrayObtainStyledAttributes = getContext().obtainStyledAttributes(attributeSet, xra.b, 0, 0);
            int indexCount = typedArrayObtainStyledAttributes.getIndexCount();
            for (int i = 0; i < indexCount; i++) {
                int index = typedArrayObtainStyledAttributes.getIndex(i);
                if (index == 16) {
                    this.d = typedArrayObtainStyledAttributes.getDimensionPixelOffset(index, this.d);
                } else if (index == 17) {
                    this.e = typedArrayObtainStyledAttributes.getDimensionPixelOffset(index, this.e);
                } else if (index == 14) {
                    this.f = typedArrayObtainStyledAttributes.getDimensionPixelOffset(index, this.f);
                } else if (index == 15) {
                    this.g = typedArrayObtainStyledAttributes.getDimensionPixelOffset(index, this.g);
                } else if (index == 113) {
                    this.i = typedArrayObtainStyledAttributes.getInt(index, this.i);
                } else if (index == 56) {
                    int resourceId = typedArrayObtainStyledAttributes.getResourceId(index, 0);
                    if (resourceId != 0) {
                        try {
                            d(resourceId);
                        } catch (Resources.NotFoundException unused) {
                            this.k = null;
                        }
                    }
                } else if (index == 34) {
                    int resourceId2 = typedArrayObtainStyledAttributes.getResourceId(index, 0);
                    try {
                        j62 j62Var = new j62();
                        this.j = j62Var;
                        j62Var.e(getContext(), resourceId2);
                    } catch (Resources.NotFoundException unused2) {
                        this.j = null;
                    }
                    this.l = resourceId2;
                }
            }
            typedArrayObtainStyledAttributes.recycle();
        }
        c72Var.E0 = this.i;
        wz6.q = c72Var.c0(512);
    }

    @Override // android.view.ViewGroup
    public final boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof t52;
    }

    public final void d(int i) {
        String str;
        Context context = getContext();
        lig ligVar = new lig(14);
        ligVar.b = new SparseArray();
        ligVar.c = new SparseArray();
        XmlResourceParser xml = context.getResources().getXml(i);
        try {
            u11 u11Var = null;
            for (int eventType = xml.getEventType(); eventType != 1; eventType = xml.next()) {
                if (eventType == 2) {
                    String name = xml.getName();
                    switch (name.hashCode()) {
                        case -1349929691:
                            if (name.equals("ConstraintSet")) {
                                ligVar.i0(context, xml);
                            }
                            break;
                        case 80204913:
                            if (name.equals("State")) {
                                u11 u11Var2 = new u11(context, xml);
                                ((SparseArray) ligVar.b).put(u11Var2.b, u11Var2);
                                u11Var = u11Var2;
                            }
                            break;
                        case 1382829617:
                            str = "StateSet";
                            name.equals(str);
                            break;
                        case 1657696882:
                            str = "layoutDescription";
                            name.equals(str);
                            break;
                        case 1901439077:
                            if (name.equals("Variant")) {
                                a62 a62Var = new a62(context, xml);
                                if (u11Var != null) {
                                    ((ArrayList) u11Var.d).add(a62Var);
                                }
                            }
                            break;
                    }
                }
            }
        } catch (IOException e) {
            Log.e("ConstraintLayoutStates", "Error parsing resource: " + i, e);
        } catch (XmlPullParserException e2) {
            Log.e("ConstraintLayoutStates", "Error parsing resource: " + i, e2);
        }
        this.k = ligVar;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchDraw(Canvas canvas) {
        Object tag;
        int size;
        ArrayList arrayList = this.b;
        if (arrayList != null && (size = arrayList.size()) > 0) {
            for (int i = 0; i < size; i++) {
                ((p52) arrayList.get(i)).getClass();
            }
        }
        super.dispatchDraw(canvas);
        if (isInEditMode()) {
            float width = getWidth();
            float height = getHeight();
            int childCount = getChildCount();
            for (int i2 = 0; i2 < childCount; i2++) {
                View childAt = getChildAt(i2);
                if (childAt.getVisibility() != 8 && (tag = childAt.getTag()) != null && (tag instanceof String)) {
                    String[] strArrSplit = ((String) tag).split(",");
                    if (strArrSplit.length == 4) {
                        int i3 = Integer.parseInt(strArrSplit[0]);
                        int i4 = Integer.parseInt(strArrSplit[1]);
                        int i5 = Integer.parseInt(strArrSplit[2]);
                        int i6 = (int) ((i3 / 1080.0f) * width);
                        int i7 = (int) ((i4 / 1920.0f) * height);
                        Paint paint = new Paint();
                        paint.setColor(-65536);
                        float f = i6;
                        float f2 = i7;
                        float f3 = i6 + ((int) ((i5 / 1080.0f) * width));
                        canvas.drawLine(f, f2, f3, f2, paint);
                        float f4 = i7 + ((int) ((Integer.parseInt(strArrSplit[3]) / 1920.0f) * height));
                        canvas.drawLine(f3, f2, f3, f4, paint);
                        canvas.drawLine(f3, f4, f, f4, paint);
                        canvas.drawLine(f, f4, f, f2, paint);
                        paint.setColor(-16711936);
                        canvas.drawLine(f, f2, f3, f4, paint);
                        canvas.drawLine(f, f4, f3, f2, paint);
                    }
                }
            }
        }
    }

    public final void e(b72 b72Var, t52 t52Var, SparseArray sparseArray, int i, k52 k52Var) {
        View view = (View) this.a.get(i);
        b72 b72Var2 = (b72) sparseArray.get(i);
        if (b72Var2 == null || view == null || !(view.getLayoutParams() instanceof t52)) {
            return;
        }
        t52Var.c0 = true;
        k52 k52Var2 = k52.BASELINE;
        if (k52Var == k52Var2) {
            t52 t52Var2 = (t52) view.getLayoutParams();
            t52Var2.c0 = true;
            t52Var2.p0.F = true;
        }
        b72Var.j(k52Var2).b(b72Var2.j(k52Var), t52Var.D, t52Var.C, true);
        b72Var.F = true;
        b72Var.j(k52.TOP).j();
        b72Var.j(k52.BOTTOM).j();
    }

    @Override // android.view.View
    public final void forceLayout() {
        this.h = true;
        super.forceLayout();
    }

    @Override // android.view.ViewGroup
    public final /* bridge */ /* synthetic */ ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return a();
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        Context context = getContext();
        t52 t52Var = new t52(context, attributeSet);
        t52Var.a = -1;
        t52Var.b = -1;
        t52Var.c = -1.0f;
        t52Var.d = true;
        t52Var.e = -1;
        t52Var.f = -1;
        t52Var.g = -1;
        t52Var.h = -1;
        t52Var.i = -1;
        t52Var.j = -1;
        t52Var.k = -1;
        t52Var.l = -1;
        t52Var.m = -1;
        t52Var.n = -1;
        t52Var.o = -1;
        t52Var.p = -1;
        t52Var.q = 0;
        t52Var.r = 0.0f;
        t52Var.s = -1;
        t52Var.t = -1;
        t52Var.u = -1;
        t52Var.v = -1;
        t52Var.w = Integer.MIN_VALUE;
        t52Var.x = Integer.MIN_VALUE;
        t52Var.y = Integer.MIN_VALUE;
        t52Var.z = Integer.MIN_VALUE;
        t52Var.A = Integer.MIN_VALUE;
        t52Var.B = Integer.MIN_VALUE;
        t52Var.C = Integer.MIN_VALUE;
        t52Var.D = 0;
        t52Var.E = 0.5f;
        t52Var.F = 0.5f;
        t52Var.G = null;
        t52Var.H = -1.0f;
        t52Var.I = -1.0f;
        t52Var.J = 0;
        t52Var.K = 0;
        t52Var.L = 0;
        t52Var.M = 0;
        t52Var.N = 0;
        t52Var.O = 0;
        t52Var.P = 0;
        t52Var.Q = 0;
        t52Var.R = 1.0f;
        t52Var.S = 1.0f;
        t52Var.T = -1;
        t52Var.U = -1;
        t52Var.V = -1;
        t52Var.W = false;
        t52Var.X = false;
        t52Var.Y = null;
        t52Var.Z = 0;
        t52Var.a0 = true;
        t52Var.b0 = true;
        t52Var.c0 = false;
        t52Var.d0 = false;
        t52Var.e0 = false;
        t52Var.f0 = -1;
        t52Var.g0 = -1;
        t52Var.h0 = -1;
        t52Var.i0 = -1;
        t52Var.j0 = Integer.MIN_VALUE;
        t52Var.k0 = Integer.MIN_VALUE;
        t52Var.l0 = 0.5f;
        t52Var.p0 = new b72();
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, xra.b);
        int indexCount = typedArrayObtainStyledAttributes.getIndexCount();
        for (int i = 0; i < indexCount; i++) {
            int index = typedArrayObtainStyledAttributes.getIndex(i);
            int i2 = s52.a.get(index);
            switch (i2) {
                case 1:
                    t52Var.V = typedArrayObtainStyledAttributes.getInt(index, t52Var.V);
                    break;
                case 2:
                    int resourceId = typedArrayObtainStyledAttributes.getResourceId(index, t52Var.p);
                    t52Var.p = resourceId;
                    if (resourceId == -1) {
                        t52Var.p = typedArrayObtainStyledAttributes.getInt(index, -1);
                    }
                    break;
                case 3:
                    t52Var.q = typedArrayObtainStyledAttributes.getDimensionPixelSize(index, t52Var.q);
                    break;
                case 4:
                    float f = typedArrayObtainStyledAttributes.getFloat(index, t52Var.r) % 360.0f;
                    t52Var.r = f;
                    if (f < 0.0f) {
                        t52Var.r = (360.0f - f) % 360.0f;
                    }
                    break;
                case 5:
                    t52Var.a = typedArrayObtainStyledAttributes.getDimensionPixelOffset(index, t52Var.a);
                    break;
                case 6:
                    t52Var.b = typedArrayObtainStyledAttributes.getDimensionPixelOffset(index, t52Var.b);
                    break;
                case 7:
                    t52Var.c = typedArrayObtainStyledAttributes.getFloat(index, t52Var.c);
                    break;
                case 8:
                    int resourceId2 = typedArrayObtainStyledAttributes.getResourceId(index, t52Var.e);
                    t52Var.e = resourceId2;
                    if (resourceId2 == -1) {
                        t52Var.e = typedArrayObtainStyledAttributes.getInt(index, -1);
                    }
                    break;
                case 9:
                    int resourceId3 = typedArrayObtainStyledAttributes.getResourceId(index, t52Var.f);
                    t52Var.f = resourceId3;
                    if (resourceId3 == -1) {
                        t52Var.f = typedArrayObtainStyledAttributes.getInt(index, -1);
                    }
                    break;
                case 10:
                    int resourceId4 = typedArrayObtainStyledAttributes.getResourceId(index, t52Var.g);
                    t52Var.g = resourceId4;
                    if (resourceId4 == -1) {
                        t52Var.g = typedArrayObtainStyledAttributes.getInt(index, -1);
                    }
                    break;
                case 11:
                    int resourceId5 = typedArrayObtainStyledAttributes.getResourceId(index, t52Var.h);
                    t52Var.h = resourceId5;
                    if (resourceId5 == -1) {
                        t52Var.h = typedArrayObtainStyledAttributes.getInt(index, -1);
                    }
                    break;
                case 12:
                    int resourceId6 = typedArrayObtainStyledAttributes.getResourceId(index, t52Var.i);
                    t52Var.i = resourceId6;
                    if (resourceId6 == -1) {
                        t52Var.i = typedArrayObtainStyledAttributes.getInt(index, -1);
                    }
                    break;
                case 13:
                    int resourceId7 = typedArrayObtainStyledAttributes.getResourceId(index, t52Var.j);
                    t52Var.j = resourceId7;
                    if (resourceId7 == -1) {
                        t52Var.j = typedArrayObtainStyledAttributes.getInt(index, -1);
                    }
                    break;
                case 14:
                    int resourceId8 = typedArrayObtainStyledAttributes.getResourceId(index, t52Var.k);
                    t52Var.k = resourceId8;
                    if (resourceId8 == -1) {
                        t52Var.k = typedArrayObtainStyledAttributes.getInt(index, -1);
                    }
                    break;
                case 15:
                    int resourceId9 = typedArrayObtainStyledAttributes.getResourceId(index, t52Var.l);
                    t52Var.l = resourceId9;
                    if (resourceId9 == -1) {
                        t52Var.l = typedArrayObtainStyledAttributes.getInt(index, -1);
                    }
                    break;
                case 16:
                    int resourceId10 = typedArrayObtainStyledAttributes.getResourceId(index, t52Var.m);
                    t52Var.m = resourceId10;
                    if (resourceId10 == -1) {
                        t52Var.m = typedArrayObtainStyledAttributes.getInt(index, -1);
                    }
                    break;
                case 17:
                    int resourceId11 = typedArrayObtainStyledAttributes.getResourceId(index, t52Var.s);
                    t52Var.s = resourceId11;
                    if (resourceId11 == -1) {
                        t52Var.s = typedArrayObtainStyledAttributes.getInt(index, -1);
                    }
                    break;
                case 18:
                    int resourceId12 = typedArrayObtainStyledAttributes.getResourceId(index, t52Var.t);
                    t52Var.t = resourceId12;
                    if (resourceId12 == -1) {
                        t52Var.t = typedArrayObtainStyledAttributes.getInt(index, -1);
                    }
                    break;
                case 19:
                    int resourceId13 = typedArrayObtainStyledAttributes.getResourceId(index, t52Var.u);
                    t52Var.u = resourceId13;
                    if (resourceId13 == -1) {
                        t52Var.u = typedArrayObtainStyledAttributes.getInt(index, -1);
                    }
                    break;
                case 20:
                    int resourceId14 = typedArrayObtainStyledAttributes.getResourceId(index, t52Var.v);
                    t52Var.v = resourceId14;
                    if (resourceId14 == -1) {
                        t52Var.v = typedArrayObtainStyledAttributes.getInt(index, -1);
                    }
                    break;
                case 21:
                    t52Var.w = typedArrayObtainStyledAttributes.getDimensionPixelSize(index, t52Var.w);
                    break;
                case 22:
                    t52Var.x = typedArrayObtainStyledAttributes.getDimensionPixelSize(index, t52Var.x);
                    break;
                case 23:
                    t52Var.y = typedArrayObtainStyledAttributes.getDimensionPixelSize(index, t52Var.y);
                    break;
                case 24:
                    t52Var.z = typedArrayObtainStyledAttributes.getDimensionPixelSize(index, t52Var.z);
                    break;
                case 25:
                    t52Var.A = typedArrayObtainStyledAttributes.getDimensionPixelSize(index, t52Var.A);
                    break;
                case 26:
                    t52Var.B = typedArrayObtainStyledAttributes.getDimensionPixelSize(index, t52Var.B);
                    break;
                case 27:
                    t52Var.W = typedArrayObtainStyledAttributes.getBoolean(index, t52Var.W);
                    break;
                case 28:
                    t52Var.X = typedArrayObtainStyledAttributes.getBoolean(index, t52Var.X);
                    break;
                case 29:
                    t52Var.E = typedArrayObtainStyledAttributes.getFloat(index, t52Var.E);
                    break;
                case 30:
                    t52Var.F = typedArrayObtainStyledAttributes.getFloat(index, t52Var.F);
                    break;
                case 31:
                    int i3 = typedArrayObtainStyledAttributes.getInt(index, 0);
                    t52Var.L = i3;
                    if (i3 == 1) {
                        Log.e("ConstraintLayout", "layout_constraintWidth_default=\"wrap\" is deprecated.\nUse layout_width=\"WRAP_CONTENT\" and layout_constrainedWidth=\"true\" instead.");
                    }
                    break;
                case 32:
                    int i4 = typedArrayObtainStyledAttributes.getInt(index, 0);
                    t52Var.M = i4;
                    if (i4 == 1) {
                        Log.e("ConstraintLayout", "layout_constraintHeight_default=\"wrap\" is deprecated.\nUse layout_height=\"WRAP_CONTENT\" and layout_constrainedHeight=\"true\" instead.");
                    }
                    break;
                case 33:
                    try {
                        t52Var.N = typedArrayObtainStyledAttributes.getDimensionPixelSize(index, t52Var.N);
                    } catch (Exception unused) {
                        if (typedArrayObtainStyledAttributes.getInt(index, t52Var.N) == -2) {
                            t52Var.N = -2;
                        }
                    }
                    break;
                case 34:
                    try {
                        t52Var.P = typedArrayObtainStyledAttributes.getDimensionPixelSize(index, t52Var.P);
                    } catch (Exception unused2) {
                        if (typedArrayObtainStyledAttributes.getInt(index, t52Var.P) == -2) {
                            t52Var.P = -2;
                        }
                    }
                    break;
                case 35:
                    t52Var.R = Math.max(0.0f, typedArrayObtainStyledAttributes.getFloat(index, t52Var.R));
                    t52Var.L = 2;
                    break;
                case 36:
                    try {
                        t52Var.O = typedArrayObtainStyledAttributes.getDimensionPixelSize(index, t52Var.O);
                    } catch (Exception unused3) {
                        if (typedArrayObtainStyledAttributes.getInt(index, t52Var.O) == -2) {
                            t52Var.O = -2;
                        }
                    }
                    break;
                case 37:
                    try {
                        t52Var.Q = typedArrayObtainStyledAttributes.getDimensionPixelSize(index, t52Var.Q);
                    } catch (Exception unused4) {
                        if (typedArrayObtainStyledAttributes.getInt(index, t52Var.Q) == -2) {
                            t52Var.Q = -2;
                        }
                    }
                    break;
                case 38:
                    t52Var.S = Math.max(0.0f, typedArrayObtainStyledAttributes.getFloat(index, t52Var.S));
                    t52Var.M = 2;
                    break;
                default:
                    switch (i2) {
                        case 44:
                            j62.h(t52Var, typedArrayObtainStyledAttributes.getString(index));
                            break;
                        case 45:
                            t52Var.H = typedArrayObtainStyledAttributes.getFloat(index, t52Var.H);
                            break;
                        case 46:
                            t52Var.I = typedArrayObtainStyledAttributes.getFloat(index, t52Var.I);
                            break;
                        case 47:
                            t52Var.J = typedArrayObtainStyledAttributes.getInt(index, 0);
                            break;
                        case 48:
                            t52Var.K = typedArrayObtainStyledAttributes.getInt(index, 0);
                            break;
                        case 49:
                            t52Var.T = typedArrayObtainStyledAttributes.getDimensionPixelOffset(index, t52Var.T);
                            break;
                        case 50:
                            t52Var.U = typedArrayObtainStyledAttributes.getDimensionPixelOffset(index, t52Var.U);
                            break;
                        case 51:
                            t52Var.Y = typedArrayObtainStyledAttributes.getString(index);
                            break;
                        case 52:
                            int resourceId15 = typedArrayObtainStyledAttributes.getResourceId(index, t52Var.n);
                            t52Var.n = resourceId15;
                            if (resourceId15 == -1) {
                                t52Var.n = typedArrayObtainStyledAttributes.getInt(index, -1);
                            }
                            break;
                        case 53:
                            int resourceId16 = typedArrayObtainStyledAttributes.getResourceId(index, t52Var.o);
                            t52Var.o = resourceId16;
                            if (resourceId16 == -1) {
                                t52Var.o = typedArrayObtainStyledAttributes.getInt(index, -1);
                            }
                            break;
                        case 54:
                            t52Var.D = typedArrayObtainStyledAttributes.getDimensionPixelSize(index, t52Var.D);
                            break;
                        case 55:
                            t52Var.C = typedArrayObtainStyledAttributes.getDimensionPixelSize(index, t52Var.C);
                            break;
                        default:
                            switch (i2) {
                                case 64:
                                    j62.g(t52Var, typedArrayObtainStyledAttributes, index, 0);
                                    break;
                                case 65:
                                    j62.g(t52Var, typedArrayObtainStyledAttributes, index, 1);
                                    break;
                                case 66:
                                    t52Var.Z = typedArrayObtainStyledAttributes.getInt(index, t52Var.Z);
                                    break;
                                case 67:
                                    t52Var.d = typedArrayObtainStyledAttributes.getBoolean(index, t52Var.d);
                                    break;
                            }
                            break;
                    }
                    break;
            }
        }
        typedArrayObtainStyledAttributes.recycle();
        t52Var.a();
        return t52Var;
    }

    public int getMaxHeight() {
        return this.g;
    }

    public int getMaxWidth() {
        return this.f;
    }

    public int getMinHeight() {
        return this.e;
    }

    public int getMinWidth() {
        return this.d;
    }

    public int getOptimizationLevel() {
        return this.c.E0;
    }

    public String getSceneString() {
        int id;
        StringBuilder sb = new StringBuilder();
        c72 c72Var = this.c;
        if (c72Var.k == null) {
            int id2 = getId();
            if (id2 != -1) {
                c72Var.k = getContext().getResources().getResourceEntryName(id2);
            } else {
                c72Var.k = "parent";
            }
        }
        if (c72Var.j0 == null) {
            c72Var.j0 = c72Var.k;
            Log.v("ConstraintLayout", " setDebugName " + c72Var.j0);
        }
        for (b72 b72Var : c72Var.r0) {
            View view = (View) b72Var.h0;
            if (view != null) {
                if (b72Var.k == null && (id = view.getId()) != -1) {
                    b72Var.k = getContext().getResources().getResourceEntryName(id);
                }
                if (b72Var.j0 == null) {
                    b72Var.j0 = b72Var.k;
                    Log.v("ConstraintLayout", " setDebugName " + b72Var.j0);
                }
            }
        }
        c72Var.o(sb);
        return sb.toString();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int childCount = getChildCount();
        boolean zIsInEditMode = isInEditMode();
        for (int i5 = 0; i5 < childCount; i5++) {
            View childAt = getChildAt(i5);
            t52 t52Var = (t52) childAt.getLayoutParams();
            b72 b72Var = t52Var.p0;
            if (childAt.getVisibility() != 8 || t52Var.d0 || t52Var.e0 || zIsInEditMode) {
                int iS = b72Var.s();
                int iT = b72Var.t();
                childAt.layout(iS, iT, b72Var.r() + iS, b72Var.l() + iT);
            }
        }
        ArrayList arrayList = this.b;
        int size = arrayList.size();
        if (size > 0) {
            for (int i6 = 0; i6 < size; i6++) {
                ((p52) arrayList.get(i6)).i();
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:261:0x0541  */
    /* JADX WARN: Removed duplicated region for block: B:271:0x057c  */
    /* JADX WARN: Removed duplicated region for block: B:276:0x0597  */
    /* JADX WARN: Removed duplicated region for block: B:279:0x059d A[PHI: r8
      0x059d: PHI (r8v7 a72) = (r8v6 a72), (r8v2 a72) binds: [B:282:0x05ab, B:278:0x059b] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:284:0x05b7  */
    /* JADX WARN: Removed duplicated region for block: B:290:0x05ca  */
    /* JADX WARN: Removed duplicated region for block: B:295:0x05d6  */
    /* JADX WARN: Removed duplicated region for block: B:298:0x060c  */
    /* JADX WARN: Removed duplicated region for block: B:299:0x060f  */
    /* JADX WARN: Removed duplicated region for block: B:302:0x0617  */
    /* JADX WARN: Removed duplicated region for block: B:304:0x0620  */
    /* JADX WARN: Removed duplicated region for block: B:307:0x0656  */
    /* JADX WARN: Removed duplicated region for block: B:309:0x0659  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void onMeasure(int r29, int r30) {
        /*
            Method dump skipped, instruction units count: 1630
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.constraintlayout.widget.ConstraintLayout.onMeasure(int, int):void");
    }

    @Override // android.view.ViewGroup
    public final void onViewAdded(View view) {
        super.onViewAdded(view);
        b72 b72VarB = b(view);
        if ((view instanceof rh5) && !(b72VarB instanceof sh5)) {
            t52 t52Var = (t52) view.getLayoutParams();
            sh5 sh5Var = new sh5();
            t52Var.p0 = sh5Var;
            t52Var.d0 = true;
            sh5Var.W(t52Var.V);
        }
        if (view instanceof p52) {
            p52 p52Var = (p52) view;
            p52Var.j();
            ((t52) view.getLayoutParams()).e0 = true;
            ArrayList arrayList = this.b;
            if (!arrayList.contains(p52Var)) {
                arrayList.add(p52Var);
            }
        }
        this.a.put(view.getId(), view);
        this.h = true;
    }

    @Override // android.view.ViewGroup
    public final void onViewRemoved(View view) {
        super.onViewRemoved(view);
        this.a.remove(view.getId());
        b72 b72VarB = b(view);
        this.c.r0.remove(b72VarB);
        b72VarB.D();
        this.b.remove(view);
        this.h = true;
    }

    @Override // android.view.View, android.view.ViewParent
    public final void requestLayout() {
        this.h = true;
        super.requestLayout();
    }

    public void setConstraintSet(j62 j62Var) {
        this.j = j62Var;
    }

    @Override // android.view.View
    public void setId(int i) {
        int id = getId();
        SparseArray sparseArray = this.a;
        sparseArray.remove(id);
        super.setId(i);
        sparseArray.put(getId(), this);
    }

    public void setMaxHeight(int i) {
        if (i == this.g) {
            return;
        }
        this.g = i;
        requestLayout();
    }

    public void setMaxWidth(int i) {
        if (i == this.f) {
            return;
        }
        this.f = i;
        requestLayout();
    }

    public void setMinHeight(int i) {
        if (i == this.e) {
            return;
        }
        this.e = i;
        requestLayout();
    }

    public void setMinWidth(int i) {
        if (i == this.d) {
            return;
        }
        this.d = i;
        requestLayout();
    }

    public void setOnConstraintsChanged(g72 g72Var) {
        lig ligVar = this.k;
        if (ligVar != null) {
            ligVar.getClass();
        }
    }

    public void setOptimizationLevel(int i) {
        this.i = i;
        c72 c72Var = this.c;
        c72Var.E0 = i;
        wz6.q = c72Var.c0(512);
    }

    @Override // android.view.ViewGroup
    public final boolean shouldDelayChildPressedState() {
        return false;
    }

    public ConstraintLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.a = new SparseArray();
        this.b = new ArrayList(4);
        this.c = new c72();
        this.d = 0;
        this.e = 0;
        this.f = Integer.MAX_VALUE;
        this.g = Integer.MAX_VALUE;
        this.h = true;
        this.i = 257;
        this.j = null;
        this.k = null;
        this.l = -1;
        this.m = new HashMap();
        this.n = new SparseArray();
        this.o = new u52(this, this);
        c(attributeSet);
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        t52 t52Var = new t52(layoutParams);
        t52Var.a = -1;
        t52Var.b = -1;
        t52Var.c = -1.0f;
        t52Var.d = true;
        t52Var.e = -1;
        t52Var.f = -1;
        t52Var.g = -1;
        t52Var.h = -1;
        t52Var.i = -1;
        t52Var.j = -1;
        t52Var.k = -1;
        t52Var.l = -1;
        t52Var.m = -1;
        t52Var.n = -1;
        t52Var.o = -1;
        t52Var.p = -1;
        t52Var.q = 0;
        t52Var.r = 0.0f;
        t52Var.s = -1;
        t52Var.t = -1;
        t52Var.u = -1;
        t52Var.v = -1;
        t52Var.w = Integer.MIN_VALUE;
        t52Var.x = Integer.MIN_VALUE;
        t52Var.y = Integer.MIN_VALUE;
        t52Var.z = Integer.MIN_VALUE;
        t52Var.A = Integer.MIN_VALUE;
        t52Var.B = Integer.MIN_VALUE;
        t52Var.C = Integer.MIN_VALUE;
        t52Var.D = 0;
        t52Var.E = 0.5f;
        t52Var.F = 0.5f;
        t52Var.G = null;
        t52Var.H = -1.0f;
        t52Var.I = -1.0f;
        t52Var.J = 0;
        t52Var.K = 0;
        t52Var.L = 0;
        t52Var.M = 0;
        t52Var.N = 0;
        t52Var.O = 0;
        t52Var.P = 0;
        t52Var.Q = 0;
        t52Var.R = 1.0f;
        t52Var.S = 1.0f;
        t52Var.T = -1;
        t52Var.U = -1;
        t52Var.V = -1;
        t52Var.W = false;
        t52Var.X = false;
        t52Var.Y = null;
        t52Var.Z = 0;
        t52Var.a0 = true;
        t52Var.b0 = true;
        t52Var.c0 = false;
        t52Var.d0 = false;
        t52Var.e0 = false;
        t52Var.f0 = -1;
        t52Var.g0 = -1;
        t52Var.h0 = -1;
        t52Var.i0 = -1;
        t52Var.j0 = Integer.MIN_VALUE;
        t52Var.k0 = Integer.MIN_VALUE;
        t52Var.l0 = 0.5f;
        t52Var.p0 = new b72();
        if (layoutParams instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) layoutParams;
            ((ViewGroup.MarginLayoutParams) t52Var).leftMargin = marginLayoutParams.leftMargin;
            ((ViewGroup.MarginLayoutParams) t52Var).rightMargin = marginLayoutParams.rightMargin;
            ((ViewGroup.MarginLayoutParams) t52Var).topMargin = marginLayoutParams.topMargin;
            ((ViewGroup.MarginLayoutParams) t52Var).bottomMargin = marginLayoutParams.bottomMargin;
            t52Var.setMarginStart(marginLayoutParams.getMarginStart());
            t52Var.setMarginEnd(marginLayoutParams.getMarginEnd());
        }
        if (!(layoutParams instanceof t52)) {
            return t52Var;
        }
        t52 t52Var2 = (t52) layoutParams;
        t52Var.a = t52Var2.a;
        t52Var.b = t52Var2.b;
        t52Var.c = t52Var2.c;
        t52Var.d = t52Var2.d;
        t52Var.e = t52Var2.e;
        t52Var.f = t52Var2.f;
        t52Var.g = t52Var2.g;
        t52Var.h = t52Var2.h;
        t52Var.i = t52Var2.i;
        t52Var.j = t52Var2.j;
        t52Var.k = t52Var2.k;
        t52Var.l = t52Var2.l;
        t52Var.m = t52Var2.m;
        t52Var.n = t52Var2.n;
        t52Var.o = t52Var2.o;
        t52Var.p = t52Var2.p;
        t52Var.q = t52Var2.q;
        t52Var.r = t52Var2.r;
        t52Var.s = t52Var2.s;
        t52Var.t = t52Var2.t;
        t52Var.u = t52Var2.u;
        t52Var.v = t52Var2.v;
        t52Var.w = t52Var2.w;
        t52Var.x = t52Var2.x;
        t52Var.y = t52Var2.y;
        t52Var.z = t52Var2.z;
        t52Var.A = t52Var2.A;
        t52Var.B = t52Var2.B;
        t52Var.C = t52Var2.C;
        t52Var.D = t52Var2.D;
        t52Var.E = t52Var2.E;
        t52Var.F = t52Var2.F;
        t52Var.G = t52Var2.G;
        t52Var.H = t52Var2.H;
        t52Var.I = t52Var2.I;
        t52Var.J = t52Var2.J;
        t52Var.K = t52Var2.K;
        t52Var.W = t52Var2.W;
        t52Var.X = t52Var2.X;
        t52Var.L = t52Var2.L;
        t52Var.M = t52Var2.M;
        t52Var.N = t52Var2.N;
        t52Var.P = t52Var2.P;
        t52Var.O = t52Var2.O;
        t52Var.Q = t52Var2.Q;
        t52Var.R = t52Var2.R;
        t52Var.S = t52Var2.S;
        t52Var.T = t52Var2.T;
        t52Var.U = t52Var2.U;
        t52Var.V = t52Var2.V;
        t52Var.a0 = t52Var2.a0;
        t52Var.b0 = t52Var2.b0;
        t52Var.c0 = t52Var2.c0;
        t52Var.d0 = t52Var2.d0;
        t52Var.f0 = t52Var2.f0;
        t52Var.g0 = t52Var2.g0;
        t52Var.h0 = t52Var2.h0;
        t52Var.i0 = t52Var2.i0;
        t52Var.j0 = t52Var2.j0;
        t52Var.k0 = t52Var2.k0;
        t52Var.l0 = t52Var2.l0;
        t52Var.Y = t52Var2.Y;
        t52Var.Z = t52Var2.Z;
        t52Var.p0 = t52Var2.p0;
        return t52Var;
    }
}

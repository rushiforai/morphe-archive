package bk;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import com.google.android.gms.internal.consent_sdk.e0;
import com.google.android.gms.internal.consent_sdk.k0;

/* loaded from: classes3.dex */
public final class j {

    /* renamed from: m, reason: collision with root package name */
    public static final h f18002m = new h(0.5f);

    /* renamed from: a, reason: collision with root package name */
    public e0 f18003a;

    /* renamed from: b, reason: collision with root package name */
    public e0 f18004b;

    /* renamed from: c, reason: collision with root package name */
    public e0 f18005c;

    /* renamed from: d, reason: collision with root package name */
    public e0 f18006d;

    /* renamed from: e, reason: collision with root package name */
    public c f18007e;

    /* renamed from: f, reason: collision with root package name */
    public c f18008f;

    /* renamed from: g, reason: collision with root package name */
    public c f18009g;

    /* renamed from: h, reason: collision with root package name */
    public c f18010h;

    /* renamed from: i, reason: collision with root package name */
    public e f18011i;

    /* renamed from: j, reason: collision with root package name */
    public e f18012j;

    /* renamed from: k, reason: collision with root package name */
    public e f18013k;

    /* renamed from: l, reason: collision with root package name */
    public e f18014l;

    public j(int i5) {
        switch (i5) {
            case 1:
                this.f18003a = new i();
                this.f18004b = new i();
                this.f18005c = new i();
                this.f18006d = new i();
                this.f18007e = new a(0.0f);
                this.f18008f = new a(0.0f);
                this.f18009g = new a(0.0f);
                this.f18010h = new a(0.0f);
                int i11 = 0;
                this.f18011i = new e(i11);
                this.f18012j = new e(i11);
                this.f18013k = new e(i11);
                this.f18014l = new e(i11);
                break;
            default:
                this.f18003a = new i();
                this.f18004b = new i();
                this.f18005c = new i();
                this.f18006d = new i();
                this.f18007e = new a(0.0f);
                this.f18008f = new a(0.0f);
                this.f18009g = new a(0.0f);
                this.f18010h = new a(0.0f);
                int i12 = 0;
                this.f18011i = new e(i12);
                this.f18012j = new e(i12);
                this.f18013k = new e(i12);
                this.f18014l = new e(i12);
                break;
        }
    }

    public static j b(Context context, int i5, int i11, c cVar) {
        ContextThemeWrapper contextThemeWrapper = new ContextThemeWrapper(context, i5);
        if (i11 != 0) {
            contextThemeWrapper = new ContextThemeWrapper(contextThemeWrapper, i11);
        }
        TypedArray typedArrayObtainStyledAttributes = contextThemeWrapper.obtainStyledAttributes(bj.a.G);
        try {
            int i12 = typedArrayObtainStyledAttributes.getInt(0, 0);
            int i13 = typedArrayObtainStyledAttributes.getInt(3, i12);
            int i14 = typedArrayObtainStyledAttributes.getInt(4, i12);
            int i15 = typedArrayObtainStyledAttributes.getInt(2, i12);
            int i16 = typedArrayObtainStyledAttributes.getInt(1, i12);
            c cVarD = d(typedArrayObtainStyledAttributes, 5, cVar);
            c cVarD2 = d(typedArrayObtainStyledAttributes, 8, cVarD);
            c cVarD3 = d(typedArrayObtainStyledAttributes, 9, cVarD);
            c cVarD4 = d(typedArrayObtainStyledAttributes, 7, cVarD);
            c cVarD5 = d(typedArrayObtainStyledAttributes, 6, cVarD);
            j jVar = new j(1);
            jVar.f18003a = k0.i(i13);
            jVar.f18007e = cVarD2;
            jVar.f18004b = k0.i(i14);
            jVar.f18008f = cVarD3;
            jVar.f18005c = k0.i(i15);
            jVar.f18009g = cVarD4;
            jVar.f18006d = k0.i(i16);
            jVar.f18010h = cVarD5;
            return jVar;
        } finally {
            typedArrayObtainStyledAttributes.recycle();
        }
    }

    public static j c(Context context, AttributeSet attributeSet, int i5, int i11) {
        a aVar = new a(0);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, bj.a.f17937z, i5, i11);
        int resourceId = typedArrayObtainStyledAttributes.getResourceId(0, 0);
        int resourceId2 = typedArrayObtainStyledAttributes.getResourceId(1, 0);
        typedArrayObtainStyledAttributes.recycle();
        return b(context, resourceId, resourceId2, aVar);
    }

    public static c d(TypedArray typedArray, int i5, c cVar) {
        TypedValue typedValuePeekValue = typedArray.peekValue(i5);
        if (typedValuePeekValue != null) {
            int i11 = typedValuePeekValue.type;
            if (i11 == 5) {
                return new a(TypedValue.complexToDimensionPixelSize(typedValuePeekValue.data, typedArray.getResources().getDisplayMetrics()));
            }
            if (i11 == 6) {
                return new h(typedValuePeekValue.getFraction(1.0f, 1.0f));
            }
        }
        return cVar;
    }

    public j a() {
        j jVar = new j();
        jVar.f18003a = this.f18003a;
        jVar.f18004b = this.f18004b;
        jVar.f18005c = this.f18005c;
        jVar.f18006d = this.f18006d;
        jVar.f18007e = this.f18007e;
        jVar.f18008f = this.f18008f;
        jVar.f18009g = this.f18009g;
        jVar.f18010h = this.f18010h;
        jVar.f18011i = this.f18011i;
        jVar.f18012j = this.f18012j;
        jVar.f18013k = this.f18013k;
        jVar.f18014l = this.f18014l;
        return jVar;
    }

    public boolean e(RectF rectF) {
        boolean z11 = this.f18014l.getClass().equals(e.class) && this.f18012j.getClass().equals(e.class) && this.f18011i.getClass().equals(e.class) && this.f18013k.getClass().equals(e.class);
        float fA = this.f18007e.a(rectF);
        return z11 && ((this.f18008f.a(rectF) > fA ? 1 : (this.f18008f.a(rectF) == fA ? 0 : -1)) == 0 && (this.f18010h.a(rectF) > fA ? 1 : (this.f18010h.a(rectF) == fA ? 0 : -1)) == 0 && (this.f18009g.a(rectF) > fA ? 1 : (this.f18009g.a(rectF) == fA ? 0 : -1)) == 0) && ((this.f18004b instanceof i) && (this.f18003a instanceof i) && (this.f18005c instanceof i) && (this.f18006d instanceof i));
    }

    public j f() {
        j jVar = new j();
        jVar.f18003a = this.f18003a;
        jVar.f18004b = this.f18004b;
        jVar.f18005c = this.f18005c;
        jVar.f18006d = this.f18006d;
        jVar.f18007e = this.f18007e;
        jVar.f18008f = this.f18008f;
        jVar.f18009g = this.f18009g;
        jVar.f18010h = this.f18010h;
        jVar.f18011i = this.f18011i;
        jVar.f18012j = this.f18012j;
        jVar.f18013k = this.f18013k;
        jVar.f18014l = this.f18014l;
        return jVar;
    }
}

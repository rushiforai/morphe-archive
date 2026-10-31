package o9;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.util.TypedValue;

/* loaded from: classes.dex */
public final class x0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f80229a;

    /* renamed from: b, reason: collision with root package name */
    public final int f80230b;

    /* renamed from: c, reason: collision with root package name */
    public final int f80231c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f80232d;

    /* renamed from: e, reason: collision with root package name */
    public final int f80233e;

    /* renamed from: f, reason: collision with root package name */
    public final int f80234f;

    /* renamed from: g, reason: collision with root package name */
    public final int f80235g;

    /* renamed from: h, reason: collision with root package name */
    public final int f80236h;

    /* renamed from: i, reason: collision with root package name */
    public final String f80237i;

    /* renamed from: j, reason: collision with root package name */
    public final int f80238j;

    /* renamed from: k, reason: collision with root package name */
    public final int f80239k;

    /* renamed from: l, reason: collision with root package name */
    public final boolean f80240l;

    /* renamed from: m, reason: collision with root package name */
    public final int f80241m;

    public x0(Context context, AttributeSet attributeSet, int i5) {
        int[] iArr = u2.f80175z;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, iArr);
        this.f80229a = typedArrayObtainStyledAttributes.getString(7);
        int i11 = typedArrayObtainStyledAttributes.getInt(15, 0);
        this.f80230b = i11;
        int i12 = typedArrayObtainStyledAttributes.getInt(9, 0);
        this.f80231c = i12;
        this.f80237i = typedArrayObtainStyledAttributes.getString(0);
        boolean z11 = true;
        int resourceId = typedArrayObtainStyledAttributes.getResourceId((i5 == 1 && typedArrayObtainStyledAttributes.hasValue(2)) ? 2 : 1, 0);
        this.f80238j = resourceId;
        this.f80239k = typedArrayObtainStyledAttributes.getResourceId(3, resourceId);
        int i13 = typedArrayObtainStyledAttributes.getInt(8, i12);
        this.f80233e = i13;
        this.f80234f = typedArrayObtainStyledAttributes.getInt(10, i13 * 2);
        int i14 = typedArrayObtainStyledAttributes.getInt(14, i12);
        this.f80235g = i14;
        this.f80236h = typedArrayObtainStyledAttributes.getInt(11, i14 * 2);
        typedArrayObtainStyledAttributes.getInt(13, i11);
        typedArrayObtainStyledAttributes.getInt(12, i12);
        this.f80240l = typedArrayObtainStyledAttributes.getBoolean(6, false);
        this.f80241m = typedArrayObtainStyledAttributes.getResourceId(5, 0);
        int i15 = typedArrayObtainStyledAttributes.getInt(4, 7);
        if ((i5 != 0 || (i15 & 1) != 1) && ((i5 != 2 || (i15 & 2) != 2) && (i5 != 1 || (i15 & 4) != 4))) {
            z11 = false;
        }
        this.f80232d = z11;
        typedArrayObtainStyledAttributes.recycle();
        int attributeCount = attributeSet.getAttributeCount();
        ya.p pVar = new ya.p(attributeCount);
        for (int i16 = 0; i16 < attributeCount; i16++) {
            pVar.c(attributeSet.getAttributeNameResource(i16));
        }
        for (int i17 = 0; i17 < 16; i17++) {
            pVar.o(iArr[i17]);
        }
        int[] iArrQ = pVar.q();
        SparseArray sparseArray = new SparseArray(iArrQ.length);
        TypedArray typedArrayObtainStyledAttributes2 = context.obtainStyledAttributes(attributeSet, iArrQ);
        for (int i18 = 0; i18 < iArrQ.length; i18++) {
            TypedValue typedValue = new TypedValue();
            typedArrayObtainStyledAttributes2.getValue(i18, typedValue);
            sparseArray.put(iArrQ[i18], typedValue);
        }
        typedArrayObtainStyledAttributes2.recycle();
    }
}

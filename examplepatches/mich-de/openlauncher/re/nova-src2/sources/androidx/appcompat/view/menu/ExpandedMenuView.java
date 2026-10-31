package androidx.appcompat.view.menu;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import q.j;
import q.k;
import q.m;
import q.y;
import x7.u;

/* loaded from: classes2.dex */
public final class ExpandedMenuView extends ListView implements j, y, AdapterView.OnItemClickListener {

    /* renamed from: b, reason: collision with root package name */
    public static final int[] f13674b = {16842964, 16843049};

    /* renamed from: a, reason: collision with root package name */
    public k f13675a;

    public ExpandedMenuView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        setOnItemClickListener(this);
        u uVarR = u.r(context, attributeSet, f13674b, 16842868);
        TypedArray typedArray = (TypedArray) uVarR.f95209b;
        if (typedArray.hasValue(0)) {
            setBackgroundDrawable(uVarR.l(0));
        }
        if (typedArray.hasValue(1)) {
            setDivider(uVarR.l(1));
        }
        uVarR.s();
    }

    @Override // q.j
    public final boolean a(m mVar) {
        return this.f13675a.q(mVar, null, 0);
    }

    @Override // q.y
    public final void b(k kVar) {
        this.f13675a = kVar;
    }

    @Override // android.widget.ListView, android.widget.AbsListView, android.widget.AdapterView, android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        setChildrenDrawingCacheEnabled(false);
    }

    @Override // android.widget.AdapterView.OnItemClickListener
    public final void onItemClick(AdapterView adapterView, View view, int i5, long j11) {
        a((m) getAdapter().getItem(i5));
    }
}

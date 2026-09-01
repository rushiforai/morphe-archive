package androidx.appcompat.view.menu;

import android.R;
import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import defpackage.kx7;
import defpackage.lx7;
import defpackage.oy7;
import defpackage.sx7;
import defpackage.vwa;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ExpandedMenuView extends ListView implements kx7, oy7, AdapterView.OnItemClickListener {
    public static final int[] b = {R.attr.background, R.attr.divider};
    public lx7 a;

    public ExpandedMenuView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        setOnItemClickListener(this);
        vwa vwaVarX = vwa.x(context, attributeSet, b, R.attr.listViewStyle);
        TypedArray typedArray = (TypedArray) vwaVarX.c;
        if (typedArray.hasValue(0)) {
            setBackgroundDrawable(vwaVarX.q(0));
        }
        if (typedArray.hasValue(1)) {
            setDivider(vwaVarX.q(1));
        }
        vwaVarX.C();
    }

    @Override // defpackage.kx7
    public final boolean a(sx7 sx7Var) {
        return this.a.q(sx7Var, null, 0);
    }

    @Override // defpackage.oy7
    public final void b(lx7 lx7Var) {
        this.a = lx7Var;
    }

    public int getWindowAnimations() {
        return 0;
    }

    @Override // android.widget.ListView, android.widget.AbsListView, android.widget.AdapterView, android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        setChildrenDrawingCacheEnabled(false);
    }

    @Override // android.widget.AdapterView.OnItemClickListener
    public final void onItemClick(AdapterView adapterView, View view, int i, long j) {
        a((sx7) getAdapter().getItem(i));
    }
}

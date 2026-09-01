package defpackage;

import android.content.Context;
import android.view.ViewGroup;
import com.medium.reader.R;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nkb extends ViewGroup {
    public final int a;
    public final ArrayList b;
    public final ArrayList c;
    public final a1a d;
    public int e;

    public nkb(Context context) {
        super(context);
        this.a = 5;
        ArrayList arrayList = new ArrayList();
        this.b = arrayList;
        ArrayList arrayList2 = new ArrayList();
        this.c = arrayList2;
        this.d = new a1a(7);
        setClipChildren(false);
        okb okbVar = new okb(context);
        addView(okbVar);
        arrayList.add(okbVar);
        arrayList2.add(okbVar);
        this.e = 1;
        setTag(R.id.hide_in_inspector_tag, Boolean.TRUE);
    }

    @Override // android.view.View
    public final void onMeasure(int i, int i2) {
        setMeasuredDimension(0, 0);
    }

    @Override // android.view.View, android.view.ViewParent
    public final void requestLayout() {
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z, int i, int i2, int i3, int i4) {
    }
}

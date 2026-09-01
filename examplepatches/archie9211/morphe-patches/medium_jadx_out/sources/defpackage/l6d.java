package defpackage;

import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l6d {
    public final j6d a;
    public final ArrayList b = new ArrayList();
    public b36 c;
    public b36 d;
    public int e;

    public l6d(ViewGroup viewGroup) {
        View childAt;
        b36 b36Var = b36.e;
        this.c = b36Var;
        this.d = b36Var;
        Drawable background = viewGroup.getBackground();
        this.e = background instanceof ColorDrawable ? ((ColorDrawable) background).getColor() : 0;
        j6d j6dVar = new j6d(this, viewGroup.getContext(), viewGroup);
        this.a = j6dVar;
        j6dVar.setVisibility(8);
        int i = 1;
        j6dVar.setWillNotDraw(true);
        o19 o19Var = new o19(10, this);
        WeakHashMap weakHashMap = ute.a;
        mte.c(j6dVar, o19Var);
        f4f.a(j6dVar, new k6d(this));
        int childCount = viewGroup.getChildCount() - 1;
        while (true) {
            if (childCount < 0) {
                childAt = null;
                break;
            }
            childAt = viewGroup.getChildAt(childCount);
            if (childAt.isAttachedToWindow() != viewGroup.isAttachedToWindow()) {
                break;
            } else {
                childCount--;
            }
        }
        if (childAt == null) {
            viewGroup.addView(j6dVar, 0);
        } else {
            childAt.addOnAttachStateChangeListener(new q15(i, viewGroup, j6dVar));
        }
    }
}

package androidx.core.view.insets;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.medium.reader.R;
import defpackage.a5a;
import defpackage.ay0;
import defpackage.b09;
import defpackage.b2a;
import defpackage.ev1;
import defpackage.l6d;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ProtectionLayout extends FrameLayout {
    public static final Object c = new Object();
    public final ArrayList a;
    public a5a b;

    public ProtectionLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0, 0);
        this.a = new ArrayList();
    }

    private l6d getOrInstallSystemBarStateMonitor() {
        ViewGroup viewGroup = (ViewGroup) getRootView();
        Object tag = viewGroup.getTag(R.id.tag_system_bar_state_monitor);
        if (tag instanceof l6d) {
            return (l6d) tag;
        }
        l6d l6dVar = new l6d(viewGroup);
        viewGroup.setTag(R.id.tag_system_bar_state_monitor, l6dVar);
        return l6dVar;
    }

    public final void a() {
        ArrayList arrayList = this.a;
        if (arrayList.isEmpty()) {
            b();
            return;
        }
        l6d orInstallSystemBarStateMonitor = getOrInstallSystemBarStateMonitor();
        b();
        this.b = new a5a(orInstallSystemBarStateMonitor, arrayList);
        getChildCount();
        if (this.b.a.size() <= 0) {
            return;
        }
        ev1 ev1Var = (ev1) this.b.a.get(0);
        getContext();
        ev1Var.getClass();
        ay0.e(b09.w(0, "Unexpected side: "));
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i, ViewGroup.LayoutParams layoutParams) {
        if (view != null && view.getTag() != c) {
            a5a a5aVar = this.b;
            int childCount = getChildCount() - (a5aVar != null ? a5aVar.a.size() : 0);
            if (i > childCount || i < 0) {
                i = childCount;
            }
        }
        super.addView(view, i, layoutParams);
    }

    public final void b() {
        if (this.b != null) {
            removeViews(getChildCount() - this.b.a.size(), this.b.a.size());
            int size = this.b.a.size();
            a5a a5aVar = this.b;
            if (size > 0) {
                ((ev1) a5aVar.a.get(0)).getClass();
                throw null;
            }
            ArrayList arrayList = a5aVar.a;
            if (!a5aVar.f) {
                a5aVar.f = true;
                a5aVar.b.b.remove(a5aVar);
                for (int size2 = arrayList.size() - 1; size2 >= 0; size2--) {
                    ((ev1) arrayList.get(size2)).c = null;
                }
                arrayList.clear();
            }
            this.b = null;
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        a();
        requestApplyInsets();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        b();
        ViewGroup viewGroup = (ViewGroup) getRootView();
        Object tag = viewGroup.getTag(R.id.tag_system_bar_state_monitor);
        if (tag instanceof l6d) {
            l6d l6dVar = (l6d) tag;
            if (l6dVar.b.isEmpty()) {
                l6dVar.a.post(new b2a(6, l6dVar));
                viewGroup.setTag(R.id.tag_system_bar_state_monitor, null);
            }
        }
    }

    public void setProtections(List<ev1> list) {
        ArrayList arrayList = this.a;
        arrayList.clear();
        arrayList.addAll(list);
        if (isAttachedToWindow()) {
            a();
            requestApplyInsets();
        }
    }

    public ProtectionLayout(Context context) {
        super(context);
        this.a = new ArrayList();
    }
}

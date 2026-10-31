package l30;

import android.view.View;
import android.view.ViewGroup;
import android.widget.RadioButton;
import com.teslacoilsw.launcher.widget.DumbRadioGrid;
import com.teslacoilsw.launcher.widget.RadioGrid;

/* loaded from: classes4.dex */
public final class d implements ViewGroup.OnHierarchyChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f74636a;

    /* renamed from: b, reason: collision with root package name */
    public ViewGroup.OnHierarchyChangeListener f74637b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ ViewGroup f74638c;

    public /* synthetic */ d(ViewGroup viewGroup, int i5) {
        this.f74636a = i5;
        this.f74638c = viewGroup;
    }

    @Override // android.view.ViewGroup.OnHierarchyChangeListener
    public final void onChildViewAdded(View view, View view2) {
        switch (this.f74636a) {
            case 0:
                DumbRadioGrid dumbRadioGrid = (DumbRadioGrid) this.f74638c;
                if (view == dumbRadioGrid && (view2 instanceof RadioButton)) {
                    if (view2.getId() == -1) {
                        view2.setId(view2.hashCode());
                    }
                    ((RadioButton) view2).setOnCheckedChangeListener(dumbRadioGrid.f46405g);
                }
                ViewGroup.OnHierarchyChangeListener onHierarchyChangeListener = this.f74637b;
                if (onHierarchyChangeListener != null) {
                    onHierarchyChangeListener.onChildViewAdded(view, view2);
                    break;
                }
                break;
            default:
                RadioGrid radioGrid = (RadioGrid) this.f74638c;
                if (view == radioGrid && (view2 instanceof RadioButton)) {
                    if (view2.getId() == -1) {
                        view2.setId(view2.hashCode());
                    }
                    ((RadioButton) view2).setOnCheckedChangeListener(radioGrid.f46458b);
                }
                ViewGroup.OnHierarchyChangeListener onHierarchyChangeListener2 = this.f74637b;
                if (onHierarchyChangeListener2 != null) {
                    onHierarchyChangeListener2.onChildViewAdded(view, view2);
                    break;
                }
                break;
        }
    }

    @Override // android.view.ViewGroup.OnHierarchyChangeListener
    public final void onChildViewRemoved(View view, View view2) {
        switch (this.f74636a) {
            case 0:
                if (view == ((DumbRadioGrid) this.f74638c) && (view2 instanceof RadioButton)) {
                    ((RadioButton) view2).setOnCheckedChangeListener(null);
                }
                ViewGroup.OnHierarchyChangeListener onHierarchyChangeListener = this.f74637b;
                if (onHierarchyChangeListener != null) {
                    onHierarchyChangeListener.onChildViewRemoved(view, view2);
                    break;
                }
                break;
            default:
                if (view == ((RadioGrid) this.f74638c) && (view2 instanceof RadioButton)) {
                    ((RadioButton) view2).setOnCheckedChangeListener(null);
                }
                ViewGroup.OnHierarchyChangeListener onHierarchyChangeListener2 = this.f74637b;
                if (onHierarchyChangeListener2 != null) {
                    onHierarchyChangeListener2.onChildViewRemoved(view, view2);
                    break;
                }
                break;
        }
    }
}

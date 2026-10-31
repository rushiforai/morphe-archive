package uy;

import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.CheckedTextView;
import com.teslacoilsw.launcher.drawer.drawergroups.DialogAddDrawerGroupFragment;
import java.util.ArrayList;

/* loaded from: classes4.dex */
public final class g extends BaseAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final int f91711a = 2131624192;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f91712b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ DialogAddDrawerGroupFragment f91713c;

    public g(DialogAddDrawerGroupFragment dialogAddDrawerGroupFragment, boolean z11) {
        this.f91713c = dialogAddDrawerGroupFragment;
        ArrayList arrayList = new ArrayList(4);
        this.f91712b = arrayList;
        l0 l0Var = n0.f91731c;
        if (!z11) {
            arrayList.add(new f(2132017502, 0, l0Var));
        } else {
            arrayList.add(new f(2132017503, 2131231710, n0.f91732d));
            arrayList.add(new f(2132017504, 2131231726, l0Var));
        }
    }

    @Override // android.widget.Adapter
    public final int getCount() {
        return this.f91712b.size();
    }

    @Override // android.widget.BaseAdapter, android.widget.SpinnerAdapter
    public final View getDropDownView(int i5, View view, ViewGroup viewGroup) {
        return getView(i5, view, viewGroup);
    }

    @Override // android.widget.Adapter
    public final Object getItem(int i5) {
        return (f) this.f91712b.get(i5);
    }

    @Override // android.widget.Adapter
    public final long getItemId(int i5) {
        return i5;
    }

    @Override // android.widget.Adapter
    public final View getView(int i5, View view, ViewGroup viewGroup) {
        CheckedTextView checkedTextView = (CheckedTextView) view;
        if (checkedTextView == null) {
            checkedTextView = (CheckedTextView) this.f91713c.getActivity().getLayoutInflater().inflate(this.f91711a, viewGroup, false);
            checkedTextView.setCheckMarkDrawable((Drawable) null);
        }
        f fVar = (f) this.f91712b.get(i5);
        Drawable drawableMutate = checkedTextView.getContext().getDrawable(fVar.f91708b).mutate();
        drawableMutate.setTint(aa.p.b(checkedTextView.getContext(), 2130968934));
        checkedTextView.setCompoundDrawablesWithIntrinsicBounds(drawableMutate, (Drawable) null, (Drawable) null, (Drawable) null);
        checkedTextView.setText(fVar.f91707a);
        return checkedTextView;
    }
}

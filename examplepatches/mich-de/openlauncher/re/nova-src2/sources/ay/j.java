package ay;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.CheckedTextView;
import java.util.ArrayList;

/* loaded from: classes4.dex */
public final class j extends BaseAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final Context f15753a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f15754b;

    public j(Context context) {
        this.f15753a = context;
        LayoutInflater.from(context);
        this.f15754b = i.b(context, true);
    }

    @Override // android.widget.Adapter
    public final int getCount() {
        return this.f15754b.size();
    }

    @Override // android.widget.BaseAdapter, android.widget.SpinnerAdapter
    public final View getDropDownView(int i5, View view, ViewGroup viewGroup) {
        return getView(i5, view, viewGroup);
    }

    @Override // android.widget.Adapter
    public final Object getItem(int i5) {
        return (a) this.f15754b.get(i5);
    }

    @Override // android.widget.Adapter
    public final long getItemId(int i5) {
        return i5;
    }

    @Override // android.widget.Adapter
    public final View getView(int i5, View view, ViewGroup viewGroup) {
        CheckedTextView checkedTextView = (CheckedTextView) view;
        if (checkedTextView == null) {
            checkedTextView = (CheckedTextView) LayoutInflater.from(this.f15753a).inflate(2131624192, viewGroup, false);
            checkedTextView.setCheckMarkDrawable((Drawable) null);
        }
        a aVar = (a) this.f15754b.get(i5);
        checkedTextView.setCompoundDrawablesWithIntrinsicBounds(aVar.f15735a, 0, 0, 0);
        viewGroup.getContext();
        checkedTextView.setText(aVar.f15736b);
        return checkedTextView;
    }
}

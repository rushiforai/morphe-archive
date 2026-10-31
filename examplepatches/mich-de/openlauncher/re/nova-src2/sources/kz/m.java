package kz;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.CheckedTextView;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m extends ArrayAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f72887a = 1;

    public /* synthetic */ m(Context context, int i5, int i11, Object[] objArr) {
        super(context, i5, i11, objArr);
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public long getItemId(int i5) {
        switch (this.f72887a) {
            case 1:
                return i5;
            default:
                return super.getItemId(i5);
        }
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public View getView(int i5, View view, ViewGroup viewGroup) {
        switch (this.f72887a) {
            case 0:
                View view2 = super.getView(i5, view, viewGroup);
                Intrinsics.e(view2, "null cannot be cast to non-null type android.widget.CheckedTextView");
                CheckedTextView checkedTextView = (CheckedTextView) view2;
                checkedTextView.setCheckMarkDrawable((Drawable) null);
                return checkedTextView;
            default:
                return super.getView(i5, view, viewGroup);
        }
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public boolean hasStableIds() {
        switch (this.f72887a) {
            case 1:
                return true;
            default:
                return super.hasStableIds();
        }
    }

    public m(py.a aVar, String[] strArr) {
        super(aVar, 2131624068, strArr);
    }
}

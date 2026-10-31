package y9;

import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.CheckedTextView;

/* loaded from: classes.dex */
public final class f extends ArrayAdapter {
    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public final View getView(int i5, View view, ViewGroup viewGroup) {
        CheckedTextView checkedTextView = (CheckedTextView) super.getView(i5, view, viewGroup);
        checkedTextView.setCheckMarkDrawable((Drawable) null);
        return checkedTextView;
    }
}
